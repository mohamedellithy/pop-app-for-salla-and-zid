<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;
use App\Services\CommandSchedule;
use Log;
use Illuminate\Support\Facades\Http;
class Kernel extends ConsoleKernel
{
    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = [
        //
        Commands\RefreshAppAccounts::class
    ];

    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        // here handle all actions process
        $command = new CommandSchedule($schedule);
        $command->schedule;

        // refresh token
        $schedule->command('command:refresh_accounts')->weekly();
        //->monthly();

        // https://webhook.site/8876a6cf-a708-44b9-8f2f-ab8212bf7935
        // $schedule->call(function () {
        //     Http::get('https://webhook.site/7e365462-a4fb-42bc-932b-1daa458f1cc3');
        // })->everyMinute();
    }

    /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }
}
