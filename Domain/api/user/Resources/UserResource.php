<?php

namespace Domain\api\user\Resources;

use Domain\api\iam\Resources\RoleResource;
use Domain\api\staff\Resources\DeparmentResource;
use Domain\api\staff\Resources\StaffResource;
use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
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
            'id' => $this->id,
            "name" => $this->name,
            "email" => $this->email,
            "staff" => new StaffResource($this->staff),
            "roles" =>  RoleResource::collection($this->roles),
        ];
    }
}












