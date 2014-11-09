<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld"%>
<%@ taglib prefix="t" uri="/WEB-INF/tld/struts-privilege.tld"%>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>

<a:body>
	<div class="breadcrumbs" id="breadcrumbs">
		<script type="text/javascript">
			try {
				ace.settings.check('breadcrumbs', 'fixed')
			} catch (e) {
			}
		</script>
		<ul class="breadcrumb">
			<li><i class="ace-icon fa fa-home home-icon"></i> <a
				href="index.do">首页</a></li>
			<li>系统管理</li>
			<li class="active">新增角色信息</li>
		</ul>
	</div>
	<form action="roleAddSubmit.do" id="form" method="post">
		<table class="table table-striped table-bordered table-condensed">
			<tr>
				<td width="20%"  style="text-align: right;"><strong class="text-success">用户名</strong></td>
				<td colspan='3'><input type="text" name="role.name"
					class="{required:true,maxlength:64}" /></td>
			</tr>
			<s:iterator value="moduleResources" status="vs">
					</tr>
				<td style="text-align: right;"><strong
					class="text-success text-right"><s:property value="key" /></strong></td>
				<td><s:iterator value="value.resources">
						<input type="checkbox" name="resourceIdSelect"
							value='<s:property value="id"/>'
							id="<s:property value="key"/>_<s:property value="name"/>" />
						<label for="<s:property value="key"/>_<s:property value="name"/>"><s:property
								value="name" /></label>
					</s:iterator></td>
					</tr>
			</s:iterator>
			<tr>
				<td style="text-align: right;"><strong class="text-success">备注信息</strong></td>
				<td colspan='3'><textarea type="text" 
						name="role.des" class="{maxlength:512}"></textarea></td>
			</tr>
			<tr>
				<td colspan='4' style="text-align: center;">
					<button class="btn btn-sm btn-primary" type="submit">提交</button>
				</td>
			</tr>
		</table>
	</form>
</a:body>
<script type="text/javascript">
	$(document).ready(function() {
		$('#systemMenu').addClass("active open");
		$('#roleList').addClass("active");
		$("#form").validate();
	});
</script>

