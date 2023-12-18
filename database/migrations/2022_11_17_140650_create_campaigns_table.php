<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCampaignsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('campaigns', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id')->required();
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->string('name')->required();
            $table->text('description')->nullable();
            $table->enum('action',[0,1,2,3,4,5,6])->comment("
                0 =>  نشر المنتجات,
                1 =>  الغاء نشر المنتجات,
                2 =>  تخفيضات على المنتجات,
                3 =>  تغير فى السعر المنتجات,
                4 =>  اضافة الترميزات الخاصة للمنتجات,
                5 =>  حذف الترميزات الخاصة للمنتجات,
                6 =>  الغاء تخفيضات على المنتجات
            ")->default(null);
            $table->string('type_set')->default("0");
            $table->string('type_selected')->default("products")->comment('products,categories');
            $table->integer('status')->comments("1 => working , 0 => stopped")->default(0);
            $table->integer('progress')->comments("0 => working , 1 => ended")->default(0);
            $table->softDeletes();
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
        Schema::dropIfExists('campaigns');
    }
}
