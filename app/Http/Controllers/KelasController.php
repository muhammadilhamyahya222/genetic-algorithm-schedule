<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Kelas;

class KelasController extends Controller
{
    public function index(Request $request)
    {
        $request_keyword = "";
    
        if ($request->keyword) {
            $kelas = DB::table('kelas')
                ->where('nama_matkul', 'LIKE', "%{$request->keyword}%")
                ->orWhere('nama_dosen', 'LIKE', "%{$request->keyword}%")
                ->orWhere('kelas', 'LIKE', "%{$request->keyword}%")
                ->orWhere('kapasitas_kelas', 'LIKE', "%{$request->keyword}%")
                ->get();
            
            $request_keyword = $request->keyword;
        } else {
            $kelas = DB::table('kelas')->get();
        }
    
        foreach ($kelas as $k) {
            $kodeJenis = strtoupper(substr($k->kode_kelas, -2, 1));
            if ($kodeJenis === 'T') {
                $k->jenis = 'Tatap Muka';
            } elseif ($kodeJenis === 'P') {
                $k->jenis = 'Praktikum';
            } else {
                $k->jenis = 'Lainnya';
            }
        }
    
        $tahun_ajaran = DB::table('tahun_ajaran')->get();
    
        $kelasByTahun = [];
        foreach ($tahun_ajaran as $tahun) {
            array_push($kelasByTahun, [$tahun->tahun_ajaran]);
        }
    
        for ($i = 0; $i < count($kelasByTahun); $i++) {
            $tempKelas = DB::table('kelas')
                ->where('tahun_ajaran', $kelasByTahun[$i][0])
                ->get();
        
            foreach ($tempKelas as $k) {
                $kodeJenis = strtoupper(substr($k->kode_kelas, -2, 1));
                if ($kodeJenis === 'T') {
                    $k->jenis = 'Tatap Muka';
                } elseif ($kodeJenis === 'P') {
                    $k->jenis = 'Praktikum';
                } else {
                    $k->jenis = 'Lainnya';
                }
            }
        
            array_push($kelasByTahun[$i], $tempKelas ?: []);
        }
    
        return view('managekelas.index', compact('kelas', 'request_keyword', 'kelasByTahun'));
    }

    public function create(Request $request)
    {
        $tahun_ajaran = DB::table('tahun_ajaran')->get();

        $semester = DB::table('semester')->get();
        $matkul = DB::table('matkul')->get();
        $dosen = DB::table('dosen')->get();
        $prodi = DB::table('prodi')->get();
        return view('managekelas.create', compact('semester','prodi','matkul','dosen','tahun_ajaran'));
    }


