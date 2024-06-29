<?php

namespace Domain\api\staff\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StaffRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true; // Change this to true to allow the request
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'code' => 'nullable|unique:staff,code',
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:staff,email',
            'mobile' => 'required|unique:staff,mobile',
            'joined_date' => 'nullable|date',
            'department_id' => 'required|exists:departments,id',
            'position' => 'required|string|max:255',
            'age' => 'required|integer|min:0',
            'gender' => 'required|string|max:10',
            'status' => 'required|string|max:50',
            // 'created_by' => 'required|exists:users,id',
            'created_by' => 'required',
            'updated_by' => 'nullable|exists:users,id',
        ];
    }
}
