<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Ruang;


class RuangController extends Controller
{
    public function index(Request $request)
    {
        $request_keyword = "";
        if($request->keyword){
            $ruang = DB::table('ruang')->where('nama_ruang', 'LIKE', "%{$request->keyword}%")->orWhere('kode_ruang', 'LIKE', "%{$request->keyword}%")->get();
            $request_keyword = $request->keyword;
        } else {
            $ruang = Ruang::get();
        }
        return view('manageruang.index', compact('ruang', 'request_keyword'));
    }
    public function create(Request $request)
    {
        $allRuang = Ruang::get();
        if(count($allRuang) > 0) {
            $kodeRuang = $allRuang[count($allRuang) - 1]->kode_ruang + 1;
        } else {
            $kodeRuang = 1;
        }

        return view('manageruang.create', compact('kodeRuang'));
    }
    public function store(Request $request)
    {   
        $request->validate(
            [
                'nama_ruang' => 'required|min:2|max:255|unique:ruang',
            ],
            [
                'nama_ruang.required' => 'Harap di isi dengan benar!',
                'nama_ruang.min' => 'Nama minimal 2 huruf.',
                'nama_ruang.max' => 'Nama maksimal 255 huruf.',
                'nama_ruang.unique' => 'Nama ruang Sudah Terdaftar.',
            ]

        );

        DB::table('ruang')->insert([
            'kode_ruang' => $request->kode_ruang,
            'nama_ruang' => strtolower($request->nama_ruang),
        ]);

        return redirect('/manageruang')->with('status', 'Data ruang Berhasil Ditambahkan!');
    }

    public function edit(Request $request, $kode_ruang)
    {
        $ruang = DB::table('ruang')->where('kode_ruang', $kode_ruang)->first();

        return view('manageruang.edit', compact( 'ruang'));
    }

    public function update(Request $request, $kode_ruang)
    {
        $request->validate(
            [
                'nama_ruang' => 'required|min:2|max:255',
            ],
            [
                'nama_ruang.required' => 'Harap di isi dengan benar!',
                'nama_ruang.min' => 'Nama minimal 2 huruf.',
                'nama_ruang.max' => 'Nama maksimal 255 huruf.',
            ]
        );

        try {
            DB::table('ruang')
            ->where('kode_ruang', $kode_ruang)
            ->update([
                'nama_ruang' => strtolower($request->nama_ruang)
            ]);

        } catch(\Illuminate\Database\QueryException $ex){
            return redirect('/manageruang/'.$kode_ruang.'/edit')->with('status', 'Gagal! Nama ruang atau Kode ruang sudah digunakan.');
        }

        return redirect('/manageruang')->with('status', 'Data ruang berhasil diubah');
    }

    public function destroy($kode_ruang, Request $request)
    {
        $all_ruang = Ruang::get();

        if(count($all_ruang) == 1) {
            return redirect('/manageruang')->with('status', 'Minimal Tersisa Satu Ruang!');
        }

        $ruang = DB::table('ruang')->where('kode_ruang', $kode_ruang)->first();

        DB::table('ruang')->where('kode_ruang', $kode_ruang)->delete();


        if($all_ruang[count($all_ruang) - 1]->kode_ruang != count($all_ruang)) {
            for ($i=0; $i < count($all_ruang); $i++) { 
                DB::table('ruang')
                ->where('kode_ruang', $all_ruang[$i]->kode_ruang)
                ->update([
                    'kode_ruang' => $i+1,
                ]);
            }
        }

        return redirect('/manageruang')->with('status', 'Data ruang berhasil dihapus!');
    }
}
