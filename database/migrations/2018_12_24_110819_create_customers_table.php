<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCustomersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customers', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('agent_id');
            $table->text('customer_id')->nullable();
            $table->string('name')->nullable();
            $table->dateTime('date_of_birth')->nullable();
            $table->string('father_or_husbamd_name')->nullable();
            $table->text('residential_address')->nullable();
            $table->text('land_mark')->nullable();
             
            $table->string('police_station')->nullable();
            $table->integer('phone_number')->nullable();
            $table->mediumInteger('years_of_res_address')->nullable();
            $table->text('residance_type')->nullable();
            $table->text('office_address')->nullable();
            $table->integer('ofc_phone_number')->nullable();
            $table->integer('adhar_card_number')->nullable();
            $table->integer('adhar_card_image')->nullable();
            $table->integer('pan_card_number')->nullable();
            $table->integer('pan_card_image')->nullable();
            $table->mediumInteger('years_of_ofc_address')->nullable();
            $table->string('email')->unique()->nullable();
            $table->string('profile')->nullable();
            $table->string('marital_status');
            $table->mediumInteger('no_of_dependants')->nullable();
            $table->integer('loan_amount')->nullable();
            $table->integer('EMI')->nullable();
            $table->mediumInteger('Period')->nullable();
            $table->string('status');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('customers');
    }
}
