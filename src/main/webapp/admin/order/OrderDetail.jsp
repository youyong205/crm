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
			<li>店铺管理</li>
			<li class="active">订单信息</li>
		</ul>
	</div>
		<table class="table table-striped table-bordered table-condensed">
			<tr>
				<input type="hidden" name="shopId"
					value="<s:property value="shopId"/>" />
				<td style="text-align: right;"><strong
					class="text-success">商户名</strong></td>
				<td><s:select name="order.shopId" list="shops"  listKey="id" listValue="name"  value="shopId"
						theme="simple">
					</s:select></td>
			</tr>
			<tr>
				<td width="20%" style="text-align: right;"><strong
					class="text-success">时间</strong></td>
				<td>
		           <input name="order.period"  id="datetimepicker1" readonly class="{required:true,date:true}"
		              value='<s:date name="order.period" format="yyyy-MM-dd"/>'/>
		           </span>
				</td>
			</tr>
			<tr>
				<td style="text-align: right;"><strong
					class="text-success">类型</strong></td>
				<td>
					<select id="type" name="order.type">
						<option value="1">午市</option>
						<option value="2">晚市</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="text-align: right;"><strong
					class="text-success">天气</strong></td>
				<td>
					<select id="weather" name="order.weather">
						<option value="1">晴朗</option>
						<option value="2">多云</option>
						<option value="3">小雨</option>
						<option value="4">大雨</option>
					</select>
				</td>
			</tr>
			<tr>
				<td  style="text-align: right;"><strong
					class="text-success">现金收入</strong></td>
				<td><input type="text" name="order.money1" readonly value="<s:property value="order.money1"/>"
					class="{required:true,number:true}" /></td>
			</tr>
			<tr>
				<td style="text-align: right;"><strong
					class="text-success">刷卡收入</strong></td>
				<td><input type="text" name="order.money2" readonly value="<s:property value="order.money2"/>"
					class="{required:true,number:true}" /></td>
			</tr><tr>
				<td style="text-align: right;"><strong
					class="text-success">团购收入</strong></td>
				<td><input type="text" name="order.money3" readonly value="<s:property value="order.money3"/>"
					class="{required:true,number:true}" /></td>
			</tr><tr>
				<td style="text-align: right;"><strong
					class="text-success">桌数</strong></td>
				<td><input type="text" name="order.tableNumber" readonly value="<s:property value="order.tableNumber"/>"
					class="{required:true,number:true}" /></td>
			</tr><tr>
				<td style="text-align: right;"><strong
					class="text-success">总人数</strong></td>
				<td><input type="text" name="order.number" readonly value="<s:property value="order.number"/>"
					class="{required:true,number:true}" /></td>
			</tr>
			<tr>
				<td style="text-align: right;"><strong class="text-success">描述</strong></td>
				<td><textarea type="text"  readonly
						name="order.detail" class="{maxlength:512}"><s:property value="order.detail"/></textarea></td>
			</tr>
		</table>
</a:body>
<script type="text/javascript">
	$(document).ready(function() {
		$('#shopMenu').addClass("active open");
		$('#orderList').addClass("active");
		
		$('#type').val('<s:property value="order.type"/>');
		$('#weather').val('<s:property value="order.weather"/>');
	});
</script>




