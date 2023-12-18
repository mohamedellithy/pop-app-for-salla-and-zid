<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class SallaItem extends JsonResource
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
        if(isset($this['data'])){
            $image =  $this['data']['main_image'] ? $this['data']['main_image'] : ($this['data']['images'] ? ($this['data']['images'][0] ? $this['data']['images'][0]['url'] : null) : null);
        } else {
            $image =  $this['main_image'] ? $this['main_image'] : ($this['images'] ? ($this['images'][0] ? $this['images'][0]['url'] : null) : null);
        }
        return [
            'id'              => isset($this['data']) ? $this['data']['id'] : $this['id'],
            'currency'        => isset($this['data']) ? $this['data']['regular_price']['currency'] : $this['regular_price']['currency'],
            'currency_symbol' => isset($this['data']) ? $this['data']['regular_price']['currency'] : $this['regular_price']['currency'],
            'price'           => isset($this['data']) ? $this['data']['regular_price']['amount'] : $this['regular_price']['amount'],
            'name'            => isset($this['data']) ? $this['data']['name'] : $this['name'],
            'image'           => $image,
            'categories'      => isset($this['data']) ? $this['data']['categories'] : $this['categories']
        ];
    }
}
