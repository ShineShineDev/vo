<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductVariantsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // Schema::create('product_variants', function (Blueprint $table) {
        //     $table->id();
        //     $table->string('name')->comment("size, color, style"); // e.g., size, color, style
        //     $table->string('value')->comment("small, red, casual"); // e.g., small, red, casual
        //     $table->decimal('price_modifier', 10, 2)->nullable(); // Optional price modifier
        //     $table->integer('stock_quantity')->nullable();
        //     $table->string('sku')->nullable();
        //     $table->unsignedBigInteger('product_id');
        //     $table->foreign('product_id')->references('id')->on('products')->onDelete('cascade');
        //     $table->timestamps();
        // });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        // Schema::dropIfExists('product_variants');
    }
}

