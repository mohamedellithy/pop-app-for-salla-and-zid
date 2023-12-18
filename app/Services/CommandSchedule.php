<?php
namespace App\Services;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Support\Facades\Http;
use App\Models\Campaign;
use Exception;
use Illuminate\Http\Request;
use Log;
use App\Services\AppService;
class CommandSchedule{
    private $campaign_schedule;
    public $campaign;
    public $schedule;
    public $merchant;
    private $command;

     /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    public function __construct(Schedule $schedule){
        $this->schedule = $schedule;

        $this->start_campaign_schedule();
    }

    private function start_campaign_schedule(){
        $campaigns = Campaign::where('status',1)->where('progress','!=',2);
        if ($campaigns->exists()):
            foreach($campaigns->get() as $campaign):

                // campaign
                $this->campaign = $campaign;

                // schedule of capaign
                $this->campaign_schedule = $campaign->schedule;

                // merchant config
                $this->merchant          = $campaign->merchant->zid_config;

                // type of repeate if schedule not reapete or not
                if(($this->campaign_schedule->repeate == "0") && ($this->campaign_schedule->count_repeate == null)):
                    continue;
                endif;

                // count of repeate
                if(($this->campaign_schedule->count_repeate === 0) && ($this->campaign_schedule->type_repeate == 1)):
                    continue;
                endif;

                //end at date
                if(($this->campaign_schedule->end_type_cal == 1) &&
                   ( strtotime($this->campaign_schedule->end_at) < strtotime(date('Y-m-d')) ) &&
                   (($this->campaign_schedule->repeate == "0") || (($this->campaign_schedule->repeate == "custom")))
                ):
                    continue;
                endif;

                // working on operation
                $campaign->update([
                    'progress' => 1
                ]);

                $this->load_campagin_schedule($campaign);

            endforeach;
        endif;
    }

    public function load_campagin_schedule($campaign){

        $this->command = $this->schedule->call(function() use($campaign){
            set_time_limit(1000000);
            try{
                $operation           = AppService::Operations($this->merchant->app_name ?: 'zid');
                $operation->merchant = $this->merchant;
                $result              = $operation->run($campaign);
                $log                 = '';
                if(isset($result['failed']) && $result['failed'] == true){
                    $log  = $result['results'];
                } else {
                    $log  = "Campaign is Completed successfully";
                }

                $campaign->campaign_logs()->create([
                    'log' =>  $log,
                ]);
            } catch(Exception $exception){
                $campaign->campaign_logs()->create([
                    'log' => $exception->getMessage(),
                ]);
            }
        });

        $this->name_config();

        $this->repeate_config();

        $this->repeate_at_time_config();

        $this->repeate_on_days_config();

        $this->custom_repeate_config();

        //$this->run_once_time_at_selected_date_config();

        $this->timezone_config($campaign->merchant);

        $this->prevent_ovelaping();
    }

    private function name_config(){
        /**
         * name of Campaign
         */
        $this->command = $this->command->name('Campaign '.$this->campaign->name.' ('.$this->campaign_schedule->campaign_id.')');
    }

    private function timezone_config($merchant){
        /**
         * timezones
         * ($merchant->time_zone ?: 'Africa/Cairo')
         */
        $this->command =  $this->command->timezone($merchant->time_zone ?: "Africa/Cairo");
    }

    private function prevent_ovelaping(){
        $this->command =  $this->command->withoutOverlapping()->onOneServer();
    }

    private function repeate_config(){
        /**
         * daily
         * weekly
         * monthly
         * annually
         * weekends
         */

        if($this->campaign_schedule->repeate     === 'daily'):

           $this->command = $this->command->daily();

        elseif($this->campaign_schedule->repeate === 'weekly'):

           $this->command = $this->command->weekly();

        elseif($this->campaign_schedule->repeate === 'monthly'):

           $this->command = $this->command->monthly();

        elseif($this->campaign_schedule->repeate === 'annually'):

           $this->command = $this->command->yearly();

        elseif($this->campaign_schedule->repeate === 'weekends'):

           $this->command = $this->command->weekends();

        endif;
    }

