@extends('layouts.app')
@section('title','Hasil Generate Jadwal | Sistem Penjadwalan Kuliah')
@section('content')

    <!-- Header -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-9">
            <h1 class="m-0">Jadwal Perkuliahan</h1>
          </div>
          <div class="col-sm-3">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/home/dashboard"><i class="fas fa-igloo mr-2"></i>Home</a></li>
              <li class="breadcrumb-item active">Hasil Jadwal</li>
            </ol>
          </div>
        </div>
      </div>
    </div>

<!-- Main -->
<section class="content">
    <div class="container-fluid">
      <a href="/generatejadwal" class="btn btn-outline-greenTheme mb-2"><i class="fas fa-recycle mr-1"></i>Generate Kembali Jadwal</a>
       <div class="row">
        <div class="col-md-12">
          <div class="card">
            <div class="card-body">
              <div class="form-group">
                <label>Tahun Ajaran</label>
                <select name="search-tahun" id="search-tahun" class="form-control select2bs4" style="width: 100%;">
                  <option value="" id="default-tahun-option">-- Silahkan pilih Tahun Ajaran --</option> 
                  @foreach($tahun_ajaran as $tahun)
                    <option value="{{$tahun->tahun_ajaran}}">{{$tahun->tahun_ajaran}}</option>
                  @endforeach
                </select>
            </div>
            </div>
          </div>
        </div>
      </div>
      
      <div id="jadwal_ganjil_wrap"></div>
      <div id="jadwal_genap_wrap"></div>
  
  @endsection