<?php

namespace App\Http\Resources;

use App\Http\Resources\ZidCategory;
use Illuminate\Http\Resources\Json\JsonResource;

class ZidCategories extends JsonResource
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
            'results'       => ZidCategory::collection($this['categories']) ?: null
        ];
    }
}
