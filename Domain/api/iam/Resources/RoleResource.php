<?php

namespace Domain\api\iam\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class RoleResource extends JsonResource
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
            "name" => $this->name,
            "label" => $this->label,
            "flag" => $this->flag,
            "permissions" => PermissionResource::collection($this->permissions)
        ];
    }
}























