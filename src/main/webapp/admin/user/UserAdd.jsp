<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld"%>
<%@ taglib prefix="t" uri="/WEB-INF/tld/struts-privilege.tld"%>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>

<a:body>
	<div class="breadcrumbs" id="breadcrumbs">
		<script type="text/javascript">
			try {ace.settings.check('breadcrumbs', 'fixed')} catch (e) {}
		</script>
		<ul class="breadcrumb">
			<li><i class="ace-icon fa fa-home home-icon"></i> <a
				href="index.do">首页</a></li>
			<li>店铺管理</li>
			<li class="active">新增员工</li>
		</ul>
	</div>
	<form action="userAddSubmit.do" id="form" method="post">
		<table class="table table-striped table-bordered table-condensed">
			<input type="hidden" name="shopId"
					value="<s:property value="shopId"/>" />
			<tr>
				<td style="text-align: right;"><strong
					class="text-success">商户名</strong></td>
				<td><s:select name="user.shopId" list="shops"  listKey="id" listValue="name"  value="shopId"
						theme="simple">
					</s:select></td>
			</tr>
			<tr>
				<td width="20%"  style="text-align: right;"><strong class="text-success">用户名</strong></td>
				<td><input type="text" name="user.userName"
					class="{required:true,maxlength:64}" /></td>
			</tr>
			<tr>
				<td style="text-align: right;"><strong class="text-success">密码</strong></td>
				<td><input type="text" name="user.password"
					class="{required:true,maxlength:64}" /></td>
			</tr>
			<tr>
				<td style="text-align: right;"><strong class="text-success">真实姓名</strong></td>
				<td><input type="text" name="user.realName"
					class="{required:true,maxlength:64}" /></td>
			</tr>
			<tr>
				<td style="text-align: right;"><strong
					class="text-success text-right">用户角色</strong></td>
				<td><s:checkboxlist list="roles" listKey="id" listValue="name"
						name="roleIdSelect" theme="simple">
					</s:checkboxlist></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<button class="btn btn-sm btn-primary" type="submit">提交</button>
				</td>
			</tr>
		</table>
	</form>
</a:body>
<script type="text/javascript">
$(document).ready(function() {
	$('#shopMenu').addClass("active open");
	$('#userList').addClass("active");
	$("#form").validate();
});
</script>
