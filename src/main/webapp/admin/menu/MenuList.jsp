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
			<li class="active">菜单列表</li>
		</ul>
	</div>
	<form class=" margin-buttom" action="menuList.do" method="post">
		<div style="padding-left:5px;padding-top:8px;"><strong>商户</strong>
			  	 <s:select name="shopId" id="shop"
						list="shops"  listKey="id" listValue="name"  value="shopId"
						theme="simple" >
				 </s:select>
			  <button type="submit" >
			  	<i class="text-success ace-icon fa fa-search nav-search-icon"></i>
			  </button></div>
			  </form>
	<table
		class="table table-striped table-bordered table-condensed table-hover">
		<thead>
			<tr>
				<th>名称</th>
				<th>操作 <t:privilege res="菜单模块:新增">
						<a class="space"
							href="menuAdd.do?shopId=<s:property value="shopId"/>&index=<s:property value="index"/>"><button
								class="btn btn-xs btn-warning">
								<i class=" ace-icon ace-icon fa fa-plus bigger-120"></i>
							</button></a>
					</t:privilege>
				</th>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="menus" status="vs">
				<tr>
					<td><s:property value="name" /></td>
					<td><t:privilege res="菜单模块:详情">
							<a href="menuDetail.do?shopId=<s:property value="shopId"/>&menuId=<s:property value="id"/>&index=<s:property value="index"/>"><button
									class="btn btn-xs btn-success">
									<i class="ace-icon fa fa-search-plus bigger-120"></i>
								</button></a>
						</t:privilege> <t:privilege res="菜单模块:编辑">
							<a href="menuUpdate.do?shopId=<s:property value="shopId"/>&menuId=<s:property value="id"/>&index=<s:property value="index"/>"><button
									class="btn btn-xs btn-info">
									<i class="ace-icon fa fa-pencil bigger-120"></i>
								</button></a>
						</t:privilege> <t:privilege res="菜单模块:删除">
							<a class="delete"
								href="menuDelete.do?shopId=<s:property value="shopId"/>&menuId=<s:property value="id"/>&index=<s:property value="index"/>"><button
									class="btn btn-xs btn-danger">
									<i class="ace-icon fa fa-trash-o bigger-120"></i>
								</button></a>
						</t:privilege></td>
				</tr>
			</s:iterator>
		</tbody>
	</table>
	<div class="text-center">
		<ul class="pagination text-center">
			<li><a href="#">共${totalSize}记录&${totalPages}页</a></li>
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
		$('#menuList').addClass("active");
	});
</script>
