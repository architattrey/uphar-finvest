<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class FinancialBuddyLogin extends Model
{
    protected $table = 'financial_buddy_logins';
    public $timestamps = false;
    protected $primaryKey = 'id';
    protected $fillable = [
        'value',
        'mac_id' 
    ];

}
