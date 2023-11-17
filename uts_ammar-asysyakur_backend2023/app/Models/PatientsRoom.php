<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PatientsRoom extends Model
{
    use HasFactory;

    protected $table = 'patients_rooms';

    protected $fillable = [

        'id',
        'no_room',
        'floor',
        'class',
        'created_at',
        'updated_at'
    ];
    
    public function patients()
    {
        return $this->hasMany(Patients::class, 'room_id');
    }
}
