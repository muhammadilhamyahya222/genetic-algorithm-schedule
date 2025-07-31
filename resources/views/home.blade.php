@extends('layouts.app')

@section('title','Dashboard | Sistem Penjadwalan Kuliah')

@section('content')
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Dashboard</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/"><i class="fas fa-igloo mr-2"></i>Home</a></li>
              <li class="breadcrumb-item active">Dashboard</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="row justify-content-around">
          <div class="col-lg-2 col-6" style="width: 25%;
          flex: 0 0 25%;max-width: 25%;">
            <!-- small box -->
            <div class="small-box" style="background-color: #113a50d6; color: #fff;">
              <div class="inner">
                <h3>{{$countDosen}}</h3>
                <p>DOSEN</p>
              </div>
              <div class="icon">
                <i class="fas fa-users" style="color: #ffffff61;"></i>
              </div>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-2 col-6" style="width: 25%;
          flex: 0 0 25%;max-width: 25%;">
            <!-- small box -->
            <div class="small-box" style="background-color: #009df7; color: #fff;">
              <div class="inner">
                <h3>{{$countMatkul}}</h3>
                <p>MATA KULIAH</p>
              </div>
              <div class="icon">
                <i class="fas fa-book" style="color: #ffffff90;"></i>
              </div>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-2 col-6" style="width: 25%;
          flex: 0 0 25%;max-width: 25%;">
            <!-- small box -->
            <div class="small-box" style="background-color: #ffc800; color: #fff;">
              <div class="inner">
                <h3>{{ $countRuang }}</h3>

                <p>RUANG</p>
              </div>
              <div class="icon">
                <i class="far fa-square" style="color: #ffffff90;"></i>
              </div>
            </div>
          </div>
          
          <!-- ./col -->
          <div class="col-lg-2 col-6" style="width: 25%;
          flex: 0 0 25%;max-width: 25%;">
            <!-- small box -->
            <div class="small-box" style="background-color: #f2416e; color: #fff;">
              <div class="inner">
                <h3>{{ $countJadwal }}</h3>
                <p>JADWAL</p>
              </div>
              <div class="icon">
                <i class="fas fa-clipboard-list" style="color: #ffffff90;"></i>
              </div>
            </div>
          </div>
        </div>
        <!-- /.row -->

        {{-- Row, search tahun ajaran --}}
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


        <!-- Main row -->
        
        <div id="jadwal_ganjil_wrap"></div>
        <div id="jadwal_genap_wrap"></div>

          
  </div>
  <!-- /.content-wrapper -->
  @endsection