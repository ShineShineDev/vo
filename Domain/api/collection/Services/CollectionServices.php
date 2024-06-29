<?php

namespace Domain\api\collection\Services;

use App\Models\Product;
use App\Models\ProductMedia;
use App\Models\ProductVariant;
use App\Models\Tag;
use Domain\api\inventory\Resources\ProductRsource;

class CollectionServices
{
    function get($request, $productMod)
    {
        $query = $productMod->with("category", "brand");
        if ($request->status) {
            $query = $productMod->where("status", $request->status);
        }
        $product = $query->paginate($request->count);
        return ProductRsource::collection($product->items());
    }

    function store($req, $file)
    {
        $product = Product::create($this->productModel($req, $file));
        if ($product) {
            if ($req->variants)
                $this->productVariant($req->variants, $product->id);
            if ($req->medias)
                $this->productMedai($req->medias, $product->id, $file);
            if ($req->tags) {
                $tagIds = $this->storeTags($req->tags);
                $product->tags()->sync($tagIds);
            }
            return $product;
        }
        return false;
    }
    private function productModel($req, $file)
    {
        $input = [
            'name' => $req->name,
            'desc' => $req->desc,
            'category_id' => $req->category_id,
            'brand_id' => $req->brand_id,
            'base_price' => $req->base_price,
            'compare_at_price' => $req->compare_at_price,
            'has_tax' => $req->has_tax ? 1 : 0,
            'cost_per_item' => $req->cost_per_item,
            'track_quantity' => $req->track_quantity ? 1 : 0,
            'cswofs' => $req->cswofs ? 1 : 0,
            'sku' => $req->sku,
            'barcode' => $req->barcode,
        ];
        if ($req->thumbnail) {
            $media = $file->find($req->thumbnail);
            if ($media) {
                $input['thumbnail'] = $media->path;
            }
        }
        return $input;
    }
    private function productVariant($variants, $product_id)
    {
        foreach ($variants as $variant) {
            ProductVariant::create($this->variantModle($variant, $product_id));
        }
    }
    private function variantModle($variant, $product_id)
    {
        return [
            'name' => $variant['name'],
            'value' => $variant['value'],
            'price_modifier' => $variant['price_modifier'],
            'stock_quantity' => $variant['stock_quantity'],
            'sku' => $variant['sku'],
            'product_id' => $product_id
        ];
    }

    private function productMedai($files, $product_id, $fileMod)
    {
        foreach ($files as $media) {
            $file = $fileMod->find($media);
            if ($file && $file->path) {
                ProductMedia::create($this->mediaModle($file, $product_id));
            }
        }
    }
    private function mediaModle($media, $product_id)
    {
        return [
            'media' => $media->path,
            'client_original_name' => $media->original_name,
            'products_id' => $product_id,
        ];
    }

    private function storeTags($tags)
    {
        $tagIds = [];
        foreach ($tags as $tagName) {
            $tag = Tag::firstOrCreate(['name' => $tagName]);
            $tagIds[] = $tag->id;
        }
        return $tagIds;
    }
}
