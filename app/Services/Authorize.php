<?php
namespace App\Services;

use App\Services\AppService;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Password;
class Authorize{
    public function __construct(){}

    public function login(Request $request,$saveToken = false){
        if(Auth::attempt(['email' => $request->input('email'), 'password' => $request->input('password')])) {
            $user_logged_in = User::where('email', $request->input('email'))->firstOrFail();
            $token = $user_logged_in->createToken('authToken')->plainTextToken;

            if($user_logged_in->time_zone == null):
                $user_logged_in->update([
                    'time_zone' => $this->get_time_zone() ?: null
                ]);
            endif;

            $tokens = [
                'access_token' => $token,
                'token_type'   => 'Bearer',
                'role_name'    => $user_logged_in->role_name
            ];

            if($saveToken == true):
                return $tokens;
            endif;

            return response()->json($tokens);
        }
        else {
            $Check_Where_is_error = User::where('email',$request->input('email'))->exists();
            if($Check_Where_is_error):
                return response()->json(['errors'=>[
                    "password" => [
                        "كلمة المرور غير صحيحة "
                    ]
                ]], 401);
            else:
                return response()->json(['errors'=>
                [
                    "email" => [
                        "البريد الالكترونى غير موجود يمكنك تجربة بريد الكترونى أخر"
                    ]
                ]], 401);
            endif;
        }
    }

    public function register(Request $request){
        $UnHashed_password = $request->input('password');
        $request['password'] = Hash::make($request->input('password'));
        $request['remember_token'] = Str::random(10);
        $request['time_zone'] = $this->get_time_zone() ?: null;
        $user = User::create($request->toArray());
        if (Auth::attempt(['email' => $request->input('email'), 'password' => $UnHashed_password ])) {
            $token = $user->createToken('authToken')->plainTextToken;
            return response()->json([
                'access_token'  => $token,
                'token_type'    => 'Bearer',
                'role_name'     => $user->role_name
            ]);
        }
        else {
            return response()->json(['error'=>'Unauthorised'], 401);
        }
    }

    public function validate_authenticated_app(Request $request,$token = null){
        if ($request->has('service')):
            $app = AppService::authorize($request->input('service'));
            return [
                'service'      => $request->input('service'),
                'access_token' => $token ?: $request->bearerToken(),
                'token_type'   => 'Bearer',
                'redirectTo'   => $app->redirect($request)
            ];
        endif;
    }

    public function forget(Request $request) {
        $credentials = request()->all();

        Password::sendResetLink($credentials);

        return response()->json(["msg" => 'تم ارسال رابط تحديث كلمة المرور الى بريدك الالكترونى']);
    }

    public function check_permissions(Request $request){
        $user = User::where('email', $request->input('email'))->first();
        if(Password::broker()->tokenExists($user,$request->input('token'))){
            return response()->json(["status" => true]);
        } else {
            return response()->json(["status" => false]);
        }
    }

    public function reset(Request $request) {
        $credentials = request()->all();

        $reset_password_status = Password::reset($credentials, function ($user, $password) {
            $user->password = Hash::make($password);
            $user->save();
        });

        if ($reset_password_status == Password::INVALID_TOKEN) {
            return response()->json(['errors'=>[
                "password" => [
                    "رابط اعادة كلمة المرور منتهي"
                ]
            ]], 401);
        }


        return response()->json(["msg" => "تم تحديث كلمة المرور بنجاح"]);
    }

    public function logout($request){
        if(method_exists($request->user()->currentAccessToken(), 'delete')) {
            $request->user()->currentAccessToken()->delete();
        }

        auth()->guard('web')->logout();
        return response()->json(['message' => 'تم تسجيل الخروج بنجاح'], 200);
    }

    public function get_time_zone(){
        $ip_client = request()->ip();
        $time_zone = file_get_contents("https://ipapi.co/".$ip_client."/timezone");
        if($time_zone != 'Undefined' || $time_zone != 'None'){
            return $time_zone;
        }
        return null;
    }
}
