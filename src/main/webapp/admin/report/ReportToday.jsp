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
			<li class="active">今日营业</li>
		</ul>
	</div>
		      <div align="center">
	<form id="form" class="form-inline"  action="today.do" method="post">
		<table>
			<td>
			<strong>店铺</strong>
			  		 <s:select name="shopId" id="shop"
						list="shops"  listKey="id" listValue="name"  value="shopId"
						theme="simple" >
				 </s:select>
			</td>
            <td style="padding-left:3px;">
			  	<button type="submit" class="btn btn-success btn-sm">查询</button></div>
			  </td>
		</table>
	</form></div>

	<div class="row">
		<div class="col-sm-3 text-center">
			<!-- #section:pages/dashboard.infobox -->
			<div class="infobox infobox-green">
				<div class="infobox-icon">
					<i class="ace-icon fa fa-comments"></i>
				</div>

				<div class="infobox-data">
					<span class="infobox-data-number"><s:property
							value="report.money" /></span>
					<div class="infobox-content">当天营业额</div>
				</div>

				<!-- #section:pages/dashboard.infobox.stat -->
				<div class="stat stat-success">8%</div>

				<!-- /section:pages/dashboard.infobox.stat -->
			</div>

			<div class="infobox infobox-blue">
				<div class="infobox-icon">
					<i class="ace-icon fa fa-twitter"></i>
				</div>

				<div class="infobox-data">
					<span class="infobox-data-number"><s:property
							value="report.number" /></span>
					<div class="infobox-content">当天客流</div>
				</div>

				<div class="badge badge-success">
					+32% <i class="ace-icon fa fa-arrow-up"></i>
				</div>
			</div>

			<div class="infobox infobox-pink">
				<div class="infobox-icon">
					<i class="ace-icon fa fa-shopping-cart"></i>
				</div>

				<div class="infobox-data">
					<span class="infobox-data-number"><s:property
							value="report.avg" /></span>
					<div class="infobox-content">当天人均</div>
				</div>
				<div class="stat stat-important">4%</div>
			</div>
			<!-- /section:pages/dashboard.infobox.dark -->
		</div>
		<div class="col-sm-8">
			<div style="margin-top:5px">
				<button class="btn btn-danger btn-block" id="addOrder">记一笔</button>
			</div>

			<div class="widget-box">
				<div class="widget-header">
					<h4 class="widget-title">今日订单详情&nbsp;&nbsp;<s:date name="start" format="yyyy-MM-dd"/></h4>
				</div>

				<div class="widget-body">
					<table
						class="table table-striped table-bordered table-condensed table-hover">
						<thead>
							<tr class="text-right">
								<th class="text-right">人数</th>
								<th class="text-right">价格</th>
								<th class="text-right">人均</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="orders" status="vs">
								<tr class="text-right">
									<td><s:property value="number" /></td>
									<td><s:property value="money1+money2+money3" /></td>
									<td><s:property value="avg" /></td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

</a:body>
<script type="text/javascript">
	$(document).ready(function() {
		$('#shopMenu').addClass("active open");
		$('#reportToday').addClass("active");
		
		$('#addOrder').bind("click",function(){
			var shopId =<s:property value="shopId"/>;
			var href = "orderAdd.do?shopId="+shopId+"&index=1&tag=index"
			window.location.href=href;
		})
	});
</script>





