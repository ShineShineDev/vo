<?php

namespace Domain\api\user\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserRequest extends FormRequest
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
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|string|min:8|confirmed',
            'staff_id' => 'required|unique:users,staff_id|exists:staff,id',
            'created_by' => 'nullable',
            'updated_by' => 'nullable',
            'flag' => 'required|boolean',
        ];
    }
}
