<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class JamController extends Controller
{
    public function index(Request $request)
    {  
        $request_keyword = "";
        if($request->keyword){
            $jam = DB::table('jam')->where('jam', 'LIKE', "%{$request->keyword}%")->orWhere('kode_jam', 'LIKE', "%{$request->keyword}%")->get();
            $request_keyword = $request->keyword;
        } else {
            $jam = DB::table('jam')->get();
        }
        return view('managejam.index', compact('jam', 'request_keyword'));
    }
    public function create(Request $request)
    {
        $allJam = DB::table('jam')->get();
        $availableCode = [];

        if (count($allJam) != 0) {

            $lastKodejam = $allJam[count($allJam)-1]->kode_jam;
            
            for ($i = 0; $i <= $lastKodejam; $i++) {
                array_push($availableCode,($i+1));
            }
            
            foreach ($allJam as $jam) {
                array_splice($availableCode, array_search($jam->kode_jam, $availableCode ), 1);       
            }
        } else {
            array_push($availableCode,1);
        }

        return view('managejam.create', compact('allJam','availableCode'));
    }
    public function store(Request $request)
    {   
        $request->validate(
            [
                'kode_jam' => 'required|numeric|unique:jam',
                'jam' => 'required|numeric|max:23',
                'menit' => 'required|numeric|max:59',
            ],
            [
                'kode_jam.required' => 'Kolom Kode Jam Harap di Isi.',
                'kode_jam.numeric' => 'Kode Jam Harus Berupa Angka.',
                'kode_jam.unique' => 'Kode Jam Sudah Didaftarkan!',
                'jam.required' => 'Kolom Jam Harap di Isi.',
                'jam.numeric' => 'Jam Harus Berupa Angka.',
                'jam.max' => 'Jam Maksimal 23.',
                'menit.required' => 'Kolom Menit Harap di Isi.',
                'menit.numeric' => 'Menit Harus Berupa Angka.',
                'menit.max' => 'Inputan Menit Maksimal 59.',
            ]

        );

        DB::table('jam')->insert([
            'kode_jam' => $request->kode_jam,
            'jam' => $request->jam.':'.$request->menit,
        ]);

        return redirect('/managewaktu/managejam')->with('status', 'Data jam Berhasil Ditambahkan!');
    }

    public function edit(Request $request, $kode_jam)
    {
        $jam = DB::table('jam')->where('kode_jam', $kode_jam)->first();
        $alljam = DB::table('jam')->get();
        $availableCode = [];

        $lastKodejam = $alljam[count($alljam)-1]->kode_jam;

        for ($i = 0; $i < $lastKodejam; $i++) {
            array_push($availableCode,($i+1));
        }
        
        foreach ($alljam as $r) {
            array_splice($availableCode, array_search($r->kode_jam, $availableCode ), 1);       
        }
        
        array_push($availableCode,$jam->kode_jam);
        sort($availableCode);

        return view('managejam.edit', compact( 'jam','availableCode'));
    }

    public function update(Request $request, $kode_jam)
    {

        $request->validate(
            [
                'kode_jam' => 'required|numeric',
                'jam' => 'required|numeric|max:23',
                'menit' => 'required|numeric|max:59',
            ],
            [
                'kode_jam.required' => 'Kolom Kode Jam Harap di Isi.',
                'kode_jam.numeric' => 'Kode Jam Harus Berupa Angka.',
                'jam.required' => 'Kolom Jam Harap di Isi.',
                'jam.numeric' => 'Jam Harus Berupa Angka.',
                'jam.max' => 'Jam Maksimal 23.',
                'menit.required' => 'Kolom Menit Harap di Isi.',
                'menit.numeric' => 'Menit Harus Berupa Angka.',
                'menit.max' => 'Inputan Menit Maksimal 59.',
            ]

        );
        $jam = DB::table('jam')->where('kode_jam', $kode_jam)->first();

        if($jam->kode_jam != $request->kode_jam){
            $request->validate(
                [
                    'kode_jam' => 'unique:jam',
                ],
                [
                    'kode_jam.unique' => 'Kode jam sudah digunakan.',
                ]
    
            );
        }

        try {
            DB::table('jam')
            ->where('kode_jam', $kode_jam)
            ->update([
                'kode_jam' => $request->kode_jam,
                'jam' => $request->jam.":".$request->menit,
            ]);

        } catch(\Illuminate\Database\QueryException $ex){
            return redirect('/managewaktu/managejam/'.$kode_jam.'/edit')->with('status', 'Gagal! Nama jam atau Kode jam sudah digunakan.');
        }

        return redirect('/managewaktu/managejam')->with('status', 'Data jam berhasil diubah');
    }

    public function destroy(Request $request, $kode_jam)
    {
        $all_jam = DB::table('jam')->get();

        if(count($all_jam) == 1) {
            return redirect('managewaktu/managejam')->with('status', 'Minimal Tersisa Satu Jam!');
        }

        $jam = DB::table('jam')->where('kode_jam', $kode_jam)->first();

        DB::table('jam')->where('kode_jam', $kode_jam)->delete();
        DB::table('waktu')->where('kode_jam', $kode_jam)->delete();

        return redirect('/managewaktu/managejam')->with('status', 'Data jam berhasil dihapus!');
    }
}
