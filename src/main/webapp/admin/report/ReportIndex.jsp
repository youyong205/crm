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
			<li class="active">历史报表</li>
		</ul>
	</div>
		        
	<form id="form" class="form-inline"  action="reportHistory.do" method="post">
		<table class="table table-striped table-bordered table-condensed">
		 <tr class="text-center">
			<td>
				<div id="datetimepicker1" class="input-append  date">
		           开始<input name="start"  size="10" class="{required:true,date:true}"
		              data-format="yyyy-MM-dd" type="text"  value='<s:date name="start" format="yyyy-MM-dd"/>'></input> <span class="add-on">
		              <i class="ace-icon fa fa-calendar"></i>
		           </span>
		        </div>
		        
			</td><td style="padding-left:3px">
			 <div id="datetimepicker2" class="input-append   date">
		          结束 <input name="end"  size="10"  class="{required:true,date:true}"
		              data-format="yyyy-MM-dd" type="text"  value='<s:date name="end" format="yyyy-MM-dd"/>'></input> <span class="add-on">
		              <i class="ace-icon fa fa-calendar"></i>
		           </span>
		        </div></td>
            </tr><tr class="text-center">
			<td>
			<strong>店铺</strong>
			  		 <s:select name="shopId" id="shop"
						list="shops"  listKey="id" listValue="name"  value="shopId"
						theme="simple" >
				 </s:select>
			</td><td style="padding-left:3px;">
			  	<button type="submit" class="btn btn-success btn-sm">查询</button></div>
			  </td></tr>
		</table>
	</form>
	
	<div class="row">
		<div class="col-sm-3 text-center">
			<!-- #section:pages/dashboard.infobox -->
			<div class="infobox infobox-green">
				<div class="infobox-icon">
					<i class="ace-icon fa fa-comments"></i>
				</div>

				<div class="infobox-data">
					<span class="infobox-data-number"><s:property value="report.money"/></span>
					<div class="infobox-content">总营业额</div>
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
					<span class="infobox-data-number"><s:property value="report.number"/></span>
					<div class="infobox-content">总客流</div>
				</div>

				<div class="badge badge-success">
					+32%
					<i class="ace-icon fa fa-arrow-up"></i>
				</div>
			</div>

			<div class="infobox infobox-pink">
				<div class="infobox-icon">
					<i class="ace-icon fa fa-shopping-cart"></i>
				</div>

				<div class="infobox-data">
					<span class="infobox-data-number"><s:property value="report.avg"/></span>
					<div class="infobox-content">平均人均</div>
				</div>
				<div class="stat stat-important">4%</div>
			</div>
			<!-- /section:pages/dashboard.infobox.dark -->
			<div style="margin-top:5px">
				<button class="btn btn-danger btn-block" id="addOrder">记一笔</button>
			</div>
		</div>
		<div class="col-sm-8">
			<div id="chart1"></div>
		</div>
	</div>
<!-- 	<div class="row">
		<div class="col-sm-6">
			<div id="chart2" ></div>
		</div>
		<div class="col-sm-6">
			<div id="chart3"></div>
		</div>
	</div> -->

</a:body>
<script src="assets/js/highcharts.js" type="text/javascript"></script>
<script type="text/javascript">
	function graphChartByDate(container,title,lable,unit,data){
		Highcharts.setOptions({
		    global: {
		        useUTC: false
		    }
		});
		$('#'+container).highcharts({
	        chart: {
	            type: 'spline'
	        },
	        title: {
	            text: title
	        },
	        credits : {
	            enabled:false
	        },
	        xAxis: {
	            type: 'datetime',
	            dateTimeLabelFormats: { // don't display the dummy year
	                second: '%H:%M:%S',
	                minute: '%m-%d %H:%M',
	                hour: '%m-%d %H:%M',
	                day: '%m-%d',
	                week: '%y-%m',
	                month: '%y-%m',
	                year: '%y'
	            },
	            labels : {
	            	align : "right",
	            	rotation : 330
	            },
	            title: {
	            	text: "时间",
	            	align: "high"
	            }
	        },
	        yAxis: {
	            title: {
	                text: lable + unit
	            },
	            min: 0
	        },
	        tooltip: {
	            formatter: function() {
	                    return '<b>'+ this.series.name +'</b><br/>'+
	                    Highcharts.dateFormat('%Y-%m-%d', this.x) +' '+lable+' = '+ this.y+unit;
	            }
	        },
	        series:data
	    }); 
	}

	$(document).ready(function() {
		$('#shopMenu').addClass("active open");
		$('#reportList').addClass("active");
		$('#datetimepicker1').datetimepicker();
		$('#datetimepicker2').datetimepicker();
		
		var data1 = <s:property value='chart1.jsonString' escape="false"/>;
		//var data2 = <s:property value='chart2.jsonString' escape="false"/>;
		//var data3 = <s:property value='chart3.jsonString' escape="false"/>;
		graphChartByDate("chart1","营业趋势图","","元",data1.series);
		//graphChartByDate("chart2","客流趋势图","","人",data2.series);
		//graphChartByDate("chart3","人均趋势图","","元",data3.series);
		
		$('#addOrder').bind("click",function(){
			var shopId =<s:property value="shopId"/>;
			var href = "orderAdd.do?shopId="+shopId+"&index=1&tag=history"
			window.location.href=href;
		})
	});
</script>





