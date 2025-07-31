<?php

use App\Http\Controllers\HomeController;
use App\Http\Controllers\KuliahController;
use App\Http\Controllers\DosenController;
use App\Http\Controllers\MatkulController;
use App\Http\Controllers\ProdiController;
use App\Http\Controllers\KelasController;
use App\Http\Controllers\RuangController;
use App\Http\Controllers\WaktuController;
use App\Http\Controllers\HariController;
use App\Http\Controllers\JamController;
use App\Http\Controllers\PenjadwalanController;
use Illuminate\Support\Facades\Route;

// Dashboard and Home Routes
Route::get('/', [HomeController::class, 'index']);
Route::get('/home', [HomeController::class, 'index']);
Route::get('/home/action', [HomeController::class, 'tampilkan_jadwal']);
Route::get('/home/export_excel/{semester}/{tahun}', [HomeController::class, 'export_excel']);

// Manage Kuliah Routes
Route::get('/managekuliah', [KuliahController::class, 'index']);
Route::get('/managekuliah/create', [KuliahController::class, 'create']);
Route::get('/managekuliah/create/action', [KuliahController::class, 'create_action'])->name('managekuliah.create.action');
Route::post('/managekuliah/keyword', [KuliahController::class, 'index']);
Route::post('/managekuliah', [KuliahController::class, 'store']);
Route::delete('/managekuliah/{kode_kuliah}', [KuliahController::class, 'destroy']);
Route::get('/managekuliah/{kode_kuliah}/edit', [KuliahController::class, 'edit']);
Route::patch('/managekuliah/{kode_kuliah}', [KuliahController::class, 'update']);

// Manage Dosen Routes
Route::get('/managekuliah/managedosen', [DosenController::class, 'index']);
Route::get('/managekuliah/managedosen/create', [DosenController::class, 'create']);
Route::post('/managekuliah/managedosen/keyword', [DosenController::class, 'index']);
Route::post('/managekuliah/managedosen', [DosenController::class, 'store']);
Route::delete('/managekuliah/managedosen/{kode_dosen}', [DosenController::class, 'destroy']);
Route::get('/managekuliah/managedosen/{kode_dosen}/edit', [DosenController::class, 'edit']);
Route::patch('/managekuliah/managedosen/{kode_dosen}', [DosenController::class, 'update']);

// Manage Mata Kuliah Routes
Route::get('/managekuliah/managematkul', [MatkulController::class, 'index']);
Route::get('/managekuliah/managematkul/create', [MatkulController::class, 'create']);
Route::post('/managekuliah/managematkul/keyword', [MatkulController::class, 'index']);
Route::post('/managekuliah/managematkul', [MatkulController::class, 'store']);
Route::delete('/managekuliah/managematkul/{kode_matkul}/{tahun_ajaran}', [MatkulController::class, 'destroy']);
Route::get('/managekuliah/managematkul/{kode_matkul}/{tahun_ajaran}/edit', [MatkulController::class, 'edit']);
Route::patch('/managekuliah/managematkul/{kode_matkul}/{tahun_ajaran}', [MatkulController::class, 'update']);

// Manage Prodi Routes
Route::get('/managekuliah/manageprodi', [ProdiController::class, 'index']);
Route::get('/managekuliah/manageprodi/create', [ProdiController::class, 'create']);
Route::post('/managekuliah/manageprodi/keyword', [ProdiController::class, 'index']);
Route::post('/managekuliah/manageprodi', [ProdiController::class, 'store']);
Route::delete('/managekuliah/manageprodi/{id}', [ProdiController::class, 'destroy']);
Route::get('/managekuliah/manageprodi/{id}/edit', [ProdiController::class, 'edit']);
Route::patch('/managekuliah/manageprodi/{id}', [ProdiController::class, 'update']);

// Manage Kelas Routes
Route::get('/managekuliah/managekelas', [KelasController::class, 'index']);
Route::get('/managekuliah/managekelas/create', [KelasController::class, 'create']);
Route::get('/managekuliah/managekelas/create/action', [KelasController::class, 'create_action']);
Route::post('/managekuliah/managekelas/keyword', [KelasController::class, 'index']);
Route::post('/managekuliah/managekelas', [KelasController::class, 'store']);
Route::delete('/managekuliah/managekelas/{kode_kelas}/{tahun_ajaran}', [KelasController::class, 'destroy']);
Route::get('/managekuliah/managekelas/{kode_kelas}/{tahun_ajaran}/edit', [KelasController::class, 'edit']);
Route::patch('/managekuliah/managekelas/{kode_kelas}/{tahun_ajaran}', [KelasController::class, 'update']);

// Manage Ruang Routes
Route::get('/manageruang', [RuangController::class, 'index']);
Route::get('/manageruang/create', [RuangController::class, 'create']);
Route::post('/manageruang/keyword', [RuangController::class, 'index']);
Route::post('/manageruang', [RuangController::class, 'store']);
Route::delete('/manageruang/{kode_ruang}', [RuangController::class, 'destroy']);
Route::get('/manageruang/{kode_ruang}/edit', [RuangController::class, 'edit']);
Route::patch('/manageruang/{kode_ruang}', [RuangController::class, 'update']);

// Manage Waktu Routes
Route::get('/managewaktu', [WaktuController::class, 'index']);
Route::get('/managewaktu/create', [WaktuController::class, 'create']);
Route::get('/managewaktu/create/action', [WaktuController::class, 'create_action']);
Route::post('/managewaktu/keyword', [WaktuController::class, 'index']);
Route::post('/managewaktu', [WaktuController::class, 'store']);
Route::delete('/managewaktu/{kode_waktu}', [WaktuController::class, 'destroy']);
Route::get('/managewaktu/{kode_waktu}/edit', [WaktuController::class, 'edit']);
Route::patch('/managewaktu/{kode_waktu}', [WaktuController::class, 'update']);

// Manage Hari Routes
Route::get('/managewaktu/managehari', [HariController::class, 'index']);
Route::get('/managewaktu/managehari/create', [HariController::class, 'create']);
Route::post('/managewaktu/managehari/keyword', [HariController::class, 'index']);
Route::post('/managewaktu/managehari', [HariController::class, 'store']);
Route::delete('/managewaktu/managehari/{kode_hari}', [HariController::class, 'destroy']);
Route::get('/managewaktu/managehari/{kode_hari}/edit', [HariController::class, 'edit']);
Route::patch('/managewaktu/managehari/{kode_hari}', [HariController::class, 'update']);

// Manage Jam Routes
Route::get('/managewaktu/managejam', [JamController::class, 'index']);
Route::get('/managewaktu/managejam/create', [JamController::class, 'create']);
Route::post('/managewaktu/managejam/keyword', [JamController::class, 'index']);
Route::post('/managewaktu/managejam', [JamController::class, 'store']);
Route::delete('/managewaktu/managejam/{kode_jam}', [JamController::class, 'destroy']);
Route::get('/managewaktu/managejam/{kode_jam}/edit', [JamController::class, 'edit']);
Route::patch('/managewaktu/managejam/{kode_jam}', [JamController::class, 'update']);

// Generate Jadwal Routes
Route::get('/generatejadwal', [PenjadwalanController::class, 'generatejadwalform']);
Route::get('/generatejadwal/action', [PenjadwalanController::class, 'generate_action']);
Route::post('/generatejadwal', [PenjadwalanController::class, 'generatejadwal']);

// Hasil Jadwal Routes
Route::get('/hasilgenerate/{jadwal_index}', [PenjadwalanController::class, 'hasilgenerate']);
Route::get('/hasiljadwal', [PenjadwalanController::class, 'hasiljadwal']);