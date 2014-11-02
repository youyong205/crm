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
			<li class="active">商户信息</li>
		</ul>
	</div><form action="shopUpdateSubmit.do" id="form" method="post">
		<table class="table table-striped table-bordered table-condensed">
			<tr>
				<input type="hidden" name="shop.id"
					value="<s:property value="shop.id"/>" />
				<input type="hidden" name="index"
					value="<s:property value="index"/>" />
				<input type="hidden" name="shop.bossId"
					value="<s:property value="shop.bossId"/>" />
			</tr>
			<tr>
				<td width="20%" style="text-align: right;"><strong
					class="text-success">商户名</strong></td>
				<td><input type="text" name="shop.name"
					class="{required:true,maxlength:128}" value="<s:property value="shop.name"/>" /></td>
			</tr><tr>
				<td  style="text-align: right;"><strong
					class="text-success">地址</strong></td>
				<td><input type="text" name="shop.address"
					class="{required:true,maxlength:128}" value="<s:property value="shop.address"/>" /></td>
			</tr><tr>
				<td  style="text-align: right;"><strong
					class="text-success">面积</strong></td>
				<td><input type="text" name="shop.area"
					class="{required:true,number:true}" value="<s:property value="shop.area"/>" /></td>
			</tr><tr>
				<td  style="text-align: right;"><strong
					class="text-success">房租</strong></td>
				<td><input type="text" name="shop.rent"
					class="{required:true,number:true}" value="<s:property value="shop.rent"/>" /></td>
			</tr>
			<tr>
				<td  style="text-align: right;"><strong
					class="text-success">前厅员工总数</strong></td>
				<td><input type="text" name="shop.staff1"
					class="{required:true,number:true}" value="<s:property value="shop.staff1"/>" /></td>
			</tr><tr>
				<td  style="text-align: right;"><strong
					class="text-success">前厅员工薪资</strong></td>
				<td><input type="text" name="shop.salary1"
					class="{required:true,number:true}" value="<s:property value="shop.salary1"/>" /></td>
			</tr><tr>
				<td  style="text-align: right;"><strong
					class="text-success">后厅员工总数</strong></td>
				<td><input type="text" name="shop.staff2"
					class="{required:true,number:true}" value="<s:property value="shop.staff2"/>" /></td>
			</tr><tr>
				<td  style="text-align: right;"><strong
					class="text-success">后厅员工总数</strong></td>
				<td><input type="text" name="shop.salary2"
					class="{required:true,number:true}" value="<s:property value="shop.salary2"/>" /></td>
			</tr><tr>
				<td  style="text-align: right;"><strong
					class="text-success">上月销售总额</strong></td>
				<td><input type="text" name="shop.sales"
					class="{required:true,number:true}" value="<s:property value="shop.sales"/>" /></td>
			</tr><tr>
				<td  style="text-align: right;"><strong
					class="text-success">上月采购总额</strong></td>
				<td><input type="text" name="shop.purchase"
					class="{required:true,number:true}" value="<s:property value="shop.purchase"/>" /></td>
			</tr><tr>
				<td  style="text-align: right;"><strong
					class="text-success">上月毛利率</strong></td>
				<td><input type="text" name="shop.interest"
					class="{required:true,number:true}" value="<s:property value="shop.interest"/>" /></td>
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
		$('#shopList').addClass("active");
		$("#form").validate();
	});
</script>



