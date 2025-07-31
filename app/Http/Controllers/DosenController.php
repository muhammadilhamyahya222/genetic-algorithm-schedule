<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Dosen;
use App\Models\Prodi;

class DosenController extends Controller
{
    public function index(Request $request)
    {
        $request_keyword = "";
        if($request->keyword){
            $dosen = Dosen::where('nama', 'LIKE', "%{$request->keyword}%")->orWhere('kode_dosen', 'LIKE', "%{$request->keyword}%")->orWhere('nidn', 'LIKE', "%{$request->keyword}%")->get();
            $request_keyword = $request->keyword;
        } else {
            $dosen = Dosen::orderByRaw('LENGTH(kode_dosen), kode_dosen')->get();
        }
        return view('managedosen.index', compact('dosen','request_keyword'));
    }
    public function create(Request $request)
    {
        $prodi = Prodi::get();

        return view('managedosen.create', compact('prodi'));
    }
    public function store(Request $request)
    { 
        $request->validate(
            [
                'nama' => 'required|min:3|max:255',
                'nidn' => 'required',
            ],
            [
                'nama.required' => 'Harap di isi dengan benar!',
                'nama.min' => 'Nama minimal 3 huruf.',
                'nama.max' => 'Nama maksimal 255 huruf.',
                'nidn.required' => 'Harap di isi dengan benar!',
                ]
            );

        $existingDosen = Dosen::orderByRaw('LENGTH(kode_dosen), kode_dosen')->get();
        $kode_dosen = "1";

        for ($i = 1; $i <= count($existingDosen) + 1; $i++) {
            $iStr = (string)$i;
            $found = false;

            foreach ($existingDosen as $d) {
                if ($d->kode_dosen === $iStr) {
                    $found = true;
                    break;
                }
            }

            if (!$found) {
                $kode_dosen = $iStr;
                break;
            }
        }

        DB::table('dosen')->insert([
            'kode_dosen' => $kode_dosen,
            'nidn' => $request->nidn,
            'nama' => strtolower($request->nama),
        ]);

        return redirect('/managekuliah/managedosen')->with('status', 'Data dosen Berhasil Ditambahkan!');
    }

    public function edit(Request $request, $kode_dosen)
    {
        $dosen = DB::table('dosen')->where('kode_dosen',$kode_dosen)->first();
        $prodi = DB::table('prodi')->get();
        
        return view('managedosen.edit', compact('dosen','prodi'));
    }

    public function update(Request $request, $kode_dosen)
    {
        $request->validate(
            [
                'nama' => 'required|min:3|max:255',
                'nidn' => 'required',
            ],
            [
                'nama.required' => 'Harap di isi dengan benar!',
                'nama.min' => 'Nama minimal 3 huruf.',
                'nama.max' => 'Nama maksimal 255 huruf.',
                'nidn.required' => 'Harap di isi dengan benar!',
                ]
                
            );

        $dosen_old = DB::table('dosen')->where('kode_dosen',$kode_dosen)->first();

         DB::table('dosen')
         ->where('kode_dosen', $kode_dosen)
         ->update([
             'nama' => strtolower($request->nama),
             'nidn' => $request->nidn,
         ]);

         DB::table('kelas')
         ->where('nama_dosen', $dosen_old->nama)
         ->update([
             'nama_dosen' => strtolower($request->nama),
         ]);

         return redirect('/managekuliah/managedosen')->with('status', 'Data dosen berhasil diubah');
    }


    public function destroy(Request $request, $kode_dosen)
    {
        $all_dosen = DB::table('dosen')->get();

        if(count($all_dosen) == 1) {
            return redirect('managekuliah/managedosen')->with('status', 'Minimal Tersisa Satu Dosen!');
        }

        $dosen = Dosen::where('kode_dosen',$kode_dosen)->first();

        DB::table('dosen')->where('kode_dosen', $kode_dosen)->delete();
        return redirect('/managekuliah/managedosen')->with('status', 'Data dosen berhasil dihapus!');
    }
}
