<?php
namespace App\Services\SallaService;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use App\Models\Campaign;
use App\Models\Attachment;
use App\Models\Product;
use App\Services\CampaignFireEvent;
use Log;
use App\Services\SallaService\Items;
use App\Services\InterfaceService\Operations as InterfaceOperations;
use App\Http\Resources\SallaItem;
class Operations extends Credential Implements InterfaceOperations{
    public $operations = [
        '0'  => 'publish_products',
        '1'  => 'unpublish_products',
        '2'  => 'discounts_on_products',
        '3'  => 'change_price_products',
        '4'  => 'add_tags_products',
        '5'  => 'delete_tags_products',
        '6'  => 'remove_discounts_on_products'
    ];

    public $current_operation = '0';

    public $products;

    public $categories;

    public $items;

    public function run(Campaign $campaign){

        // set current operation
        $this->current_operation = $campaign->action ?: '0';

        // get all products as array
        if($campaign->type_selected == 'products'):
            $this->products         = $campaign->products;
            $this->start_operations($campaign);
        endif;

        // fetch by using categories
        if($campaign->type_selected == 'categories'):
            foreach($campaign->categories as $category):
                $categories           = new Categories();
                $categories->merchant = $this->merchant;
                $this->products       = $categories->fetchProducts($category);
                $this->start_operations($campaign);
            endforeach;
        endif;
    }

    public function start_operations($campaign){
        if(method_exists($this,$this->operations[$this->current_operation])):
            try {
                $results = $this->{$this->operations[$this->current_operation]}();

                // campaign fire event after complated
                $campaign = new CampaignFireEvent($campaign);
                $campaign->decreament_count_repeate();
                $campaign->make_campaign_completed();
            } catch(\Exception $exception){
                $results =  [
                    'status' => 'error : '. $exception->getMessage(),
                    'failed' => true
                ];
            }

            return $results;
        endif;
    }

    public function publish_products(){

        $results = [];

        // published products
        $updated_products = [];

        // loop products
        foreach($this->products as $product):
            $updated_products = [
                'status'     => 'sale'
            ];

            // response update products
            $response = $this->resolve_call("/products/".$product->product_id."/status/",'post', $updated_products);

            // on case updated failed
            if($response->failed() == true):
                return [
                    'results'   => $response->body(),
                    'failed'    => $response->failed() ?: ( $response->successful() ? false : true )
                ];
            endif;

            $results[]= $response->body();
        endforeach;

        return [
            'results'   => $results,
            'failed'    => false
        ];
    }

    public function unpublish_products(){
        $results = [];

        // published products
        $updated_products = [];

        // loop products
        foreach($this->products as $product):
            $updated_products = [
                'status'     => 'hidden'
            ];

            // response update products
            $response = $this->resolve_call("/products/".$product->product_id."/status/",'post', $updated_products);

            // on case updated failed
            if($response->failed() == true):
                return [
                    'results'   => $response->body(),
                    'failed'    => $response->failed() ?: ( $response->successful() ? false : true )
                ];
            endif;

            $results[]= $response->body();
        endforeach;

        return [
            'results'   => $results,
            'failed'    => false
        ];
    }

    public function discounts_on_products(){
        $results = [];
        // discounts on products
        $updated_products = [];

        // loop products
        foreach ($this->products as $product):
            $single_product_response     = $this->resolve_call("/products/".$product->product_id);
            $single_product              = $single_product_response->json();

            if(!isset($single_product['data'])) return;

            $updated_products = [
                'name'       => "{$single_product['data']['name']}",
                'price'      => $single_product['data']['regular_price']['amount'],
                'sale_price' => $this->get_calculate_discount_value($product,$single_product['data']['regular_price']['amount']),
            ];

            // response update products
            $response = $this->resolve_call("/products/".$product->product_id,'put', $updated_products);
            $results[] = $response->status();

            if($response->failed()):
                return [
                    'results'   => $response->status(),
                    'failed'    => true
                ];
            endif;

        endforeach;


        return [
            'results'   => $results,
            'failed'    => false
        ];
    }

    public function get_calculate_discount_value($product,$price = null){

        $discount = ($price * floatval($this->ar_to_en_numeric($product->values))) / 100;

        // here filter type of discount if percent or by value
        if($product->notes == 'percentage'){
            return $price - $discount;
        }

        return $price - floatval($this->ar_to_en_numeric($product->values));
    }

    public function remove_discounts_on_products(){
        $results = [];
        // discounts on products
        $updated_products = [];

        // loop products
        foreach ($this->products as $product):
            $single_product_response     = $this->resolve_call("/products/".$product->product_id);
            $single_product              = $single_product_response->json();

            if(!isset($single_product['data'])) return;

            $updated_products = [
                'name'       => "{$single_product['data']['name']}",
                'price'      => $single_product['data']['regular_price']['amount'],
                'sale_price' => $single_product['data']['regular_price']['amount'],
            ];

            // response update products
            $response = $this->resolve_call("/products/".$product->product_id,'put', $updated_products);
            $results[] = $response->status();

            if($response->failed()):
                return [
                    'results'   => $response->status(),
                    'failed'    => true
                ];
            endif;

        endforeach;


        return [
            'results'   => $results,
            'failed'    => false
        ];
    }

