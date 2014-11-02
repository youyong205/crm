<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld"%>
<%@ taglib prefix="t" uri="/WEB-INF/tld/struts-privilege.tld"%>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>

<a:body>
	<div class="breadcrumbs" id="breadcrumbs">
		<script type="text/javascript">
			try {ace.settings.check('breadcrumbs', 'fixed')
			} catch (e) {}
		</script>
		<ul class="breadcrumb">
			<li><i class="ace-icon fa fa-home home-icon"></i> <a
				href="index.action">首页</a></li>
			<li>系统管理</li>
			<li class="active">用户列表</li>
		</ul>
	</div>
	<table class="table table-striped table-bordered table-hover"
		style="font-size: small">
		<thead>
			<tr>
				<th>用户名</th>
				<th>真实姓名</th>
				<th>操作 <t:privilege res="用户模块:新增">
						<a class="space"
							href="userAdd.do?index=<s:property value="index"/>">
							<button class="btn btn-xs btn-warning">
								<i class=" ace-icon ace-icon fa fa-plus bigger-120"></i>
							</button>
						</a>
					</t:privilege>
				</th>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="users" status="vs">
				<tr>
					<td><s:property value="userName" /></td>
					<td><s:property value="realName" /></td>
					<td><t:privilege res="用户模块:详情">
							<a
								href="userDetail.do?userId=<s:property value="id"/>&index=<s:property value="index"/>">
								<button class="btn btn-xs btn-success">
									<i class="ace-icon fa fa-search-plus bigger-120"></i>
								</button>
							</a>
						</t:privilege> <t:privilege res="用户模块:编辑">
							<a
								href="userUpdate.do?userId=<s:property value="id"/>&index=<s:property value="index"/>">
								<button class="btn btn-xs btn-info">
									<i class="ace-icon fa fa-pencil bigger-120"></i>
								</button>
							</a>
						</t:privilege> <t:privilege res="用户模块:删除">
							<a class="delete "
								href="userDelete.do?userId=<s:property value="id"/>&index=<s:property value="index"/>">
								<button class="btn btn-xs btn-danger">
									<i class="ace-icon fa fa-trash-o bigger-120"></i>
								</button>
							</a>
						</t:privilege></td>
				</tr>
			</s:iterator>
		</tbody>
	</table>
	<div class="text-center">
		<ul class="pagination">
			<li><a href="?index=1">首页</a></li>
			<s:iterator id="item" value="pageIndexs">
				<s:if test="${item == index }">
					<li class="disabled"><a href="?index=${item}">${item}</a></li>
				</s:if>
				<s:else>
					<li><a href="?index=${item}">${item}</a></li>
				</s:else>
			</s:iterator>
			<li><a href="?index=${totalPages}">末页</a></li>
		</ul>
	</div>
</a:body>
<script type="text/javascript">
	$(document).ready(function() {
		$('#systemMenu').addClass("active open");
		$('#userList').addClass("active");
	});
</script>



