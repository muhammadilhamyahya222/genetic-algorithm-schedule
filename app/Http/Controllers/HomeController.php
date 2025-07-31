<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\JadwalExport;
use App\Models\Jadwal;
use App\Models\Hari;
use App\Models\Jam;

class HomeController extends Controller
{
    public function index(Request $request) {
        $countDosen = DB::table('dosen')->count();
        $countMatkul = DB::table('matkul')->distinct()->count('kode_matkul');
        $countRuang = DB::table('ruang')->count();
        $countKelas = DB::table('kelas')->count();
        $countJadwal = DB::table('jadwal')->count();

        $semester = DB::table('semester')->get();
        $jadwal = []; 
        for ($i=0; $i < count($semester); $i++) { 
            $jadwal[$i] = DB::table('jadwal')->where('semester', $semester[$i]->nama_semester)->get();
        }

        $tahun_ajaran = DB::table('tahun_ajaran')->get();
        $user_login = $request->session()->get('user_login');

        return view('home',compact( 'countDosen', 'countMatkul', 'countRuang', 'countKelas', 'countJadwal',  'jadwal','semester','tahun_ajaran'));
    }

    public function tampilkan_jadwal(Request $request) {
        if($request->ajax()) {
            $tahun = $request->get('tahun');
            
            $jadwal_ganjil = DB::table('jadwal')->where('tahun_ajaran', $tahun)->where('semester', 'ganjil')->get();
            $jadwal_genap = DB::table('jadwal')->where('tahun_ajaran', $tahun)->where('semester', 'genap')->get();
            
            $data = array(
                'ganjil'  => $jadwal_ganjil,
                'genap'   => $jadwal_genap,
                'tahun' => $tahun
            );
            echo json_encode($data);
        } else {
            return redirect('/home/dashboard');
        }
    }

    public function export_excel($semester, $tahun){
        $tahun_ajaran = str_replace('-', '/', $tahun);

        $timeSlots = Jam::orderBy('jam')->get()->map(function ($item) {
            return date('H:i', strtotime($item->jam));
        });
        $timeSlotIndexes = array_flip($timeSlots->toArray()); 

        $days = Hari::orderBy('kode_hari')->get()->map(function ($item) {
            return strtolower(trim($item->nama_hari));
        });

        $rawJadwal = Jadwal::where('semester', $semester)
            ->where('tahun_ajaran', $tahun_ajaran)
            ->get();
            
        $scheduleMap = [];
        foreach ($rawJadwal as $item) {
            $jamMasuk = date('H:i', strtotime($item->jam_masuk));
            $jamKeluar = date('H:i', strtotime($item->jam_keluar));
            $hariJadwal = strtolower(trim($item->hari));
            $ruangJadwal = strtoupper(trim($item->nama_ruang));

            $matkulFormatted = ucwords(strtolower($item->matkul));
            $prodiSemester = "({$item->kode_prodi} Semester {$item->perkuliahan_semester})";
            $item->displayText = "{$matkulFormatted}\n{$prodiSemester}\n{$item->jenis}\nKelas {$item->kelas}";

            if (isset($timeSlotIndexes[$jamMasuk]) && isset($timeSlotIndexes[$jamKeluar])) {
                $item->rowspan = $timeSlotIndexes[$jamKeluar] - $timeSlotIndexes[$jamMasuk];
            } else {
                $item->rowspan = 1;
            }

            if (!empty($ruangJadwal)) {
                 $scheduleMap[$hariJadwal][$ruangJadwal][$jamMasuk] = $item;
            }
        }

        $roomList = [];
        foreach ($scheduleMap as $daySchedule) {
            foreach (array_keys($daySchedule) as $roomName) {
                $roomList[$roomName] = true;
            }
        }
        $rooms = collect(array_keys($roomList))->sort()->values();

        $exportData = [
            'days' => $days,
            'timeSlots' => $timeSlots,
            'rooms' => $rooms,
            'scheduleMap' => $scheduleMap,
            'semester' => $semester,
            'tahun_ajaran' => $tahun_ajaran,
        ];
        
        return Excel::download(new JadwalExport($exportData), "jadwalkuliah-{$semester}-{$tahun}.xlsx");
    }
}
