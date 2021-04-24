<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Agent extends Model
{

    protected $table = 'tbl_agent';
    public $timestamps = false;
    protected $primaryKey = 'id';

    protected $fillable = [
        'user_id',
        'user_type',
        'first_name',
        'last_name',
        'gender',
        'state',
        'city',
        'address',
        'marital_status',
        'date_of_birth',
        'education',
        'user_image',
        'phone_number',
        'delete_status',
        'created_at',
        'updated_at',
    ];

    public function userAgents()
    {
        return $this->belongsTo('App\User','user_id');
    }
    // public function agentsCustomers(){
        
    //     return $this->hasOne(Customer::class);
        
    // }


   
}




 