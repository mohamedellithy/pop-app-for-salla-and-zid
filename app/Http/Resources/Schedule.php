<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class Schedule extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        //return parent::toArray($request);
        return [
            'id'              => $this->id,
            'repeate'         => $this->repeate,
            'count_repeate'   => $this->count_repeate,
            'unit_repeate'    => $this->unit_repeate,
            'repeate_at_time' => $this->repeate_at_time,
            'reapete_on'      => $this->repeate_on,
            'end_type_cal'    => $this->end_type_cal,
            'end_at'          => $this->end_at,
        ];
    }
}
