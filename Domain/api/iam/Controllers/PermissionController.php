<?php

namespace Domain\api\iam\Controllers;

use App\Http\Helpers\ApiResponse;

use App\Models\Permission;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class PermissionController extends Controller
{
    function store(Request $request, Permission $model)
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
            "name" => 'required|unique:permissions,name',
            "label" => "nullable",
            'flag' => 'nullable|boolean',
        ]);
    }
    function index(Permission $model)
    {
        $status = $model->orderByDesc("id")->get();
        if (!$status)
            return ApiResponse::error("Fail", 500);
        return ApiResponse::success("Success", $status, 200);
    }

    function destroy($id, Permission $model)
    {
        $status = $model->destroy($id);
        if (!$status)
            return ApiResponse::error("Fail", 500);
        return ApiResponse::success("Success", $status, 200);
    }
}
