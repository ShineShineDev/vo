<?php

namespace Domain\api\staff\Controllers;

use App\Http\Helpers\ApiResponse;
use App\Models\Staff;
use Domain\api\staff\Requests\StaffRequest;
use App\Http\Controllers\Controller;
use Domain\api\staff\Resources\StaffResource;
use Illuminate\Http\Request;

class StaffController extends Controller
{
    function index(Staff $model)
    {
        $status = $model->orderByDesc("id")->get();
        if (!$status)
            return ApiResponse::error("Fail", 500);
        return ApiResponse::success("Success", $status, 200);
    }
    function store(StaffRequest $request, Staff $model)
    {
        $validated = $request->validated();
        if (is_null($validated['code']))
            $validated['code'] = uniqid();

        if (is_null($validated['joined_date']))
            $validated['joined_date'] = now()->toDateString();
        $input = $this->prepareDataForInsert($validated);
        $staff = $model->create($input);
        $staff->departments()->attach($validated['department_ids']);
        if (!$staff)
            return ApiResponse::error("Fail", 500);
        return ApiResponse::success("Success", $staff, 200);
    }

    private function prepareDataForInsert($validated)
    {
        return [
            'code' => $validated['code'],
            'name' => $validated['name'],
            'email' => $validated['email'],
            'mobile' => $validated['mobile'],
            'joined_date' => $validated['joined_date'],
            'position' => $validated['position'],
            'age' => $validated['age'],
            'gender' => $validated['gender'],
            'status' => $validated['status'],
            'created_by' => $validated['created_by'] ?? $validated['name'],
            'department_ids' => 'required|array',
            'department_ids.*' => 'exists:departments,id',
        ];
    }

    function update($id, Request $request, Staff $model)
    {
        $request->validate([
            "code" => "required",
            "name" => "required",
            "email" => "required",
            "mobile" => "required",
            "joined_date" => "required|date",
            "position" => "required",
            "age" => "required|integer|min:0",
            "gender" => "required",
            "status" => "required",
            'department_ids' => 'required|array',
            'department_ids.*' => 'exists:departments,id',
        ]);
        $staff = Staff::findOrFail($id);
        $staff->code = $request->input('code');
        $staff->name = $request->input('name');
        $staff->email = $request->input('email');
        $staff->mobile = $request->input('mobile');
        $staff->joined_date = $request->input('joined_date');
        $staff->position = $request->input('position');
        $staff->age = $request->input('age');
        $staff->gender = $request->input('gender');
        $staff->status = $request->input('status');
        $staff->save();
        $staff->departments()->sync($request->department_ids);
        $staff->refresh();
        return new StaffResource($staff);
    }

}
















