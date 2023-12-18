<?php

namespace App\Http\Resources;

use App\Http\Resources\SallaCategory;
use Illuminate\Http\Resources\Json\JsonResource;

class SallaCategories extends JsonResource
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
            'results'       => SallaCategory::collection($this['data']) ?: null
        ];
    }
}
