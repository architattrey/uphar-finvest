<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    protected $table = 'customers';
    public $timestamps = false;
    protected $primaryKey = 'id';

    protected $fillable = [
        'customer_id',
        'agent_id',
        'name',
        'date_of_birth',
        'field_boy',
        'father_or_husband_name',
        'state',
        'city',
        'residential_address',
        'land_mark',
        'police_station',
        'phone_number',
        'years_of_res_address',
        'residance_type',
        'office_address',
        'ofc_phone_number',
        'years_of_ofc_address',
        'email',
        'profile',
        'marital_status',
        'no_of_dependants',
        'loan_amount',
        'EMI','Period',
        'adhar_card_number',
        'adhar_card_image',
        'pan_card_number',
        'pan_card_image',
        'image1',
        'image2',
        'image3',
        'status'
    ];
    public function agentCustomer()
    {
        return $this->belongsTo('App\Agent','agent_id');
    }

}
