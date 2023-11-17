<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PatientsStatus extends Model
{
    use HasFactory;

    protected $table = 'patients_statuses';

    protected $fillable = [

        'id',
        'status',
        'created_at',
        'updated_at'
    ];

    public function patients()
    {
        return $this->hasMany(Patients::class, 'status_id');
    }
}
