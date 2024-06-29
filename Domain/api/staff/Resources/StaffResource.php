<?php

namespace Domain\api\staff\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class StaffResource extends JsonResource
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
            "code" => $this->code,
            "name" => $this->name,
            "email" => $this->email,
            "mobile" => $this->mobile,
            "joined_date" => $this->joined_date,
            "department_id" => $this->department_id,
            "position" => $this->position,
            "age" => $this->age,
            "gender" => $this->gender,
            "status" => $this->status,
            "created_by" => $this->created_by,
            "updated_by" => $this->updated_by,
            "departments" =>  DeparmentResource::collection($this->departments),
        ];
    }
}























