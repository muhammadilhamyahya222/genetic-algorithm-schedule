<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Session;
class PenjadwalanController extends Controller
{
    public function generatejadwalform(Request $request)
    {
        $semester = DB::table('semester')->get();
        $allTahunAjaran = DB::table('tahun_ajaran')->get();

        $countKuliahTabel = [];
        foreach($allTahunAjaran as $tahun){
            $countGanjil = DB::table('kuliah')->where('kode_semester', 1)->where('tahun_ajaran', $tahun->tahun_ajaran)->count();
            $countGenap = DB::table('kuliah')->where('kode_semester', 2)->where('tahun_ajaran', $tahun->tahun_ajaran)->count();
            array_push(
                $countKuliahTabel, [
                'tahun_ajaran' => $tahun->tahun_ajaran,
                'semester_ganjil_count' => $countGanjil,
                'semester_genap_count' => $countGenap]
             );
        }

        $kuliah = DB::table('kuliah')->get();
        $ruang = DB::table('ruang')->get();
        $waktu = DB::table('waktu')->get();
        $allDosen = DB::table('dosen')->get();
        $allHari = DB::table('hari')->get();

        if(count($kuliah) == 0) {
            return redirect('/managekuliah/managekelas')->with('status', 'Harap Mengisi Data Kelas Terlebih Dahulu!');
        }

        foreach($countKuliahTabel as $countKuliah){
            if($countKuliah['semester_ganjil_count'] == 0) {
                return redirect('/managekuliah/managekelas')->with('status', 'Harap Menambahkan Data Kelas di Semester Ganjil Tahun Ajaran '.$countKuliah['tahun_ajaran']);
            }
    
            if($countKuliah['semester_genap_count'] == 0) {
                return redirect('/managekuliah/managekelas')->with('status', 'Harap Menambahkan Data Kelas di Semester Genap Tahun Ajaran '.$countKuliah['tahun_ajaran']);
            }
        }
        

        if(count($ruang) == 0) {
            return redirect('/manageruang')->with('status', 'Harap Mengisi Data Ruang Terlebih Dahulu!');
        }

        if(count($waktu) == 0) {
            return redirect('/managewaktu')->with('status', 'Harap Mengisi Data Waktu Terlebih Dahulu!');
        }

        foreach($countKuliahTabel as $countKuliah){
            $kuliah = DB::table('kuliah')->where('tahun_ajaran', $countKuliah['tahun_ajaran'])->get();
            if ($kuliah[count($kuliah)-1]->kode_kuliah != count($kuliah)) {
                for ($i=0; $i < count($kuliah); $i++) { 
                    DB::table('kuliah')
                    ->where('kode_kuliah', $kuliah[$i]->kode_kuliah)
                    ->where('tahun_ajaran', $countKuliah['tahun_ajaran'])
                    ->update([
                        'kode_kuliah' => $i+1,
                    ]);
                }
            }

        }

        if ($ruang[count($ruang)-1]->kode_ruang != count($ruang)) {
            for ($i=0; $i < count($ruang); $i++) { 
                DB::table('ruang')
                ->where('kode_ruang', $ruang[$i]->kode_ruang)
                ->update([
                    'kode_ruang' => $i+1,
                ]);
            }
        }
        if ($waktu[count($waktu)-1]->kode_waktu != count($waktu)) {
            for ($i=0; $i < count($waktu); $i++) { 
                DB::table('waktu')
                ->where('kode_waktu', $waktu[$i]->kode_waktu)
                ->update([
                    'kode_waktu' => $i+1,
                ]);
            }
        }

        $algoritma_proses = [];
        $execution_time = [];


        return view('penjadwalankuliah.generatejadwal', compact('semester','algoritma_proses','execution_time','allDosen', 'allHari', 'countKuliahTabel','allTahunAjaran'));
    }
    public function generate_action(Request $request){
        if($request->ajax()){
            if($request->has('dosen')){

                $namaDosen = $request->get('dosen');
                $kodeDosen = DB::table('dosen')->where('nama', $namaDosen)->first()->kode_dosen;
                $semester = $request->get('semester');
                $tahun_ajaran = $request->get('tahun_ajaran');
                $kodeKelasBySemesterAndYear = DB::table('kuliah')->where('kode_dosen',$kodeDosen)->where('kode_semester', $semester)->where('tahun_ajaran', $tahun_ajaran)->get();
                foreach ($kodeKelasBySemesterAndYear as $key => $kelas) {
                    $kelasBySemesterAndYear[$key] = DB::table('kelas')->where('kode_kelas', $kelas->kode_kelas)->where('tahun_ajaran', $tahun_ajaran)->first();
                }
                
                $data = array(
                    'allKelas'  => $kelasBySemesterAndYear
                );
                
                echo json_encode($data);
            }   

            if($request->has('hari')) {
                $kodeHari = $request->get('hari');

                $getKodeJamByHari = DB::table('waktu')->where('kode_hari', $kodeHari)->get();

                $allJamByKodeJam = [];

                foreach($getKodeJamByHari as $key => $jam) {
                    $allJamByKodeJam[$key] = DB::table('jam')->where('kode_jam', $jam->kode_jam)->first();
                }

                $data = array(
                    'allJam' => $allJamByKodeJam
                );

                echo json_encode($data);

            }

            if($request->has('i')) {
                $getAllDosen = DB::table('dosen')->get();
                $getAllHari = DB::table('hari')->get();

                $data = array(
                    'dosen' => $getAllDosen,
                    'hari' => $getAllHari
                );

                echo json_encode($data);
            }
        }
    }

