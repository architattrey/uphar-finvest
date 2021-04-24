<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OauthAccessToken extends Model
{
    protected $fillable = [
        'user_id','client_id','name','scopes','revoked','created_at','updated_at','expires_at',
    ];
}
