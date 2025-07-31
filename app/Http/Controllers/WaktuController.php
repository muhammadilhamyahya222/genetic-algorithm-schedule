<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class WaktuController extends Controller
{
    public function index(Request $request)
    {
        $request_keyword = "";
        if($request->keyword){
            $waktu = DB::table('waktu')->where('kode_hari', "$request->keyword")->orWhere('kode_waktu', "$request->keyword")->orWhere('kode_jam', "$request->keyword")->get();
            $request_keyword = $request->keyword;
        } else {
            $waktu = DB::table('waktu')->get();
        }

        $waktuWithDetail = [];

        foreach ($waktu as $w) {
            $kode_waktu = $w->kode_waktu;
            $hari = DB::table('hari')->where('kode_hari',$w->kode_hari)->first()->nama_hari;
            $jam= DB::table('jam')->where('kode_jam', $w->kode_jam)->first()->jam;

            array_push($waktuWithDetail, compact(
                'kode_waktu',
                'hari',
                'jam'
            ));
        }

        return view('managewaktu.index', compact('waktu', 'waktuWithDetail', 'request_keyword'));
    }
    public function create(Request $request)
    {
        $waktu = DB::table('waktu')->get();
        $allDays = DB::table('hari')->get();
        $allHours = DB::table('jam')->get();
        $availableDays = [];
        $availableHours = [];

        foreach ($allDays as $day) {
            array_push($availableDays, $day);
        }

        foreach ($allHours as $hour) {
            array_push($availableHours, $hour);
        }

        return view('managewaktu.create', compact('availableDays','availableHours'));
    }
    public function create_action(Request $request) {

        if($request->ajax()) {
             
            $kode_hari = $request->get('kode_hari');
            $jamTable = DB::table('jam')->get();
            $jamByHari = DB::table('waktu')->where('kode_hari',$kode_hari)->get();

            $jamByHariCont = [];
            $availableHours = [];

            foreach ($jamByHari as $jam) {
                array_push($jamByHariCont,$jam->kode_jam);
            }

            foreach ($jamTable as $jam) {   
                if (!in_array($jam->kode_jam,$jamByHariCont)){
                    array_push($availableHours,$jam);
                }
            }
            
            $data = array(
                'availableHours'  => $availableHours,
            );
            echo json_encode($data);
        } else {
            return redirect('/managekuliah/managekelas/create');
        }
    }
    public function store(Request $request)
    {   
        $request->validate(
            [
                'hari' => 'required',
                'jam' => 'required',
            ],
            [
                'hari.required' => 'Harap di isi dengan benar!',
                'jam.required' => 'Harap di isi dengan benar!',
            ]
        );

        $hoursCode = $request->jam;
        $hours = [];
        $nama_hari = DB::table('hari')->where('kode_hari', $request->hari)->first()->nama_hari;

        foreach ($hoursCode as $hourCode) {
            array_push($hours, DB::table('jam')->where('kode_jam', $hourCode)->first()->jam);
        }

        $kode = 1;
        $waktu = DB::table('waktu')->get();
        if(count($waktu) != 0){
            if(($waktu[count($waktu)-1]->kode_waktu) != count($waktu)){
                for ($i=0; $i < count($waktu); $i++) { 
                    DB::table('waktu')
                    ->where('kode_waktu', $waktu[$i]->kode_waktu)
                    ->update([
                        'kode_waktu' => $i + 1,
                    ]);
                }
                $waktu = DB::table('waktu')->get();
                $kode = $waktu[count($waktu)-1]->kode_waktu + 1;
            } else {
                $kode = $waktu[count($waktu)-1]->kode_waktu + 1;
            }
        }

        foreach ($hoursCode as $hourCode) {
            DB::table('waktu')->insert([
                'kode_waktu' => $kode++,
                'kode_hari' => $request->hari,
                'kode_jam' => $hourCode,
            ]);
        }

        return redirect('/managewaktu')->with('status', 'Data waktu Berhasil Ditambahkan!');
    }

    public function destroy(Request $request, $kode_waktu)
    {
        $all_waktu = DB::table('waktu')->get();

        if(count($all_waktu) == 1) {
            return redirect('/managewaktu')->with('status', 'Minimal Tersisa Satu Waktu!');
        }

        $waktu = DB::table('waktu')->where('kode_waktu', $kode_waktu)->first();

        DB::table('waktu')->where('kode_waktu', $kode_waktu)->delete();

        $waktu = DB::table('waktu')->get();

        if(($waktu[count($waktu)-1]->kode_waktu) != count($waktu)){
            for ($i=0; $i < count($waktu); $i++) { 
                DB::table('waktu')
                ->where('kode_waktu', $waktu[$i]->kode_waktu)
                ->update([
                    'kode_waktu' => $i + 1,
                ]);
            }
        }

        return redirect('/managewaktu')->with('status', 'Data waktu berhasil dihapus!');
    }
}
