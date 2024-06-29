<?php

namespace Domain\api\collection\Controllers;

use App\Http\Controllers\Controller;

use App\Http\Helpers\ApiResponse;
use App\Models\Collection;
use Domain\api\collection\Services\CollectionServices;
use Illuminate\Http\Request;


class CollectionController extends Controller
{
    function index(Request $request, CollectionServices $collectionServices, Collection $collection)
    {
        $collections = Collection::select("uuid",'name')->withCount('products')->get();
        return ApiResponse::success("Collection Lists", $collections, 200);
    }
    function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'products' => 'required|array',
            'products.*' => 'exists:products,uuid',
        ]);
        $collection = Collection::firstOrCreate(['name' => $request->name]);
        $collection->products()->sync($request->products);
        return ApiResponse::success("You have created a new collection", $collection, 200);
    }
}
