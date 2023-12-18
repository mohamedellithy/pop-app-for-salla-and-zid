<?php namespace App\Services\InterfaceService;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
interface Authorize{
    public function redirect(Request $request);

    public function callback(Request $request);

    public function authorizer_info(Array $credentials);

    public function authorizer_store(Array $authorizer_info);

    public static function refresh_merchant_token($user);

}
