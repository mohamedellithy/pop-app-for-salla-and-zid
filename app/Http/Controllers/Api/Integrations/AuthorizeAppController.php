<?php

namespace App\Http\Controllers\Api\Integrations;

use App\Services\Authorize;
use App\Services\AppService;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Http;

class AuthorizeAppController extends Controller
{
    //
    public function callback_salla(Request $request){
        $request->merge([
            'service' => 'salla'
        ]);

        $all = (new Authorize())->validate_authenticated_app($request);
        // return back();
    }

    public function accept_zid(Request $request){
        $request->merge([
            'service' => 'zid'
        ]);

        $authentication = (new Authorize())->validate_authenticated_app($request);
        return redirect()->to($authentication['redirectTo']);
    }

    public function callback_zid(Request $request){
        $result = (AppService::authorize('zid'))->callback($request);
    }

    public function app_products(Request $request){
        return (AppService::Items($request->user()->zid_config->app_name ?: 'zid'))->products();
    }

    public function app_categories(Request $request){
        return (AppService::Items($request->user()->zid_config->app_name ?: 'zid'))->categoreis();
    }

    public function app_single_product(Request $request,$product_id){
       return (AppService::Items($request->user()->zid_config->app_name ?: 'zid'))->single_product($product_id);
    }

    public function app_single_category(Request $request,$category_id){
        return (AppService::Items($request->user()->zid_config->app_name ?: 'zid'))->single_category($category_id);
    }
}
