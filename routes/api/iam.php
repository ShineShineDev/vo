<?php

use Domain\api\iam\Controllers\PermissionController;
use Domain\api\iam\Controllers\RoleController;

use Illuminate\Support\Facades\Route;

Route::middleware(['auth:admin', 'manager_or_admin'])->group(function () {
    Route::apiResource("roles", RoleController::class);
    Route::apiResource("permissions", PermissionController::class);
    Route::post("bind-role-and-permission", [RoleController::class, 'bindRoleAndPermission']);
});