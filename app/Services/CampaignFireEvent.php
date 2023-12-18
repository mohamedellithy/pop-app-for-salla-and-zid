<?php
namespace App\Services;

class CampaignFireEvent{

    private $campaign;

    public function __construct($campaign){
        $this->campaign = $campaign;
    }

    public function decreament_count_repeate(){
        // updated count running campaign
        if($this->campaign_can_decrement()):
            $this->campaign->schedule->decrement('count_repeate', 1);
        endif;
    }


    public function campaign_can_decrement(){
        return (
            (($this->campaign->schedule->count_repeate != 0) || ($this->campaign->schedule->count_repeate != null))
            &&
            (($this->campaign->schedule->repeate == "0") || ($this->campaign->schedule->type_repeate == "1"))
        ) ? true : false;
    }

    public function make_campaign_completed(){

        // type of repeate if schedule not reapete or not
        if(($this->campaign->schedule->repeate == "0") && ($this->campaign->schedule->count_repeate == 0)):
            $this->campaign->update([
               'progress' => 2
            ]);
            return;
        endif;

        // count of repeate
        if(($this->campaign->schedule->count_repeate === 0) && ($this->campaign->schedule->repeate != "0") && ($this->campaign->schedule->type_repeate == "1")):
            $this->campaign->update([
                'progress' => 2
            ]);
            return;
        endif;

        //end at date
        if(($this->campaign->schedule->end_type_cal == 1) &&
                ( strtotime($this->campaign->schedule->end_at) <= strtotime(date('Y-m-d')) ) &&
                (($this->campaign->schedule->repeate == "0") || (($this->campaign->schedule->repeate == "custom")))
            ):
            $this->campaign->update([
                'progress' => 2
            ]);
            return;
        endif;
    }
}
