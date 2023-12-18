<?php 
namespace App\Services\InterfaceService;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
interface Items {

    public function __construct();

    public function products();

    public function single_product($product_id);

    public function get_categories_by_products($merchant,$product);

}
