<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
class Campaign extends Model
{
    use HasFactory,SoftDeletes;

    protected $fillable = ['name', 'description','action','type_set','progress','status','type_selected'];

    public function schedule(){
        return $this->hasOne('App\Models\Schedule','campaign_id','id');
    }

    public function merchant(){
        return $this->belongsTo('App\Models\User','user_id','id');
    }

    public function products(){
        return $this->hasMany('App\Models\Product','campaign_id','id');
    }

    public function categories(){
        return $this->hasMany('App\Models\Category','campaign_id','id');
    }

    public function campaign_logs(){
        return $this->hasMany('App\Models\CampaignLog','campaign_id','id');
    }

    public function getProductsIdsAttribute(){
        return $this->products->pluck('product_id')->toArray();
    }

    public function getCategoriesIdsAttribute(){
        return $this->categories->pluck('category_id')->toArray();
    }

}
