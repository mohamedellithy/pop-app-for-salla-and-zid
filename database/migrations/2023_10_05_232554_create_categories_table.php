<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCategoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('categories', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('campaign_id')->required();
            $table->foreign('campaign_id')->references('id')->on('campaigns')->onDelete('cascade');
            $table->text('category_id')->required();
            $table->text('values')->nullable();
            $table->string('notes')->default('-1');
            $table->integer('status')->comments("0 => not start , 1 => finished")->default(0);
            $table->engine = "MyISAM";
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
        Schema::dropIfExists('categories');
    }
}
