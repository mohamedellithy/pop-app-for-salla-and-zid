<?php
namespace App\Services\ZidService;

use Log;

use App\Models\Product;
use App\Models\Campaign;
use App\Models\Attachment;
use Illuminate\Http\Request;
use App\Services\CampaignFireEvent;
use App\Services\ZidService\Categories;
use Illuminate\Support\Facades\Http;
use App\Services\InterfaceService\Operations as InterfaceOperations;

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
            $categories           = new Categories();
            $categories->merchant = $this->merchant;
            $this->categories     = $categories->fetchProducts($campaign);
            foreach($this->categories as $category_products):
                $this->products = $category_products;
                $this->start_operations($campaign);
            endforeach;
        endif;
    }

    public function start_operations($campaign){
        // check if operation exists
        if(method_exists($this,$this->operations[$this->current_operation])):
            try{
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

        // published products
        $updated_products = [];

        // loop products
        foreach($this->products as $product):
            $updated_products[] = [
                'id'           => $product->product_id,
                'is_draft'     => false,
                'is_published' => true
            ];
        endforeach;

        // response update products
        $response = $this->resolve_call("/products/",'patch', $updated_products);

        return [
            'results'   => $response->body(),
            'failed'    => $response->failed() ?: ( $response->successful() ? false : true )
        ];

    }

    public function unpublish_products(){
        // unpublish products
        $updated_products = [];

        // loop products
        foreach ($this->products as $product):
            $updated_products[] = [
                'id'           => $product->product_id,
                'is_draft'     => true,
                'is_published' => false
            ];
        endforeach;

        // response update products
        $response = $this->resolve_call("/products/",'patch', $updated_products);

        return [
            'results'   => $response->body(),
            'failed'    => $response->failed() ?: ( $response->successful() ? false : true )
        ];
    }

    public function discounts_on_products(){
        // discounts on products
        $updated_products = [];

        // loop products
        foreach ($this->products as $product):
            $updated_products[] = [
                'id' => $product->product_id,
                'sale_price' => "{$this->get_calculate_discount_value($product)}",
            ];
        endforeach;

        // response update products
        $response = $this->resolve_call("/products/",'patch', $updated_products);

        return [
            'results'   => $response->body(),
            'failed'    => $response->failed() ?: ( $response->successful() ? false : true )
        ];
    }

    public function get_calculate_discount_value($product,$price = null){

        // response update products
        $response = $this->resolve_call("/products/".$product->product_id);

        $item = $response->object();

        $discount = ($item->price * floatval($this->ar_to_en_numeric($product->values))) / 100;

        // here filter type of discount if percent or by value
        if($product->notes == 'percentage'){
            return $item->price - $discount;
        }

        return $item->price - floatval($this->ar_to_en_numeric($product->values));
    }

    public function remove_discounts_on_products(){
        // discounts on products
        $updated_products = [];

        // loop products
        foreach($this->products as $product):
            $updated_products[] = [
                'id' => $product->product_id,
                'sale_price' => null,
            ];
        endforeach;

        // response update products
        $response = $this->resolve_call("/products/",'patch',$updated_products);

        return [
            'results'   => $response->body(),
            'failed'    => $response->failed() ?: ( $response->successful() ? false : true )
        ];
    }

    public function change_price_products(){
        // change price products
        $updated_products = [];

        // loop products
        foreach ($this->products as $product):
            $updated_products[] = [
                'id'           => $product->product_id,
                'price'        => "{$this->ar_to_en_numeric($product->values)}",
            ];
        endforeach;

        // response update products
        $response = $this->resolve_call("/products/",'patch',$updated_products);

        return [
            'results'   => $response->body(),
            'failed'    => $response->failed() ?: ( $response->successful() ? false : true )
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

                // foreach categories
                foreach($categories_deleted as $category):

                    // if category is not exist
                    if(!$category):
                        continue;
                    endif;

                    $response = $this->resolve_call("/products/".$product->product_id.'/categories/'.$category.'/','delete');

                    $results[]= $response->json();

                endforeach;

                Product::where('id',$product->id)->update([
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

            // check if categories is exist
            if(count($all_categories) > 0):

                // foreach categories
                foreach($all_categories as $category_name):

                    // search about category
                    $category = $this->search_about_category($category_name);


                    // if category is not exist
                    if($category['status'] == false):
                        continue;
                    endif;

                    // add category for product
                    $response = $this->resolve_call(
                        '/products/'.$product->product_id.'/categories/',
                        'post',
                        array('id' => $category['category_id'])
                    );

                    $results[]= $response->json();

                endforeach;

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
        $category = $this->add_new_category($category_name);
        if($category['status'] == false){
            $category = $this->search_on_all_categories($category_name);
        }

        return $category;
    }

    public function search_on_all_categories($category_name,$page = 1){

        $response = $this->resolve_call('/managers/store/categories?page='.$page);

        $result = $response->object();

        if(count($result->categories) <= 0){
            return [
                'status' => false
            ];
        }

        $category = collect($result->categories)->where('name', $category_name)->first();

        if($category){
            return [
                'status'      => true,
                'category_id' => $category->id
            ];
        }

        if($result->pagination->page > $result->pagination->last_page){
            return [
                'status' => false
            ];
        }
        return $this->search_on_all_categories($category_name,$result->pagination->page + 1);
    }

    public function  add_new_category($category_name){

        if($category_name == null):
            return [
                'status' => false,
            ];
        endif;

        $response = $this->resolve_call('/managers/store/categories/add','post',[
                'name' => [
                    'ar' => $category_name,
                    'en' => $category_name,
                ],
                'description' => [
                    'ar' => $category_name,
                    'en' => $category_name,
                ]
        ]);

        $result = $response->object();

        if($result->status =='validation_error'){
            return [
                'status' => false,
            ];
        }

        return [
            'status' => true,
            'category_id' => $result->category->id
        ];

    }

    public function ar_to_en_numeric($string) {
        return strtr($string, array('۰'=>'0', '۱'=>'1', '۲'=>'2', '۳'=>'3', '۴'=>'4', '۵'=>'5', '۶'=>'6', '۷'=>'7', '۸'=>'8', '۹'=>'9', '٠'=>'0', '١'=>'1', '٢'=>'2', '٣'=>'3', '٤'=>'4', '٥'=>'5', '٦'=>'6', '٧'=>'7', '٨'=>'8', '٩'=>'9'));
    }

}

