<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFilesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // Schema::create('files', function (Blueprint $table) {
        //     $table->id();
        //     $table->string('path', 255);
        //     $table->string('original_name', 255);
        //     $table->string('stored_name', 255);
        //     $table->integer('file_size');
        //     $table->string('mime_type', 100);
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
        // Schema::dropIfExists('files');
    }
}
