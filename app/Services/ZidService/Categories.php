<?php
namespace App\Services\ZidService;

class Categories extends Credential{
    private $results = [];
    public function fetchProducts($campaign,$page_no = 2){
        $response = $this->resolve_call('/products/?page_size=99&page='.$page_no);

        if($response->successful()):

            $products   = $response->json()['results'];
            $categories = $campaign->categories->pluck('category_id')->toArray();

            foreach($products as $product):
                $product_id     = $product["id"];
                $all_categories = [];
                $results[$product_id] = collect($product["categories"])->contains(function($value) use($categories,&$all_categories){
                    if(in_array($value["id"],$categories)):
                        $all_categories[] = $value["id"];
                        return true;
                    endif;
                });

                if($results[$product_id] == true):
                    $this->results[] = (object) $campaign->categories()->whereIn('category_id',$all_categories)
                    ->get()->map(function($value) use($product_id){
                        return (object) collect($value)->merge([
                            'product_id' => $product_id
                        ])->all();
                    })->all();
                endif;

            endforeach;

            if($response->json()['next']):

                parse_str(parse_url($response->json()['next'],PHP_URL_QUERY),$query_next);
                if((count($query_next) > 0 ) && (isset($query_next['page'])) ):
                    $this->fetchProducts($campaign,$query_next['page']);
                endif;

            endif;

        endif;

        return $this->results;
    }
}
