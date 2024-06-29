<?php

namespace Domain\api\inventory\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Helpers\ApiResponse;
use App\Models\Brand;
use App\Models\File;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class BrandController extends Controller
{
    function index(Request $request, Brand $brand)
    {
        $brands = $brand->select("uuid", 'name', 'img','id')->get();
        return ApiResponse::success("Brands", $brands);
    }

    function store(Request $request, Brand $model, File $file)
    {
        $validator = $this->storeValidation($request);
        if ($validator->fails()) {
            return ApiResponse::error("Validation Error", 422, $validator->errors());
        }
        $input['name'] = $request->name;
        if ($request->img) {
            $file = $file->find($request->img);
            if ($file) {
                $input['img'] = $file->path;
            }

        }
        return $model->create($input);
    }

    private function storeValidation($request)
    {
        return Validator::make($request->all(), [
            "name" => 'required|unique:brands,name',
            "img" => ['nullable']
        ]);
    }
}
