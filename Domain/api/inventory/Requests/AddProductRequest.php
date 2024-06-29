<?php

namespace Domain\api\inventory\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AddProductRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true; // Change this to true to allow the request
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [

            'name' => 'required|string|max:255',
            'desc' => 'nullable|string',
            'category_id' => 'nullable|numeric|exists:categories,id',
            'brand_id' => 'nullable|numeric|exists:brands,id',
            'thumbnail' => 'nullable|numeric|exists:files,id',

            'base_price' => 'required|numeric|min:0',
            'compare_at_price' => 'nullable|numeric|min:0|gte:base_price',
            'has_tax' => 'nullable|boolean',
            'cost_per_item' => 'nullable|numeric|min:0',

            'track_quantity' => 'nullable|boolean',
            'cswofs' => 'nullable|boolean',
            'sku' => 'nullable|string|max:100|unique:products,sku',
            'barcode' => 'nullable|string|max:100|unique:products,barcode',


            'variants' => 'nullable|array',
            'variants.*.name' => 'required|string|max:255',
            'variants.*.value' => 'required|string|max:255',
            'variants.*.price_modifier' => 'nullable|numeric|min:0',
            'variants.*.stock_quantity' => 'nullable|integer|min:0',
            'variants.*.sku' => 'nullable|string|max:100|unique:product_variants,sku',

            'medias' => 'nullable|array',
            'medias.*' => 'required|integer',

            'tags' => 'nullable|array',
        ];
    }

    // public function messages()
    // {
    //     return [
    //         'name.required' => 'The product name is required.',
    //         'category_id.required' => 'The category is required.',
    //         'category_id.exists' => 'The selected category does not exist.',
    //         'brand_id.required' => 'The brand is required.',
    //         'brand_id.exists' => 'The selected brand does not exist.',
    //         'thumbnail.image' => 'The thumbnail must be an image.',
    //         'base_price.required' => 'The base price is required.',
    //         'base_price.numeric' => 'The base price must be a number.',
    //         'base_price.min' => 'The base price must be at least 0.',
    //         'compare_at_price.numeric' => 'The compare at price must be a number.',
    //         'compare_at_price.gte' => 'The compare at price must be greater than or equal to the base price.',
    //         'has_tax.required' => 'Please specify if the product has tax.',
    //         'has_tax.boolean' => 'The has tax field must be true or false.',
    //         'track_quantity.required' => 'Please specify if the product quantity is tracked.',
    //         'track_quantity.boolean' => 'The track quantity field must be true or false.',
    //         'sku.required' => 'The SKU is required.',
    //         'sku.unique' => 'The SKU must be unique.',
    //         'barcode.unique' => 'The barcode must be unique.',

    //         'variants.*.name.required' => 'The variant name is required.',
    //         'variants.*.value.required' => 'The variant value is required.',
    //         'variants.*.price_modifier.numeric' => 'The variant price modifier must be a number.',
    //         'variants.*.price_modifier.min' => 'The variant price modifier must be at least 0.',
    //         'variants.*.stock_quantity.required' => 'The variant stock quantity is required.',
    //         'variants.*.stock_quantity.integer' => 'The variant stock quantity must be an integer.',
    //         'variants.*.stock_quantity.min' => 'The variant stock quantity must be at least 0.',
    //         'variants.*.sku.required' => 'The variant SKU is required.',
    //         'variants.*.sku.unique' => 'The variant SKU must be unique.',
    //         'variants.*.product_id.required' => 'The product ID for the variant is required.',
    //         'variants.*.product_id.exists' => 'The selected product ID for the variant does not exist.',
    //     ];
    // }

}

/*
protected $fillable = [
    'uuid',
    'name',
    'desc',
    'category_id',
    'brand_id',
    'thumbnail',
    'base_price',
    'compare_at_price',
    'has_tax',
    'cost_per_item',
    'track_quantity',
    'cswofs',
    'sku',
    'barcode',
    'status'
];
protected $fillable = [
    "name",
    "value",
    "price_modifier",
    "stock_quantity",
    "sku",
    "product_id"
];
*/