    public function generatejadwal(Request $request)
    {
        ini_set('max_execution_time', 3600);
        
        $semester = DB::table('semester')->get();
        $allDosen = DB::table('dosen')->get()->keyBy('kode_dosen');
        $allHari = DB::table('hari')->get()->keyBy('kode_hari');
        $allTahunAjaran = DB::table('tahun_ajaran')->get();
        $allRuang = DB::table('ruang')->get()->keyBy('kode_ruang');
        $allWaktu = DB::table('waktu')->get()->keyBy('kode_waktu');
        $allJam = DB::table('jam')->get()->keyBy('kode_jam');
        $allMatkul = DB::table('matkul')->get()->keyBy('kode_matkul');
        $allKelas = DB::table('kelas')->get()->keyBy('kode_kelas');

        $jumlahIndividu = 6;
        $maxGenerasi = 10;
        $tahunAjaran = $request->tahun_ajaran;
        $kodeSemester = $request->radioSemester;
        $showAlgorithm = $request->algoritma;
        $crossoverRate = 75;
        $mutationRate = 0.01;

        $maxJamPerHari = $allWaktu->groupBy('kode_hari')->map(fn($group) => $group->max('kode_jam'))->all();

        if (!$kodeSemester) {
            Session::flash('errorSemester', "Harap di isi dengan benar!");
            return Redirect::back();
        }
        if (!$tahunAjaran) {
            Session::flash('errorTahunAjaran', "Harap di isi dengan benar!");
            return Redirect::back();
        }

        $countKuliahTableRaw = DB::table('kuliah')
            ->select('tahun_ajaran', 'kode_semester', DB::raw('count(*) as total'))
            ->groupBy('tahun_ajaran', 'kode_semester')
            ->get();

        $countKuliahTabel = [];
        foreach ($allTahunAjaran as $tahun) {
            $ganjilCount = $countKuliahTableRaw->where('tahun_ajaran', $tahun->tahun_ajaran)
                                               ->where('kode_semester', 1)
                                               ->sum('total');

            $genapCount = $countKuliahTableRaw->where('tahun_ajaran', $tahun->tahun_ajaran)
                                              ->where('kode_semester', 2)
                                              ->sum('total');
 
            $countKuliahTabel[] = [
                'tahun_ajaran' => $tahun->tahun_ajaran,
                'semester_ganjil_count' => $ganjilCount,
                'semester_genap_count' => $genapCount
            ];
        }

        $kuliahTable = DB::table('kuliah')->where('kode_semester', $kodeSemester)->where('tahun_ajaran', $tahunAjaran)->get();

        $allKodeRuang = $allRuang->keys()->all();
        $firstKodeRuang = $allKodeRuang[0] ?? null;
        $lastKodeRuang = end($allKodeRuang);

        $allKodeWaktu = $allWaktu->keys()->all();
        $firstKodeWaktu = $allKodeWaktu[0] ?? null;
        $lastKodeWaktu = end($allKodeWaktu);

        $random_kode_ruang = function () use ($allKodeRuang) {
            if (empty($allKodeRuang)) {
                return null;
            }
            return $allKodeRuang[array_rand($allKodeRuang)];
        };

        $random_1 = function ($count) {
            $random = [];
            for ($i = 0; $i < $count; $i++) {
                $random[$i] = rand(0, 1000) / 1000;
            }
            return $random;
        };

        $random_2 = function ($individu) {
            $length = count($individu) - 1;
            return rand(1, max($length, 1));
        };

        $individuWithDetail = function ($individu, $tahun_ajaran) use ($allMatkul, $allWaktu, $allRuang) {
            $result = [];

            foreach ($individu as $i => $jadwal) {
                $result[$i] = [];
                foreach ($jadwal as $j => $kromosom) {
                    $kode_kuliah = $kromosom[0];
                    $kode_ruang = $kromosom[1];
                    $kode_waktu = $kromosom[2];

                    $kuliah = DB::table('kuliah')
                        ->where('kode_kuliah', $kode_kuliah)
                        ->where('tahun_ajaran', $tahun_ajaran)
                        ->first();

                    $matkul = $kuliah ? ($allMatkul[$kuliah->kode_matkul] ?? null) : null;
                    $waktu = $allWaktu[$kode_waktu] ?? null;
                    $ruang = $allRuang[$kode_ruang] ?? null;

                    $kode_prodi = $kuliah ? $kuliah->kode_prodi : null;
                    $perkuliahan_semester = $kuliah ? $kuliah->perkuliahan_semester : null;

                    $jumlah_sks = $matkul ? $matkul->sks : 0;
                    if ($matkul && str_ends_with($kuliah->kode_matkul, 'P')) {
                        $jumlah_sks = 3;
                    }

                    $jam_keluar = $waktu ? ($waktu->kode_jam + $jumlah_sks - 1) : null;

                    $result[$i][$j] = [
                        'kode_kuliah' => $kode_kuliah,
                        'kode_matkul' => $kuliah ? $kuliah->kode_matkul : null,
                        'kode_prodi' => $kode_prodi,
                        'perkuliahan_semester' => [
                            'kode' => $perkuliahan_semester,
                            'clash' => 0
                        ],
                        'kode_dosen' => [
                            'kode' => $kuliah ? $kuliah->kode_dosen : null,
                            'clash' => 0
                        ],
                        'kode_kelas' => $kuliah ? $kuliah->kode_kelas : null,
                        'jumlah_sks' => $jumlah_sks,
                        'nama_ruang' => [
                            'kode' => $ruang ? $ruang->nama_ruang : null,
                            'clash' => 0
                        ],
                        'kode_hari' => $waktu ? $waktu->kode_hari : null,
                        'kode_jam' => $waktu ? $waktu->kode_jam : null,
                        'jam_keluar' => $jam_keluar,
                    ];
                }
            }

            foreach ($result as &$jadwal) {
                for ($a = 0; $a < count($jadwal); $a++) {
                    $dataA = $jadwal[$a];
                    if ($dataA['nama_ruang']['kode'] === null || $dataA['kode_hari'] === null) continue;
                    $startA = $dataA['kode_jam'];
                    $endA = $dataA['jam_keluar'];
                    for ($b = $a + 1; $b < count($jadwal); $b++) {
                        $dataB = $jadwal[$b];
                        if ($dataB['nama_ruang']['kode'] === null || $dataB['kode_hari'] === null) continue;
                        if ($dataA['nama_ruang']['kode'] === $dataB['nama_ruang']['kode'] && $dataA['kode_hari'] === $dataB['kode_hari']) {
                            $startB = $dataB['kode_jam'];
                            $endB = $dataB['jam_keluar'];
                            if ($startA <= $endB && $startB <= $endA) {
                                $jadwal[$a]['nama_ruang']['clash'] = 1;
                                $jadwal[$b]['nama_ruang']['clash'] = 1;
                            }
                        }
                    }
                }
            }
            unset($jadwal);

            foreach ($result as &$jadwal) {
                $dosenTimeSlot = [];

                foreach ($jadwal as $a => $dataA) {
                    $kodeDosenList = explode(';', $dataA['kode_dosen']['kode'] ?? '');
                    $kodeHari = $dataA['kode_hari'];
                    $kodeJam = $dataA['kode_jam'];
                    $jamKeluar = $dataA['jam_keluar'];
                    $sks = $dataA['jumlah_sks'];

                    for ($jamSlot = $kodeJam; $jamSlot <= $jamKeluar; $jamSlot++) {
                        foreach ($kodeDosenList as $dosen) {
                            if (!$dosen) continue;
                            $key = "$dosen-$kodeHari-$jamSlot";
                            $dosenTimeSlot[$key][] = [
                                'isTim' => count($kodeDosenList) > 1,
                                'index' => $a
                            ];
                        }
                    }
                }

                foreach ($jadwal as $a => $dataA) {
                    $kodeDosenA = $dataA['kode_dosen']['kode'] ?? '';
                    if ($kodeDosenA && strpos($kodeDosenA, ';') === false) {
                        $kodeHariA = $dataA['kode_hari'];
                        $kodeJamA = $dataA['kode_jam'];
                        $jamKeluarA = $dataA['jam_keluar'];

                        for ($jamSlot = $kodeJamA; $jamSlot <= $jamKeluarA; $jamSlot++) {
                            $key = "$kodeDosenA-$kodeHariA-$jamSlot";

                            if (isset($dosenTimeSlot[$key])) {
                                foreach ($dosenTimeSlot[$key] as $info) {
                                    if ($info['index'] !== $a) {
                                        $jadwal[$a]['kode_dosen']['clash'] = 1;
                                        break 2;
                                    }
                                }
                            }
                        }
                    }
                }
            }
            unset($jadwal);

            foreach ($result as &$jadwal) {
                $prodiPeriodTimeSlots = [];

                foreach ($jadwal as $idx => $data) {
                    $kodeProdi = $data['kode_prodi'];
                    $periodeSemester = $data['perkuliahan_semester']['kode'];
                    $kodeHari = $data['kode_hari'];
                    $kodeJam = $data['kode_jam'];
                    $jamKeluar = $data['jam_keluar'];
                    $kodeMatkul = $data['kode_matkul'];
                
                    if ($kodeProdi === null || $periodeSemester === null || $kodeHari === null || $kodeJam === null || $jamKeluar === null) {
                        continue;
                    }
                
                    for ($jamSlot = $kodeJam; $jamSlot <= $jamKeluar; $jamSlot++) {
                        $key = "$kodeProdi-$periodeSemester-$kodeHari-$jamSlot";
                        $prodiPeriodTimeSlots[$key][] = [
                            'index' => $idx,
                            'matkul' => $kodeMatkul
                        ];
                    }
                }
         
                foreach ($jadwal as $idx => $data) {
                    $kodeProdi = $data['kode_prodi'];
                    $periodeSemester = $data['perkuliahan_semester']['kode'];
                    $kodeHari = $data['kode_hari'];
                    $kodeJam = $data['kode_jam'];
                    $jamKeluar = $data['jam_keluar'];
                    $kodeMatkul = $data['kode_matkul'];
                
                    if ($kodeProdi === null || $periodeSemester === null || $kodeHari === null || $kodeJam === null || $jamKeluar === null) {
                        continue;
                    }
                
                    for ($jamSlot = $kodeJam; $jamSlot <= $jamKeluar; $jamSlot++) {
                        $key = "$kodeProdi-$periodeSemester-$kodeHari-$jamSlot";
                        if (isset($prodiPeriodTimeSlots[$key])) {
                            foreach ($prodiPeriodTimeSlots[$key] as $info) {
                                if ($info['index'] !== $idx && $info['matkul'] !== $kodeMatkul && $periodeSemester != 5) {
                                    $jadwal[$idx]['perkuliahan_semester']['clash'] = 1;
                                    $jadwal[$info['index']]['perkuliahan_semester']['clash'] = 1;
                                }
                            }
                        }
                    }
                }
            }
            unset($jadwal);

            return $result;
        };

        $codeIntoNameIndividuDetail = function ($individuWithDetail, $tahun_ajaran) use ($allMatkul, $allDosen, $allKelas, $allHari, $allJam) {
            $result = [];
            foreach ($individuWithDetail as $i => $jadwal) {
                $result[$i] = [];
                foreach ($jadwal as $j => $detail) {
                    $kodeMatkul = $detail['kode_matkul'];
                    $kodeDosenRaw = $detail['kode_dosen']['kode'] ?? '';
                    $kodeKelas = $detail['kode_kelas'];
                    $kodeHari = $detail['kode_hari'];
                    $kodeJam = $detail['kode_jam'];

                    $namaMatkul = $allMatkul[$kodeMatkul]->nama_matkul ?? '-';
                    $dosenKodeList = explode(';', $kodeDosenRaw);
                    $namaDosenList = [];
                    foreach ($dosenKodeList as $kd) {
                        $namaDosenList[] = $allDosen[$kd]->nama ?? '-';
                    }
                    $namaKelas = $allKelas[$kodeKelas]->kelas ?? '-';
                    $namaHari = $allHari[$kodeHari]->nama_hari ?? '-';
                    $namaJam = $allJam[$kodeJam]->jam ?? '-';

                    $jamKeluar = $detail['jam_keluar'] ? ($allJam[$detail['jam_keluar']]->jam ?? '-') : '-';

                    $result[$i][$j] = [
                        'kode_kelas' => $kodeKelas,
                        'matkul' => $namaMatkul,
                        'dosen' => $namaDosenList,
                        'kelas' => $namaKelas,
                        'jumlah_sks' => $detail['jumlah_sks'],
                        'nama_ruang' => $detail['nama_ruang']['kode'],
                        'hari' => $namaHari,
                        'jam' => $namaJam,
                        'jam_keluar' => $jamKeluar,
                    ];
                }
            }
            return $result;
        };

        // Fungsi fitness
        $fitness = function ($individuWithDetail) {
        $CR = $CD = $CJ = [];
        $fitnessIndividu = [];
        $totalNilaiFitness = 0;

            foreach ($individuWithDetail as $i => $jadwal) {
                $cR = $cD = $cJ = 0;
                foreach ($jadwal as $item) {
                    if (!empty($item['nama_ruang']['clash'])) {
                        $cR += 1;
                    }
                    if (!empty($item['kode_dosen']['clash'])) {
                        $cD += 1;
                    }
                    if (!empty($item['perkuliahan_semester']['clash'])) {
                        $cJ += 1;
                    }
                }
                $CR[$i] = $cR;
                $CD[$i] = $cD;
                $CJ[$i] = $cJ;

                $fitnessIndividu[$i] = 1 / (1 + $CR[$i] + $CD[$i] + $CJ[$i]);
                $totalNilaiFitness += $fitnessIndividu[$i];
            }
    
            $fixJadwal = [];

            $nilaiFitnessTerbaik = max($fitnessIndividu);

            if ($nilaiFitnessTerbaik == 1) {
                $kunciIndividuSempurna = array_keys($fitnessIndividu, 1);
                
                foreach ($kunciIndividuSempurna as $idx) {
                    $fixJadwal[] = $individuWithDetail[$idx];
                }
            }
        
            return [
                'CR' => $CR,
                'CD' => $CD,
                'CJ' => $CJ,
                'fitness_individu' => $fitnessIndividu,
                'total_fitness' => $totalNilaiFitness,
                'fix_jadwal' => $fixJadwal
            ];
        };

        $allClashChromosome = function ($individu, $tahun_ajaran) use ($individuWithDetail) {
            $individuDetail = $individuWithDetail($individu, $tahun_ajaran);
            $allClashChromosome = [];
            foreach ($individuDetail as $i => $jadwal) {
                foreach ($jadwal as $j => $kromosom) {
                    $clashes = [];
                    if (!empty($kromosom['nama_ruang']['clash'])) {
                        $clashes[] = 'CR';
                    }
                    if (!empty($kromosom['kode_dosen']['clash'])) {
                        $clashes[] = 'CD';
                    }
                    if (!empty($kromosom['perkuliahan_semester']['clash'])) {
                        $clashes[] = 'CJ';
                    }

                    if (!empty($clashes)) {
                        $allClashChromosome[] = [
                            'index_individu' => $i,
                            'index_kromosom' => $j,
                            'jenis_clash' => $clashes,
                            'detail' => $kromosom,
                            'gen_asli' => $individu[$i][$j]
                        ];
                    }
                }
            }
            return $allClashChromosome;
        };

        $perbaikiClashRuang = function ($kromosomDetail, $jadwalSatuIndividu, $allRuang, $allWaktu) {
            $hari_clash = $kromosomDetail['kode_hari'];
            $jam_mulai_clash = $kromosomDetail['kode_jam'];
            $jam_selesai_clash = $kromosomDetail['jam_keluar'];

            $ruangTerpakai = [];
            foreach ($jadwalSatuIndividu as $jadwal) {
                if ($jadwal['kode_hari'] == $hari_clash) {
                    $start = $jadwal['kode_jam'];
                    $end = $jadwal['jam_keluar'];
                    if ($jam_mulai_clash <= $end && $start <= $jam_selesai_clash) {
                        $ruangTerpakai[$jadwal['nama_ruang']['kode']] = true;
                    }
                }
            }
        
            $ruangKosong = [];
            foreach ($allRuang as $ruang) {
                if (!isset($ruangTerpakai[$ruang->nama_ruang])) {
                    $ruangKosong[] = $ruang->kode_ruang;
                }
            }

            if (!empty($ruangKosong)) {
                return $ruangKosong[array_rand($ruangKosong)];
            }

            return null;
        };
      
        $perbaikiClashDosenSemester = function ($kromosomDetail, $jadwalSatuIndividu, $allWaktu, $allRuang) use ($maxJamPerHari) {
        $dosen_clash_list = explode(';', $kromosomDetail['kode_dosen']['kode'] ?? '');
        $semester_clash = $kromosomDetail['perkuliahan_semester']['kode'];
        $prodi_clash = $kromosomDetail['kode_prodi'];
        $sks = $kromosomDetail['jumlah_sks'];

        $slotWaktuValid = [];

        foreach ($allWaktu as $kodeWaktu => $waktu) {
            $hari_uji = $waktu->kode_hari;
            $jam_mulai_uji = $waktu->kode_jam;
            $jam_selesai_uji = $jam_mulai_uji + $sks - 1;

            if (!isset($maxJamPerHari[$hari_uji])) {
                continue;
            }

            $maxJamHariIni = $maxJamPerHari[$hari_uji];

            if ($jam_selesai_uji > $maxJamHariIni) {
                continue;
            }

            $isSlotBebas = true;

            foreach ($jadwalSatuIndividu as $jadwal) {
                if ($jadwal['kode_kuliah'] == $kromosomDetail['kode_kuliah']) continue;
                $start = $jadwal['kode_jam'];
                $end = $jadwal['jam_keluar'];
                if ($jadwal['kode_hari'] == $hari_uji && ($jam_mulai_uji <= $end && $start <= $jam_selesai_uji)) {
                    $dosen_lain_list = explode(';', $jadwal['kode_dosen']['kode'] ?? '');
                    if (count(array_intersect($dosen_clash_list, $dosen_lain_list)) > 0) {
                        $isSlotBebas = false;
                        break;
                    }
                    if ($jadwal['perkuliahan_semester']['kode'] == $semester_clash && $jadwal['kode_prodi'] == $prodi_clash) {
                        $isSlotBebas = false;
                        break;
                    }
                }
            }
            if ($isSlotBebas) {
                $slotWaktuValid[] = $kodeWaktu;
            }
        }

        if (!empty($slotWaktuValid)) {
            shuffle($slotWaktuValid);
            foreach($slotWaktuValid as $kodeWaktuBaru) {
                $waktuBaru = $allWaktu[$kodeWaktuBaru];
                $hariBaru = $waktuBaru->kode_hari;
                $jamMulaiBaru = $waktuBaru->kode_jam;
                $jamSelesaiBaru = $jamMulaiBaru + $sks - 1;
                $ruangTerpakai = [];
                foreach ($jadwalSatuIndividu as $jadwal) {
                     if ($jadwal['kode_hari'] == $hariBaru) {
                        $start = $jadwal['kode_jam'];
                        $end = $jadwal['jam_keluar'];
                        if ($jamMulaiBaru <= $end && $start <= $jamSelesaiBaru) {
                            $ruangTerpakai[$jadwal['nama_ruang']['kode']] = true;
                        }
                    }
                }
                $ruangKosong = [];
                foreach ($allRuang as $ruang) {
                    if (!isset($ruangTerpakai[$ruang->nama_ruang])) {
                        $ruangKosong[] = $ruang->kode_ruang;
                    }
                }
                if(!empty($ruangKosong)) {
                    return ['kode_waktu' => $kodeWaktuBaru, 'kode_ruang' => $ruangKosong[array_rand($ruangKosong)]];
                }
            }
        }
    
        return null;
        };

        $validWaktuTatapMuka = $allWaktu->filter(function($w) {
            return in_array($w->kode_hari, [1,2,3,4,5]) && $w->kode_jam <= 12;
        })->keys()->all();

        $validWaktuPraktikumHari5 = $allWaktu->filter(function($w) {
            return $w->kode_hari == 5 && $w->kode_jam >= 1 && $w->kode_jam <= 15;
        })->keys()->all();

        $validWaktuPraktikumOtherDays = $allWaktu->filter(function($w) {
            return in_array($w->kode_hari, [2,3,4]) && $w->kode_jam >= 1 && $w->kode_jam <= 15;
        })->keys()->all();

        $kelasGrouped = [];
        foreach ($kuliahTable as $kuliah) {
            $key = $kuliah->kode_matkul . '-' . $kuliah->kode_prodi;
            $kelasGrouped[$key][] = $kuliah;
        }

        // Inisialisasi Populasi
        $individu = [];
        for ($i = 0; $i < $jumlahIndividu; $i++) {
            $individu[$i] = [];
            $usedSlots = [];

            $usedWaktuPerProdi = [];

            foreach ($kelasGrouped as $groupKey => $groupClasses) {
                $firstKelas = $groupClasses[0];
                $kode_prodi = $firstKelas->kode_prodi ?? null;
                $kode_matkul = $firstKelas->kode_matkul ?? null;

                $matkul = $allMatkul[$kode_matkul] ?? null;
                $jumlah_sks = $matkul ? $matkul->sks : 0;
                if (str_ends_with($kode_matkul, 'P')) {
                    $jumlah_sks = 3;
                } elseif (!$jumlah_sks || $jumlah_sks < 1) {
                    $jumlah_sks = 3;
                }

                $kodeWaktuGroup = null;

                if (str_ends_with($kode_matkul, 'P')) {
        
                    $candidateWaktuHari5 = array_filter($validWaktuPraktikumHari5, function($w) use ($allWaktu, $jumlah_sks) {
                        $kodeJam = $allWaktu[$w]->kode_jam;
                        return ($kodeJam + $jumlah_sks - 1) <= 15 && $kodeJam <= 13;
                    });

                    $listValidWaktu = !empty($candidateWaktuHari5) ? $candidateWaktuHari5 : $validWaktuPraktikumOtherDays;

                    $listValidWaktu = array_filter($listValidWaktu, function($w) use ($allWaktu, $jumlah_sks) {
                        $kodeJam = $allWaktu[$w]->kode_jam;
                        return $kodeJam <= 13 && ($kodeJam + $jumlah_sks -1) <= 15;
                    });
                } else {
                    $listValidWaktu = $validWaktuTatapMuka;

                    if ($jumlah_sks == 2) {
                        $listValidWaktu = array_filter($listValidWaktu, function($w) use ($allWaktu) {
                            return $allWaktu[$w]->kode_jam <= 11;
                        });
                    }
                }

                $candidates = [];
                foreach ($listValidWaktu as $waktuId) {
                    $waktuData = $allWaktu[$waktuId] ?? null;
                    if (!$waktuData) continue;

                    $kodeHari = $waktuData->kode_hari;
                    $jamMulai = $waktuData->kode_jam;
                    $jamSelesai = $jamMulai + $jumlah_sks - 1;

                    $bentrokMatkulBeda = false;
                    for ($jamSlot = $jamMulai; $jamSlot <= $jamSelesai; $jamSlot++) {
                        $matkulLain = $usedWaktuPerProdi[$kode_prodi][$kodeHari][$jamSlot] ?? [];
                        foreach ($matkulLain as $matkulYgSudahAda) {
                            if ($matkulYgSudahAda !== $kode_matkul) {
                                $bentrokMatkulBeda = true;
                                break 2;
                            }
                        }
                    }
                    if ($bentrokMatkulBeda) {
                        continue;
                    }

                    $availableRooms = $allRuang->keys()->all();
                    $roomCount = 0;

                    foreach ($availableRooms as $ruang) {
                        $conflict = false;
                        for ($jamSlot = $jamMulai; $jamSlot <= $jamSelesai; $jamSlot++) {
                            $slotKey = $ruang . '-' . $kodeHari . '-' . $jamSlot;
                            if (isset($usedSlots[$slotKey])) {
                                $conflict = true;
                                break;
                            }
                        }
                        if (!$conflict) {
                            $roomCount++;
                        }
                    }
                    if ($roomCount > 0) {
                        $candidates[] = $waktuId;
                    }
                }

                if (!empty($candidates)) {
                    $kodeWaktuGroup = $candidates[array_rand($candidates)];
                } else {
                    if (!empty($listValidWaktu)) {
                        $kodeWaktuGroup = $listValidWaktu[array_rand($listValidWaktu)];
                    } else {
                        $kodeWaktuGroup = null;
                    }
                }
                if ($kodeWaktuGroup === null) {
                    continue;
                }

                $waktuDipakai = $allWaktu[$kodeWaktuGroup];
                if ($waktuDipakai && $kode_prodi !== null) {
                    $kodeHariWaktu = $waktuDipakai->kode_hari;
                    $jamMulaiWaktu = $waktuDipakai->kode_jam;
                    for ($jamSlot = $jamMulaiWaktu; $jamSlot < $jamMulaiWaktu + $jumlah_sks; $jamSlot++) {
                        if (!isset($usedWaktuPerProdi[$kode_prodi])) {
                            $usedWaktuPerProdi[$kode_prodi] = [];
                        }
                        if (!isset($usedWaktuPerProdi[$kode_prodi][$kodeHariWaktu])) {
                            $usedWaktuPerProdi[$kode_prodi][$kodeHariWaktu] = [];
                        }
                        if (!isset($usedWaktuPerProdi[$kode_prodi][$kodeHariWaktu][$jamSlot])) {
                            $usedWaktuPerProdi[$kode_prodi][$kodeHariWaktu][$jamSlot] = [];
                        }
                        if (!in_array($kode_matkul, $usedWaktuPerProdi[$kode_prodi][$kodeHariWaktu][$jamSlot])) {
                            $usedWaktuPerProdi[$kode_prodi][$kodeHariWaktu][$jamSlot][] = $kode_matkul;
                        }
                    }
                }

                foreach ($groupClasses as $kuliah) {
                    $matkulKelas = $allMatkul[$kuliah->kode_matkul] ?? null;
                    $jml_sks_kelas = $matkulKelas ? $matkulKelas->sks : 0;
                    if (str_ends_with($kuliah->kode_matkul, 'P')) {
                        $jml_sks_kelas = 3;
                    } elseif (!$jml_sks_kelas || $jml_sks_kelas < 1) {
                        $jml_sks_kelas = 3;
                    }

                    $possibleRuang = $allRuang->keys()->all();
                    $foundRuang = null;
                    $hariWaktu = $allWaktu[$kodeWaktuGroup] ?? null;

                    if ($hariWaktu) {
                        $kodeHariForSlot = $hariWaktu->kode_hari;
                        $jamMulai = $hariWaktu->kode_jam;
                        $jamSelesai = $jamMulai + $jml_sks_kelas - 1;

                        foreach ($possibleRuang as $r) {
                            if (in_array($r, [7,8,9,10]) && $jamSelesai > 12) {
                                continue;
                            }

                            $conflict = false;
                            for ($jamSlot = $jamMulai; $jamSlot <= $jamSelesai; $jamSlot++) {
                                $slotKey = $r . '-' . $kodeHariForSlot . '-' . $jamSlot;
                                if (isset($usedSlots[$slotKey])) {
                                    $conflict = true;
                                    break;
                                }
                            }
                            if (!$conflict) {
                                $foundRuang = $r;
                                for ($jamSlot = $jamMulai; $jamSlot <= $jamSelesai; $jamSlot++) {
                                    $slotKey = $r . '-' . $kodeHariForSlot . '-' . $jamSlot;
                                    $usedSlots[$slotKey] = true;
                                }
                                break;
                            }
                        }
                    }

                    if ($foundRuang === null) {
                        $allKodeRuang = $allRuang->keys()->all();
                        if (!empty($allKodeRuang)) {
                            $foundRuang = $allKodeRuang[array_rand($allKodeRuang)];
                        } else {
                            $foundRuang = null;
                        }
                    }

                    $individu[$i][] = [
                        $kuliah->kode_kuliah,
                        $foundRuang,
                        $kodeWaktuGroup,
                    ];
                }
            }
        }

        /* === ALGORITMA GA START === */
        $algoritma_proses = [];
        $time_start = microtime(true);
        $fixJadwal = [];
        $generasi = 0;

        $bestIndividu = null;
        $bestFitness = -INF;

        while ($generasi < $maxGenerasi && count($fixJadwal) == 0) {
            $individuWithDetailArr = $individuWithDetail($individu, $tahunAjaran, $allMatkul, $kuliahTable);

            $fitness_function = $fitness($individuWithDetailArr);
            $CR = $fitness_function['CR'];
            $CD = $fitness_function['CD'];
            $CJ = $fitness_function['CJ'];
            $fitnessIndividu = $fitness_function['fitness_individu'];
            $total_nilai_fitness = $fitness_function['total_fitness'];
            $fixJadwal = $fitness_function['fix_jadwal'];

            $nilaiFitnessTerbaik = max($fitnessIndividu);
            $indexIndividuTerbaik = array_search($nilaiFitnessTerbaik, $fitnessIndividu);
            $individuElite = $individu[$indexIndividuTerbaik];

            $algoritma_proses[$generasi] = [
                'individu' => $individu,
                'individuWithDetail' => $individuWithDetailArr,
                'individuWithDetail_with_name' => $codeIntoNameIndividuDetail($individuWithDetailArr, $tahunAjaran),
                'CR' => $CR,
                'CD' => $CD,
                'CJ' => $CJ,
                'fitness_individu' => $fitnessIndividu,
                'total_fitness' => $total_nilai_fitness,
                'fix_jadwal' => $fixJadwal,
            ];

            if ($fixJadwal) break;

            // SELECTION (roulette wheel)
            $probabilitas = [];
            for ($i = 0; $i < count($fitnessIndividu); $i++) {
                $probabilitas[$i] = $fitnessIndividu[$i] / $total_nilai_fitness;
            }

            $algoritma_proses[$generasi]["probabilitas"] = $probabilitas;

            $kumulatif = [];
            $total_kumulatif = 0;
            foreach ($probabilitas as $p) {
                $total_kumulatif += $p;
                $kumulatif[] = $total_kumulatif;
            }

            $algoritma_proses[$generasi]["kumulatif"] = $kumulatif;
            $algoritma_proses[$generasi]["total_kumulatif"] = $total_kumulatif;

            $randoms = $random_1(count($individu));

            $algoritma_proses[$generasi]["random1_selection"] = $randoms;

            $newIndividu = [];
            $listNewIndividu = [];

            for ($i = 0; $i < count($individu); $i++) {
                for ($j = 0; $j < count($kumulatif); $j++) {
                    if ($randoms[$i] <= $kumulatif[$j]) {
                        $newIndividu[$i] = $individu[$j];
                        $listNewIndividu[] = $j;
                        break;
                    }
                }
            }

            $algoritma_proses[$generasi]["list_new_individu_selection"] = $listNewIndividu;
            $algoritma_proses[$generasi]["new_individu_selection"] = $newIndividu;

            // CROSSOVER
            $PC = $crossoverRate / 100;
            $indexIndividuSelected = [];

            while (count($indexIndividuSelected) < 3) {
                $randomX = $random_1(count($individu));
                foreach ($randomX as $i => $val) {
                    if ($val < $PC) {
                        $indexIndividuSelected[] = $i;
                    }
                }
                if (count($indexIndividuSelected) < 3) {
                    $indexIndividuSelected = [];
                }
            }
            
            $algoritma_proses[$generasi]["random1_crossover"] = $randomX;
            $algoritma_proses[$generasi]["index_best_individu"] = $indexIndividuSelected;

            $parents = [];
            $lastIndex = count($indexIndividuSelected) - 1;
            for ($i = 0; $i < count($indexIndividuSelected); $i++) {
                $father = $indexIndividuSelected[$i];
                $mother = ($i == $lastIndex) ? $indexIndividuSelected[0] : $indexIndividuSelected[$i + 1];
                $parents[$i] = [
                    'father' => $father,
                    'mother' => $mother,
                    'cut-point' => $random_2($individu[0]),
                ];
            }

            $algoritma_proses[$generasi]["parents"] = $parents;

            $offSpring = [];
            foreach ($parents as $iParent => $parent) {
                $cutPoint = $parent['cut-point'];
                $fatherChromosome = $newIndividu[$parent['father']];
                $motherChromosome = $newIndividu[$parent['mother']];
                $firstChunk = array_slice($fatherChromosome, 0, $cutPoint);
                $lastChunk = array_slice($motherChromosome, $cutPoint);
                $offSpring[$iParent] = array_merge($firstChunk, $lastChunk);
            }

            $algoritma_proses[$generasi]["offSpring"] = $offSpring;

            foreach ($indexIndividuSelected as $idx => $individuIdx) {
                $newIndividu[$individuIdx] = $offSpring[$idx];
            }

            $individuWithDetailArr = $individuWithDetail($newIndividu, $tahunAjaran);
            $fitness_function = $fitness($individuWithDetailArr);
            $fixJadwal = $fitness_function['fix_jadwal'];

            $algoritma_proses[$generasi]["new_individu_crossover"] = $newIndividu;
            $algoritma_proses[$generasi]["new_individu_crossover_with_detail"] = $individuWithDetail;

            if ($fixJadwal) break;

            $fitness_function = $fitness($individuWithDetailArr);
            $CD = $fitness_function['CD'];
            $CR = $fitness_function['CR'];
            $CJ = $fitness_function['CJ'];
            $fitnessIndividu = $fitness_function['fitness_individu'];
            $total_nilai_fitness = $fitness_function['total_fitness'];
            $fixJadwal = $fitness_function['fix_jadwal'];

            $algoritma_proses[$generasi]["new_CD"] = $CD;
            $algoritma_proses[$generasi]["new_CR"] = $CR;
            $algoritma_proses[$generasi]["new_CJ"] = $CJ;
            $algoritma_proses[$generasi]["new_fitness_individu"] = $fitnessIndividu;
            $algoritma_proses[$generasi]["new_total_fitness"] = $total_nilai_fitness;
            $algoritma_proses[$generasi]["new_fix_jadwal"] = $fixJadwal;

            $individuHasilMutasi = $newIndividu;

            $individuDetailAwal = $individuWithDetail($individuHasilMutasi, $tahunAjaran);

            $daftarClash = $allClashChromosome($individuHasilMutasi, $tahunAjaran);
            $algoritma_proses[$generasi]["all_clash_chromosome"] = $daftarClash;

            $mutasiBerhasil = 0;
            foreach ($daftarClash as $clash) {
                $indexIndividu = $clash['index_individu'];
                $indexKromosom = $clash['index_kromosom'];
                $jenisClash = $clash['jenis_clash'];
            
                $kromosomDetail = $individuDetailAwal[$indexIndividu][$indexKromosom];
                $jadwalSatuIndividu = $individuDetailAwal[$indexIndividu];
            
                $genAsli = $individuHasilMutasi[$indexIndividu][$indexKromosom];
                $genHasilMutasi = null;
            
                if (in_array('CD', $jenisClash) || in_array('CJ', $jenisClash)) {
                    $solusi = $perbaikiClashDosenSemester($kromosomDetail, $jadwalSatuIndividu, $allWaktu, $allRuang);
                    if ($solusi !== null) {
                        $genHasilMutasi = [$genAsli[0], $solusi['kode_ruang'], $solusi['kode_waktu']];
                    }
                } else if (in_array('CR', $jenisClash)) {
                    $ruangBaru = $perbaikiClashRuang($kromosomDetail, $jadwalSatuIndividu, $allRuang, $allWaktu);
                    if ($ruangBaru !== null) {
                        $genHasilMutasi = [$genAsli[0], $ruangBaru, $genAsli[2]];
                    }
                }
            
                if ($genHasilMutasi !== null) {
                    $individuHasilMutasi[$indexIndividu][$indexKromosom] = $genHasilMutasi;
                    $individuDetailAwal = $individuWithDetail($individuHasilMutasi, $tahunAjaran);
                    $mutasiBerhasil++;
                }
            }

            $algoritma_proses[$generasi]["mutasi_berhasil"] = $mutasiBerhasil;

            if ($mutasiBerhasil == 0 && count($daftarClash) > 0) {
                $clash_to_shake = $daftarClash[array_rand($daftarClash)];
                $individu_idx = $clash_to_shake['index_individu'];
                $kromosom_idx = $clash_to_shake['index_kromosom'];
                $gen_asli = $individuHasilMutasi[$individu_idx][$kromosom_idx];
                $individuHasilMutasi[$individu_idx][$kromosom_idx] = [$gen_asli[0], $random_kode_ruang(), rand($firstKodeWaktu, $lastKodeWaktu)];
            }

            foreach ($individuHasilMutasi as $i => $individu) {
                foreach ($individu as $j => $kromosom) {

                    if (!isset($kromosom[1]) || !isset($kromosom[2])) continue;

                    if ((mt_rand() / mt_getrandmax()) < $mutationRate) {
                        $individuHasilMutasi[$i][$j][1] = $allKodeRuang[array_rand($allKodeRuang)];
                    }

                    if ((mt_rand() / mt_getrandmax()) < $mutationRate) {
                        $individuHasilMutasi[$i][$j][2] = $allKodeWaktu[array_rand($allKodeWaktu)];
                    }
                }
            }

            // --- Elitisme ---
            $fitnessPopulasiBaruArr = $fitness($individuWithDetail($individuHasilMutasi, $tahunAjaran));
            $fitnessPopulasiBaru = $fitnessPopulasiBaruArr['fitness_individu'];

            $nilaiFitnessTerburuk = min($fitnessPopulasiBaru);
            $indexIndividuTerburuk = array_search($nilaiFitnessTerburuk, $fitnessPopulasiBaru);

            $individuHasilMutasi[$indexIndividuTerburuk] = $individuElite;

            $individu = $individuHasilMutasi;
            $generasi++;
        }

        $execution_time = microtime(true) - $time_start;

        if (!$showAlgorithm) {
            $algoritma_proses = [];
        }

        return view('penjadwalankuliah.generatejadwal', compact(
            'semester',
            'algoritma_proses',
            'execution_time',
            'fixJadwal',
            'kodeSemester',
            'tahunAjaran',
            'allTahunAjaran',
            'allDosen',
            'allHari',
            'countKuliahTabel'
        ));
    }

