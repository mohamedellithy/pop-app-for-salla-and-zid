<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Database\Eloquent\Builder;
class User extends Authenticatable
{
    use HasApiTokens,HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name','time_zone','email','phone','role','password'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    /**
     *  the relation with campaign
     *
     * @var Collection Object
     */

    public function campaign(){
        return $this->hasMany('App\Models\Campaign','user_id','id');
    }


    /**
     *  the relation with campaign
     *
     * @var Collection Object
     */

    public function zid_config(){
        return $this->hasOne('App\Models\ZidAuthorize','user_id','id');
    }

    public function getCampaignActiveAttribute(){
        return $this->campaign()->where('status',1)->count();
    }

    public function getCampaignNotActiveAttribute(){
        return $this->campaign()->where('status',0)->count();
    }

    public function getCampaignEndedAttribute(){
        return $this->campaign()->where('progress',2)->count();
    }

    public function getCampaignWorkingAttribute(){
        return $this->campaign()->where('progress',1)->count();
    }

    public function getCampaignNotStartedAttribute(){
        return $this->campaign()->where('progress',0)->count();
    }

    public function getCampaignTrashedAttribute(){
        return $this->campaign()->onlyTrashed()->count();
    }

    public function getRoleNameAttribute(){
        return $this->role == 0 ? 'admin':'user';
    }

}
