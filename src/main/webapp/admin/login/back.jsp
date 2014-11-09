<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld"%>
<%@ taglib prefix="t" uri="/WEB-INF/tld/struts-privilege.tld"%>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>

<a:body>
	<div class="text-center">
	  		<a class='btn btn-danger' href="${requestUrl}">返回上次请求页面</a>
	  	</div>
</a:body>
<script type="text/javascript">
	function gid(id) { return document.getElementById ? document.getElementById(id) : null; }
	function timeDesc() {
		if (all <= 0) {
			self.location = "${requestUrl}";
		}
		var obj = gid("tS");
		if (obj) obj.innerHTML = all + " 秒后";
		all--;
	}
	var all = 3;
</script>