    public function create_action(Request $request) {
    if ($request->ajax()) {

        if ($request->has('prodi')) {

            $prodi = $request->get('prodi');
            $tahun_ajaran = $request->get('tahun_ajaran');
            $prodi = explode("-", $prodi);

            $matkulByProdiAndTahunAjaran = DB::table('matkul')
                ->where('kode_prodi', $prodi[0])
                ->where('tahun_ajaran', $tahun_ajaran)
                ->get();

            $dosen = DB::table('dosen')->get();

            $data = array(
                'allMatkul' => $matkulByProdiAndTahunAjaran,
                'allDosen' => $dosen,
            );
            return response()->json($data);
        }

        if ($request->has('matkul')) {

            $matkuls = $request->get('matkul');
            $tahun_ajaran = $request->get('tahun_ajaran');
        
            if (!is_array($matkuls)) {
                $matkuls = [$matkuls];
            }

            $namaMatkulList = array_map(function ($item) {
                $parts = explode("-", $item);
                return $parts[1]; // Nama matkul
            }, $matkuls);
        
            $kelasByMatkulAndTahunAjaran = DB::table('kelas')
                ->whereIn('nama_matkul', $namaMatkulList)
                ->where('tahun_ajaran', $tahun_ajaran)
                ->get();
        
            return response()->json([
                'kelas' => $kelasByMatkulAndTahunAjaran,
            ]);
        }
        
        } else {
            return redirect('/managekuliah/managekelas/create');
        }
    }

    
    public function store(Request $request)
    {
        $request->validate(
            [
                'prodi' => 'required|min:3|max:255',
                'matkul' => 'required|array|min:1',
                'dosen_pengajar' => 'required|array|min:1',
                'kelas' => 'required|array|min:1',
                'kapasitas_kelas' => 'required|numeric|min:1|max:100',
            ],
            [
                'prodi.required' => 'Harap di isi dengan benar!',
                'prodi.min' => 'Program Studi minimal 3 huruf.',
                'prodi.max' => 'Program Studi maksimal 255 huruf.',
                'matkul.required' => 'Harap di isi dengan benar!',
                'matkul.array' => 'Harap pilih setidaknya 1 mata kuliah.',
                'dosen_pengajar.required' => 'Harap di isi dengan benar!',
                'dosen_pengajar.array' => 'Harap pilih setidaknya 1 Dosen.',
                'kapasitas_kelas.required' => 'Harap di isi dengan benar!',
                'kapasitas_kelas.numeric' => 'Kapasitas Kelas Harus Berupa Angka',
                'kapasitas_kelas.min' => 'Harap di isi dengan benar!',
                'kapasitas_kelas.max' => 'Kapasitas Kelas maksimal 100 Orang',
                'kelas.required' => 'Harap di isi dengan benar!',
                'kelas.array' => 'Harap pilih setidaknya 1 kelas.',
            ]
        );

        $prodi = explode("-", $request->prodi, 2);
        $kodeProdi = trim($prodi[0]);

        $matkuls = $request->matkul;
        $tahunAjaran = $request->tahun_ajaran;

        $dosenPengajar = implode("; ", $request->dosen_pengajar);
        $kodeDosenArray = [];

        foreach ($request->dosen_pengajar as $namaDosen) {
            $dosen = DB::table('dosen')->where('nama', $namaDosen)->first();
            if ($dosen) {
                $kodeDosenArray[] = $dosen->kode_dosen;
            }
        }

        $kodeDosen = implode("; ", $kodeDosenArray);

        foreach ($matkuls as $item) {
            $matkulParts = explode("-", $item, 2);
            $kodeMatkul = trim($matkulParts[0]);
            $namaMatkul = trim($matkulParts[1]);

            $matkulData = DB::table('matkul')
                ->where('kode_matkul', $kodeMatkul)
                ->where('kode_prodi', $kodeProdi)
                ->where('tahun_ajaran', $tahunAjaran)
                ->first();

            if (!$matkulData) {
                return redirect()->back()->withErrors([
                    'matkul' => "Mata kuliah '{$namaMatkul}' tidak ditemukan untuk tahun ajaran '{$tahunAjaran}' dan prodi '{$kodeProdi}'."
                ]);
            }

            $perkuliahanSemester = $matkulData->perkuliahan_semester;
            $kodeSemester = $matkulData->kode_semester;

            foreach ($request->kelas as $kelasItem) {
                $kodeKelas = $kodeMatkul . strtoupper($kelasItem);

                DB::table('kelas')->insert([
                    'kode_kelas' => $kodeKelas,
                    'nama_matkul' => strtolower($namaMatkul),
                    'nama_dosen' => $dosenPengajar,
                    'kelas' => strtoupper($kelasItem),
                    'kode_prodi' => $kodeProdi,
                    'kapasitas_kelas' => $request->kapasitas_kelas,
                    'tahun_ajaran' => $tahunAjaran,
                ]);

                $kuliah = DB::table('kuliah')->where('tahun_ajaran', $tahunAjaran)->get();
                $kodeKuliah = (count($kuliah) == 0) ? 1 : $kuliah->last()->kode_kuliah + 1;

                DB::table('kuliah')->insert([
                    'kode_kuliah' => $kodeKuliah,
                    'kode_matkul' => $kodeMatkul,
                    'kode_dosen' => $kodeDosen,
                    'kode_kelas' => $kodeKelas, 
                    'kode_prodi' => $kodeProdi,
                    'perkuliahan_semester' => $perkuliahanSemester,
                    'kode_semester' => $kodeSemester,
                    'tahun_ajaran' => $tahunAjaran,
                ]);
            }
        }

        $kuliah = DB::table('kuliah')->where('tahun_ajaran', $tahunAjaran)->get();
        if ($kuliah->last()->kode_kuliah != count($kuliah)) {
            foreach ($kuliah as $i => $kuliahRow) {
                DB::table('kuliah')
                    ->where('kode_kuliah', $kuliahRow->kode_kuliah)
                    ->where('tahun_ajaran', $tahunAjaran)
                    ->update([
                        'kode_kuliah' => $i + 1,
                    ]);
            }
        }

        return redirect('/managekuliah/managekelas')->with('status', 'Data kelas berhasil ditambahkan!');
    }
    public function edit(Request $request, $kode_kelas, $tahun_ajaran)
    {
        $tahun_ajaran_temp = explode('-', $tahun_ajaran); 
        $tahun_ajaran = implode('/',$tahun_ajaran_temp);

        $kelas = DB::table('kelas')->where('kode_kelas', $kode_kelas)->where('tahun_ajaran', $tahun_ajaran)->first();
   
        $currentDosen = explode(';', $kelas->nama_dosen);

        $dosen = DB::table('dosen')->get();

        $tahun_ajaran_temp = explode('/', $tahun_ajaran); 
        $tahun_ajaran = implode('-',$tahun_ajaran_temp);

        return view('managekelas.edit', compact('kelas', 'tahun_ajaran', 'dosen', 'currentDosen'));
    }


