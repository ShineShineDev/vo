<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // Schema::create('products', function (Blueprint $table) {
        //     $table->id();
        //     $table->uuid('uuid')->unique();
        //     $table->string('name');
        //     $table->longText('desc');
        //     $table->unsignedBigInteger('category_id')->nullable();
        //     $table->unsignedBigInteger('brand_id')->nullable();
        //     $table->text('thumbnail')->nullable();
        //     $table->decimal('base_price', 10, 2)->nullable();
        //     $table->decimal('compare_at_price', 10, 2)->nullable();
        //     $table->boolean('has_tax')->default(false);
        //     $table->decimal('cost_per_item', 10, 2)->nullable();
        //     $table->boolean('track_quantity')->default(true);
        //     $table->boolean('cswofs')->default(true)->comment('Continue selling when out of stock');
        //     $table->string('sku')->nullable();
        //     $table->string('barcode')->nullable();
        //     $table->enum('status', ['Active', 'Draft', 'Archived'])->default('Active');
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
        // Schema::dropIfExists('products');
    }
}
