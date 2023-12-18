<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Schedule extends Model
{
    use HasFactory;

    protected $fillable = [
        'repeate','count_repeate','repeate_at_time','unit_repeate','repeate_on','end_type_cal','end_at','type_repeate'
    ];

    public function compaign(){
        return $this->belongsTo('App\Models\Campaign','campaign_id','id');
    }

    public function getRepeateOnHandleAttribute(){
        if ($this->repeate_on == null)
            return [];

        return explode('-',$this->repeate_on);
    }
    
}
