<?php namespace App\Services\ZidService;

use Log;
use Illuminate\Http\Request;
use App\Http\Resources\ZidItem;
use App\Http\Resources\ZidProduct;
use App\Http\Resources\ZidCategory;
use Illuminate\Support\Facades\Http;
use App\Http\Resources\ZidCategories;
use Laravel\Sanctum\PersonalAccessToken;
use App\Services\InterfaceService\Items as InterfaceItems;

class Items extends Credential implements InterfaceItems{

    public function __construct(){
        $this->merchant();
    }
    public function products(){
        if(!$this->merchant) return;

        $response = $this->resolve_call('/products/?page='.request('page_no').'&page_size=20');

        if ($response->successful()) {
            return response()->json([
                'products' => new ZidProduct($response->json()),
                'user'     => $this->merchant,
                'page'     => request('page_no')
            ]);
        } else {
            return response()->json([
                'err'  =>  $response->json(),
                'user' =>  $this->merchant
            ]);
        }

    }

    public function categoreis(){
        if(!$this->merchant) return;

        $response = $this->resolve_call('/managers/store/categories/');

        if ($response->successful()) {
            return response()->json([
                'categories' => new ZidCategories($response->json())
            ]);
        } else {
            return response()->json([
                'err'  =>  $response->json(),
                'user' =>  $this->merchant
            ]);
        }
    }

    public function single_product($product_id){

        if(!$this->merchant) return;

        $response = $this->resolve_call("/products/".$product_id);

        if ($response->successful()) {
            return response()->json([
                'product'  => new ZidItem($response->json()),
                'user'     => $this->merchant
            ]);
        } else {
            return response()->json([
                'err'  =>  $response->json(),
                'user' =>  $this->merchant
            ]);
        }
    }

    public function single_category($category_id){
        if(!$this->merchant) return;

        $response = $this->resolve_call("/managers/store/categories/".$category_id."/view/");

        if ($response->successful()) {
            return response()->json([
                'category'  => new ZidCategory($response->json()['categories']),
                'user'      => $this->merchant
            ]);
        } else {
            return response()->json([
                'err'  =>  $response->json(),
                'user' =>  $this->merchant
            ]);
        }
    }

    public function get_categories_by_products($merchant,$product){

        $this->merchant = $merchant;

        $response = $this->resolve_call("/products/".$product);

        if($response->successful()):
            return $response->json()['categories'];
        endif;
        return null;
    }

}
