<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@page import="com.cbt.util.WebCookie"%>
<%@page import="com.cbt.util.Base64Encode"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%String[] userinfo = WebCookie.getUser(request);%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>login</title>
	 <link rel="stylesheet" href="${ctx}/css/easydialog.css" />
	 <link rel="stylesheet" href="${ctx}/css/login.css">
     <link type='image/x-ico' rel='icon' href='img/favicon.ico' />
     <script type="text/javascript" src="${ctx}/js/jquery-1.10.2.js"></script>   
     <script type="text/javascript" src="${ctx}/js/easydialog.min.js"></script>  
     
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-115010583-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-115010583-1');
</script>
     
     
<style>
/*正在发送中*/
*{ padding:0; margin:0;}
.layer {
  background: rgba(0, 0, 0, 0.4);
  display: none;
  height: 100%;
  left: 0;
  position: fixed;
  top: 0;
  width: 100%;
}
.layer_com {
  background: rgba(0, 0, 0, 0.8) url(/crm/img/loading.gif) no-repeat center 15px;
  border-radius: 8px;
  height: 50px;
  left: 45%;
  opacity: 0.8;
  position: absolute;
  text-align: center;
  top: 40%;
  width: 120px;
  z-index: 6000;
}
.layer_com p {
  color: #fff;
  font-size: 20px;
  padding-top: 15px;
}



    .btn-success{color: #fff;
        background-color:  #08c;}
    .btn-success:hover{color: #fff;
        background-color: #04c;}

        
input[type=text].error,input[type=password].error{
	  border-color: red;
}
.weui_mask {
    position: fixed;
    z-index: 1000;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    background: rgba(0, 0, 0, 0.6);
}
.weui_dialog {
    height: 300px;
    position: fixed;
    z-index: 5000;
    width: 35%;
    top: 50%;
    left: 50%;
    margin-top:-150px;
    margin-left:-17.5%;
    background-color: #FAFAFC;
    text-align: center;
    border-radius: 3px;
    overflow: hidden;
}
.weui_dialog_hd {
    padding: 7.5em 0 .5em;
}
.weui_dialog_title {
    font-weight: bold;
    font-size: 17px;
}
.close-reveal-modal {
    font-size: 18px;
    line-height: .5;
    position: absolute;
    top: 10px;
    right: 10px;
    color: #aaa;
    text-shadow: 0 -1px 1px rbga(0,0,0,.6);
    font-weight: bold;
    cursor: pointer;
}
/* .weui_dialog_ft {
    position: relative;
    line-height: 42px;
    margin-top:60px;
    margin-bottom: 20px;
    font-size: 17px;
    display: -webkit-box;
    display: -webkit-flex;
    display: flex;
} */
.weui_btn_dialog.primary {
    color: #08c;
}
.weui_dialog_ft a {
    display: block;
    -webkit-box-flex: 1;
    -webkit-flex: 1;
    flex: 1;
    color: #08c;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
}
.weui_dialog table{width:90%;margin: auto;}
#login_email{
width:280px;
height:40px;
margin-left:20px;
padding-left:15px;
}
.weui_dialog_ft{
display:block;
width:180px;
height:42px;
margin: 0 auto;
margin-top: 40px;
}
.weui_dialog_ft button{
border:0 none;}

</style>
</head>
<body>
	<div class="login">
		<div class="bg"><!-- <img src="images/bg.jpg" alt=""> --></div>
		<div class="login-in">
			<div class="L">
				<h4>Supplier Management <br/>System for Importing</h4>
				<div class="sm">
					<p>Receive inspection reports, weekly updates online</p>
					<p>Track order status and review order history</p>
				</div>
			</div>
			<div class="R">
				<div class="R-t">
					<div class="logo">
						<img src="images/logo.png" alt=""> <span>Buyer</span>
					</div>
					<form action="">
						<fieldset>
							<legend>Email</legend>
							<input type="email" id="loginEmail">
						</fieldset>
						<fieldset>
							<legend>Password</legend>
							<input type="password" id="pwd">
						</fieldset>
					</form>
					<div class="tj">
						<a href="###" class="a1" onclick="recover_pwd();">Forgot  Password?</a>
						<a href="###" class="btn" id="login" onclick="login()">Login</a>
					</div>
				</div>
				<div class="R-b">
					Don’t have an account? <a href="/crm/c_register.jsp">Sign up</a>
				</div>	
			</div>			
		</div>
		
		   <!-- 忘记密码 -->
				<div class="weui_dialog_alert" id="recover_pwd_div" style="display:none;">
					<div class="weui_mask"></div>
					<div class="weui_dialog">
						<div class="layer" style="display:none;" id="send_mail_div"><div class="layer_com"><p>sending</p></div></div>
						<div class="weui_dialog_hd">
								<div class="controls">
			            <div class="main_input_box">
			                <span class="add-on bg_lo">Email<i class="icon-envelope"></i></span><input type="text"  id="login_email" placeholder="E-mail address" style="border:1px solid #ddd;">
			            </div>
			                </div>
						</div>
							
							<a class="close-reveal-modal" style="font-size:30px;" href="javascript:void(0);"
								onclick="dispose()">×</a>
							<!--<a class="close-reveal-modal">×</a>-->
							<div class="weui_dialog_ft">
								<a href="javascript:;"><button
										class="weui_btn_dialog btn btn-primary" onclick="recover();">Recover</button></a>
							</div>
					</div>			
		        </div>
	</div>
	
</body>
  <script type="text/javascript">
   

        //自动填入用户、密码
        $(function(){
        	
        	  <%
        	    String loginEmail = "";
        	    String pwd = "";
        	    String userInfo = request.getParameter("userInfo");
        	    if(userInfo != null && !"".equals(userInfo)){
        	      String plainTxt = Base64Encode.getFromBase64(userInfo);	
        	      String[] u = plainTxt.split("&");
        	     loginEmail = u[0];
        	     pwd = u[1];    	  
        	    }       
        	  %>
        	var email = '<%=loginEmail%>';
        	var pwd = '<%=pwd%>';
        	  
        	$('#send_mail_div').hide();
        	$('#recover_pwd_div').hide();
        	     	
            $('#loginEmail').val('<%=userinfo != null ? WebCookie.getLoginEmail(request) : ""%>'); 
            $('#pwd').val('<%=userinfo != null ? WebCookie.getPwd(request) : ""%>'); 
            if(email != '' && email != null){
            	$('#loginEmail').val(email);	
            }
            if(pwd != '' && pwd != null){
            	$('#pwd').val(pwd);
            }
           //键盘enter事件
           $(document).keydown(function(event){ 
        	   
           if(event.keyCode==13){ 
            login(); 
           } 
          
           });
        })
         //跳转主页
           function login(){
        		//检查表单数据的正确性
        		//将表单数据发送到服务器
        		//利用Callback处理返回结果
        		//如果成功就跳转到主页
        		//如果失败显示错误消息
        		var loginEmail = $('#loginEmail').val();
        		var pwd = $('#pwd').val();
        		
        		$('#login').css({"background-color":"#bbb"}).attr("disabled","true");
        		$.post("/crm/account/login.do",
        				{
					  "loginEmail":loginEmail,
					  "pwd":pwd
					    },
        				function(result){
                            if(result.state == 0){   
                            	  $('#login').css({"background-color":"#0088cc"}).removeAttr("disabled");	                       
    	                          window.location.href = "/crm/queryAllClientOrder.do";   

		    				}else{
		    					  $('#login').css({"background-color":"#0088cc"}).removeAttr("disabled");	
		    					easyDialog.open({
		    			    		  container : {
		    			    		    header : 'Prompt message',
		    			    		    content : result.message
		    			    		  },
		    			    		  overlay : false,
		    			    		  autoClose : 1000   			    		  
		    			    		});
		    				}
    				
    			});
            }
         
      //找回密码弹窗   
      function recover_pwd(){
    	  $('#recover_pwd_div').show(); 
    	  var email = $('#loginEmail').val(); 
      	  $('#login_email').val(email);
      }   
      
      function dispose(){
    	  $('#recover_pwd_div').hide();
      }
      
      //找回密码
      function recover(){
    	var email = $('#login_email').val();
    	
	   if(email == null || email == ""){
		   
		   easyDialog.open({
	    		  container : {
	    		    header : 'Prompt message',
	    		    content : ' * E-mail can not empty!'
	    		  },
	    		  autoClose : 2000
	    		});
			return false; 
	   }
		 //验证邮箱是否合法
 	   var szReg=/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+/;     	    	   
 	   if(!(email == null || email.length==0)){
 		   var bChk = szReg.test(email);
			
			if(!bChk){
				easyDialog.open({
		    		  container : {
		    		    header : 'Prompt message',
		    		    content : ' * E-mail format is incorrect'
		    		  },
		    		  autoClose : 1000
		    		});
				return false;
			}
		   }  
    	
    	$('#send_mail_div').show(); 
  		$.post("/crm/account/recoverPwd.do",
				{
			  "email":email
			    },
				function(result){
			    	
			    if(result.state == 0){
			    $('#send_mail_div').hide();
			    
			    if(result.message == "YES"){		    	
			    	var callFn = function(){
			    		window.location.href = "/crm/login.jsp";
			    		};

			    		easyDialog.open({
			    		  container : {
			    		    header : 'Prompt message',
			    		    content : ' Sending successful'
			    		  },
			    		  autoClose : 1000,
			    		  callback : callFn
			    		});
			    }
			    if(result.message == "NO"){
			    	
			    		easyDialog.open({
			    		  container : {
			    		    header : 'Prompt message',
			    		    content : ' Failed to send. Please try again'
			    		  },
			    		  autoClose : 1000
			    		});
			    }
				 
			}else{
				$('#send_mail_div').hide();
				easyDialog.open({
		    		  container : {
		    		    header : 'Prompt message',
		    		    content : result.message
		    		  },
		    		  autoClose : 2000
		    		});
			}
			
		});
      }   
         

        </script>
</html>