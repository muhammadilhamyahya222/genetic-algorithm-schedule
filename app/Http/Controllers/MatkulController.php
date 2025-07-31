<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Matkul;

class MatkulController extends Controller
{
    public function index(Request $request)
    {
        $tahun_ajaran = DB::table('tahun_ajaran')->get();

        $matkulByTahun = [];
        foreach($tahun_ajaran as $tahun) {
            array_push($matkulByTahun, [$tahun->tahun_ajaran]);
        }

        for ($i=0; $i < count($matkulByTahun); $i++) { 
            $tempMatkul = DB::table('matkul')->where('tahun_ajaran', $matkulByTahun[$i])->get();
            if ($tempMatkul) {
                array_push($matkulByTahun[$i], $tempMatkul);
            } else {
                array_push($matkulByTahun[$i], []);
            }
        }
 
        return view('managematkul.index', compact('matkulByTahun'));
    }
    public function create(Request $request)
    {
        $semester = DB::table('semester')->get();
        $prodi = DB::table('prodi')->get();
        return view('managematkul.create', compact('semester','prodi'));
    }
    public function store(Request $request)
    {
        $request->validate(
            [
                'kode_matkul' => 'required|unique:matkul,kode_matkul',
                'nama_matkul' => 'required|min:3|max:255',
                'sks_teori' => 'nullable|integer|min:0',
                'sks_praktikum' => 'nullable|integer|min:0',
                'program_studi' => 'required',
                'semester' => 'required',
                'perkuliahan_semester' => 'required',
                'tahun_ajaran' => 'required',
            ],
            [
                'kode_matkul.required' => 'Kolom kode matkul harap di isi.',
                'kode_matkul.unique' => 'Kode matkul sudah digunakan.',
                'nama_matkul.required' => 'Kolom nama matkul harap di isi.',
                'nama_matkul.min' => 'Nama matkul minimal 3 huruf.',
                'nama_matkul.max' => 'Nama matkul minimal 255 huruf.',
                'program_studi.required' => 'Harap pilih salah satu program studi.',
                'semester.required' => 'Harap pilih salah satu semester.',
                'perkuliahan_semester.required' => 'Harap pilih salah satu perkuliahan semester.',
                'tahun_ajaran.required' => 'Harap pilih salah satu tahun ajaran.',
            ]

        );

        $prodi = DB::table('prodi')->where('kode_prodi', $request->program_studi)->first();

        $matkul = DB::table('matkul')->where('kode_prodi', "$prodi->kode_prodi")->where('tahun_ajaran',$request->tahun_ajaran)->get();

        if (count($matkul) >= 9999) {
            return redirect('/managekuliah/managematkul')->with('status', 'Mata Kuliah Maksimal 9999!');
        }

        $tahun_ajaran_exist = DB::table('tahun_ajaran')->where('tahun_ajaran', $request->tahun_ajaran)->first();
        if(!$tahun_ajaran_exist){
            DB::table('tahun_ajaran')->insert([
                'tahun_ajaran' => $request->tahun_ajaran
            ]);
        }

        $kodeBase = strtoupper($request->kode_matkul);
        $namaMatkul = strtolower($request->nama_matkul);
        $kodeProdi = $request->program_studi;
        $semester = $request->semester;
        $perkuliahan_semester = $request->perkuliahan_semester;
        $tahunAjaran = $request->tahun_ajaran;
    
        // Simpan matkul teori jika ada
        if ($request->filled('sks_teori') && $request->sks_teori > 0) {
            Matkul::create([
                'kode_matkul' => $kodeBase . 'T',
                'nama_matkul' => $namaMatkul,
                'sks' => $request->sks_teori,
                'kode_prodi' => $kodeProdi,
                'kode_semester' => $semester,
                'perkuliahan_semester' => $perkuliahan_semester,
                'tahun_ajaran' => $tahunAjaran,
                'jenis' => 'Tatap Muka'
            ]);
        }
    
        if ($request->filled('sks_praktikum') && $request->sks_praktikum > 0) {
            Matkul::create([
                'kode_matkul' => $kodeBase . 'P',
                'nama_matkul' => $namaMatkul,
                'sks' => $request->sks_praktikum,
                'kode_prodi' => $kodeProdi,
                'kode_semester' => $semester,
                'perkuliahan_semester' => $perkuliahan_semester,
                'tahun_ajaran' => $tahunAjaran,
                'jenis' => 'Praktikum'
            ]);
        }
    
        return redirect('/managekuliah/managematkul')->with('status', 'Data matkul berhasil ditambahkan!');
    
    }

