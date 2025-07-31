<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Prodi;

class ProdiController extends Controller
{
    public function index(Request $request)
    {    
        $request_keyword = "";
        if($request->keyword){
            $prodi = DB::table('prodi')->where('nama_prodi', 'LIKE', "%{$request->keyword}%")->orWhere('kode_prodi', 'LIKE', "%{$request->keyword}%")->get();
            $request_keyword = $request->keyword;
        } else {
            $prodi = DB::table('prodi')->get();
        }
        return view('manageprodi.index', compact('prodi','request_keyword'));
    }
    public function create(Request $request)
    {
        return view('manageprodi.create');
    }

    public function store(Request $request)
    {   
        $request->validate(
            [
                'nama_prodi' => 'required|min:3|max:255|unique:prodi',
                'kode_prodi' => 'required|regex:/^[a-zA-Z]+$/u|max:3|unique:prodi',
            ],
            [
                'nama_prodi.required' => 'Harap di isi dengan benar!',
                'nama_prodi.min' => 'Nama minimal 3 huruf.',
                'nama_prodi.max' => 'Nama maksimal 255 huruf.',
                'nama_prodi.unique' => 'Nama Prodi Sudah Terdaftar.',
                'kode_prodi.required' => 'Harap di isi dengan benar!',
                'kode_prodi.regex' => 'Kode Prodi hanya berupa huruf.',
                'kode_prodi.max' => 'Kode Prodi maksimal 3 huruf.',
                'kode_prodi.unique' => 'Kode Prodi Sudah Terdaftar.',
            ]

        );

        // INSERT DATA KE TABEL PRODI
        $prodi = new Prodi;
        $prodi->nama_prodi = strtolower($request->nama_prodi);
        $prodi->kode_prodi = strtoupper($request->kode_prodi);
        $prodi->save();

        return redirect('/managekuliah/manageprodi')->with('status', 'Data prodi Berhasil Ditambahkan!');
    }

    public function edit(Request $request, $id_prodi)
    {   
        $prodi = DB::table('prodi')->where('id_prodi', $id_prodi)->first();

        return view('manageprodi.edit', compact('prodi'));
    }

    public function update(Request $request, $id)
    {
        $request->validate(
            [
                'nama_prodi' => 'required|min:3|max:255',
                'kode_prodi' => 'required|regex:/^[a-zA-Z]+$/u|max:3',
            ],
            [
                'nama_prodi.required' => 'Harap di isi dengan benar!',
                'nama_prodi.min' => 'Nama minimal 3 huruf.',
                'nama_prodi.max' => 'Nama maksimal 255 huruf.',
                'kode_prodi.required' => 'Harap di isi dengan benar!',
                'kode_prodi.regex' => 'Kode Prodi hanya berupa huruf.',
                'kode_prodi.max' => 'Kode Prodi maksimal 3 huruf.',
            ]

        );

        $prodi = DB::table('prodi')->where('id_prodi', $id)->first();
        $kode_prodi_length = strlen($prodi->kode_prodi);

        $matkul = DB::table('matkul')->where('kode_prodi', $prodi->kode_prodi)->get();
        $kelas = DB::table('kelas')->where('kode_kelas', 'LIKE', "%{$prodi->kode_prodi}%")->get();
        $kuliah = DB::table('kuliah')->where('kode_prodi', $prodi->kode_prodi)->get();

        try {
            DB::table('prodi')
            ->where('id_prodi', $id)
            ->update([
                'nama_prodi' => strtolower($request->nama_prodi),
                'kode_prodi' => strtoupper($request->kode_prodi),
            ]);
        } 
        
        catch(\Illuminate\Database\QueryException $ex){
            return redirect('/managekuliah/manageprodi/'.$id.'/edit')->with('status', 'Gagal! Nama Prodi atau Kode Prodi sudah digunakan.');
        }
        
        foreach ($matkul as $m) {
            DB::table('matkul')
            ->where('kode_matkul', $m->kode_matkul)
            ->update([
                'kode_matkul' => strtoupper($request->kode_prodi).substr($m->kode_matkul,$kode_prodi_length),
                'kode_prodi' => strtoupper($request->kode_prodi),
            ]);
        }

        foreach ($kelas as $k) {
            DB::table('kelas')
            ->where('kode_kelas', $k->kode_kelas)
            ->update([
                'kode_kelas' => strtoupper($request->kode_prodi).substr($k->kode_kelas,$kode_prodi_length),
            ]);
        }

        foreach ($kuliah as $k) {
            DB::table('kuliah')
            ->where('kode_matkul', $k->kode_matkul)
            ->update([
                'kode_matkul' => strtoupper($request->kode_prodi).substr($k->kode_matkul,$kode_prodi_length),
                'kode_dosen' => strtoupper($request->kode_prodi).substr($k->kode_dosen,$kode_prodi_length),
                'kode_kelas' => strtoupper($request->kode_prodi).substr($k->kode_kelas,$kode_prodi_length),
                'kode_prodi' => strtoupper($request->kode_prodi)
            ]);
        }

        return redirect('/managekuliah/manageprodi')->with('status', 'Data prodi berhasil diubah');
    }


    public function destroy($id)
    {
        $all_prodi = DB::table('prodi')->get();

        if(count($all_prodi) == 1) {
            return redirect('managekuliah/manageprodi')->with('status', 'Minimal Tersisa Satu Prodi!');
        }

        $prodi = DB::table('prodi')->where('id_prodi', $id)->first();
        $kode_prodi_length = strlen($prodi->kode_prodi);

        DB::table('prodi')->where('id_prodi', $id)->delete();
        DB::table('kuliah')->where('kode_prodi', $prodi->kode_prodi)->delete();
        DB::table('matkul')->where('kode_prodi', $prodi->kode_prodi)->delete();
      
        $kelas = DB::table('kelas')->get();
        foreach ($kelas as $k) {
            if(substr($k->kode_kelas,0,$kode_prodi_length) == $prodi->kode_prodi){
                DB::table('kelas')->where('kode_kelas', $k->kode_kelas)->delete();
            }
        }

        return redirect('/managekuliah/manageprodi')->with('status', 'Data prodi berhasil dihapus!');
    }
}
