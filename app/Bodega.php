<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Bodega extends Model
{
    protected $fillable = ['nombre','estado','id_responsable'];

    // public function usuarios() {
    //     return $this->belongsTo('App\Usuario');
    // }
}
