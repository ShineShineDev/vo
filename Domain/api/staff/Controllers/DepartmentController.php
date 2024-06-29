<?php

namespace Domain\api\staff\Controllers;

use App\Http\Helpers\ApiResponse;
use App\Models\Department;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class DepartmentController extends Controller
{
    function store(Request $request, Department $model)
    {
        $validator = $this->storeValidation($request);
        if ($validator->fails()) {
            return ApiResponse::error("Validation Error", 422, $validator->errors());
        }

        $status = $model->create($request->only("name", "label", "flag"));
        if (!$status)
            return ApiResponse::error("Fail", 500);
        return ApiResponse::success("Success", $status, 201);
    }
    private function storeValidation($request)
    {
        return Validator::make($request->all(), [
            "name" => 'required|unique:departments,name',
            "label" => "nullable",
            'flag' => 'nullable|boolean',
        ]);
    }
    function index(Department $model)
    {
        $status = $model->orderByDesc("id")->get();
        if (!$status)
            return ApiResponse::error("Fail", 500);
        return ApiResponse::success("Success", $status, 200);
    }

    function destroy($id, Department $model)
    {
        return "Route Closed!";
        $status = $model->destroy($id);
        if (!$status)
            return ApiResponse::error("Fail", 500);
        return ApiResponse::success("Success", $status, 200);
    }
}
