<!-- HEADER -->

@include('layouts.partials.header');
@include('layouts.partials.sidebar');
@include('layouts.partials.navbar');

<main>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper" style="background-color: #f5f7fa; color: #181c33;">
    @yield('content')
</main>

@include('layouts.partials.footer');