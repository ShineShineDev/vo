<?php

namespace Domain\api\iam\Controllers;

use App\Http\Helpers\ApiResponse;
use App\Models\Department;
use App\Models\Role;
use Domain\api\iam\Resources\RoleResource;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class RoleController extends Controller
{
    function store(Request $request, Role $model)
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
            "name" => 'required|unique:roles,name',
            "label" => "nullable",
            'flag' => 'nullable|boolean',
        ]);
    }
    function index(Role $model)
    {
        $status = $model->with('permissions')->orderByDesc("id")->get();
        if (!$status)
            return ApiResponse::error("Fail", 500);
        return ApiResponse::success("Success", $status, 200);
    }

    function destroy($id, Department $model)
    {
        $status = $model->destroy($id);
        if (!$status)
            return ApiResponse::error("Fail", 500);
        return ApiResponse::success("Success", $status, 200);
    }

    public function bindRoleAndPermission(Request $request)
    {
        $request->validate([
            'role_id' => 'required|exists:roles,id',
            'permissions' => 'required|array',
            'permissions.*' => 'exists:permissions,id',
        ]);

        $role = Role::findOrFail($request->role_id);
        $role->permissions()->sync($request->permissions);
        $role->load('permissions');
        return response()->json([
            'message' => 'Permissions successfully bound to role.',
            'role' => new RoleResource($role)
        ], 200);
    }
}



