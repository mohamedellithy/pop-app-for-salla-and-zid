<?php
namespace App\Services;
use App\Models\Product;
use App\Models\Category;
use App\Services\AppService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CampaignService {
    private $data = array();

    public function __construct($data = array()){
        $this->data = $data;
    }

    public function store(){
        DB::beginTransaction();
        try{
            $campaign = auth()->user()->campaign()->create([
                'name'          => $this->data['name'] ?: null,
                'description'   => isset($this->data['description']) ? $this->data['description'] : null,
                'action'        => $this->data['action'],
                'status'        => $this->data['status'] ?: 1,
                'type_set'      => $this->data['type_set'] ?: 0,
                'progress'      => 0,
                'type_selected' => $this->data['type_selected'] == 1 ? 'products' : 'categories'
            ]);

            // handle campagin have not repeate
            $this->handle_campagin_have_not_repeate();

            // set end_at null if repeate not have it
            $this->set_end_at_to_campaign_that_not_have_repeate_or_not_a_custom();


            // set end_at null if campaign type custom and without limit
            $this->set_end_at_to_campaign_a_custom_with_limit();

            if($campaign):

                $campaign->schedule()->create([
                    'repeate'          => $this->data['repeate'],
                    'count_repeate'    => $this->data['count_repeate'],
                    'unit_repeate'     => $this->data['unit_repeate'],
                    'repeate_on'       => is_array($this->data['reapete_on']) ? implode('-',$this->data['reapete_on']) : $this->data['reapete_on'],
                    'repeate_at_time'  => $this->data['repeate_at_time'],
                    'end_type_cal'     => $this->data['end_type_cal'],
                    'end_at'           => $this->data['end_at'],
                    'type_repeate'     => $this->data['type_repeate']
                ]);

                if(isset($this->data['products'])):

                    if(count($this->data['products']) > 0):

                        // insert new products
                        $products = new Product();
                        $products->insert($this->loop_products_selected_campaign($campaign));

                        $this->run_campaign_now($campaign);
                    endif;
                endif;

                if(isset($this->data['categories'])):

                    if(count($this->data['categories']) > 0):

                        // insert new products
                        $categories = new Category();
                        $categories->insert($this->loop_categories_selected_campaign($campaign));

                        $this->run_campaign_now($campaign);
                    endif;

                endif;

            endif;

            DB::commit();
            return response()->json(array('campaigns' => $campaign));
        } catch(\Exception $e) {
            DB::rollBack();
            return response()->json(array('errors' => $e->getMessage()),401);
        }
    }

    public function update($id){

        DB::beginTransaction();
        try{
            $campaign = auth()->user()->campaign()->where('id',$id)->first();
            $campaign_update = $campaign->Update([
                'name'          => $this->data['name'] ?: null,
                'description'   => isset($this->data['description']) ? $this->data['description'] : null,
                'action'        => $this->data['action'],
                'status'        => $this->data['status'] ?: 1,
                'type_set'      => $this->data['type_set'] ?: 0,
                'type_selected' => $this->data['type_selected'] == 1 ? 'products' : 'categories'
            ]);

            // handle campagin have not repeate
            $this->handle_campagin_have_not_repeate();

            // set end_at null if repeate not have it
            $this->set_end_at_to_campaign_that_not_have_repeate_or_not_a_custom();


            // set end_at null if campaign type custom and without limit
            $this->set_end_at_to_campaign_a_custom_with_limit();

            if($campaign_update):

                // reback campagin to progress 0
                $this->update_campaign_pregress_to_0_if_campaign_update_time($campaign);

                $campaign->schedule()->update([
                   'repeate'          => $this->data['repeate'],
                   'count_repeate'    => $this->data['count_repeate'],
                   'unit_repeate'     => $this->data['unit_repeate'],
                   'repeate_on'       => is_array($this->data['reapete_on']) ? implode('-',$this->data['reapete_on']) : $this->data['reapete_on'],
                   'repeate_at_time'  => $this->data['repeate_at_time'],
                   'end_type_cal'     => $this->data['end_type_cal'],
                   'end_at'           => $this->data['end_at'],
                   'type_repeate'     => $this->data['type_repeate']
                ]);

                if (isset($this->data['products'])):

                    // reomved products not add to campaign
                    $campaign->products()->delete();

                    if(count($this->data['products']) > 0):

                        // insert new products
                        $products = new Product();
                        $products->insert($this->loop_products_selected_campaign($campaign));

                        $this->run_campaign_now($campaign);
                    endif;

                endif;

                if(isset($this->data['categories'])):

                    $campaign->categories()->delete();

                    if(count($this->data['categories']) > 0):

                        // insert new products
                        $categories = new Category();
                        $categories->insert($this->loop_categories_selected_campaign($campaign));

                        $this->run_campaign_now($campaign);
                    endif;

                endif;

            endif;

            DB::commit();

            // run if Date selected Now
            //$operation    = (new OperationsZid($request))->run();

            return response()->json(array('campaigns' => $campaign));
        }catch(\Exception $e){
            DB::rollBack();
            return response()->json(array('errors' => [$e->getMessage()]),401);
        }
    }


    public function handle_campagin_have_not_repeate(){
        if($this->if_campaign_without_repeate()):
            $this->data['count_repeate'] = 1;
            $this->data['end_type_cal']  = 1;
        endif;
    }

    public function if_campaign_without_repeate(){
        return ( ($this->data['repeate'] == 0) &&  ($this->data['end_at'] != null) &&  ($this->data['repeate_at_time'] != null)) ? true : false;
    }

    public function set_end_at_to_campaign_that_not_have_repeate_or_not_a_custom(){
        if($this->if_campaign_not_repeate_or_not_a_custom()):
            $this->data['end_at'] = null;
        endif;
    }

    public function if_campaign_not_repeate_or_not_a_custom(){
        return (($this->data['repeate'] != 0) && ($this->data['repeate'] != 'custom')) ? true : false;
    }

    public function set_end_at_to_campaign_a_custom_with_limit(){
        if( ($this->data['repeate'] == 'custom') && ($this->data['end_type_cal'] == 0) ):
            $this->data['end_at'] = null;
        endif;
    }

    public function update_campaign_pregress_to_0_if_campaign_update_time($campaign){
        if(($campaign->schedule->repeate != $this->data['repeate'])
        || ($campaign->schedule->end_at != $this->data['end_at'])
        || ($campaign->schedule->repeate_at_time != $this->data['repeate_at_time'])
        || ($campaign->schedule->count_repeate != $this->data['count_repeate']) ):
            $campaign->update([
                'progress' => 0
            ]);
        endif;
    }

    public function run_campaign_now($campaign){
        if(($campaign->schedule->repeate == '0') && ($campaign->schedule->repeate_at_time == null)):
            $operation = AppService::Operations(auth()->user()->zid_config->app_name ?: 'zid');
            $operation->merchant = auth()->user()->zid_config;
            return $operation->run($campaign);
        endif;
    }

    public function loop_products_selected_campaign($campaign){
        $products_fill       = [];
        foreach ($this->data['products'] as $product):
            $values = isset($this->data['set_values_products']) ? $this->data['set_values_products'] : null;
            $notes  = isset($this->data['set_notes_products'])  ? $this->data['set_notes_products'] : null;
            $products_fill[] = [
                'product_id' => $product,
                'campaign_id'=> $campaign->id,
                'values'     => is_array($values) ? ( isset($values[$product]) ?  $values[$product] : null) : ( $values ?: null),
                'notes'      => is_array($notes) ? ( isset($notes[$product]) ?  $notes[$product] : '-1') : ( $notes ?: '-1')
            ];
        endforeach;

        return $products_fill;
    }

    public function loop_categories_selected_campaign($campaign){
        $categories_fill       = [];
        foreach ($this->data['categories'] as $category):
            $values = isset($this->data['set_values_products']) ? $this->data['set_values_products'] : null;
            $notes  = isset($this->data['set_notes_products'])  ? $this->data['set_notes_products'] : null;
            $categories_fill[] = [
                'category_id' => $category,
                'campaign_id' => $campaign->id,
                'values'      => is_array($values) ? ( isset($values[$category]) ?  $values[$category] : null) : ( $values ?: null),
                'notes'       => is_array($notes) ? ( isset($notes[$category]) ?  $notes[$category] : '-1') : ( $notes ?: '-1')
            ];
        endforeach;

        return $categories_fill;
    }
}
