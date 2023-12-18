<?php namespace App\Services\ZidService;

use Log;
use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Resources\ZidItem;
use App\Http\Resources\ZidProduct;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Http;
use Laravel\Sanctum\PersonalAccessToken;
use App\Notifications\MerchantRegistered;
use App\Services\Authorize as LoginAuthorize;
use App\Services\InterfaceService\Authorize as InterfaceAuthorize;

class Authorize extends Credential implements InterfaceAuthorize{
    public function redirect(Request $request){
        $queries = http_build_query([
            'client_id'     => env('ZID_CLIENT_ID'),
            'redirect_uri'  => env('APP_URL')."/api/zid/callback",
            'response_type' => 'code'
        ]);
        return urldecode(self::$auth_endPoint . "/oauth/authorize?" . $queries);
    }

    public function callback(Request $request){
        $response = Http::withOptions([
            'verify' => false
        ])->post(self::$auth_endPoint . '/oauth/token', [
            'grant_type'    => 'authorization_code',
            'client_id'     => env('ZID_CLIENT_ID'),
            'client_secret' => env('ZID_CLIENT_SECRET'),
            'redirect_uri'  => env('APP_URL')."/api/zid/callback",
            'code'          => $request->query('code') // grant code
        ]);

        if($response->successful()):
            $user     = $request->user();
            $data     = $response->json();
            /* authorizer info & store info */
            $authorizer_info           = $this->authorizer_info($response->json());
            $store                     = $this->authorizer_store($authorizer_info);
            $data['store_id']          = $store['id'];
            $data['store_url']         = $store['url'];
            $data['merchant_email']    = $authorizer_info['user']['email']  ?: null;
            $data['merchant_phone']    = $authorizer_info['user']['mobile'] ?: null;
            $data['merchant_name']     = $authorizer_info['user']['name'] ?: null;
            $data['app_name']          = 'zid';
            $data['password']          = Str::random(10);

            /** insert data on merchant account */
            $merchant = User::updateOrCreate([
                'email' => $data['merchant_email'],
                'phone' => $data['merchant_phone']
            ],[
                'name'  => $data['merchant_name'],
                'role'  => 1,
                'password'  => Hash::make($data['password']) //Str::random(10)
            ]);

            $merchant->zid_config()->updateOrCreate(
                ['user_id' => $merchant->id],
                $data
            );

            $request->merge([
                'email'    => $data['merchant_email'],
                'password' => $data['password']
            ]);

            try{
                $merchant->notify(new MerchantRegistered($data));
            }catch(\Exception $e){}

            $tokens = (new LoginAuthorize())->login($request,true);
            $access_token = isset($tokens['access_token']) ? $tokens['access_token'] : null;

            return redirect('/app/integrated?service=zid&token='.$access_token)->send();
            exit();
        else:
            // failed intgrated
            return array(
                $response->json()
            );
        endif;
    }

    public function authorizer_info(Array $credentials){
        $response = $this->resolve_call('/managers/account/profile','get',[],$credentials);
        return $response->json();
    }

    public function authorizer_store(Array $authorizer_info){
        return collect($authorizer_info['user'])->get('store');
    }

    public static function refresh_merchant_token($user){

        if(!$user->zid_config) return;

        $response = Http::withOptions([
            'verify' => false,
        ])->post(self::$auth_endPoint . '/oauth/token', [
            'grant_type' => 'refresh_token',
            'refresh_token' => $user->zid_config->refresh_token, // your merchant refresh token
            'client_id'     => env('ZID_CLIENT_ID'),
            'client_secret' => env('ZID_CLIENT_SECRET'),
            'redirect_uri'  => env('APP_URL')."/api/zid/callback"
        ]);

        if($response->successful()):
            $user->zid_config()->updateOrCreate(
                ['user_id' => $user->id],
                $response->json()
            );
            return $user->zid_config;
        else:
            return $response;
        endif;
    }
}
