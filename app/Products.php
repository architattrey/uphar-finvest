<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Products extends Model
{
    protected $table = 'products';
    public $timestamps = false;
    protected $primaryKey = 'id';

    protected $fillable = [
        'product_type','created_at','updated_at',
    ];

}
