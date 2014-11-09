<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld"%>
<%@ taglib prefix="t" uri="/WEB-INF/tld/struts-privilege.tld"%>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>

<a:body>

<script type="text/javascript">
	function gid(id) { return document.getElementById ? document.getElementById(id) : null; }
	function timeDesc() {
		if (all <= 0) {
			self.location = "today.do";
		}
		var obj = gid("tS");
		if (obj) obj.innerHTML = all + " 秒后";
		all--;
	}
	var all = 10;
</script>
  </br>
  </br>
  <div class="row-fluid">
      	<div class="span12 text-center">
      	<h3 class="text-error text-center">请输入正确的参数请求！</h3>
  		<a class='btn btn-danger' href="today.do">返回主页</a>
       	<s:property value="exception.message"/>
        <s:property value="exceptionStack"/>
      </div>
    </div>
</a:body>