    public function change_price_products(){
        $results = [];
        // discounts on products
        $updated_products = [];

        // loop products
        foreach($this->products as $product):
            $single_product_response     = $this->resolve_call("/products/".$product->product_id);
            $single_product              = $single_product_response->json();

            if(!isset($single_product['data'])) return;

            $updated_products = [
                'name'       => "{$single_product['data']['name']}",
                'price'      => $this->ar_to_en_numeric($product->values),
            ];

            // response update products
            $response = $this->resolve_call("/products/".$product->product_id,'put', $updated_products);
            $results[] = $response->status();

            if($response->failed()):
                return [
                    'results'   => $response->status(),
                    'failed'    => true
                ];
            endif;

        endforeach;


        return [
            'results'   => $results,
            'failed'    => false
        ];
    }

    public function delete_tags_products(){
        // add tags products
        $results = [];

        // loop products
        foreach ($this->products as $product):

            // fetch all categories
            $categories_deleted = explode('-',$product->values);

            // check if categories is exist
            if($categories_deleted):

                // fetch categories from app salla
                $single_product_response       = $this->resolve_call("/products/".$product->product_id);
                $single_product                = $single_product_response->json();

                if(!isset($single_product['data'])) return;

                $required_update['name']       = $single_product['data']['name'];
                $all_categories                = collect($single_product['data']['categories'])->pluck('id')->all();
                $required_update['categories'] = array_diff($all_categories,$categories_deleted);

                $response = $this->resolve_call("/products/".$product->product_id,'put',$required_update);
                $results[]= $response->json();

                $product->update([
                    'values' => null
                ]);


            endif;

        endforeach;

        return [
            'results' => $results
        ];
    }

    public function add_tags_products(){
        // add tags products
        $results = [];

        // loop products
        foreach ($this->products as $product):
            // fetch all categories
            $all_categories = explode('-',$product->values);

            $categories = [];

            // check if categories is exist
            if(count($all_categories) > 0):

                // foreach categories
                foreach($all_categories as $category_name):

                    // search about category
                    $category = $this->search_about_category($category_name);

                    $categories[]= $category;

                endforeach;

                $single_product_response            = $this->resolve_call("/products/".$product->product_id);
                $single_product                     = $single_product_response->json();

                if(!isset($single_product['data'])) return;

                $all_added_categories['name']       = $single_product['data']['name'];
                $already_exist_categories           = collect($single_product['data']['categories'])->pluck('id')->all();
                $all_added_categories['categories'] = array_merge($already_exist_categories,$categories);

                $response  = $this->resolve_call("/products/".$product->product_id,'put',$all_added_categories);
                $results[] = $response->json();

                $product->update([
                    'values' => null
                ]);

            endif;


        endforeach;

        return [
            'results' => $results
        ];
    }

    public function search_about_category($category_name){

        $category_result_search = $this->search_on_all_categories($category_name);

        if($category_result_search['status'] == false){
            $category = $this->add_new_category($category_name);
            return $category['category_id'];
        }
        // $category = $this->add_new_category($category_name);
        // return $category['category_id'];
       return $category_result_search['category_id'];
    }

    public function search_on_all_categories($category_name,$page = 1){

        $response = $this->resolve_call('/categories?keyword='.urlencode($category_name));

        $result   = $response->json();

        if(count($result['data']) == 0):
            return [
                'status' => false
            ];
        elseif(count($result['data']) > 0):
            $selected = [];
            foreach($result['data'] as $item):
                if(preg_match('/'.$category_name.'/i',$item['name']) == 1):
                    $selected =  $item;
                    break;
                endif;
            endforeach;

            if(count($selected) == 0 ):
                return [
                    'status' => false
                ];
            endif;

            return [
                'status' => true,
                'category_id' => isset($selected['id']) ? $selected['id'] : null
            ];
        endif;
    }

    public function  add_new_category($category_name){
        $response = $this->resolve_call('/categories','post',[
            'name'   => $category_name,
            'status' => 'active',
            'metadata_title' => $category_name,
            'metadata_description' => $category_name
        ]);

        $result = collect($response->json());

        if($response->successful()):
            return [
                'status' => true,
                'category_id' => $result['data']['id']
            ];
        else:
            return [
                'status' => false,
                'category_id' => null
            ];
        endif;

    }

    public function ar_to_en_numeric($string) {
        return strtr($string, array('۰'=>'0', '۱'=>'1', '۲'=>'2', '۳'=>'3', '۴'=>'4', '۵'=>'5', '۶'=>'6', '۷'=>'7', '۸'=>'8', '۹'=>'9', '٠'=>'0', '١'=>'1', '٢'=>'2', '٣'=>'3', '٤'=>'4', '٥'=>'5', '٦'=>'6', '٧'=>'7', '٨'=>'8', '٩'=>'9'));
    }
}

