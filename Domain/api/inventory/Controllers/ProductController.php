<?php

namespace Domain\api\inventory\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Helpers\ApiResponse;
use App\Models\Product;
use App\Models\Tag;
use Domain\api\inventory\Requests\AddProductRequest;
use Domain\api\inventory\Services\ProductServices;
use Illuminate\Http\Request;
use App\Models\File;

class ProductController extends Controller
{
    function index(Request $request, ProductServices $productServices, Product $product)
    {
        \Log::info($request->all());
        return ApiResponse::success("You have created a new product", $productServices->get($request, $product), 200);
    }
    function store(AddProductRequest $addProductRequest, ProductServices $productServices, File $file)
    {
        $status = $productServices->store($addProductRequest, $file);
        if (!$status)
            return ApiResponse::error("Product Create Fail", 422);
        return ApiResponse::success("You have created a new product", $status, 201);
    }
}
