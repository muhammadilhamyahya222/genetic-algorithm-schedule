<footer class="main-footer mb-n5" style="background-color: #f5f7fa; color: #181c33;">
    <strong>Sistem Penjadwalan Kuliah Fasilkom UNEJ.</strong>
   <!--  <div class="float-right d-none d-sm-inline-block">z
      <b>Version</b> 1.0
    </div> -->
  </footer>

</div>
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="{{ asset('/AdminLTE/plugins/jquery/jquery.min.js')}}"></script>
<!-- jQuery UI 1.11.4 -->
<script src="{{ asset('/AdminLTE/plugins/jquery-ui/jquery-ui.min.js')}}"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="{{ asset('/AdminLTE/plugins/bootstrap/js/bootstrap.bundle.min.js')}}"></script>
<!-- sweetAlert 2 -->
<script src="{{ asset('/AdminLTE/plugins/sweetalert2/sweetalert2.all.min.js')}}"></script>
<!-- ChartJS -->
<script src="{{ asset('/AdminLTE/plugins/chart.js/Chart.min.js')}}"></script>
<!-- Sparkline -->
<script src="{{ asset('/AdminLTE/plugins/sparklines/sparkline.js')}}"></script>
<!-- JQVMap -->
<script src="{{ asset('/AdminLTE/plugins/jqvmap/jquery.vmap.min.js')}}"></script>
<script src="{{ asset('/AdminLTE/plugins/jqvmap/maps/jquery.vmap.usa.js')}}"></script>
<!-- JQuery -->
<script src="{{ asset('/AdminLTE/plugins/jquery/jquery.min.js')}}"></script>
<!-- jQuery Knob Chart -->
<script src="{{ asset('/AdminLTE/plugins/jquery-knob/jquery.knob.min.js')}}"></script>
<!-- daterangepicker -->
<script src="{{ asset('/AdminLTE/plugins/moment/moment.min.js')}}"></script>
<script src="{{ asset('/AdminLTE/plugins/daterangepicker/daterangepicker.js')}}"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="{{ asset('/AdminLTE/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js')}}"></script>
<!-- Bootstrap Switch -->
<script src="{{ asset('/AdminLTE/plugins/bootstrap-switch/js/bootstrap-switch.min.js')}}"></script>
<!-- Summernote -->
<script src="{{ asset('/AdminLTE/plugins/summernote/summernote-bs4.min.js')}}"></script>
<!-- overlayScrollbars -->
<script src="{{ asset('/AdminLTE/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js')}}"></script>
<!-- AdminLTE App -->
<script src="{{ asset('/AdminLTE/dist/js/adminlte.js')}}"></script>
<!-- AdminLTE for demo purposes -->
<script src="{{ asset('/AdminLTE/dist/js/demo.js')}}"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="{{ asset('/AdminLTE/dist/js/pages/dashboard.js')}}"></script>
<!-- Select2 -->
<script src="{{ asset('/AdminLTE/plugins/select2/js/select2.full.min.js')}}"></script>
<!-- Custom javascript file -->
<script type="text/javascript">
	$.ajaxSetup({
		headers: {
			'X-CSRF-TOKEN' : $('meta[name="csrf-token"]').attr('content')
		}
	})
	</script>
<script src="{{ asset('/js/script.js')}}"></script>

</body>
</html>
