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
				href="index.action">首页</a></li>
			<li>系统管理</li>
			<li class="active">资源信息</li>
		</ul>
	</div><table class="table table-striped table-bordered table-condensed">
		<tr>
			<td width="20%"  style="text-align: right;"><strong
				class="text-success">模块名</strong></td>
			<td><s:select name="resource.module" id="module" list="modules"
					value="resource.module" theme="simple">
				</s:select></td>
		</tr>
		<tr>
			<td style="text-align: right;"><strong
				class="text-success">资源名</strong></td>
			<td><select name="resource.name" id="name">
					<option value="详情">详情</option>
					<option value="新增">新增</option>
					<option value="编辑">编辑</option>
					<option value="删除">删除</option>
			</select></td>
		</tr>
		<tr>
			<td style="text-align: right;"><strong class="text-success">备注信息</strong></td>
			<td colspan='3'><textarea readonly type="text" rows="5"
					cols="80" name="resource.des" class="{maxlength:512}">
					<s:property value="resource.des" />
				</textarea></td>

		</tr>
	</table>
</a:body>
<script type="text/javascript">
	$(document).ready(function() {
		$('#systemMenu').addClass("active open");
		$('#resourceList').addClass("active");
		$('#name').val("<s:property value="resource.name"/>");

	});
</script>




