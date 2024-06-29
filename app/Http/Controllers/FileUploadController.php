<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\File;
use App\Http\Helpers\ApiResponse;

class FileUploadController extends Controller
{
    public function upload(Request $request)
    {
        $validator = $this->vali($request);
        if ($validator->fails())
            return ApiResponse::error("Validation Error", 400, $validator->errors());

        $uploadedFiles = [];
        if ($request->hasFile('files')) {
            $files = $request->file('files');

            foreach ($files as $file) {
                $uploadedData = $this->uploadFile($file, $request->type, "");
                if ($uploadedData) {
                    $uploadedData['type'] = $request->type;
                    $createdFile = File::create($uploadedData);
                    $uploadedData['message'] = "Uploaded successfully";
                    $uploadedData['id'] = $createdFile->id;
                    $uploadedFiles[] = $uploadedData;
                }
            }
            return ApiResponse::success("Files uploaded successfully", $uploadedFiles, 200);
        } else {
            return ApiResponse::error("No files were uploaded", 400);
        }
    }
    private function vali($request)
    {
        return Validator::make($request->all(), [
            "files.*" => ['required', 'mimes:png,jpg,jpeg,PNG,JPG,JPEG,svg,webp', 'max:5128'],
            'type' => ['required']
        ]);
    }
    public function fileLists(Request $request)
    {
        if ($request->type)
            $files = File::orderByDesc("id")->where("type", $request->type)->get();
        else
            $files = File::orderByDesc("id")->get();
        return ApiResponse::success("Files", $files, 200);
    }
}
