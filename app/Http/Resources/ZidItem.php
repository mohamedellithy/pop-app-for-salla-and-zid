<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ZidItem extends JsonResource
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
            'id'              => $this['id'],
            'currency'        => $this['currency'],
            'currency_symbol' => $this['currency_symbol'],
            'price'           => $this['price'],
            'name'            => $this['name']['ar'] ?: $this['name']['en'],
            'image'           => $this['images'] ? ($this['images'][0] ? $this['images'][0]['image']['medium'] : null) : null,
            'formatted_price' => $this['formatted_price'],
            'categories'      => $this['categories']
        ];
    }
}
