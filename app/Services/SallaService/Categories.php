<?php
namespace App\Services\SallaService;

use Log;
use stdClass;
use App\Http\Resources\SallaProductsCat;

class Categories extends Credential{
    public function fetchProducts($category,$page_no = 1){
        $response = $this->resolve_call('/products?category='.$category->category_id.'&per_page=65&page='.$page_no);
        if($response->successful()) {
            $products  = $response->json();
            foreach($products['data'] as $product):
                $var = new stdClass();
                $var->product_id = $product['id'];
                $var->values     = $category->values;
                $var->status     = $category->status;
                $var->notes      = $category->notes;
                $results[] = $var;
            endforeach;

            if($products['pagination']['currentPage'] < $products['pagination']['totalPages']):
                $this->fetchProducts($category,$products['pagination']['currentPage'] + 1);
            endif;

            return $results;
        }
    }
}
