<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class vehicle extends Model
{
    protected $table = 'vehicles';
    public $timestamps = false;
    protected $primaryKey = 'id';

    protected $fillable = [
        'customer_id',
        'vehicle_type',
        'vehicle_manufacture',
        'vehicle_name',
        'vehicle_model_no',
    ];
    public function customerVehicle()
    {
        return $this->belongsTo('App\Customer','customer_id');
    }
}