    private function repeate_at_time_config(){
        /**
         * daily with time
         */
        if(($this->campaign_schedule->repeate  === 'daily') && ($this->campaign_schedule->repeate_at_time != null)):

            $this->command = $this->command->dailyAt($this->campaign_schedule->repeate_at_time);
        endif;
    }

    private function repeate_on_days_config(){
        /**
         * weekly
         * weekends
         * monthly
         * annually
         */
        if(
            (!in_array($this->campaign_schedule->repeate, [
                '0',
                'daily',
                'custom'
            ]))
            && ($this->campaign_schedule->repeate_on != null)
        ):

            if(($this->campaign_schedule->repeate == 'weekly') || ($this->campaign_schedule->repeate == 'weekends')):

                $DAYS = explode('-', $this->campaign_schedule->repeate_on);

                $kernal_days = [
                    'SATURDAY' => schedule::SATURDAY,
                    'SUNDAY'   => schedule::SUNDAY,
                    'MONDAY'   => schedule::MONDAY,
                    'TUESDAY'  => schedule::TUESDAY,
                    'WEDNESDAY'=> schedule::WEDNESDAY,
                    'THURSDAY' => schedule::THURSDAY,
                    'FRIDAY'   => schedule::FRIDAY
                ];

                $day_list = [];

                foreach($DAYS as $day):
                    $day_list []= $kernal_days[$day];
                endforeach;

                $this->command = $this->command->days($day_list)->at($this->campaign_schedule->repeate_at_time ?: '00:15');

            elseif($this->campaign_schedule->repeate == 'monthly'):

                $this->command = $this->command->monthlyOn($this->campaign_schedule->repeate_on,$this->campaign_schedule->repeate_at_time ?: '01:55');

            elseif($this->campaign_schedule->repeate == 'annually'):

                $this->command = $this->command->yearlyOn(2,$this->campaign_schedule->repeate_on,$this->campaign_schedule->repeate_at_time ?: '01:55');

            endif;

        endif;
    }

    private function custom_repeate_config(){
        /**
         * Custom
         */
        if (
            (in_array($this->campaign_schedule->repeate, [
                'custom'
            ]))
            && ($this->campaign_schedule->repeate_on != null)
        ):

            if($this->campaign_schedule->unit_repeate == 0 || $this->campaign_schedule->unit_repeate == 1):
                /**
                 * dialy
                 * weekly
                */

                $DAYS = explode('-', $this->campaign_schedule->repeate_on);

                $kernal_days = [
                    'SATURDAY' => schedule::SATURDAY,
                    'SUNDAY'   => schedule::SUNDAY,
                    'MONDAY'   => schedule::MONDAY,
                    'TUESDAY'  => schedule::TUESDAY,
                    'WEDNESDAY'=> schedule::WEDNESDAY,
                    'THURSDAY' => schedule::THURSDAY,
                    'FRIDAY'   => schedule::FRIDAY
                ];

                $day_list = [];

                foreach($DAYS as $day):
                    $day_list []= $kernal_days[$day];
                endforeach;

                $this->command = $this->command->days($day_list)->at($this->campaign_schedule->repeate_at_time ?: '00:15');

            elseif($this->campaign_schedule->unit_repeate == 2):
                /**
                 * monthly
                 */
                $this->command = $this->command->monthlyOn($this->campaign_schedule->repeate_on,$this->campaign_schedule->repeate_at_time ?: '01:55');

            elseif($this->campaign_schedule->unit_repeate == 3):
                /**
                 * annually
                 */
                $this->command = $this->command->yearlyOn(2,$this->campaign_schedule->repeate_on,$this->campaign_schedule->repeate_at_time ?: '01:55');

            endif;

        endif;

    }

    private function run_once_time_at_selected_date_config(){
         /**
         * 0
         */
        if (
            (in_array($this->campaign_schedule->repeate, [
                '0'
            ]))
            && ($this->campaign_schedule->count_repeate > 0)
        ):
            if(strtotime(date('Y-m-d',strtotime($this->campaign_schedule->end_at))) == strtotime(date('Y-m-d')) ):
                $this->command = $this->command->at($this->campaign_schedule->repeate_at_time ?: '00:15');
            endif;

        endif;
    }
}
