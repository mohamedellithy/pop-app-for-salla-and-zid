<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Product;
use App\Http\Resources\Schedule;
use App\Http\Resources\User;
class Campaign extends JsonResource
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
            'name'            => $this->name,
            'description'     => $this->description,
            'action'          => $this->action,
            'status'          => $this->status,
            'schedule_info'   => new Schedule($this->schedule),
            'repeate'         => $this->schedule->repeate,
            'repeate_at_time' => $this->schedule->repeate_at_time,
            'count_repeate'   => $this->schedule->count_repeate,
            'unit_repeate'    => $this->schedule->unit_repeate,
            'reapete_on'      => $this->schedule->repeate_on_handle,
            'end_type_cal'    => $this->schedule->end_type_cal,
            'end_at'          => $this->schedule->end_at ? date('Y-m-d',strtotime($this->schedule->end_at)) : null,
            'products_info'   => Product::collection($this->products),
            'products'        => $this->products_ids,
            'categories'      => $this->categories_ids,
            'merchant'        => new User($this->merchant),
            'progress'        => $this->progress,
            'type_set'        => $this->type_set,
            'type_repeate'    => $this->schedule->type_repeate,
            // 'bb' => $this->categories->pluck('values','category_id'),
            'type_selected'   => $this->type_selected == 'products' ? 1 : 2,
            'products_values' => $this->type_selected == 'products' ? $this->products->pluck('values','product_id')->toArray() : $this->categories->pluck('values','category_id'),
            'products_notes'  => $this->type_selected == 'products' ? $this->products->pluck('notes','product_id')->toArray() : $this->categories->pluck('notes','category_id'),
            //'logs'            => $this->campaign_logs ? $this->campaign_logs()->orderBy('created_at','desc')->limit(5)->get() : null,
            'created_at'      => date('D m , M  Y ',strtotime($this->created_at)),
            'updated_at'      => $this->updated_at ? date('D m , M  Y ',strtotime($this->updated_at)) : null,
            'deleted_at'      => $this->deleted_at ? date('D m , M  Y ',strtotime($this->deleted_at)) : null,
        ];
    }
}
