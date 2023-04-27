<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DebitCard extends Model
{
    use HasFactory;

    protected $fillable = [
        'card_name',
        'card_number',
        'card_type',
        'expiry_date',
        'cvv',
        'status'
    ];
    
    
            public function user()
        {
            return $this->belongsTo(User::class);
        }

}
