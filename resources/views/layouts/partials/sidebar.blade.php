<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4" style="overflow: hidden; background-color: #0b232e;">
    <!-- Brand Logo -->
    <a href="/home/dashboard" class="brand-link" style="margin-left: 15px;">
      <img src="{{ asset('/img/logo-unej.png')}}" alt="" class="brand-image img-circle ml-n1">
      <span class="brand-text font-weight-bold" style="font-size: 16px">FASILKOM UNEJ</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">


      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">

          <li class="nav-item mt-2 pb-1 mb-1 d-flex" style="">
            <a href="/home" class="nav-link {{ (request()->segment(1) == 'home') ? 'active' : '' }}">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Dashboard
              </p>
            </a>
          </li>
          <li class="nav-header">MENU MANAGEMENT</li>
          <li class="nav-item">
            <a href="/managekuliah" class="nav-link {{ (request()->segment(1) == 'managekuliah') ? 'active' : '' }}">
              <i class="nav-icon fas fa-school"></i>
              <p>
                Manage Kuliah
              </p>
              <i class="right fas fa-angle-left arrow-kuliah"></i>
            </a>
            <ul class="nav nav-treeview-container treeview-kuliah">
               <li class="nav-item ml-2">
                <a href="/managekuliah/manageprodi" class="nav-link">
                  <i class="nav-icon fas fa-circle-notch {{ (request()->segment(2) == 'manageprodi') ? 'text-greenTheme rotate-90d' : '' }}"></i>
                  <p class="{{ (request()->segment(2) == 'manageprodi') ? 'text-greenTheme' : '' }}">
                    Manage Program Studi
                  </p>
                </a>
              </li>
              <li class="nav-item ml-2">
                <a href="/managekuliah/managematkul" class="nav-link">
                  <i class="nav-icon fas fa-circle-notch {{ (request()->segment(2) == 'managematkul') ? 'text-greenTheme rotate-90d' : '' }}"></i>
                  <p class="{{ (request()->segment(2) == 'managematkul') ? 'text-greenTheme' : '' }}">
                    Manage Mata Kuliah
                  </p>
                </a>
              </li>
              <li class="nav-item ml-2">
                <a href="/managekuliah/managedosen" class="nav-link">
                  <i class="nav-icon fas fa-circle-notch {{ (request()->segment(2) == 'managedosen') ? 'text-greenTheme rotate-90d' : '' }}"></i>
                  <p class="{{ (request()->segment(2) == 'managedosen') ? 'text-greenTheme' : '' }}">
                    Manage Dosen
                  </p>
                </a>
              </li>
              <li class="nav-item ml-2">
                <a href="/managekuliah/managekelas" class="nav-link">
                  <i class="nav-icon fas fa-circle-notch {{ (request()->segment(2) == 'managekelas') ? 'text-greenTheme rotate-90d' : '' }}"></i>
                  <p class="{{ (request()->segment(2) == 'managekelas') ? 'text-greenTheme' : '' }}">
                    Manage Kelas
                  </p>
                </a>
              </li>
             
            </ul>
          </li>
          <li class="nav-item">
            <a href="/manageruang" class="nav-link {{ (request()->segment(1) == 'manageruang') ? 'active' : '' }}">
              <i class="nav-icon far fa-square"></i>
              <p>
                Manage Ruang
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="/managewaktu" class="nav-link {{ (request()->segment(1) == 'managewaktu') ? 'active' : '' }}">
              <i class="nav-icon fas fa-clock"></i>
              <p>
                Manage Waktu
                <i class="right fas fa-angle-left arrow-waktu"></i>
              </p>
            </a>
            <ul class="nav nav-treeview-container treeview-waktu">
              <li class="nav-item ml-2">
                <a href="/managewaktu/managehari" class="nav-link">
                  <i class="nav-icon fas fa-circle-notch {{ (request()->segment(2) == 'managehari') ? 'text-greenTheme rotate-90d' : '' }}"></i>
                  <p class="{{ (request()->segment(2) == 'managehari') ? 'text-greenTheme' : '' }}">
                    Manage Hari
                  </p>
                </a>
              </li>
              <li class="nav-item ml-2">
                <a href="/managewaktu/managejam" class="nav-link">
                  <i class="nav-icon fas fa-circle-notch {{ (request()->segment(2) == 'managejam') ? 'text-greenTheme rotate-90d' : '' }}"></i>
                  <p class="{{ (request()->segment(2) == 'managejam') ? 'text-greenTheme' : '' }}">
                    Manage Jam
                  </p>
                </a>
              </li>
            </ul>
          </li>
           {{-- @endif --}}
          <li class="nav-header">MENU PENJADWALAN KULIAH</li>
          <li class="nav-item {{ (request()->segment(1) == 'generatejadwal' || request()->segment(1) == 'hasiljadwal') ? 'menu-open' : '' }}">
            <a href="/" class="nav-link {{ (request()->segment(1) == 'generatejadwal' || request()->segment(1) == 'hasiljadwal') ? 'active' : '' }}">
              <i class="nav-icon fas fa-clipboard-list"></i>
              <p>
                Penjadwalan Kuliah
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview list-jadwal">
              {{-- @if($user_login->role_id == 1) --}}
              <li class="nav-item">
                <a href="/generatejadwal" class="nav-link pl-4">
                  <i class="far fa-circle nav-icon {{ (request()->segment(1) == 'generatejadwal') ? 'text-greenTheme' : '' }}"></i>
                  <p class="{{ (request()->segment(1) == 'generatejadwal') ? 'text-greenTheme' : '' }}">Generate Jadwal</p>
                </a>
              </li>
              {{-- @endif --}}
              <li class="nav-item">
                <a href="/hasiljadwal" class="nav-link pl-4">
                  <i class="far fa-circle nav-icon {{ (request()->segment(1) == 'hasiljadwal') ? 'text-greenTheme' : '' }}"></i>
                  <p class="{{ (request()->segment(1) == 'hasiljadwal') ? 'text-greenTheme' : '' }}">Hasil Jadwal</p>
                </a>
              </li>
            </ul>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

 