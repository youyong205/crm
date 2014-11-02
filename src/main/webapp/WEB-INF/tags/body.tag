<%@ tag trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld"%>
<html lang="en"><head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta charset="utf-8">
		<title>CRM管理系统</title>

		<meta name="description" content="Restyling jQuery UI Widgets and Elements">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="assets/css/bootstrap.min.css">
		<link rel="stylesheet" href="assets/css/font-awesome.min.css">

		<!-- page specific plugin styles -->
		<link rel="stylesheet" href="assets/css/jquery-ui.min.css">

		<!-- text fonts -->
		<link rel="stylesheet" href="assets/css/ace-fonts.css">

		<!-- ace styles -->
		<link rel="stylesheet" href="assets/css/ace.min.css" id="main-ace-style">

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="assets/css/ace-part2.min.css" />
		<![endif]-->
		<link rel="stylesheet" href="assets/css/ace-skins.min.css">
		<link rel="stylesheet" href="assets/css/ace-rtl.min.css">

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
	</head>

	<body class="no-skin">
		<!-- #section:basics/navbar.layout -->
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
							CRM管理系统
						</small>
					</a>

					<!-- /section:basics/navbar.layout.brand -->

					<!-- #section:basics/navbar.toggle -->

					<!-- /section:basics/navbar.toggle -->
				</div>
				<!-- #section:basics/navbar.dropdown -->
				<%-- <div class="navbar-buttons navbar-header pull-right" role="navigation">
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
			</div> --%>
				<!-- /section:basics/navbar.dropdown -->
			</div><!-- /.navbar-container -->
		</div>

		<!-- /section:basics/navbar.layout -->
		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

			<!-- #section:basics/sidebar -->
			<div id="sidebar" class="sidebar                  responsive">
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
				</script>

				<div class="sidebar-shortcuts-large text-center" id="sidebar-shortcuts-large">
						<span >
						<small>欢迎您, ${session.user.userName}
						<a href="logout.do">
							<i class="ace-icon fa fa-power-off"></i>注销
						</a></small>
					</span>
						<!-- /section:basics/sidebar.layout.shortcuts -->
					</div>
					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
					</div><!-- /.sidebar-shortcuts -->

				<ul class="nav  nav-list" style="top: 0px;">
			<li id="shopMenu" class="hsub"><a href="#" class="dropdown-toggle"> <i
				class="menu-icon fa fa-desktop"></i> <span class="menu-text">店铺管理</span>
		    <b class="arrow fa fa-angle-down"></b>
		    </a> <b class="arrow"></b>

			<ul class="submenu">
				<li id="reportList" class=""><a href="index.do"> <i
						class="menu-icon fa fa-caret-right"></i> 营业信息
				</a> <b class="arrow"></b></li>
				<li id="shopList" class=""><a href="shopList.do"> <i
						class="menu-icon fa fa-caret-right"></i> 店铺信息
				</a> <b class="arrow"></b></li>
				<li id="menuList" class="menuList"><a href='menuList.do?shopId=<s:property value="shopId"/>&index=<s:property value="index"/>'> <i
						class="menu-icon fa fa-caret-right"></i> 菜品管理
				</a> <b class="arrow"></b></li>

				<li id="memberList" class=""><a href=""> <i
						class="menu-icon fa fa-caret-right"></i> 员工管理
				</a> <b class="arrow"></b></li>
				<li id="orderList" class=""><a href='orderList.do?shopId=<s:property value="shopId"/>&index=<s:property value="index"/>'> <i
						class="menu-icon fa fa-caret-right"></i> 订单管理
				</a> <b class="arrow"></b></li>
			</ul></li>
		<li id="systemMenu" class="hsub"><a href="#" class="dropdown-toggle">
				<i class="menu-icon fa fa-tag"></i> <span class="menu-text">系统管理</span>
				<b class="arrow fa fa-angle-down"></b>
			</a> <b class="arrow"></b>

			<ul class="submenu">
				<li id="userList" ><a href="userList.do"> <i
						class="menu-icon fa fa-caret-right"></i> 用户管理
				</a> <b class="arrow"></b></li>
				<li id="roleList" ><a href="roleList.do"> <i
						class="menu-icon fa fa-caret-right"></i> 角色管理
				</a> <b class="arrow"></b></li>
				<li id="resourceList" ><a href="resourceList.do"> <i
						class="menu-icon fa fa-caret-right"></i> 资源管理
				</a> <b class="arrow"></b></li>
				<li id="logList" ><a href="logList.do"> <i
						class="menu-icon fa fa-caret-right"></i> 操作日志
				</a> <b class="arrow"></b></li>
			</ul></li>
		</ul>
				
				<!-- #section:basics/sidebar.layout.minimize -->
				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>

				<!-- /section:basics/sidebar.layout.minimize -->
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
				</script>
			</div>
				
			<!-- /section:basics/sidebar -->
			<div class="main-content">
				<div id="dialog-message" class="hide">
					<p>
						你确定要删除吗？(不可恢复)
					</p>
				</div>
				<jsp:doBody />
				
				<!-- #section:basics/content.breadcrumbs -->

				<!-- /section:basics/content.breadcrumbs -->
			</div><!-- /.main-content -->

			<div class="footer">
				<div class="footer-inner">
					<!-- #section:basics/footer -->
					<div class="footer-content">
						<span class="bigger-120">
							<span class="blue bolder">CRM系统</span>
							Application © 2014-2015
						</span>
					</div>
					<!-- /section:basics/footer -->
				</div>
			</div>

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='assets/js/jquery.min.js'>"+"<"+"/script>");
		</script><script src="assets/js/jquery.min.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='assets/js/jquery1x.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="assets/js/bootstrap.min.js"></script>

		<!-- page specific plugin scripts -->
		<script src="assets/js/jquery-ui.min.js"></script>
		<script src="assets/js/jquery.ui.touch-punch.min.js"></script>

		<!-- ace scripts -->
		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			jQuery(function($) {
				//override dialog's title function to allow for HTML titles
				$.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
					_title: function(title) {
						var $title = this.options.title || '&nbsp;'
						if( ("title_html" in this.options) && this.options.title_html == true )
							title.html($title);
						else title.text($title);
					}
				}));
			
				$(".delete").on('click', function(e) {
					e.preventDefault();
					var anchor = this;
					var dialog = $( "#dialog-message" ).removeClass('hide').dialog({
						modal: true,
						title: "<div class='widget-header widget-header-small'><h4 class='smaller'><i class='ace-icon fa fa-check'></i>CRM管理系统提示</h4></div>",
						title_html: true,
						buttons: [ 
							{
								text: "Cancel",
								"class" : "btn btn-xs",
								click: function() {
									$( this ).dialog( "close" ); 
								} 
							},
							{
								text: "OK",
								"class" : "btn btn-primary btn-xs",
								click: function() {
									window.location.href=anchor.href;
								} 
							}
						]
					});
			
				});
				
				//tooltips
				$( "#show-option" ).tooltip({
					show: {
						effect: "slideDown",
						delay: 250
					}
				});
			
				$( "#hide-option" ).tooltip({
					hide: {
						effect: "explode",
						delay: 250
					}
				});
			
				$( "#open-event" ).tooltip({
					show: null,
					position: {
						my: "left top",
						at: "left bottom"
					},
					open: function( event, ui ) {
						ui.tooltip.animate({ top: ui.tooltip.position().top + 10 }, "fast" );
					}
				});
			
			
				//Menu
				$( "#menu" ).menu();
			
				//spinner
				var spinner = $( "#spinner" ).spinner({
					create: function( event, ui ) {
						//add custom classes and icons
						$(this)
						.next().addClass('btn btn-success').html('<i class="ace-icon fa fa-plus"></i>')
						.next().addClass('btn btn-danger').html('<i class="ace-icon fa fa-minus"></i>')
						
						//larger buttons on touch devices
						if('touchstart' in document.documentElement) 
							$(this).closest('.ui-spinner').addClass('ui-spinner-touch');
					}
				});
			
				//slider example
				$( "#slider" ).slider({
					range: true,
					min: 0,
					max: 500,
					values: [ 75, 300 ]
				});
			
			
				//jquery accordion
				$( "#accordion" ).accordion({
					collapsible: true ,
					heightStyle: "content",
					animate: 250,
					header: ".accordion-header"
				}).sortable({
					axis: "y",
					handle: ".accordion-header",
					stop: function( event, ui ) {
						// IE doesn't register the blur when sorting
						// so trigger focusout handlers to remove .ui-state-focus
						ui.item.children( ".accordion-header" ).triggerHandler( "focusout" );
					}
				});
				//jquery tabs
				$( "#tabs" ).tabs();
			});
		</script>
</body>
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
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="assets/js/jquery.metadata.js" type="text/javascript"></script>
	<script src="assets/js/jquery.validate.min.js" type="text/javascript"></script>
	<script src="assets/js/validate.js" type="text/javascript"></script>
	<script src="assets/js/bootstrap.datetimepicker.min.js" type="text/javascript"></script>
</html>
