<?php

namespace Domain\api\collection\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class Rsource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            "id" => $this->id,
            "uuid" => $this->uuid,
            "name" => $this->name,
            "desc" => $this->desc,
            "category" => $this->category ? $this->category->name : '',
            "brand" => $this->brand ? $this->brand->name : '',
            "thumbnail" => $this->thumbnail,
            "base_price" => $this->base_price,
            "compare_at_price" => $this->compare_at_price,
            "has_tax" => $this->has_tax,
            "cost_per_item" => $this->cost_per_item,
            "track_quantity" => $this->track_quantity,
            "cswofs" => $this->cswofs,
            "sku" => $this->sku,
            "barcode" => $this->barcode,
            "status" => $this->status,
            "created_at" => $this->created_at,
            "updated_at" => $this->updated_at,
        ];
    }
}

/*
{
    "id": 8,
    "uuid": "c866775f-4fda-4e83-989d-47253fd97552",
    "name": "T-shirt",
    "desc": "T-shirt",
    "category_id": 35,
    "brand_id": 5,
    "thumbnail": "/uploads/product/667335635e6a3.svg",
    "base_price": "50.99",
    "compare_at_price": "60.99",
    "has_tax": 1,
    "cost_per_item": "10.50",
    "track_quantity": 1,
    "cswofs": 1,
    "sku": "SKU1234",
    "barcode": "1234567890",
    "status": "Active",
    "created_at": "2024-06-20T16:04:18.000000Z",
    "updated_at": "2024-06-20T16:04:18.000000Z"
},

*/




