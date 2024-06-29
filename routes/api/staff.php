<?php

use Domain\api\staff\Controllers\DepartmentController;
use Domain\api\staff\Controllers\StaffController;

use Illuminate\Support\Facades\Route;

Route::middleware(['auth:admin', 'manager_or_admin'])->group(function () {
    Route::apiResource("departments", DepartmentController::class);
    Route::apiResource("staffs", StaffController::class);
});