<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.cbt.util.WebCookie"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>China Synergy Group</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="/crm/js/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" href="/crm/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/crm/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="/crm/css/matrix-style.css" />
<link rel="stylesheet" href="/crm/css/matrix-media.css" />
<link rel="stylesheet" href="/crm/css/select2.css" />
<link href="/crm/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
	
<link rel="stylesheet" href="css/easydialog.css" />
<link type='image/x-ico' rel='icon' href='img/favicon.ico' />
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/easydialog.min.js"></script> 	

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-115010583-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-115010583-1');
</script>
<script type="text/javascript">

	<%-- //获取session的登录用户id和登录名--%>
    <%String[] userinfo = WebCookie.getUser(request);%>
	var login_email = '<%=userinfo != null ? userinfo[1] : ""%>';
	
	

		$(function(){
			$('#sidebar_ul').find('li').eq(4).addClass('active');
		})
	
	
	
	function doModifyPwd(obj) {
		var email = login_email;
		var oldPwd = $("#oldpassword").val();
		var newPwd = $("#newpassword").val();
		var confirmPwd = $("#confirmpassword").val();
		if (email == null || email == "") {			
			easyDialog.open({
        		   container : {
            		     header : '  Prompt message',
            		     content : '  Failed to get user information'
        		   },
					  drag : false,
					  overlay : false,
					  autoClose : 1000
        		 });   
			return false;
		}
		if (oldPwd == null || oldPwd == "") {
			easyDialog.open({
     		   container : {
         		     header : '  Prompt message',
         		     content : '  Please enter your old password'
     		   },
					  drag : false,
					  overlay : false,
					  autoClose : 1000
     		 }); 
			return false;
		}
		if (newPwd != confirmPwd) {
			easyDialog.open({
	     		   container : {
	         		     header : '  Prompt message',
	         		     content : '  The password entered twice is different'
	     		   },
						  drag : false,
						  overlay : false,
						  autoClose : 1000
	     		 }); 
			return false;
		}
		var psdReg = /^[0-9a-zA-Z_]{6,15}$/;//密码正则
		if (!psdReg.test(newPwd)) {
			easyDialog.open({
	     		   container : {
	         		     header : '  Prompt message',
	         		     content : '  6-15 bits contain numbers or letters'
	     		               },
						  drag : false,
						  overlay : false,
						  autoClose : 1000
	     		     }); 
			return false;
		}

		$(obj).css({"background-color":"#bbb"}).attr("disabled","true");
		
		$.post("/crm/resetCustomerPwd.do", {
			"email" : email,
			"oldPwd" : oldPwd,
			"password" : newPwd
		}, function(result) {
			
			$(obj).css({"background-color":"#006dcc"}).removeAttr("disabled");
		   	if(result.state == 0){
		   		easyDialog.open({
		     		   container : {
		         		     header : '  Prompt message',
		         		     content : '  Successfully modified, please login again'
		     		               },
							  drag : false,
							  overlay : false,
							  autoClose : 1000
		     		     }); 
		   		setTimeout(show,1000);
		   	}else{
		   		easyDialog.open({
		     		   container : {
		         		     header : '  Prompt message',
		         		     content :  result.message
		     		               },
							  drag : false,
							  overlay : false,
							  autoClose : 1000
		     		     }); 
		   	}
		});
	}
		

	//跳转登录页
	function show(){
		window.location.href = "/crm/login.jsp";
	}
	
	
</script>
<style>
.shuruming {
	margin-top: 20px;
	float: none;
	text-shadow: 0 1px 0 #ffffff;
	margin-left: 20px;
	position: relative;
}

.shuru  input {
	width: 15%;
}

.controls {
	color: #555;
	font-size: 14px;
}
</style>
</head>
<body>
	<jsp:include page="base.jsp"></jsp:include>

	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="/crm/resetPassword.do" class="tip-bottom"><i class="icon icon-user"></i>Reset Password</a>
				<a href="#" class="current"></a>
			</div>
			<h1 style="font-size: 26px;">Reset Password</h1>
		</div>
		<div class="container-fluid">
			<hr>
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-pencil"></i>
							</span>
							<h5>Reset Password</h5>
						</div>
						<div class="widget-content nopadding">
							<form id="form-wizard" class="form-horizontal ui-formwizard"
								method="post" novalidate="novalidate" onclick="return false;">
								<div id="form-wizard-1" class="step ui-formwizard-content"
									style="display: block;">
									<%-- <div style="display:none;">
										<label class="control-label">User Id</label>
										<div class="controls">
											<input id="id" type="password" name="id" value="${id}"
												class="ui-wizard-content">
										</div>
									</div> --%>
									<div class="control-group">
										<label class="control-label">Email:</label>
										<div class="controls" style="padding: 26px 6px;">
											<%=userinfo != null ? userinfo[1] : ""%>
											<!--  <input id="username" type="text" name="username" class="ui-wizard-content">-->
										</div>
									</div>

									<div class="control-group">
										<label class="control-label">Old password</label>
										<div class="controls">
											<input id="oldpassword" type="password" name="oldpassword"
												class="ui-wizard-content">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">New password</label>
										<div class="controls">
											<input id="newpassword" type="password" name="newpassword"
												class="ui-wizard-content">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Confirm password</label>
										<div class="controls">
											<input id="confirmpassword" type="password"
												name="confirmpassword" class="ui-wizard-content">
										</div>
									</div>
								</div>
								<div class="form-actions">

									<input id="next"
										class="btn btn-primary ui-wizard-content ui-formwizard-button"
										value="Save" style="padding: 4px 20px;"
										onclick="doModifyPwd(this)">
									<div id="status"></div>
								</div>
								<div id="submitted"></div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row-fluid">
		<div id="footer" class="span12">
			2013 &copy; Shanghai ce melting. More Templates <a href="#"
				target="_blank" title="">China Synergy Group</a>
		</div>
	</div>
</body>
</html>