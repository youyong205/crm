<%@ tag trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>

<div id="sidebar" class="sidebar responsive">
	<script type="text/javascript">
		try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
	</script>
	<ul class="nav nav-list" style="top: 0px;">
		<li class="hsub"><a href="#" class="dropdown-toggle"> <i
				class="menu-icon fa fa-desktop"></i> <span class="menu-text">店铺管理</span>

				<b class="arrow fa fa-angle-down"></b>
		</a> <b class="arrow"></b>

			<ul class="submenu">
				<li class=""><a href=""> <i
						class="menu-icon fa fa-caret-right"></i> 店铺信息
				</a> <b class="arrow"></b></li>
				<li class=""><a href=""> <i
						class="menu-icon fa fa-caret-right"></i> 菜品管理
				</a> <b class="arrow"></b></li>

				<li class=""><a href=""> <i
						class="menu-icon fa fa-caret-right"></i> 员工管理
				</a> <b class="arrow"></b></li>
				<li class=""><a href=""> <i
						class="menu-icon fa fa-caret-right"></i> 订单管理
				</a> <b class="arrow"></b></li>
			</ul></li>

		<li class="hsub"><a href="#" class="dropdown-toggle"> <i
				class="menu-icon fa fa-list"></i> <span class="menu-text">
					分析报表 </span> <b class="arrow fa fa-angle-down"></b>
		</a> <b class="arrow"></b>
			<ul class="submenu">
				<li class=""><a href=""> <i
						class="menu-icon fa fa-caret-right"></i> 菜品分析
				</a> <b class="arrow"></b></li>

				<li class=""><a href=""> <i
						class="menu-icon fa fa-caret-right"></i> 营业额分析
				</a> <b class="arrow"></b></li>
				<li class=""><a href=""> <i
						class="menu-icon fa fa-caret-right"></i> 客流分析
				</a> <b class="arrow"></b></li>
				<li class=""><a href=""> <i
						class="menu-icon fa fa-caret-right"></i> 人均分析
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
	<!-- /.nav-list -->

	<!-- #section:basics/sidebar.layout.minimize -->
	<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
		<i class="ace-icon fa fa-angle-double-left"
			data-icon1="ace-icon fa fa-angle-double-left"
			data-icon2="ace-icon fa fa-angle-double-right"></i>
	</div>

	<!-- /section:basics/sidebar.layout.minimize -->
	<script type="text/javascript">
		try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
	</script>
</div>
