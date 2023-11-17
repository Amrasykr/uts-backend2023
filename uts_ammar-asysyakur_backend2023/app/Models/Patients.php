<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Patients extends Model
{
    use HasFactory;

    protected $table = 'patients';

    protected $fillable = [

        'id',
        'name',
        'phone',
        'address',
        'status_id',
        'room_id',
        'in_date_at',
        'out_date_at',
        'created_at',
        'updated_at'
    ];

    public function status()
    {
        return $this->belongsTo(PatientsStatus::class, 'status_id');
    }

    public function ruangan()
    {
        return $this->belongsTo(PatientsRoom::class, 'room_id');
    }
}
