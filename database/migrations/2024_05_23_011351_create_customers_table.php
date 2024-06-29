<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCustomersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // Schema::create('customers', function (Blueprint $table) {
        //     $table->id();
        //     $table->uuid('uuid')->unique();
        //     $table->string("first_name");
        //     $table->string("last_name");
        //     $table->string("email")->nullable();
        //     $table->string("phone")->nullable();
        //     $table->string("password");
        //     $table->string("post_code")->nullable();
        //     $table->string("address")->nullable();
        //     $table->enum('gender', ['0', '1'])->nullable()->comment("0 : female, 1 : male ");
        //     $table->string("dob")->nullable();
        //     $table->string("avatar")->nullable();
        //     $table->string("last_logined_at")->nullable();
        //     $table->text("device_token")->nullable();
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
        // Schema::dropIfExists('customers');
    }
}