    public function edit(Request $request, $kode_matkul, $tahun_ajaran)
    {
        $tahun_ajaran_temp = explode('-', $tahun_ajaran); 
        $tahun_ajaran = implode('/',$tahun_ajaran_temp);

        $matkul = DB::table('matkul')->where('kode_matkul',$kode_matkul)->where('tahun_ajaran', $tahun_ajaran)->first();
        $semester = DB::table('semester')->get();

        $tahun_ajaran_temp = explode('/', $tahun_ajaran); 
        $tahun_ajaran = implode('-',$tahun_ajaran_temp);

        return view('managematkul.edit', compact('matkul','semester', 'tahun_ajaran'));
    }

    public function update(Request $request, $kode_matkul, $tahun_ajaran)
    {
        // VALIDASI FORM
        $request->validate(
            [
                'kode_matkul' => 'required',
                'nama_matkul' => 'required|min:3|max:255',
                'jumlah_sks' => 'required|numeric',
                'periode_semester' => 'required',
                'perkuliahan_semester' => 'required',
                'jenis' => 'required|in:Tatap Muka,Praktikum',
            ],
            [
                'kode_matkul.required' => 'Kolom kode matkul harap di isi.',
                'nama_matkul.required' => 'Kolom nama matkul harap di isi.',
                'nama_matkul.min' => 'Nama matkul minimal 3 huruf.',
                'nama_matkul.max' => 'Nama matkul maksimal 255 huruf.',
                'jumlah_sks.required' => 'Harap pilih jumlah sks.',
                'jumlah_sks.numeric' => 'Jumlah sks harus berupa angka.',
                'periode_semester.required' => 'Harap pilih Periode Semester.',
                'perkuliahan_semester.required' => 'Harap pilih Semester Perkuliahan.',
                'jenis.required' => 'Jenis matkul harus diisi.',
            ]
        );

        $tahun_ajaran_temp = explode('-', $tahun_ajaran); 
        $tahun_ajaran = implode('/', $tahun_ajaran_temp);

        $matkul_old = DB::table('matkul')
            ->where('kode_matkul', $kode_matkul)
            ->where('tahun_ajaran', $tahun_ajaran)
            ->first();

        if (!$matkul_old) {
            return redirect()->back()->with('error', 'Mata kuliah tidak ditemukan.');
        }

        $kode_awal = preg_replace('/[TP]$/', '', $request->kode_matkul);

        $kode_akhir = $request->jenis === 'Tatap Muka' ? 'T' : 'P';

        $kode_baru = $kode_awal . $kode_akhir;

        DB::table('matkul')
            ->where('kode_matkul', $kode_matkul)
            ->where('tahun_ajaran', $tahun_ajaran)
            ->where('kode_prodi', $matkul_old->kode_prodi)
            ->where('kode_semester', $matkul_old->kode_semester)
            ->update([
                'kode_matkul' => $kode_baru,
                'nama_matkul' => strtolower($request->nama_matkul),
                'sks' => $request->jumlah_sks,
                'kode_semester' => $request->periode_semester,
                'perkuliahan_semester' => $request->perkuliahan_semester,
                'jenis' => $request->jenis,
            ]);

        DB::table('kelas')
            ->where('nama_matkul', $matkul_old->nama_matkul)
            ->where('tahun_ajaran', $tahun_ajaran)
            ->where('kode_prodi', $matkul_old->kode_prodi)
            ->update([
                'nama_matkul' => strtolower($request->nama_matkul),
            ]);
        
        return redirect('/managekuliah/managematkul')->with('status', 'Data matkul berhasil diubah');

    }

    public function destroy(Request $request ,$kode_matkul, $tahun_ajaran)
    {
        $tahun_ajaran_temp = explode('-', $tahun_ajaran); 
        $tahun_ajaran = implode('/',$tahun_ajaran_temp);

        $all_matkul = DB::table('matkul')->where('tahun_ajaran', $tahun_ajaran)->get();

        if(count($all_matkul) == 1) {
            return redirect('managekuliah/managematkul')->with('status', 'Minimal Tersisa Satu Matkul!');
        }

        $matkul = DB::table('matkul')->where('kode_matkul',$kode_matkul)->where('tahun_ajaran', $tahun_ajaran)->first();

        DB::table('matkul')->where('kode_matkul', $kode_matkul)->where('tahun_ajaran', $tahun_ajaran)->delete();

        DB::table('kelas')->where('nama_matkul', $matkul->nama_matkul)->where('tahun_ajaran', $tahun_ajaran)->delete();

        DB::table('kuliah')->where('kode_matkul', $matkul->kode_matkul)->where('tahun_ajaran', $tahun_ajaran)->delete();

        return redirect('/managekuliah/managematkul')->with('status', 'Data matkul berhasil dihapus!');
    }
}
