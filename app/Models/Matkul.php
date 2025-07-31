<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Matkul extends Model
{
    use HasFactory;
    protected $table = "matkul";
    protected $primaryKey = 'kode_matkul';
    public $incrementing = false;
    protected $keyType = 'string';
    public $timestamps = true;

    protected $fillable = [
        'kode_matkul',
        'nama_matkul',
        'sks',
        'kode_prodi',
        'kode_semester',
        'perkuliahan_semester',
        'tahun_ajaran',
        'jenis',
    ];
}
