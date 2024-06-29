<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Department extends Model
{
    use HasFactory;
    protected $fillable = [
        "name",
        "label",
        "flag"
    ];
    public function staff()
    {
        return $this->belongsToMany(Staff::class, 'department_staff', 'department_id', 'staff_id');
    }
}
