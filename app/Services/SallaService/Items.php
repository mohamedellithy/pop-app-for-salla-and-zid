<?php namespace App\Services\SallaService;

use Log;
use Illuminate\Http\Request;
use App\Http\Resources\SallaItem;
use App\Http\Resources\SallaProduct;
use Illuminate\Support\Facades\Http;
use App\Http\Resources\SallaCategory;
use App\Http\Resources\SallaCategories;
use Laravel\Sanctum\PersonalAccessToken;
use App\Services\InterfaceService\Items as InterfaceItems;

class Items extends Credential implements InterfaceItems{

    public function __construct(){
        $this->merchant();
    }
    public function products(){
        if(!$this->merchant) return;

        $response = $this->resolve_call('/products?per_page=10&page='.request()->query('page_no'));

        if ($response->successful()) {
            return response()->json([
                'products' => new SallaProduct($response->json()),
                'user'     => $this->merchant
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

        $response = $this->resolve_call('/categories/');

        if ($response->successful()) {
            return response()->json([
                'categories' => new SallaCategories($response->json())
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
                'product'  => new SallaItem($response->json()),
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

        $response = $this->resolve_call("/categories/".$category_id);

        if ($response->successful()) {
            return response()->json([
                'category'  => new SallaCategory($response->json()['data']),
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
            return $response->json()['data']['categories'];
        endif;
        return null;
    }

}
