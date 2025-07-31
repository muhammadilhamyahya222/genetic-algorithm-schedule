<?php

namespace App\Http\Controllers;

use App\Models\Jadwal;
use App\Models\Hari; // <-- TAMBAHKAN
use App\Models\Jam; // <-- TAMBAHKAN
use App\Exports\JadwalExport; // <-- TAMBAHKAN
use Maatwebsite\Excel\Facades\Excel; // <-- TAMBAHKAN
use Illuminate\Http\Request;

class JadwalController extends Controller
{
    public function cetakJadwal(Request $request)
    {
        $semester = $request->input('semester', 'Ganjil'); 
        $tahun_ajaran = $request->input('tahun_ajaran', '2024/2025');

        $timeSlots = Jam::orderBy('jam')->pluck('jam');

        $timeSlotIndexes = array_flip($timeSlots->toArray()); 

        $rooms = Jadwal::where('semester', $semester)
            ->where('tahun_ajaran', $tahun_ajaran)
            ->distinct()
            ->orderBy('nama_ruang')
            ->pluck('nama_ruang');

        $days = Hari::orderBy('kode_hari')->pluck('nama_hari');

        $rawJadwal = Jadwal::where('semester', $semester)
            ->where('tahun_ajaran', $tahun_ajaran)
            ->get();

        $scheduleMap = [];
        foreach ($rawJadwal as $item) {
            $jamMasuk = date('H:i', strtotime($item->jam_masuk));
            $jamKeluar = date('H:i', strtotime($item->jam_keluar));

            if (isset($timeSlotIndexes[$jamMasuk]) && isset($timeSlotIndexes[$jamKeluar])) {
                $startIndex = $timeSlotIndexes[$jamMasuk];
                $endIndex = $timeSlotIndexes[$jamKeluar];
                $item->rowspan = $endIndex - $startIndex;
            } else {
                $item->rowspan = 1;
            }

            $scheduleMap[$item->hari][$item->nama_ruang][$jamMasuk] = $item;
        }

        $exportData = [
            'days' => $days,
            'timeSlots' => $timeSlots,
            'rooms' => $rooms,
            'scheduleMap' => $scheduleMap,
            'semester' => $semester,
            'tahun_ajaran' => $tahun_ajaran,
        ];

        // Unduh file Excel dengan memanggil kelas JadwalExport yang baru
        return Excel::download(new JadwalExport($exportData), 'Jadwal-Kuliah.xlsx');
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Jadwal $jadwal)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Jadwal $jadwal)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Jadwal $jadwal)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Jadwal $jadwal)
    {
        //
    }
}
