<?php

namespace Domain\api\user\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Helpers\ApiResponse;


use App\Models\User;
use Domain\api\user\Resources\UserResource;
use Illuminate\Http\Request;

class UserController extends Controller
{
    use Auth;

    function all(User $user)
    {
        return ApiResponse::success("All Profile List", UserResource::collection($user->orderByDesc("id")->get()), 200);
    }
    function profile(Request $request)
    {
        return ApiResponse::success("Profile", new UserResource($request->user()), 200);
    }

    public function assignRolesToUser(Request $request)
    {
        $request->validate([
            'user_id' => 'required|exists:users,id',
            'role_ids' => 'required|array',
            'role_ids.*' => 'exists:roles,id',
        ]);
        $user = User::findOrFail($request->user_id);
        $roleIds = $request->role_ids;
        $user->roles()->sync($roleIds);
        return response()->json([
            'message' => 'Roles successfully assigned to user.',
            'user' => new UserResource($user->load('roles'))
        ], 200);
    }

    function staffInfo(Request $request)
    {
        $user = $request->user();
        $staffs = User::whereHas('staff.departments', function ($query) use ($user) {
            $query->whereIn('department_id', $user->staff->departments->pluck('id'));
        })->get();
        return response()->json($staffs);
        // return response()->json(UserResource::collection($staffs));
    }
}
