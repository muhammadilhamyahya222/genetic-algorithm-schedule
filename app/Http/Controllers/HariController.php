<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HariController extends Controller
{
    public function index(Request $request)
    {
        $request_keyword = "";
        if($request->keyword){
            $hari = DB::table('hari')->where('nama_hari', 'LIKE', "%{$request->keyword}%")->orWhere('kode_hari', 'LIKE', "%{$request->keyword}%")->get();
            $request_keyword = $request->keyword;
        } else {
            $hari = DB::table('hari')->get();
        }
        return view('managehari.index', compact('hari', 'request_keyword'));
    }
    public function create(Request $request)
    {
        $allhari = DB::table('hari')->get();
        $availableDays = ['senin','selasa','rabu','kamis','jumat','sabtu','minggu'];

        foreach ($allhari as $hari) {
            array_splice($availableDays, array_search($hari->nama_hari, $availableDays ), 1);       
        }

        return view('managehari.create', compact('allhari','availableDays'));
    }
    public function store(Request $request)
    {   
        $request->validate(
            [
                'nama_hari' => 'required|min:3|max:255|unique:hari',
            ],
            [
                'nama_hari.required' => 'Kolom Nama hari harap di isi.',
                'nama_hari.min' => 'Nama minimal 3 huruf.',
                'nama_hari.max' => 'Nama minimal 255 huruf.',
                'nama_hari.unique' => 'Nama hari Sudah Terdaftar.',
            ]

        );

        $kode_hari = ['senin' => 1,'selasa'=>2,'rabu'=>3,'kamis'=>4,'jumat'=>5,'sabtu'=>6,'minggu'=>7];

        DB::table('hari')->insert([
            'kode_hari' => $kode_hari[strtolower($request->nama_hari)],
            'nama_hari' => strtolower($request->nama_hari),
        ]);

        return redirect('/managewaktu/managehari')->with('status', 'Data hari Berhasil Ditambahkan!');
    }

    public function destroy(Request $request, $kode_hari)
    {
        $all_hari = DB::table('hari')->get();

        if(count($all_hari) == 1) {
            return redirect('managewaktu/managehari')->with('status', 'Minimal Tersisa Satu Hari!');
        }

        $hari = DB::table('hari')->where('kode_hari', $kode_hari)->first();

        DB::table('hari')->where('kode_hari', $kode_hari)->delete();
        DB::table('waktu')->where('kode_hari', $kode_hari)->delete();

        return redirect('/managewaktu/managehari')->with('status', 'Data hari berhasil dihapus!');
    }
}
