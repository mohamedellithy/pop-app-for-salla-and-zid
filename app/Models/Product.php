<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Services\AppService;
use Illuminate\Http\Request;
class Product extends Model
{
    use HasFactory;

    protected $fillable = ['product_id','values','notes','status'];

    public function compaign(){
        return $this->belongsTo('App\Models\Campaign','campaign_id','id')->withTrashed();
    }

    public function getProductValuesAttribute(){
        if ($this->compaign->action == "4" || $this->compaign->action == "5"):
            if ($this->values != null):
                return explode('-',$this->values);
            endif;

            return null;
        endif;
        return $this->values;
    }

    public function getCategoriesAttribute(){
        if ($this->compaign->action == "4" || $this->compaign->action == "5"):
            return (AppService::Items($this->compaign->merchant->zid_config->app_name ?: 'zid'))->get_categories_by_products($this->compaign->merchant->zid_config,$this->product_id);
        endif;
        return null;
    }

    public function attachments(){
        return $this->HasMany('App\Models\Attachment','product_id','product_id');
    }
}
