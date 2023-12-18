<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CampaignLog extends Model
{
    use HasFactory;
    protected $fillable = ['campaign_id','log'];

   // public $timestamps = false;
   public function getCreatedAtAttribute($value){
       return date('D m , M  Y ',strtotime($value));
   }
}
