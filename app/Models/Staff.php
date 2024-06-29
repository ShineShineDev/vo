<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Staff extends Model
{
    use HasFactory;
    protected $fillable = [
        "code",
        "name",
        "email",
        "mobile",
        "joined_date",
        // "department_id",
        "position",
        "age",
        "gender",
        "status",
        "created_by",
        "updated_by"
    ];
    public function departments()
    {
        return $this->belongsToMany(Department::class, 'department_staff', 'staff_id', 'department_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}