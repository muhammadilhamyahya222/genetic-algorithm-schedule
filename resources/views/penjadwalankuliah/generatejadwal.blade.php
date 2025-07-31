@extends('layouts.app')
@section('title','Generate Jadwal | Sistem Penjadwalan Kuliah')
@section('content')

<!-- Header -->
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-9">
                <h1 class="m-0">Generate Jadwal Perkuliahan Menggunakan Algoritma Genetika</h1>
            </div>
            <div class="col-sm-3">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="/home/dashboard"><i class="fas fa-igloo mr-2"></i>Home</a></li>
                    <li class="breadcrumb-item active">Generate Jadwal</li>
                </ol>
            </div>
        </div>
    </div>
</div>

<!-- Main -->
<section class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-4">
                @if (session('status'))
                <div class="alert alert-dismissible fade show bg-lime" role="alert">
                    {{ session('status')}}
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                @endif
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="card text-choThem">
                    <div class="card-header bg-greenTheme">
                        <h3 class="card-title text-whiteTheme">Form Generate Jadwal Perkuliahan</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body table-responsive">
                        <form method="post" action="/generatejadwal">
                            @csrf
                            <div class="form-group">
                              <label>Tahun Ajaran</label>
                                <select name="tahun_ajaran" id="the_tahun_ajaran" class="form-control select2bs4 @error('tahun_ajaran') is-invalid @enderror">
                                  <option value="" id="the_tahun_ajaran_default">-- Silahkan Pilih Tahun Ajaran --</option>
                                  @foreach($allTahunAjaran as $tahun)
                                  <option value="{{ $tahun->tahun_ajaran }}">{{ $tahun->tahun_ajaran }}</option>
                                  @endforeach
                                </select>
                                @if (Session::has('errorTahunAjaran'))
                                <p class="error-msg">{{ Session::get('errorTahunAjaran') }}</p>
                                @endif
                          </div>
                            <div class="form-group clearfix">
                                @foreach($semester as $s)
                                <div class="icheck-greenTheme">
                                  <input type="radio" id="radio{{ $s->nama_semester }}" name="radioSemester" value="{{ $s->kode_semester }}">
                                  <label for="radio{{ $s->nama_semester }}">
                                    Semester {{ ucwords($s->nama_semester) }}
                                  </label>
                                </div>
                                @endforeach
                                @if (Session::has('errorSemester'))
                                <p class="error-msg">{{ Session::get('errorSemester') }}</p>
                                @endif
                            </div>

                            <div class="form-group d-inline">
                              <label class="switch">
                              <input type="checkbox" name="algoritma" id="algoritma">
                              <span class="slider"></span>
                              </label>
                              <label class="ml-1" for="algoritma" style="cursor: pointer">Tampilkan Proses Algoritma</label>
                            </div>        
                        </div>
                        <div class="card-footer">
                            <button type="submit" class="btn btn-greenTheme float-right genBtn"><i class="fas fa-dna mr-2"></i>Generate Jadwal</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        @if($algoritma_proses)
          @for ($i = 0; $i < count($algoritma_proses); $i++)
            <div class="container bg-choTheme py-4">
              <div class="row justify-content-center align-items-center">
                <div class="col-md-12">
                  <h1 class="text-center text-whiteTheme">GENERASI KE-{{ $i + 1 }}</h1>
                </div>
              </div>
              <div class="row justify-content-center align-items-center">
                <div class="col-md-12">
                  <p class="text-whiteTheme">PROSES 1 : INISIALISASI POPULASI</p>
                </div>
              </div>
              <div class="row text-whiteTheme">
                <div class="col-md-12">
                  <p> Individu Dalam Bentuk Kode.</p>

                  @for($j=0; $j<count($algoritma_proses[$i]["individu"]); $j++)
                    <?php
                    $stringIndividu = "";
                    foreach (
                        $algoritma_proses[$i]["individu"][$j]
                        as $kromosom
                    ) {
                        $stringIndividu .=
                            "[" .
                            $kromosom[0] .
                            "," .
                            $kromosom[1] .
                            "," .
                            $kromosom[2] .
                            "],";
                    }
                    $stringIndividu =
                        "{" . substr($stringIndividu, 0, -1) . "}";
                    ?>
                    <p>{{ $j+1 }}. Individu[{{ $j+1 }}] = {{ $stringIndividu }}.</p>
                  @endfor
                </div>
              </div>
              
              <div class="row justify-content-center align-items-center">
                <div class="col-md-12">
                  <p class="text-whiteTheme">PROSES 2 : MENGHITUNG FITNESS FUNCTION</p>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12">
                  <table class="text-whiteTheme">
                  <tr>
                    <td rowspan="2" class="pr-2">Fitness Function = </td>
                    <td style="border-bottom:solid 1px #FDE8CD;" class="text-center">1</td>
                  </tr>
                  <tr>
                    <td class="text-center">1+( CR + CD + CJ )</td>
                  </tr>
                  @foreach($algoritma_proses[$i]['fitness_individu'] as $fitness_individu)
                    <tr>
                      <td rowspan="2" class="pr-2">Fitness Individu {{ $loop->iteration }}  : </td>
                      <td style="border-bottom:solid 1px #FDE8CD;" class="text-center">1</td>
                      <td rowspan="2" class="pl-2"> = {{ round($fitness_individu,2) }}</td>
                    </tr>
                    <tr>
                      <td class="text-center">1+( {{ $algoritma_proses[$i]['CR'][$loop->index] }} + {{ $algoritma_proses[$i]['CD'][$loop->index] }}  + {{ $algoritma_proses[$i]['CJ'][$loop->index] }})</td>
                    </tr>
                  @endforeach
                  </table>
                    <p class="mt-1 text-whiteTheme">Total Nilai Fitness = {{ round($algoritma_proses[$i]['total_fitness'], 2) }}</p>
                </div>
              </div>

              @if(array_key_exists("probabilitas",$algoritma_proses[$i]))
              <div class="row justify-content-center align-items-center">
                <div class="col-md-12">
                  <p class="text-whiteTheme">PROSES 3 : SELECTION (METODE ROULETTE WHEEL)</p>
                </div>
              </div>
              <div class="row text-whiteTheme">
                <div class="col-md-12">
                  <p>Probability = fitness[i] / total fitness</p>
                  <p> 1. Hitung Probabilitas</p>
                  <div class="pl-2">
                    @foreach($algoritma_proses[$i]['fitness_individu'] as $individu)
                      <p>{{ $loop->iteration }}. Probabilitas[{{ $loop->iteration }}] = {{ round($individu,2) }} / {{ round($algoritma_proses[$i]['total_fitness'],2) }} = {{ round($algoritma_proses[$i]['probabilitas'][$loop->index], 2) }}.</p>
                    @endforeach
                  </div>
                  <p> 2. Hitung Kumulatif</p>
                  <div class="pl-2">
                    @for($j = 0; $j<count($algoritma_proses[$i]['kumulatif']); $j++)
                      @if($j == 0)
                      <p>{{ $j+1 }}. Kumulatif[{{ $j+1 }}] = {{ round($algoritma_proses[$i]['probabilitas'][$j],2) }}.</p>
                      @else
                      <p>{{ $j+1 }}. Kumulatif[{{ $j+1 }}] = {{ round($algoritma_proses[$i]['kumulatif']
                        [$j-1],2) }} + {{ round($algoritma_proses[$i]['probabilitas'][$j],2) }} = {{ round($algoritma_proses[$i]['kumulatif'][$j], 2) }}.</p>
                      @endif
                    @endfor
                  </div>
                  <p> 3. Bangkitkan Bilangan Acak 1-0</p>
                  <div class="pl-2">
                    @for($j = 0; $j < count($algoritma_proses[$i]["random1_selection"]); $j++)
                    <p>{{ $j+1 }}. Random[{{ $j+1 }}] = {{ $algoritma_proses[$i]['random1_selection'][$j] }}.</p>
                    @endfor
                  </div>
                  <p> 4. Menggantikan Individu Lama berdasarkan nilai acak terhadap nilai kumulatif. </p>
                  {{-- $algoritma_proses[$generasi]["list_new_individu_selection"] --}}
                  <div class="pl-2">
                    @for($j = 0; $j < count($algoritma_proses[$i]["individu"]); $j++)
                    <p>{{ $j+1 }}. Individu[{{ $j+1 }}] = Individu[{{ $algoritma_proses[$i]["list_new_individu_selection"][$j] +1 }}].</p>
                    @endfor
                  </div>
                  <p> 5. Hasil Seleksi Individu Baru. </p>

                    @for($j = 0; $j < count($algoritma_proses[$i]["list_new_individu_selection"]); $j++)
                    
                    <?php
                    $stringNewIndividu = "";
                    foreach (
                        $algoritma_proses[$i]["individu"][
                            $algoritma_proses[$i][
                                "list_new_individu_selection"
                            ][$j]
                        ]
                        as $kromosom
                    ) {
                        $stringNewIndividu .=
                            "[" .
                            $kromosom[0] .
                            "," .
                            $kromosom[1] .
                            "," .
                            $kromosom[2] .
                            "],";
                    }
                    $stringNewIndividu =
                        "{" . substr($stringNewIndividu, 0, -1) . "}";
                    ?>

                    <p>{{ $j+1 }}. Individu[{{ $j+1 }}] = {{ $stringNewIndividu }}.</p>
                    @endfor
                </div>
              </div>
              @endif

              @if(array_key_exists("index_best_individu",$algoritma_proses[$i]))
              <div class="row justify-content-center align-items-center">
                <div class="col-md-12">
                  <p class="text-whiteTheme">PROSES 4 : CROSSOVER (METODE One Cut-Point CROSSOVER)</p>
                </div>
              </div>
              <div class="row text-whiteTheme">
                <div class="col-md-12">
                  <p>CrossOver Rate</p>
                  <p> 1. Bangkitkan Bilangan Acak 1-0</p>
                  <div class="pl-2">
                    @for($j = 0; $j < count($algoritma_proses[$i]["random1_crossover"]); $j++)
                    <p>{{ $j+1 }}. Random[{{ $j+1 }}] = {{ $algoritma_proses[$i]['random1_crossover'][$j] }}.</p>
                    @endfor
                  </div>
                  <p> 2. Individu Terpilih</p>
                  <div class="pl-2">
                    @for($j = 0; $j < count($algoritma_proses[$i]["index_best_individu"]); $j++)
                    <p>{{ $j+1 }}. Individu[{{ $algoritma_proses[$i]["index_best_individu"][$j] + 1 }}].</p>
                    @endfor
                  </div>
                  <p> 3. Individu dipasangkan dua-dua.</p>
                  <div class="pl-2">
                    @for($j = 0; $j < count($algoritma_proses[$i]["parents"]); $j++)
                    <p>{{ $j+1 }}. Individu[{{ $algoritma_proses[$i]["parents"][$j]['father'] + 1 }}] >< Individu[{{ $algoritma_proses[$i]["parents"][$j]['mother'] + 1 }}].</p>
                    @endfor
                  </div>
                  <p> 4. Menentukan posisi one cut point secara acak.</p>
                  <div class="pl-2">
                    @for($j = 0; $j < count($algoritma_proses[$i]["parents"]); $j++)
                    <p>{{ $j+1 }}. Individu[{{ $algoritma_proses[$i]["parents"][$j]['father'] + 1 }}] >< Individu[{{ $algoritma_proses[$i]["parents"][$j]['mother'] + 1 }}] <span class="text-maroon">(Crossover[{{ $j+1}}])</span> = {{ $algoritma_proses[$i]["parents"][$j]['cut-point'] }}.</p>
                    @endfor
                  </div>

                  @for($j = 0; $j < count($algoritma_proses[$i]["parents"]); $j++)

                  <?php
                  $stringFatherIndividu = "";
                  $stringMotherIndividu = "";
                  $stringOffSpringIndividu = "";

                  foreach (
                      $algoritma_proses[$i]["new_individu_selection"][
                          $algoritma_proses[$i]["parents"][$j]["father"]
                      ]
                      as $kromosom
                  ) {
                      $stringFatherIndividu .=
                          "[" .
                          $kromosom[0] .
                          "," .
                          $kromosom[1] .
                          "," .
                          $kromosom[2] .
                          "],";
                  }
                  foreach (
                      $algoritma_proses[$i]["new_individu_selection"][
                          $algoritma_proses[$i]["parents"][$j]["mother"]
                      ]
                      as $kromosom
                  ) {
                      $stringMotherIndividu .=
                          "[" .
                          $kromosom[0] .
                          "," .
                          $kromosom[1] .
                          "," .
                          $kromosom[2] .
                          "],";
                  }
                  foreach (
                      $algoritma_proses[$i]["offSpring"][$j]
                      as $kromosom
                  ) {
                      $stringOffSpringIndividu .=
                          "[" .
                          $kromosom[0] .
                          "," .
                          $kromosom[1] .
                          "," .
                          $kromosom[2] .
                          "],";
                  }

                  $stringFatherIndividu =
                      "{" . substr($stringFatherIndividu, 0, -1) . "}";
                  $stringMotherIndividu =
                      "{" . substr($stringMotherIndividu, 0, -1) . "}";
                  $stringOffSpringIndividu =
                      "{" . substr($stringOffSpringIndividu, 0, -1) . "}";
                  ?>

                  <p> Proses Crossover ke-{{ $j+1 }}.</p>
                  Individu[{{ $algoritma_proses[$i]["parents"][$j]['father'] + 1 }}] = {{ $stringFatherIndividu }} <br>
                  Individu[{{ $algoritma_proses[$i]["parents"][$j]['mother'] + 1 }}] = {{ $stringMotherIndividu }}<br>
                  Offspring {{ $j+1 }} = {{ $stringOffSpringIndividu }}<br><br>
                  @endfor

                  <p> Individu Baru Hasil Crossover.</p>

                  @for($j=0; $j<count($algoritma_proses[$i]["new_individu_crossover"]); $j++)
                    <?php
                    $stringNewIndividu = "";
                    foreach (
                        $algoritma_proses[$i]["new_individu_crossover"][$j]
                        as $kromosom
                    ) {
                        $stringNewIndividu .=
                            "[" .
                            $kromosom[0] .
                            "," .
                            $kromosom[1] .
                            "," .
                            $kromosom[2] .
                            "],";
                    }
                    $stringNewIndividu =
                        "{" . substr($stringNewIndividu, 0, -1) . "}";
                    ?>
                    <p>{{ $j+1 }}. Individu[{{ $j+1 }}] = {{ $stringNewIndividu }}.</p>
                  @endfor
                    
                  <p> Hitung Fitness Function Individu Baru.</p>

                  <table class="text-whiteTheme">
                    <tr>
                      <td rowspan="2" class="pr-2">Fitness Function = </td>
                      <td style="border-bottom:solid 1px #FDE8CD;" class="text-center">1</td>
                    </tr>
                    <tr>
                      <td class="text-center">1+( CR + CD + CJ )</td>
                    </tr>
                    @foreach($algoritma_proses[$i]['new_fitness_individu'] as $fitness_individu)
                      <tr>
                        <td rowspan="2" class="pr-2">Fitness Individu {{ $loop->iteration }}  : </td>
                        <td style="border-bottom:solid 1px #FDE8CD;" class="text-center">1</td>
                        <td rowspan="2" class="pl-2"> = {{ round($fitness_individu,2) }}</td>
                      </tr>
                      <tr>
                        <td class="text-center">1+({{ $algoritma_proses[$i]['new_CR'][$loop->index] }} + {{ $algoritma_proses[$i]['new_CD'][$loop->index] }} + {{ $algoritma_proses[$i]['new_CJ'][$loop->index] }})</td>
                      </tr>
                    @endforeach
                    </table>
                    <p class="mt-1 text-whiteTheme">Total Nilai Fitness = {{ round($algoritma_proses[$i]['new_total_fitness'], 2) }}</p>

                </div>
              </div>
              @endif

              @if(array_key_exists("all_clash_chromosome", $algoritma_proses[$i]))
              <div class="row justify-content-center align-items-center">
                <div class="col-md-12">
                  <p class="text-whiteTheme">PROSES 5 : MUTASI</p>
                </div>
              </div> 
              <div class="row text-whiteTheme">
                <div class="col-md-12">
                  <?php
                  $stringClashChromosom = "";
                  foreach (
                      $algoritma_proses[$i]["all_clash_chromosome"]
                      as $kromosom
                  ) {
                      $stringClashChromosom .=
                          "[" .
                          $kromosom["gen_asli"][0] .
                          "," .
                          $kromosom["gen_asli"][1] .
                          "," .
                          $kromosom["gen_asli"][2] .
                          "],";
                  }
                  $stringClashChromosom =
                      "{" . rtrim($stringClashChromosom, ",") . "}";
                  ?>

                  <p>Total Kromosom Bentrok : {{ count($algoritma_proses[$i]["all_clash_chromosome"]) }}</p>
                  <p>Kromosom Bentrok : {{ $stringClashChromosom }}</p>
                  
                  @if(array_key_exists("mutated_chromosome", $algoritma_proses[$i]))
                    <?php
                    $stringMutatedChromosom = "";
                    foreach (
                        $algoritma_proses[$i]["mutated_chromosome"]
                        as $kromosom
                    ) {
                        $stringMutatedChromosom .=
                            "[" .
                            $kromosom[0] .
                            "," .
                            $kromosom[1] .
                            "," .
                            $kromosom[2] .
                            "],";
                    }
                    $stringMutatedChromosom =
                        "{" . rtrim($stringMutatedChromosom, ",") . "}";
                    ?>
                    <p>Mutasi Kromosom Bentrok  : {{ $stringMutatedChromosom }}</p>
                  @endif
                    
                  @if(array_key_exists("new_individu_has_mutated", $algoritma_proses[$i]))
                    <p>Individu Baru Hasil Mutasi.</p>
                    @for($j=0; $j<count($algoritma_proses[$i]["new_individu_has_mutated"]); $j++)
                      <?php
                      $stringNewIndividu = "";
                      foreach (
                          $algoritma_proses[$i]["new_individu_has_mutated"][$j]
                          as $kromosom
                      ) {
                          $stringNewIndividu .=
                              "[" .
                              $kromosom[0] .
                              "," .
                              $kromosom[1] .
                              "," .
                              $kromosom[2] .
                              "],";
                      }
                      $stringNewIndividu =
                          "{" . rtrim($stringNewIndividu, ",") . "}";
                      ?>
                      <p>{{ $j+1 }}. Individu[{{ $j+1 }}] = {{ $stringNewIndividu }}.</p>
                    @endfor
                  @endif
                      
                </div>
              </div>
              @endif

            </div>
          @endfor
        @endif

        @if(isset($fixJadwal))
        @if(count($fixJadwal) > 0)
        {{ session()->put('jadwal',$fixJadwal) }}
        {{ session()->put('kodeSemester',$kodeSemester) }}
        {{ session()->put('tahunAjaran',$tahunAjaran) }}
            <div class="row mt-4">
              <div class="col-md-12">
                <div class="container">
                  <h2 class="text-center text-whiteTheme bg-choTheme">Jadwal Ditemukan</h2>
                  <p class="h4 text-center text-whiteTheme bg-choTheme mb-2">Waktu Eksekusi : {{ number_format((float)$execution_time, 2, '.', '') }} Detik</p>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="container">
                        @foreach($fixJadwal as $individu)
                          <table class="table table-bordered table-hover text-center bg-light">
                            <thead>
                              <tr>
                              <th scope="col" colspan="7">Jadwal {{ $loop->iteration }}</th>
                              </tr>
                              <tr  class="bg-greenTheme text-whiteTheme">
                                <th scope="col" rowspan="2" style="max-width: 80px; font-size: 18px;">Kromosom ke -</th>
                                <th scope="col" colspan="3">Gen 1</th>
                                <th scope="col">Gen 2</th>
                                <th scope="col" colspan="2">Gen 3</th>
                              </tr>
                              <tr>
                                <th scope="col">Matkul</th>
                                <th scope="col">Dosen</th>
                                <th scope="col">Kelas</th>
                                <th scope="col">Ruang</th>
                                <th scope="col">Hari</th>
                                <th scope="col">Jam</th>
                              </tr>
                            </thead>
                            <tbody>
                              @foreach($individu as $kromosom)
                              <tr>
                                <th scope="row">{{ $loop->iteration }}</th>
                                <td>{{ $kromosom['kode_matkul'] }}</td>
                                <td scope="row">
                                  @php
                                      $kodeDosenList = array_map('trim', explode(';', $kromosom['kode_dosen']['kode']));
                                      $dosenList = \App\Models\Dosen::whereIn('kode_dosen', $kodeDosenList)->pluck('nama')->toArray();
                                  @endphp
                              
                                  @foreach($dosenList as $dosen)
                                      {{ ucwords($dosen) }}<br>
                                  @endforeach
                              </td>
                                <td>{{ substr($kromosom['kode_kelas'], -1) }}</td>
                                <td>{{ ucwords($kromosom['nama_ruang']['kode']) }}</td>
                                <td>{{ $kromosom['kode_hari'] }}</td>
                                <td>{{ $kromosom['kode_jam'] }}</td>
                              </tr>
                              @endforeach
                              <tr scope="row">
                                <th scope="col" colspan="7"><a href="/hasilgenerate/{{ $loop->index }}"class="btn bg-maroon text-center"><i class="fas fa-table mr-1"></i> Gunakan Jadwal</a></th>
                              </tr>
                            </tbody>
                          </table>
                        @endforeach
                      </div>
                    </div>
                  </div>      
                </div>
              </div>
            </div>
        @endif
        @if(count($fixJadwal) == 0)
        <div class="row mt-4">
          <div class="col-md-12">
            <div class="container">
              <h2 class="text-center text-whiteTheme bg-choTheme">Jadwal Tidak Ditemukan</h2>
              <p class="h4 text-center text-whiteTheme bg-choTheme">Waktu Eksekusi : {{ number_format((float)$execution_time, 2, '.', '') }} Detik</p>
              <a href="#"><p class="h4 text-center text-whiteTheme bg-maroon mb-2" style="cursor: pointer">Silahkan Generate Kembali</p></a>
              <div class="row">
                <div class="col-md-12">
                  <div class="container">
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        @endif
        @endif


  @for ($i = 0; $i < count($algoritma_proses); $i++)

  @foreach($algoritma_proses[$i]['individuWithDetail_with_name'] as $individu)
  <?php $individuIndex = $loop->index; ?>
 
  @foreach($individu as $kromosom)

  <div class="modal fade" id="detail-{{ $i }}-{{ $individuIndex }}-{{ $kromosom['kode_kelas'] }}" tabindex="-1" aria-labelledby="detailJadwalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header bg-greenTheme text-whiteTheme">
                <h5 class="modal-title" id="detailJadwalLabel"><i class="fas fa-info-circle mr-2"></i>Detail Individu ke-{{ $individuIndex + 1 }}, kromosom ke-{{ $loop->iteration }}</h5>
                <button type="button" class="close text-whiteTheme" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        <div class="modal-body">
            <div class="form-group">
                <label for="sks">Jumlah SKS</label>
                <input name="sks" type="text" disabled class="form-control" id="sks" value="{{ $kromosom['jumlah_sks'] }}">
            </div>
            <p class="text-center h4 text-maroon">- GEN 1 -</p>
            <div class="form-group">
                <label for="matkul">Mata Kuliah</label>
                <input name="matkul" type="text" disabled class="form-control" id="matkul" value="{{ ucwords($kromosom['matkul']) }}">
            </div>
            <div class="form-group">
              <label for="dosen">Dosen Pengajar</label>
              <input name="dosen" type="text" disabled class="form-control" id="dosen" 
                     value="{{ ucwords(implode(', ', $kromosom['dosen'])) }}">
          </div>          
            <div class="form-group">
                <label for="kelas">Kelas</label>
                <input name="kelas" type="text" disabled class="form-control" id="kelas" value="{{ $kromosom['kelas'] }}">
            </div>
            <p class="text-center h4 text-maroon">- GEN 2 -</p>
            <div class="form-group">
              <label for="ruang">Ruangan</label>
              <input name="ruang" type="text" disabled class="form-control" id="ruang" value="{{  ucwords($kromosom['nama_ruang']) }}">
            </div>
            <p class="text-center h4 text-maroon">- GEN 3 -</p>
            <div class="form-group">
              <label for="hari">Hari</label>
              <input name="hari" type="text" disabled class="form-control" id="hari" value="{{  ucwords($kromosom['hari']) }}">
            </div>
            <div class="form-group">
              <label for="jam">Jam</label>
              <input name="jam" type="text" disabled class="form-control" id="jam" value="{{ $kromosom['jam'] }}">
            </div>

            </div>
            <div class="modal-footer" style="border-top: solid 1px #113A50">
                <button type="button" class="btn btn-greenTheme" data-dismiss="modal">Kembali</button>
            </div>
        </div>
    </div>
</div>
  @endforeach
  @endforeach
  @endfor
  @endsection