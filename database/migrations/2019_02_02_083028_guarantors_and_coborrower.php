<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class GuarantorsAndCoborrower extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('guarantors_and_coborrower', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('agent_id');
            $table->integer('customer_id');
            $table->string('name');
            $table->dateTime('date_of_birth');
            $table->string('father_or_husband_name');
            $table->text('residential_address');
            $table->string('id_number');
            $table->text('land_mark');
            $table->string('police_station');
            $table->integer('phone_number');
            $table->mediumInteger('years_of_res_address');
            $table->text('residance_type');
            $table->text('office_address');
            $table->integer('ofc_phone_number');
            $table->mediumInteger('years_of_ofc_address');
            $table->string('email');
            $table->string('profile');
            $table->string('marital_status');
            $table->mediumInteger('no_of_dependants');
            $table->integer('loan_amount');
            $table->integer('EMI');
            $table->mediumInteger('Period');
            $table->string('reference');
            $table->integer('reference_phone_number');
            $table->text('reference_address');
            $table->string('user_type');
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
        Schema::dropIfExists('guarantors_and_coborrower');
    }
}
