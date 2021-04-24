<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Coborrower_and_guarantor extends Model
{
    protected $table = 'guarantors_and_coborrower';
    public $timestamps = false;
    protected $primaryKey = 'id';

    protected $fillable = [
        'customer_id',
        'agent_id',
        'name',
        'date_of_birth',
        'father_or_husband_name',
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
        'EMI',
        'Period',
        'reference',
        'reference_phone_number',
        'reference_address',
        'user_type',
        
    ];
}
