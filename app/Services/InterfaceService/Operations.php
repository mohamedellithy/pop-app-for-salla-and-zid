<?php
namespace App\Services\InterfaceService;

use App\Models\Campaign;
Interface Operations {

    public function run(Campaign $campaign);

    public function publish_products();

    public function unpublish_products();

    public function discounts_on_products();

    public function get_calculate_discount_value($product,$price = null);

    public function remove_discounts_on_products();

    public function change_price_products();

    public function delete_tags_products();

    public function add_tags_products();

    public function search_about_category($category_name);

    public function search_on_all_categories($category_name,$page = 1);

    public function add_new_category($category_name);
}

