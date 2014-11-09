<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld"%>
<%@ taglib prefix="t" uri="/WEB-INF/tld/struts-privilege.tld"%>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>

<a:body>
	<div class="breadcrumbs" id="breadcrumbs">
		<script type="text/javascript">
			try {ace.settings.check('breadcrumbs', 'fixed')
			} catch (e) {}
		</script>
		<ul class="breadcrumb">
			<li><i class="ace-icon fa fa-home home-icon"></i> <a
				href="index.do">首页</a></li>
			<li>店铺管理</li>
			<li class="active">员工列表</li>
		</ul>
	</div>
	<form class=" margin-buttom" action="userList.do" method="post">
		<div style="padding-left:5px;padding-top:8px;"><strong>店铺</strong>
			  	 <s:select name="shopId" id="shop"
						list="shops"  listKey="id" listValue="name"  value="shopId"
						theme="simple" >
				 </s:select>
			  <button type="submit" class="btn btn-success btn-sm">查询</button>
			 </div>
			  </form>
	<table class="table table-striped table-bordered table-hover"
		style="font-size: small">
		<thead>
			<tr>
				<th>用户名</th>
				<th>真实姓名</th>
				<th>操作 <t:privilege res="用户模块:新增">
						<a class="space"
							href="userAdd.do?index=<s:property value="index"/>">
							<button class="btn btn-xs btn-warning">
								<i class=" ace-icon ace-icon fa fa-plus bigger-120"></i>
							</button>
						</a>
					</t:privilege>
				</th>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="users" status="vs">
				<tr>
					<td><s:property value="userName" /></td>
					<td><s:property value="realName" /></td>
					<td><t:privilege res="用户模块:详情">
							<a
								href="userDetail.do?userId=<s:property value="id"/>&index=<s:property value="index"/>">
								<button class="btn btn-xs btn-success">
									<i class="ace-icon fa fa-search-plus bigger-120"></i>
								</button>
							</a>
						</t:privilege> <t:privilege res="用户模块:编辑">
							<a
								href="userUpdate.do?userId=<s:property value="id"/>&index=<s:property value="index"/>">
								<button class="btn btn-xs btn-info">
									<i class="ace-icon fa fa-pencil bigger-120"></i>
								</button>
							</a>
						</t:privilege> <t:privilege res="用户模块:删除">
							<a class="delete "
								href="userDelete.do?userId=<s:property value="id"/>&index=<s:property value="index"/>">
								<button class="btn btn-xs btn-danger">
									<i class="ace-icon fa fa-trash-o bigger-120"></i>
								</button>
							</a>
						</t:privilege></td>
				</tr>
			</s:iterator>
		</tbody>
	</table>
	<div class="text-center">
		<ul class="pagination">
			<li><a href="?shopId=<s:property value="shopId"/>&index=1">首页</a></li>
			<s:iterator id="item" value="pageIndexs">
				<s:if test="${item == index }">
					<li class="disabled"><a href="?shopId=<s:property value="shopId"/>&index=${item}">${item}</a></li>
				</s:if>
				<s:else>
					<li><a href="?shopId=<s:property value="shopId"/>&index=${item}">${item}</a></li>
				</s:else>
			</s:iterator>
			<li><a href="?shopId=<s:property value="shopId"/>&index=${totalPages}">末页</a></li>
		</ul>
	</div>
</a:body>
<script type="text/javascript">
	$(document).ready(function() {
		$('#shopMenu').addClass("active open");
		$('#userList').addClass("active");
	});
</script>



