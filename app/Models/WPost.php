<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Scopes\PostScope;
use App\Models\WPostAttachment;
use App\Models\WPostMeta;
class WPost extends Model
{
    // protected fillable
    protected $fillable =['post_date','post_content','post_excerpt','post_title','post_status','post_parent','post_name','post_type','post_date_gmt','post_modified_gmt'];
    /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    protected $dates = [
        'post_date_gmt','post_modified_gmt'
    ];

    const CREATED_AT = 'post_date';
    const UPDATED_AT = 'post_modified';

    protected $attributes = [
        'post_excerpt'          => '',
        'to_ping'               => '',
        'pinged'                => '',
        'post_content_filtered' => '',
    ];

    /**
     * The storage format of the model's date columns.
     *
     * @var string
     */
    protected $dateFormat = 'Y-m-d h:i:s';

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'wp_posts';

     /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'ID';

    /**
     * Indicates if the model should be timestamped.
     *
     * @var bool
     */
    public $timestamps = true;

    /**
     * The connection name for the model.
     *
     * @var string
     */
    protected $connection = 'WoCommerce';

      /**
     * The "booting" method of the model.
     *
     * @return void
     */
    protected static function boot()
    {
        parent::boot();

        static::addGlobalScope(new PostScope);
    }

    // public function meta(){
    //     return $this->hasMany(ProductMeta::class,'post_id','ID');
    // }

    public function attachment(){
        return $this->hasOne(WPostMeta::class,'post_id','ID')->where('meta_key','_thumbnail_id');
    }

    // public function attachments_all(){
    //     return $this->hasManyThrough(WPostAttachment::class,WPostMeta::class,'post_id','meta_value','ID','meta_id')->where('meta_key','_thumbnail_id');
    // }

    public function get_current_date(){
        return date('Y-m-d H:i:s');
    }
  
    public function setPostModifiedGmtAttribute($value){
        $this->attributes['post_modified_gmt'] = date('Y-m-d H:i:s');
    }

    public function setPostTypeAttribute(){
        $this->attributes['post_type'] = 'post';
    }
}
