<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductTagsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // Schema::create('product_tag', function (Blueprint $table) {
        //     $table->id();
        //     $table->foreignId('product_id')->constrained()->onDelete('cascade');
        //     $table->foreignId('tag_id')->constrained()->onDelete('cascade');
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
        // Schema::dropIfExists('product_tags');
    }
}
