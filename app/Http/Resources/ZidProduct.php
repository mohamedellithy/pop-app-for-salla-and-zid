<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ZidProduct extends JsonResource
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
            'count'         => $this['count'] ?: null,
            'next'          => $this['next'] ?: null,
            'previous'      => $this['previous'] ?: null,
            'results'       => ZidItem::collection($this['results']) ?: null
        ];
    }
}
