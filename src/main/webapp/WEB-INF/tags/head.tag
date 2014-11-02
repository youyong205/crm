<%@ tag trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<meta name="description" content="" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="assets/css/font-awesome.min.css" />

		<!-- page specific plugin styles -->

		<!-- text fonts -->
		<link rel="stylesheet" href="assets/css/ace-fonts.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="assets/css/ace.min.css" id="main-ace-style" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="assets/css/ace-part2.min.css" />
		<![endif]-->
		<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->
		<script src="assets/js/ace-extra.min.js"></script>

		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

		<!--[if lte IE 8]>
		<script src="assets/js/html5shiv.min.js"></script>
		<script src="assets/js/respond.min.js"></script>
		<![endif]-->
<style>
	label.error{
		color:red;
		background: url('assets/img/unchecked.gif') no-repeat;
		padding-left: 16px;
		margin-left: .3em;
	}
	table{font-size:small;margin-left:2px;}
	#breadcrumbs{margin-left:2px;}
</style>
<div id="navbar" class="navbar navbar-default">
		<script type="text/javascript">
			try{ace.settings.check('navbar' , 'fixed')}catch(e){}
		</script>
		<div class="navbar-container" id="navbar-container">
	<!-- #section:basics/sidebar.mobile.toggle -->
	<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler">
		<span class="sr-only">Toggle sidebar</span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
	</button>
	<!-- /section:basics/sidebar.mobile.toggle -->
	<div class="navbar-header pull-left">
		<!-- #section:basics/navbar.layout.brand -->
		<a href="#" class="navbar-brand">
			<small>
				<i class="fa fa-leaf"></i>
				Ace Admin
			</small>
		</a>

		<!-- /section:basics/navbar.layout.brand -->

		<!-- #section:basics/navbar.toggle -->

		<!-- /section:basics/navbar.toggle -->
	</div>

	<!-- #section:basics/navbar.dropdown -->
	<div class="navbar-buttons navbar-header pull-right" role="navigation">
		<ul class="nav ace-nav" >
			<!-- #section:basics/navbar.user_menu -->
			<li class="light-blue">
				<a data-toggle="dropdown" href="#" class="dropdown-toggle">
					<img class="nav-user-photo" src="assets/avatars/user.jpg" alt="Jason's Photo">
					<span class="user-info">
						<small>欢迎您,</small>
						${session.user.userName}
					</span>

					<i class="ace-icon fa fa-caret-down"></i>
				</a>

				<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
					<li>
						<a href="#">
							<i class="ace-icon fa fa-power-off"></i>
							<a href="logout.do" >注销</a>
						</a>
					</li>
				</ul>
			</li>

			<!-- /section:basics/navbar.user_menu -->
		</ul>
	</div>
	<!-- /section:basics/navbar.dropdown -->
</div>
</div>
		