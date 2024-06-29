<?php

use Domain\api\user\Controllers\UserController;

use Illuminate\Support\Facades\Route;

Route::post('auth/login', [UserController::class, 'login']);

// Authenticated routes 
Route::middleware('auth:admin')->group(function () {
    Route::get('profile', [UserController::class, 'profile']);

    // Routes restricted to Manager User Role or Super Admin
    Route::middleware('manager_or_admin')->group(function () {
        Route::controller(UserController::class)->group(function () {
            Route::post('auth/register', 'register');
            Route::get('all', 'all');
            Route::post('add-role', 'assignRolesToUser');
            // Route::get('staff-info', 'staffInfo');
        });
    });
    Route::get('staff-info', [UserController::class,'staffInfo']);
});