    public function hasilgenerate(Request $request, $jadwal_index)
    {
        $allJadwal = $request->session()->get('jadwal');
        $kode_semester = $request->session()->get('kodeSemester');
        $tahun_ajaran = $request->session()->get('tahunAjaran');
    
        $nama_semester = DB::table('semester')->where('kode_semester', $kode_semester)->first()->nama_semester;
        $jadwalTable = DB::table('jadwal')->where('semester', $nama_semester)->get();
    
        $fixJadwal = $allJadwal[$jadwal_index];
    
        if (count($jadwalTable) > 0) {
            DB::table('jadwal')->where('semester', $nama_semester)->where('tahun_ajaran', $tahun_ajaran)->delete();
        }

        $hariMap = DB::table('hari')->pluck('nama_hari', 'kode_hari')->map(fn($h) => strtolower($h))->toArray();
        $jamMap = DB::table('jam')->pluck('jam', 'kode_jam')->toArray();
        $matkulData = DB::table('matkul')->get()->keyBy('kode_matkul')->toArray();
        $kelasData = DB::table('kelas')->get()->keyBy('kode_kelas')->toArray();
        $kuliahData = DB::table('kuliah')->get()->keyBy('kode_kuliah')->toArray();

        $daysOrder = ['senin', 'selasa', 'rabu', 'kamis', 'jumat', 'sabtu', 'minggu'];
    
        usort($fixJadwal, function ($a, $b) use ($hariMap, $jamMap, $daysOrder) {
            $hariA = $hariMap[$a['kode_hari']] ?? '';
            $hariB = $hariMap[$b['kode_hari']] ?? '';
            $dayIndexA = array_search($hariA, $daysOrder);
            $dayIndexB = array_search($hariB, $daysOrder);
        
            if ($dayIndexA === $dayIndexB) {
                $jamA = $jamMap[$a['kode_jam']] ?? '00:00';
                $jamB = $jamMap[$b['kode_jam']] ?? '00:00';
            
                if ($jamA === $jamB) {
                    $sksA = $a['jumlah_sks'] ?? 0;
                    $sksB = $b['jumlah_sks'] ?? 0;
                
                    if ($sksA === $sksB) {
                        return strcmp($a['nama_ruang']['kode'], $b['nama_ruang']['kode']);
                    }
                    return $sksA <=> $sksB;
                }
                return strcmp($jamA, $jamB);
            }
            return $dayIndexA <=> $dayIndexB;
        });
    
        foreach ($fixJadwal as $row) {
            $kodeDosenList = explode(';', $row['kode_dosen']['kode'] ?? $row['kode_dosen']);
            $kodeDosenList = array_map('trim', $kodeDosenList);
        
            $dosenList = DB::table('dosen')->whereIn('kode_dosen', $kodeDosenList)->pluck('nama')->toArray();
        
            if (count($dosenList) !== count($kodeDosenList)) {
                dd([
                    'Pesan' => 'Sebagian dosen tidak ditemukan!',
                    'kode_dosen_input' => $kodeDosenList,
                    'nama_dosen_ditemukan' => $dosenList
                ]);
            }
        
            $namaDosenGabung = implode(', ', $dosenList);
   
            $menit_dalam_sks = $row['jumlah_sks'] * 50;
            $jam_masuk = $jamMap[$row['kode_jam']] ?? '00:00';
            [$jam, $menit] = explode(':', $jam_masuk);
            $total_menit_masuk = ((int)$jam * 60) + (int)$menit;
            $total_menit_keluar = $total_menit_masuk + $menit_dalam_sks;
            $jam_keluar = sprintf('%02d:%02d', floor($total_menit_keluar / 60), $total_menit_keluar % 60);
        
            $kodeMatkul = $row['kode_matkul'];
            $matkulObj = $matkulData[$kodeMatkul] ?? null;
        
            $namaMatkul = $matkulObj->nama_matkul ?? 'Unknown';
            $jenis = $matkulObj->jenis ?? '';
  
            $kodeKelas = $row['kode_kelas'];
            $kelasObj = $kelasData[$kodeKelas] ?? null;
            $kodeProdi = $kelasObj->kode_prodi ?? '';
            $namaKelas = $kelasObj->kelas ?? '';
        
            $kuliah = $kuliahData[$row['kode_kuliah']] ?? null;
            $perkuliahanSemester = $kuliah ? $kuliah->perkuliahan_semester : null;
        
            DB::table('jadwal')->insert([
                'matkul' => $namaMatkul,
                'kode_prodi' => $kodeProdi,
                'jenis' => $jenis,
                'dosen' => $namaDosenGabung,
                'kelas' => $namaKelas,
                'jumlah_sks' => $row['jumlah_sks'],
                'nama_ruang' => $row['nama_ruang']['kode'],
                'hari' => ucfirst($hariMap[$row['kode_hari']] ?? ''),
                'jam_masuk' => $jam_masuk,
                'jam_keluar' => $jam_keluar,
                'perkuliahan_semester' => $perkuliahanSemester,
                'semester' => $nama_semester,
                'tahun_ajaran' => $tahun_ajaran
            ]);
    
            if (!DB::table('tahun_ajaran')->where('tahun_ajaran', $tahun_ajaran)->exists()) {
                DB::table('tahun_ajaran')->insert([
                    'tahun_ajaran' => $tahun_ajaran
                ]);
            }
        }
    
        return redirect('/hasiljadwal');
    }

    public function hasiljadwal(Request $request)
    {
        $semester = DB::table('semester')->get();
        $jadwal = [];

        for ($i = 0; $i < count($semester); $i++) {
            $jadwal[$i] = DB::table('jadwal')
                ->where('semester', $semester[$i]->nama_semester)
                ->orderBy('kelas')
                ->orderBy('hari')
                ->orderBy('jam_masuk')
                ->get();
        }

        $tahun_ajaran = DB::table('tahun_ajaran')->get();

        return view('penjadwalankuliah.hasiljadwal', compact( 'jadwal', 'semester', 'tahun_ajaran'));
    }
}