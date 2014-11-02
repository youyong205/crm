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
			<li>店铺管理</li>
			<li class="active">菜单信息</li>
		</ul>
	</div>
		<table class="table table-striped table-bordered table-condensed">
			<tr>
				<input type="hidden" name="shopId"
					value="<s:property value="shopId"/>" />
				<td style="text-align: right;"><strong
					class="text-success">商户名</strong></td>
				<td><s:select name="menu.shopId" list="shops"  listKey="id" listValue="name" 
					value="menu.shopId"	theme="simple">
					</s:select></td>
			</tr>
			<tr>
				<td width="20%" style="text-align: right;"><strong
					class="text-success">名称</strong></td>
				<td><input type="text" name="menu.name" value="<s:property value="menu.name"/>"
					class="{required:true,maxlength:64}" /></td>
			</tr>
			<tr>
				<td style="text-align: right;"><strong
					class="text-success">价格</strong></td>
				<td><input type="text" name="menu.price" value="<s:property value="menu.price"/>"
					class="{required:true,number:true}" /></td>
			</tr>
			<tr>
				<td style="text-align: right;"><strong
					class="text-success">售卖量</strong></td>
				<td><input type="text" name="menu.count" value="<s:property value="menu.count"/>"
					class="{required:true,number:true}" /></td>
			</tr>
			<tr>
				<td style="text-align: right;"><strong class="text-success">描述</strong></td>
				<td><textarea type="text" 
						name="menu.detail" class="{maxlength:512}"><s:property value="menu.detail"/></textarea></td>
			</tr>
		</table>
</a:body>
<script type="text/javascript">
	$(document).ready(function() {
		$('#shopMenu').addClass("active open");
		$('#menuList').addClass("active");
	});
</script>




