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
			<li class="active">新增订单信息</li>
		</ul>
	</div>
	<div class="widget-box">
	<div class="widget-header widget-header-blue widget-header-flat">
		<h4 class="widget-title lighter">新增订单信息</h4>
	</div>

	<div class="widget-body">
		<div class="widget-main">
			<!-- #section:plugins/fuelux.wizard -->
			<div id="fuelux-wizard" data-target="#step-container">
				<!-- #section:plugins/fuelux.wizard.steps -->
				<ul class="wizard-steps">
					<li data-target="#step1" class="active">
						<span class="step">1</span>
						<span class="title">基本信息</span>
					</li>

					<li data-target="#step2" class="">
						<span class="step">2</span>
						<span class="title">营收状况</span>
					</li>

					<li data-target="#step3" class="">
						<span class="step">3</span>
						<span class="title">确认提交</span>
					</li>
				</ul>

				<!-- /section:plugins/fuelux.wizard.steps -->
			</div>

			<hr>
			<!-- #section:plugins/fuelux.wizard.container -->
			<div class="step-content pos-rel" id="step-container">
			<form action="orderAddSubmit.do" id="form" method="post">
				<div class="step-pane active" id="step1">
					<table class="table table-striped table-bordered table-condensed">
			<tr>
				<input type="hidden" name="shopId"
					value="<s:property value="shopId"/>" />
				<input type="hidden" name="tag"
					value="<s:property value="tag"/>" />
				<td style="text-align: right;"><strong
					class="text-success">商户</strong></td>
				<td><s:select name="order.shopId" list="shops"  listKey="id" listValue="name"  value="shopId"
						theme="simple">
					</s:select></td>
			</tr>
			<tr>
				<td width="20%" style="text-align: right;"><strong
					class="text-success">时间</strong></td>
				<td>
				<div id="datetimepicker1" class="input-append date">
		           <input name="order.period"    class="{required:true,date:true}"
		          	 value='<s:date name="date" format="yyyy-MM-dd"/>'
		              data-format="yyyy-MM-dd" type="text"></input> <span class="add-on">
		              <i class="ace-icon fa fa-calendar"></i>
		           </span>
		        </div>
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
					<select id="type" name="order.weather">
						<option value="1">晴朗</option>
						<option value="2">多云</option>
						<option value="3">小雨</option>
						<option value="4">大雨</option>
					</select>
				</td>
			</tr></table>
						</div>
						<div class="step-pane" id="step2">
						<table class="table table-striped table-bordered table-condensed">
			<tr>
				<td style="text-align: right;"><strong
					class="text-success">总桌数</strong></td>
				<td><input type="text" name="order.tableNumber"
					class="{required:true,number:true}" /></td>
			</tr><tr>
				<td style="text-align: right;"><strong
					class="text-success">总人数</strong></td>
				<td><input type="text" name="order.number"
					class="{required:true,number:true}" /></td>
			</tr>
			<tr>
				<td width="20%"  style="text-align: right;"><strong
					class="text-success">现金收入</strong></td>
				<td><input type="text" name="order.money1"
					class="{required:true,number:true}" /></td>
			</tr>
			<tr>
				<td style="text-align: right;"><strong
					class="text-success">刷卡收入</strong></td>
				<td><input type="text" name="order.money2"
					class="{required:true,number:true}" /></td>
			</tr><tr>
				<td style="text-align: right;"><strong
					class="text-success">团购收入</strong></td>
				<td><input type="text" name="order.money3"
					class="{required:true,number:true}" /></td>
			</tr>
			</table>
						</div>
						<div class="step-pane" id="step3">
						<table class="table table-striped table-bordered table-condensed">
			
			<tr>
				<td  width="20%"  style="text-align: right;"><strong class="text-success">描述</strong></td>
				<td><textarea type="text" 
						name="order.detail" class="{maxlength:512}"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<button class="btn btn-sm btn-primary" type="submit">提交</button>
				</td>
			</tr></table>
						</div>

					</div></form>

					<!-- /section:plugins/fuelux.wizard.container -->
					<hr>
					<div class="wizard-actions">
						<!-- #section:plugins/fuelux.wizard.buttons -->
						<button class="btn btn-prev">
							<i class="ace-icon fa fa-arrow-left"></i>
							上一步
						</button>
						<button class="btn btn-success btn-next" data-last="提交">
							下一步
						<i class="ace-icon fa fa-arrow-right icon-on-right"></i></button>

						<!-- /section:plugins/fuelux.wizard.buttons -->
					</div>

					<!-- /section:plugins/fuelux.wizard -->
				</div><!-- /.widget-main -->
			</div><!-- /.widget-body -->
		</div>
</a:body>
<script src="assets/js/fuelux/fuelux.wizard.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		var $validation = false;
		$('#fuelux-wizard')
		.ace_wizard({
			//step: 2 //optional argument. wizard will jump to step "2" at first
		})
		.on('change' , function(e, info){
			if(info.step == 1 && $validation) {
				 return false;
			}
		})
		.on('finished', function(e) {
			e.preventDefault();
			if($('#form').valid()){
				$('#form').submit();
			}
		}).on('stepclick', function(e){
			//e.preventDefault();//this will prevent clicking and selecting steps
		});
	});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#shopMenu').addClass("active open");
		$('#orderList').addClass("active");
		$("#form").validate();
		$('#datetimepicker1').datetimepicker();
	});
</script>

