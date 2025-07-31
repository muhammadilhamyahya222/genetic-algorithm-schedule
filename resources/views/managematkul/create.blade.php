@extends('layouts.app')

@section('title',' Tambah Matkul | Sistem Penjadwalan Kuliah')

@section('content')

    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Tambah Mata Kuliah</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/home/dashboard"><i class="fas fa-igloo mr-2"></i>Home</a></li>
              <li class="breadcrumb-item"><a href="/managekuliah"></i>Manage Perkuliahan</a></li>
              <li class="breadcrumb-item"><a href="/managematkul"></i>Manage matkul</a></li>
              <li class="breadcrumb-item active">Tambah Matkul</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

<!-- Main content -->
<section class="content">
    <div class="container-fluid">
        <!-- /.row -->
        <div class="row">
            <div class="col-6">
                <div class="card text-choThem">
                    <div class="card-header bg-greenTheme">
                        <h3 class="card-title text-whiteTheme">Form Tambah Mata Kuliah</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body table-responsive">
                        <form method="post" action="/managekuliah/managematkul">
                            @csrf
                            <div class="form-group">
                                <label for="kode_matkul">Kode Mata Kuliah</label>
                                <input name="kode_matkul" type="text" class="form-control @error('kode_matkul') is-invalid @enderror" id="kode_matkul" placeholder="Kode matkul" value="{{ old('kode_matkul') }}">
                                @error('kode_matkul')
                                <div class="invalid-feedback">
                                    {{$message}}
                                </div>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label for="nama_matkul">Nama Mata Kuliah</label>
                                <input name="nama_matkul" type="text" class="form-control @error('nama_matkul') is-invalid @enderror" id="nama_matkul" placeholder="Nama matkul" value="{{ old('nama_matkul') }}">
                                @error('nama_matkul')
                                <div class="invalid-feedback">
                                    {{$message}}
                                </div>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label for="sks_teori">Jumlah SKS Tatap Muka</label>
                                <select name="sks_teori" class="form-control @error('sks_teori') is-invalid @enderror">
                                    <option value="">-- Pilih SKS TM --</option>
                                    @for($i=0; $i<=4; $i++)
                                      <option value="{{ $i }}" {{ old('sks_teori') == $i ? 'selected' : '' }}>{{ $i }}</option>
                                    @endfor
                                </select>
                                @error('sks_teori')
                                <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                
                            <div class="form-group">
                                <label for="sks_praktikum">Jumlah SKS Praktikum</label>
                                <select name="sks_praktikum" class="form-control @error('sks_praktikum') is-invalid @enderror">
                                    <option value="">-- Pilih SKS Praktikum --</option>
                                    @for($i=0; $i<=4; $i++)
                                      <option value="{{ $i }}" {{ old('sks_praktikum') == $i ? 'selected' : '' }}>{{ $i }}</option>
                                    @endfor
                                </select>
                                @error('sks_praktikum')
                                <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                
                            <div class="form-group">
                                <label>Program Studi</label>
                                <select name="program_studi" class="form-control select2bs4 @error('program_studi') is-invalid @enderror" style="width: 100%;">
                                    <option value="" selected="selected">-- Program Studi --</option>
                                    @foreach($prodi as $p):                                
                                    <option value="{{ $p->kode_prodi }}">{{ ucwords($p->nama_prodi) }}</option>
                                    @endforeach
                                </select>
                                @error('program_studi')
                                <div class="invalid-feedback">
                                    {{$message}}
                                </div>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label>Semester</label>
                                <select name="semester" class="form-control select2bs4 @error('semester') is-invalid @enderror" style="width: 100%;">
                                    @foreach($semester as $s):
                                    <option value="{{ $s->kode_semester }}">{{ ucwords($s->nama_semester) }}</option>
                                    @endforeach
                                </select>
                                @error('semester')
                                <div class="invalid-feedback">
                                    {{$message}}
                                </div>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label>Perkuliahan Semester</label>
                                <select name="perkuliahan_semester" class="form-control select2bs4 @error('perkuliahan_semester') is-invalid @enderror" style="width: 100%;">
                                    @foreach(range(1,8) as $numb)
                                    <option value="{{ $numb }}">{{ $numb }}</option>
                                    @endforeach
                                </select>
                                @error('perkuliahan_semester')
                                <div class="invalid-feedback">
                                    {{$message}}
                                </div>
                                @enderror
                            </div>
                            <div class="form-group">
                                <label>Tahun Ajaran</label>
                                  <select name="tahun_ajaran" class="form-control select2bs4 @error('tahun_ajaran') is-invalid @enderror">
                                    @php 
                                      $year = date("Y");
                                    @endphp
                                    @for($i = 0; $i<5; $i++):
                                    <option value="{{ ($year - 1) + $i }}/{{ ($year - 1) + $i + 1 }}">{{ ($year - 1) + $i }}/{{ ($year - 1) + $i + 1 }}</option>
                                    @endfor
                                  </select>
                                @error('tahun_ajaran')
                                <div class="invalid-feedback">
                                    {{$message}}
                                </div>
                                @enderror
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <div class="card-footer">
                            <a href="/managekuliah/managematkul" class="btn btn-outline-greenTheme">Kembali</a>
                            <button type="submit" class="btn btn-greenTheme float-right">Tambah Matkul</button>
                        </div>
                    </form>
                    <!-- /.card -->
                </div>
            </div>

        <!-- Main row -->
        <div class="row">
          
  </div>
  <!-- /.content-wrapper -->
  @endsection