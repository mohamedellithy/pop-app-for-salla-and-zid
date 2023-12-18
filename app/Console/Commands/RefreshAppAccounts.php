<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Log;
use App\Models\User;
use App\Services\AppService;

class RefreshAppAccounts extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'command:refresh_accounts';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $users = User::all();
        foreach($users as $user):
            try{
                if(($user->zid_config) && ($user->zid_config->app_name != null)):
                    $app    = AppService::authorize($user->zid_config->app_name);
                    $result = $app::refresh_merchant_token($user);
                    Log::info($result);
                endif;
            }catch(\Exception $e){
                Log::info($e->getMessage());
            }
        endforeach;
        return 0;
    }
}
