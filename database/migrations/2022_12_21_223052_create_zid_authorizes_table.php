<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateZidAuthorizesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('zid_authorizes', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id')->required();
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->text('access_token')->nullable();
            $table->text('token_type')->nullable();
            $table->text('expires_in')->nullable();
            $table->text('authorization')->nullable();
            $table->text('refresh_token')->nullable();
            $table->string('store_id')->nullable();
            $table->text('store_url')->nullable();
            $table->text('merchant_email')->nullable();
            $table->text('merchant_phone')->nullable();
            $table->text('app_name')->nullable();
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
        Schema::dropIfExists('zid_authorizes');
    }
}
