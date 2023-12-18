<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class SallaProduct extends JsonResource
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
        $next = $this['pagination']['totalPages'] > $this['pagination']['currentPage'] ? $this['pagination']['currentPage'] + 1 : null;
        $previous = $this['pagination']['currentPage'] != 1 ? $this['pagination']['currentPage'] - 1 : null;
        return [
            'count'         => $this['pagination']['count'] ?: null,
            'next'          => $next,
            'previous'      => $previous,
            'results'       => SallaItem::collection($this['data']) ?: null
        ];
    }
}
