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
			<li class="active">角色信息详情</li>
		</ul>
	</div>
	<table class="table table-striped table-bordered table-condensed">
		<tr>
			<td width="20%" style="text-align: right;"><strong
				class="text-success">用户名</strong></td>
			<td colspan='3'><input readonly type="text" size="60"
				name="role.name" value="<s:property value="role.name"/>"
				class="{required:true,maxlength:64}" /></td>
		</tr>
		<s:iterator value="moduleResources" status="vs">
			<s:if test="#vs.index mod 2 ==0">
				<tr>
			</s:if>
			<td style="text-align: right;"><strong
				class="text-success text-right"><s:property value="key" /></strong></td>
			<td><s:iterator value="value.resources">
					<s:if test="checked == true">
						<input readonly type="checkbox" name="resourceIdSelect" checked
							value='<s:property value="id"/>'
							id="<s:property value="key"/>_<s:property value="name"/>" />
					</s:if>
					<s:else>
						<input readonly type="checkbox" name="resourceIdSelect"
							value='<s:property value="id"/>'
							id="<s:property value="key"/>_<s:property value="name"/>" />
					</s:else>
					<label for="<s:property value="key"/>_<s:property value="name"/>"><s:property
							value="name" /></label>
				</s:iterator></td>
			<s:if test="#vs.index % 2 ==1 ||#vs.last">
				</tr>
			</s:if>
		</s:iterator>
		<tr>
			<td style="text-align: right;"><strong class="text-success">备注信息</strong></td>
			<td colspan='3'><textarea readonly type="text" rows="5"
					cols="80" name="role.des" class="{maxlength:512}">
					<s:property value="role.name" />
				</textarea></td>

		</tr>
	</table>
</a:body>
<script type="text/javascript">
	$(document).ready(function() {
		$('#systemMenu').addClass("active open");
		$('#roleList').addClass("active");
	});
</script>




