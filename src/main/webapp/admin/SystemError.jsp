<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld"%>
<!DOCTYPE html>
<head>
<title>软土盾构隧道后台管理系统</title>

<link rel="stylesheet" type='text/css' href="css/bootstrap.min.css">
<link rel='stylesheet' type='text/css' href='css/admin.css' />
<script src="js/jquery.js" type="text/javascript" ></script>
<script src="js/bootstrap.min.js" type="text/javascript" ></script>
<script type="text/javascript" src="js/validate.js"></script>
<script src="js/jquery.validate.min.js" type="text/javascript" ></script>
<script type="text/javascript" src="js/jquery.metadata.js"></script>

<script type="text/javascript">
	function gid(id) { return document.getElementById ? document.getElementById(id) : null; }
	function timeDesc() {
		if (all <= 0) {
			self.location = "tunnelList.do";
		}
		var obj = gid("tS");
		if (obj) obj.innerHTML = all + " 秒后";
		all--;
	}
	var all = 10;
	if (all > 0) window.setInterval("timeDesc();", 10000);
</script>
</head>
<body>
  </br>
  </br>
  <div class="row-fluid">
      	<div class="span12 text-center">
      	<h3 class="text-error text-center">您访问网址有错误，或者页面不存在！</h3>
  		<a class='btn btn-danger' href="tunnelList.do"><span id="tS">10 秒后</span>返回主页</a>
        <h2 class="text-center"><img width="15%" class="img-rounded" src="img/error404.png"></h2>
       	 <s:property value="exception.message"/>
         <s:property value="exceptionStack"/>
      </div>
    </div>
</body>
</html>
