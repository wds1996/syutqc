<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>登陆</title>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" media="all" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<!-- -->
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script>
	if(top!=this){
		// 在frame中时处理
		window.parent.location.href='login.jsp';
		}	
</script>
</head>
	<body>
		<!-- contact-form -->	
		<div class="message warning">
			<div class="inset">
				<div class="login-head">
					<h1>三亚学院教学质量监控后台</h1>			
				</div>
					<form action="user_login" namespace="/" method="post">
						<li>
							<input type="text" class="text" name="USERNAME" placeholder="用户名" ><a href="#" class=" icon user"></a>
						</li>
							<div class="clear"> </div>
						<li>
							<input type="password" name="PASSWORD" placeholder="密码"> <a href="#" class="icon lock"></a>
						</li>
							<div style="font-size: 20px;height: 40px"> 
								<s:actionerror cssStyle="color:red"/>
								<s:fielderror cssStyle="color:red"/>
								<s:actionmessage cssStyle="color:green"/>
							</div>
							<input type="submit" value="Sign in" >
						<div class="clear">  </div>	
							
					</form>
					</div>					
				</div>
			</div>
			<div class="clear"> </div>
		<!--- footer --->
		<div class="footer">
			<p>Copyright &copy; 2018.10</p>
		</div>
	</body>
</html>