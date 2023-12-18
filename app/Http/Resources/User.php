<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class User extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
       // return parent::toArray($request);
        return [
            'created_at' => date('Y-m-d H:i:s',strtotime($this->created_at)),
            'email'      => $this->email,
            'email_verified_at' => $this->email_verified,
            'id'         => $this->id,
            'name'       => $this->name,
            'phone'      => $this->phone,
            'updated_at' => date('Y-m-d H:i:s',strtotime($this->updated_at)),
            'zid_config' => $this->zid_config,
            'role'       => $this->role,
            'role_name'  => $this->role_name,
            'time_zone'  => $this->time_zone
        ];

    }
}
