<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld"%>
<%@ taglib prefix="t" uri="/WEB-INF/tld/struts-privilege.tld"%>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>

<a:body>
	<form class="form-inline" action="logSearch.do" method="post">
			  <div style="padding-left:5px;padding-top:8px;"><strong>模块</strong>
			  	 <s:select name="module" id="module"
						list="modules"  value="module" theme="simple" >
				 </s:select>
			  <strong>类型</strong><select name="operation" id="operation">
			  	 <option value="">ALL</option>
			  	 <option value="新增">新增</option>
			  	 <option value="修改">修改</option>
			  	 <option value="删除">删除</option>
			  </select>
			  <button type="submit" >
			  	<i class="text-success ace-icon fa fa-search nav-search-icon"></i>
			  </button></div>
			</form>
			<table class="table table-striped table-bordered table-condensed table-hover">
				 <thead><tr>
					<th>模块名称</th>
					<th>操作名称</th>
					<th>操作员</th>
					<th>操作</th>
				</tr></thead><tbody>
				<s:iterator value="logs" status="vs">
					<tr>
					<td><s:property value="module" /></td>
					<td><s:property value="operation" /></td>
					<td><a href="userUpdate.do?userId=<s:property value="userId"/>"><s:property value="user.realName"/></a></td>
					<td><a href="logUpdate.do?logId=<s:property value="id"/>"><button class="btn btn-xs btn-success">
									<i class="ace-icon fa fa-search-plus bigger-120"></i>
								</button></a></td>
					</tr>
				</s:iterator></tbody>
			</table>
			<div class="text-center">
			  <ul class="pagination text-center">
			  	<li><a href="#">共${totalSize}记录&${totalPages}页</a></li>
			    <li><a href="?index=1&module=<s:property value="module"/>&operation=<s:property value="operation"/>">首页</a></li>
				    <s:iterator id="item" value="pageIndexs" >
				    	<s:if test="${item == index }">
							<li class="disabled"><a href="?index=${item}&module=<s:property value="module"/>&operation=<s:property value="operation"/>">${item}</a></li>
				    	</s:if>
				    	<s:else>
							<li><a href="?index=${item}&module=<s:property value="module"/>&operation=<s:property value="operation"/>">${item}</a></li>
				    	</s:else>
				    </s:iterator>
			    <li><a href="?index=${totalPages}&module=<s:property value="module"/>&operation=<s:property value="operation"/>">末页</a></li>
			  </ul>
			</div>
</a:body>

<script type="text/javascript">
	$(document).ready(function() {
		$('#systemMenu').addClass("active open");
		$('#logList').addClass('active');
		$(".delete").bind("click", function() {
			return confirm("确定要删除此分类吗(不可恢复)？");
		});
		var operation = '<s:property  value="operation"/>';
		$('#operation').val(operation);
	});
</script>

