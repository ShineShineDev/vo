<?php

use App\Http\Controllers\FileUploadController;
use Illuminate\Support\Facades\Route;

Route::controller(FileUploadController::class)->group(function () {
    Route::post('file/upload', 'upload');
    Route::get('file', 'fileLists');
});
