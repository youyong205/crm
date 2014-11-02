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
			<li class="active">新增资源信息</li>
		</ul>
	</div><form action="resourceAddSubmit.do" id="form" method="post">
		<table class="table table-striped table-bordered table-condensed">
			<tr>
				<td style="text-align: right;"><strong
					class="text-success">模块名</strong></td>
				<td><s:select name="resource.module" id="module" list="modules"
						theme="simple">
					</s:select></td>
			</tr>
			<tr>
				<td width="20%" style="text-align: right;"><strong
					class="text-success">资源名</strong></td>
				<td><select name="resource.name">
						<option value="详情">详情</option>
						<option value="新增">新增</option>
						<option value="编辑">编辑</option>
						<option value="删除">删除</option>
				</select></td>
			</tr>
			<tr>
				<td style="text-align: right;"><strong class="text-success">备注信息</strong></td>
				<td colspan='3'><textarea type="text" rows="5" cols="80"
						name="resource.des" class="{maxlength:512}"></textarea></td>
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
		$('#resourceList').addClass("active");
		$("#form").validate();
	});
</script>





