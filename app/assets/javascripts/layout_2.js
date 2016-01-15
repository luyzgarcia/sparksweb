//= require jquery2
//= require jquery_ujs
//= require twitter/bootstrap

/*Angularjs*/
//= require angularjs/angular
//= require angularjs/angular-route
//= require angularjs/angular-resource.min


//= require angular-rails-templates

//// Templates in app/assets/javascript/templates
//= require_tree ./sparksApp/templates
// require_tree ./templates

//Sparks app
//= require sparksApp/app
//= require sparksApp/routes




//Users
//= require sparksApp/components/users/usersCtrl.js
//= require sparksApp/components/users/usersService.js
// require_tree .


//= require ../../../vendor/assets/plugins/pace/pace.min


//= require_tree ../../../vendor/assets/plugins/jquery/.
//= require_tree ../../../vendor/assets/plugins/jquery-ui/.
//= require_tree ../../../vendor/assets/plugins/bootstrap/.

// require_tree ../../../vendor/assets/crossbrowserjs/.

//= require_tree ../../../vendor/assets/plugins/slimscroll/.
//= require_tree ../../../vendor/assets/plugins/jquery-cookie/.

//= require ../../../vendor/assets/plugins/gritter/js/jquery.gritter
//= require ../../../vendor/assets/plugins/flot/jquery.flot.min
//= require ../../../vendor/assets/plugins/flot/jquery.flot.time.min
//= require ../../../vendor/assets/plugins/flot/jquery.flot.resize.min
//= require ../../../vendor/assets/plugins/flot/jquery.flot.pie.min
//= require ../../../vendor/assets/plugins/sparkline/jquery.sparkline
//= require ../../../vendor/assets/plugins/jquery-jvectormap/jquery-jvectormap-1.2.2.min
//= require ../../../vendor/assets/plugins/jquery-jvectormap/jquery-jvectormap-world-mill-en
//= require ../../../vendor/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker

//= require ../../../vendor/assets/plugins/slimscroll/jquery.slimscroll.min
//= require ../../../vendor/assets/plugins/jquery-cookie/jquery.cookie

//= require ../../../vendor/assets/plugins/gritter/js/jquery.gritter
//= require ../../../vendor/assets/plugins/flot/jquery.flot.min
//= require ../../../vendor/assets/plugins/flot/jquery.flot.time.min
//= require ../../../vendor/assets/plugins/flot/jquery.flot.resize.min
//= require ../../../vendor/assets/plugins/flot/jquery.flot.pie.min
//= require ../../../vendor/assets/plugins/sparkline/jquery.sparkline
//= require ../../../vendor/assets/plugins/jquery-jvectormap/jquery-jvectormap-1.2.2.min
//= require ../../../vendor/assets/plugins/jquery-jvectormap/jquery-jvectormap-world-mill-en
//= require ../../../vendor/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker
//= require ../../../vendor/assets/javascripts/color_admin/dashboard.min
//= require ../../../vendor/assets/javascripts/color_admin/apps.min

/*
<!-- ================== BEGIN BASE JS ================== -->
<script src="assets/plugins/jquery/jquery-1.9.1.min.js"></script>
<script src="assets/plugins/jquery/jquery-migrate-1.1.0.min.js"></script>
<script src="assets/plugins/jquery-ui/ui/minified/jquery-ui.min.js"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!--[if lt IE 9]>
<script src="assets/crossbrowserjs/html5shiv.js"></script>
<script src="assets/crossbrowserjs/respond.min.js"></script>
<script src="assets/crossbrowserjs/excanvas.min.js"></script>
<![endif]-->
<script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="assets/plugins/jquery-cookie/jquery.cookie.js"></script>
    <!-- ================== END BASE JS ================== -->

    <!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="assets/plugins/gritter/js/jquery.gritter.js"></script>
<script src="assets/plugins/flot/jquery.flot.min.js"></script>
<script src="assets/plugins/flot/jquery.flot.time.min.js"></script>
<script src="assets/plugins/flot/jquery.flot.resize.min.js"></script>
<script src="assets/plugins/flot/jquery.flot.pie.min.js"></script>
<script src="assets/plugins/sparkline/jquery.sparkline.js"></script>
<script src="assets/plugins/jquery-jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="assets/plugins/jquery-jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="assets/js/dashboard.min.js"></script>
<script src="assets/js/apps.min.js"></script>
    <!-- ================== END PAGE LEVEL JS ================== -->*/

$(document).ready(function() {
    App.init();
    //Dashboard.init();
});