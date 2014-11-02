
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld"%>
<%@ taglib prefix="t" uri="/WEB-INF/tld/struts-privilege.tld"%>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>

<a:body>
	<form action="login.do" id="form" method="post">
  		<s:actionerror/>
  		<h2 class='text-error'>您没有足够权限，请向系统管理员申请！</h2>
	</form>
</a:body>


