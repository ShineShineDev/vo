<?php

namespace Domain\api\inventory\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Helpers\ApiResponse;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\File;

class CategoryController extends Controller
{
    function index(Request $request, Category $category)
    {
        $categories = $category->select("uuid", 'name', 'img','id')->orderByDesc("id")->get();
        return ApiResponse::success("categories", $categories);
    }

    function store(Request $request, Category $model, File $file)
    {
        $file = $file->find($request->img);
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
            "name" => 'required|unique:categories,name',
            "img" => ['nullable']
        ]);
    }
}