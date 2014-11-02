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
				href="index.do">首页</a></li>
			<li>系统管理</li>
			<li class="active">编辑用户信息</li>
		</ul>
	</div>
	<form action="userUpdateSubmit.do" id="form" method="post">
		<table class="table table-striped table-bordered table-condensed">
			<tr>
				<input type="hidden" name="user.id" value="<s:property value="user.id"/>"/>
				<input type="hidden" name="index" value="<s:property value="index"/>"/>
				<td width="20%" style="text-align: right;"><strong
					class="text-success">用户名</strong></td>
				<td><input type="text" name="user.userName"
					value="<s:property value="user.userName"/>"
					class="{required:true,maxlength:64}" /></td>
			</tr>
			<tr>
				<td style="text-align: right;"><strong class="text-success">密码</strong></td>
				<td><input type="text" name="user.password"
					value="<s:property value="user.password"/>"
					class="{required:true,maxlength:64}" /></td>
			</tr>

			<tr>
				<td style="text-align: right;"><strong class="text-success">真实姓名</strong></td>
				<td><input type="text" name="user.realName"
					value="<s:property value="user.realName"/>"
					class="{required:true,maxlength:64}" /></td>
			</tr>
			<tr>
				<td style="text-align: right;"><strong
					class="text-success text-right">用户角色</strong></td>
				<td><s:checkboxlist list="roles" listKey="id" listValue="name"
						name="roleIdSelect" value="roleIdSelect" theme="simple">
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
		$('#systemMenu').addClass("active open");
		$('#userList').addClass("active");
		$("#form").validate();
	});
</script>



