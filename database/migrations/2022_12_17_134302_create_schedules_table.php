<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSchedulesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('schedules', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('campaign_id');
            $table->foreign('campaign_id')->references('id')->on('campaigns')->onDelete('cascade');
            $table->string('repeate')->required();
            $table->string('repeate_at_time')->nullable();
            $table->integer('count_repeate')->nullable();
            $table->string('unit_repeate')->nullable();
            $table->string('repeate_on')->nullable();
            $table->integer('end_type_cal')->comment('0 => never , 1 => at , 2 => after')->dafault(0);
            $table->timestamp('end_at')->nullable();
            $table->integer('type_repeate')->default(0)->comment('0 => never , 1 => according count_repeate');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('schedules');
    }
}
