<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>修改密码</title>
<style>

	.logo {
		width: 100%;
		height: 100px;
		top: 10%;
		background: url(${pageContext.request.contextPath}/images/logo.png) #fff top center no-repeat;
		position: absolute;
		z-index: 9000;
	}

	.ui-dialog{ 
		width: 380px;
		height: auto;
		position: absolute;
		z-index: 9000;
		border: 1px solid #D5D5D5;
		background: #fff;
		position: fixed;
	    left: 38%;
	    top: 28%;
	    box-shadow: 2px 0px 5px #333;
	}

	.ui-dialog a{text-decoration: none;}

	.ui-dialog-title{
		height: 48px;
		line-height: 48px; 
		padding:0px 20px;
		color: #535353;
		font-size: 16px;
		border-bottom: 1px solid #efefef;
		background: #f5f5f5;
		user-select:none;
	}
	.ui-dialog-title-close {
		width: 20px;
		height:20px;
		display: block;
		background: url(${pageContext.request.contextPath}/images/close_hov.png) no-repeat;
		position: relative;
		right: 0;
		float: right;
		top: 15px;
		cursor: pointer;
	}
	.ui-dialog-title-close:hover {
		background: url(${pageContext.request.contextPath}/images/close_def.png) no-repeat;
	}

	.ui-dialog-content{
		padding: 15px 20px;
	}

	.ui-dialog-input{
		width: 100%;
		height: 40px;
		margin: 10px 0;
		padding:0px;
		border: 1px solid #d5d5d5;
		font-size: 16px;color: #c1c1c1;
		text-indent: 25px;
		outline: none;
	}
	.ui-dialog-input-username{
		background: url(${pageContext.request.contextPath}/images/input_username.png) no-repeat 2px ;
	}

	.ui-dialog-input-password{
		background: url(${pageContext.request.contextPath}/images/input_password.png) no-repeat 2px ;
	}
	.ui-dialog-submit{
		width: 100%;
		height: 50px;
		background: #3b7ae3;
		border:none;
		font-size: 16px;
		color: #fff;
		outline: none;
		text-decoration: none;
		display: block;
		text-align: center;
		line-height: 50px;


	}
	.ui-dialog-submit:hover{
		background: #3f81b0;
	}

</style>
</head>
<body >
	<div class="logo"></div>
	<div class="ui-dialog" id="dialog">
		<div class="ui-dialog-title">			
			修改密码
			<span class="ui-dialog-title-close" id="close"></span>
		</div>
		<div class="ui-dialog-content">
			<form action="user_modify" namespace="/" method="post" onsubmit="return submit()">
				<input name="USERNAME" type="hidden" value="${user.USERNAME}"/>
				<div class="">
					输入原密码 <span id="ypsspan"></span>
					<input id="password" name="PASSWORD" class="ui-dialog-input ui-dialog-input-password" type="password" onBlur="pdyps()" />
				</div>
				<div class="">
					输入新密码 <span id="psspan"></span>
					<input id="password1" class="ui-dialog-input ui-dialog-input-password" type="password" onBlur="pdps()" />
				</div>
				<div class="">
					确认新密码 <span id="ps2span"></span>
					<input id="password2" name="password2" class="ui-dialog-input ui-dialog-input-password" type="password" onkeyup="pd2ps()"/>
				</div>
				<div class="ui-dialog-button">
					<input class="ui-dialog-submit" type="submit" value="确定">
				</div>
			</form>
		<div style="font-size: 20px;height: 40px"> 
			<s:actionerror cssStyle="color:red"/>
			<s:fielderror cssStyle="color:red"/>
			<s:actionmessage id="message" cssStyle="color:green"/>
		</div>
		</div>
		
	</div>

<script>

window.onload = function() {
	var Dialog_Close = document.getElementById('close');
	var Dialog = document.getElementById('dialog');
	Dialog_Close.onclick=function() {
	        Dialog.style.display = 'none';
	    }
	var message = document.getElementById("message").innerText;
	if(message=="修改成功"){
		alert("密码修改成功，请重新登录!");
		location.href="${pageContext.request.contextPath}/user_exit";
	}
};

function pdyps(){
	var ps = document.getElementById("password").value;
	var psspan = document.getElementById("ypsspan");
	if(ps=="${user.PASSWORD}"){
		psspan.innerHTML="".fontcolor("green");	
	}else{
		psspan.innerHTML="原密码不正确".fontcolor("red");	
	}
}

function pdps(){
	var ps = document.getElementById("password1").value;
	var psspan = document.getElementById("psspan");
	var res = /^\w{6,12}$/i;
	if(res.test(ps)){
		psspan.innerHTML="".fontcolor("green");	
	}else{
		psspan.innerHTML="密码长度应为6-12位".fontcolor("red");	
	}
}

function pd2ps(){
	var ps = document.getElementById("password1").value;
	var res = document.getElementById("password2").value;
	var psspan = document.getElementById("ps2span");
	if(ps==res){
		psspan.innerHTML="".fontcolor("green");	
	}else{
		psspan.innerHTML="两次密码输入不一致".fontcolor("red");	
	}
}

function submit(){
	var ps = document.getElementById("password1").value;
	var res = document.getElementById("password2").value;
	var psspan = document.getElementById("ps2span");
	if(ps!=res){
		alert("请按要求输入");
		return false;
    } 
      return true;
}
</script>
</body>
</html>