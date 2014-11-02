<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld"%>
<%@ taglib prefix="t" uri="/WEB-INF/tld/struts-privilege.tld"%>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>

<a:body>
	<table  class="table table-striped table-bordered table-condensed">
			<tr>
				<th colspan='2'><h4 class="text-info text-center">操作日志详细信息</h4></th>
			</tr>
			<tr>
				<td  style="text-align:right;"><strong class="text-success">模块名称</strong></td>
				<td><s:property value='log.module'/></td>
			</tr>
			<tr>
				<td  style="text-align:right;"><strong class="text-success">操作名称</strong></td>
				<td><s:property value='log.operation'/></td>
			</tr>
			<tr>
				<td  style="text-align:right;"><strong class="text-success">操作员</strong></td>
				<td><s:property value='log.user.realName'/></td>
			</tr>
			<tr>
				<td  style="text-align:right;"><strong class="text-success">操作详情</strong></td>
				<td><s:property value='log.detail'/></td>
			</tr>
			<tr>
				<td  style="text-align:right;"><strong class="text-success">操作时间</strong></td>
				<td><s:date name="log.creationDate" format="yyyy/MM/dd HH:mm" /></td>
			</tr>
			</table>
</a:body>

<script type="text/javascript">
$(document).ready(function() {
	$('#systemMenu').addClass("active open");
	$('#logList').addClass("active");
	$('#log_role').val("<s:property value="log.role"/>");
});
</script>




