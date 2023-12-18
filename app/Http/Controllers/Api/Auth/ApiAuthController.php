<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Http;
use App\Services\Authorize;
use App\Services\OperationsZid;
use App\Http\Resources\User as UserResource;
class ApiAuthController extends Controller
{
    public function register(Request $request) {
        $request->validate([
            'name' => 'required|string|max:255',
            'phone'=> 'required|numeric',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6|confirmed',
        ]);

        return (new Authorize())->register($request);
    }

    public function login(Request $request){
        $validator = Validator::make($request->all(),[
            'email' => 'required|string|email|max:255',
            'password' => 'required|string|min:6',
        ]);

        if($validator->fails()) {
            return response(['errors'=>$validator->errors()], 422);
        }

        return (new Authorize())->login($request);
    }

    public function validate_authenticated_app_account(Request $request){
        return (new Authorize())->validate_authenticated_app($request);
    }

    public function me(Request $request){
        $user = $request->user();
        return response()->json(['user' => new UserResource($user)], 200);
    }

    public function forget(Request $request){
        $validator = Validator::make($request->all(),[
            'email' => 'required|string|email|max:255|exists:users,email'
        ]);

        if($validator->fails()) {
            return response(['errors'=>$validator->errors()], 422);
        }

        return (new Authorize())->forget($request);
    }

    public function check_permissions(Request $request){
        $validator = Validator::make($request->all(),[
            'email' => 'required|string|email|max:255|exists:users,email',
            'token' => 'required'
        ]);

        if($validator->fails()) {
            return response(['errors'=>$validator->errors()], 422);
        }

        return (new Authorize())->check_permissions($request);
    }

    public function reset(Request $request) {
        $validator = Validator::make($request->all(),[
            'email' => 'required|string|email|max:255|exists:users,email',
            'token' => 'required|string',
            'password' => 'required|string|confirmed'
        ]);

        if($validator->fails()) {
            return response(['errors'=>$validator->errors()], 422);
        }

        return (new Authorize())->reset($request);
    }

    public function logout(Request $request){
        // Revoke the token that was used to authenticate the current request...
        return (new Authorize())->logout($request);
    }

    public function info_me(Request $request){
        $user = $request->user();
        return response()->json([
            'user' => $user,
            'count_campaign_active'     => $request->user()->campaign_active,
            'count_campaign_not_active' => $request->user()->campaign_not_active,
            'campaign_count'            => $request->user()->campaign()->count(),
            'count_campaign_ended'      => $request->user()->campaign_ended,
            'count_campaign_working'    => $request->user()->campaign_working,
            'count_campaign_trashed'    => $request->user()->campaign_trashed,
            'campaign_not_started'      => $request->user()->campaign_not_started
        ], 200);
    }

    public function info_me_update(Request $request){
         $request->validate([
            'name' => 'sometimes|string|max:255',
            'password' => 'sometimes|string|min:6|confirmed',
        ]);

        if($request->has('name')):
            $user = $request->user()->update([
                'name' => $request->input('name')
            ]);
        endif;

        if($request->has('time_zone')):
            $user = $request->user()->update([
                'time_zone' => $request->input('time_zone')
            ]);
        endif;

        if($request->has('password')):
            $password = Hash::make($request->input('password'));
            $user = $request->user()->update([
                'password' => $password
            ]);
        endif;

        if($user){
            return response()->json([
                'user' => $request->user(),
                'count_campaign_active'     => $request->user()->campaign_active,
                'count_campaign_not_active' => $request->user()->campaign_not_active,
                'campaign_count'            => $request->user()->campaign()->count(),
                'count_campaign_ended'      => $request->user()->campaign_ended,
                'count_campaign_working'    => $request->user()->campaign_working,
                'count_campaign_trashed'    => $request->user()->campaign_trashed,
                'campaign_not_started'      => $request->user()->campaign_not_started
            ], 200);
        }
    }
}
