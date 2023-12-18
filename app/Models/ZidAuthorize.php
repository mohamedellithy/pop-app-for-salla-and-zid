<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ZidAuthorize extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'access_token',
        'token_type',
        'expires_in',
        'authorization',
        'refresh_token',
        'store_id',
        'store_url',
        'merchant_email',
        'merchant_phone',
        'app_name'
    ];
}
