<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class References extends Model
{
    protected $table = 'references';
    public $timestamps = false;
    protected $primaryKey = 'id';

    protected $fillable = [
        'agent_id', 'name','customer_id','son_of', 'address','phone_number',
    ];
}