    public function update(Request $request, $kode_kelas, $tahun_ajaran)
    {
        $request->validate(
            [
                'dosen_pengajar' => 'required|array|min:1',
                'kapasitas_kelas' => 'required|numeric|min:1|max:100',
            ],
            [
                'dosen_pengajar.required' => 'Harap di isi dengan benar!',
                'dosen_pengajar.array' => 'Harap pilih setidaknya 1 Dosen.',
                'kapasitas_kelas.required' => 'Harap di isi dengan benar!',
                'kapasitas_kelas.numeric' => 'Kapasitas Kelas Harus Berupa Angka.',
                'kapasitas_kelas.min' => 'Harap di isi dengan benar!',
                'kapasitas_kelas.max' => 'Kapasitas Kelas maksimal 100 Orang.',
            ]
        );

        $tahun_ajaran_temp = explode('-', $tahun_ajaran); 
        $tahun_ajaran = implode('/', $tahun_ajaran_temp);

        $kelas = Kelas::where('kode_kelas', $kode_kelas)->where('tahun_ajaran', $tahun_ajaran)->first();

        if (!$kelas) {
            return redirect()->back()->with('error', 'Kelas tidak ditemukan.');
        }

        $dosenPengajar = implode('; ', $request->dosen_pengajar);

        DB::table('kelas')
            ->where('kode_kelas', $kode_kelas)
            ->where('tahun_ajaran', $tahun_ajaran)
            ->update([
                'nama_dosen' => $dosenPengajar,
                'kapasitas_kelas' => $request->kapasitas_kelas,
            ]);

        $kode_dosen_array = [];
        foreach ($request->dosen_pengajar as $nama_dosen) {
            $dosen = DB::table('dosen')->where('nama', $nama_dosen)->first();
            if ($dosen) {
                $kode_dosen_array[] = $dosen->kode_dosen;
            }
        }
        $kode_dosen = implode("; ", $kode_dosen_array);

        DB::table('kuliah')
            ->where('kode_kelas', $kode_kelas)
            ->where('tahun_ajaran', $tahun_ajaran)
            ->update([
                'kode_dosen' => $kode_dosen,
            ]);

        DB::table('jadwal')
            ->where('matkul', $kelas->nama_matkul)
            ->where('kelas', $kelas->kelas)
            ->where('tahun_ajaran', $tahun_ajaran)
            ->update([
                'dosen' => $dosenPengajar
            ]);

        return redirect('/managekuliah/managekelas')->with('status', 'Data kelas berhasil diubah');
    }

    public function destroy($kode_kelas, Request $request, $tahun_ajaran)
    {
        $tahun_ajaran_temp = explode('-', $tahun_ajaran); 
        $tahun_ajaran = implode('/',$tahun_ajaran_temp);

        $all_kelas = DB::table('kelas')->where('tahun_ajaran',$tahun_ajaran)->get();

        if(count($all_kelas) == 1) {
            return redirect('managekuliah/managekelas')->with('status', 'Minimal Tersisa Satu Kelas!');
        }

        $kelas = Kelas::where('kode_kelas',$kode_kelas)->where('tahun_ajaran',$tahun_ajaran)->first();

        DB::table('kelas')->where('kode_kelas', $kode_kelas)->where('tahun_ajaran',$tahun_ajaran)->delete();
        DB::table('kuliah')->where('kode_kelas', $kode_kelas)->where('tahun_ajaran',$tahun_ajaran)->delete();

        return redirect('/managekuliah/managekelas')->with('status', 'Data kelas berhasil dihapus!');
    }
}
