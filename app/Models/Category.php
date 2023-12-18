<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;
    
    protected $appends=['product_id'];

    protected $fillable = ['category_id','values','notes','status'];

    public function compaign(){
        return $this->belongsTo('App\Models\Campaign','campaign_id','id')->withTrashed();
    }

    public function getCategoryValuesAttribute(){
        if ($this->compaign->action == "4" || $this->compaign->action == "5"):
            if ($this->values != null):
                return explode('-',$this->values);
            endif;

            return null;
        endif;
        return $this->values;
    }

    public function getProductIdAttribute(){
        return $this->values;
    }
}

