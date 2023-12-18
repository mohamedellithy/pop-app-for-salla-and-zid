<?php
namespace App\Services\ZidService;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Log;
use App\Services\InterfaceService\Credential as InterfaceCredential;
class Credential implements InterfaceCredential {
    protected static $auth_endPoint   = "https://oauth.zid.sa";
    private $api_endPoint             = "https://api.zid.sa/v1";
    public  $merchant                 = null;

    public function merchant(): void {
        $this->merchant = request()->user()->zid_config ?: null;
    }

    public function resolve_call($path = null,$method = 'get',$body = array(),$credentials = array()) : Object
    {
        $Headers = [
            "Accept-Language" => "ar",
            "Content-Type"    => "application/json",
            "ROLE"            => "Manager",
        ];

        if(isset($credentials['authorization']) || isset($this->merchant->authorization)):
            $Headers["Authorization"]     = ' Bearer '.(isset($credentials['authorization']) ? $credentials['authorization'] : $this->merchant->authorization);
        endif;

        if(isset($credentials['store_id']) || isset($this->merchant->store_id)):
            $Headers["STORE-ID"]          = isset($credentials['store_id']) ? $credentials['store_id'] : $this->merchant->store_id;
        endif;

        if(isset($credentials['access_token']) || isset($this->merchant->access_token)):
            $Headers["X-MANAGER-TOKEN"]   = isset($credentials['access_token']) ? $credentials['access_token'] : $this->merchant->access_token;
        endif;

        $response = Http::withOptions([
            'verify' => false,
        ])->withHeaders($Headers)->$method($this->api_endPoint.$path,$body);

        return $response;
    }
}
