<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@page import="com.cbt.util.Base64Encode"%>	
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
    
<head>
        <title>ImportX</title><meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="${ctx}/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${ctx}/css/bootstrap-responsive.min.css" />
        <link rel="stylesheet" href="${ctx}/css/matrix-login.css" />
        <link rel="stylesheet" href="${ctx}/css/customers.css" />
        <link rel="stylesheet" href="${ctx}/css/easydialog.css" />
        <link href="${ctx}/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <script type="text/javascript" src="js/jquery-1.10.2.js"></script>
        <script type="text/javascript" src="${ctx}/js/easydialog.min.js"></script>  
        <script type="text/javascript" src="${ctx}/js/base64.js"></script>  
        
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-115010583-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-115010583-1');
</script>
        
        <script type="text/javascript">
        var email = '<%=request.getParameter("email") == null ? "" : URLDecoder.decode(request.getParameter("email"), "utf-8")%>';
        var userid = '<%=request.getParameter("userid")%>';
  	    if(userid == 'null'){
  	    	userid = '';
  	    }
        
        
        $(function(){
        	
          if(email != null && email != ''&& email != undefined){
          	$('#email').val(email);
          } 	
        	
       	 
       	 var flag=false;
       	 var e_judgment = false;
       	 var p_judgment = false;
       	 var dp_judgment = false;
       	 
       	 //验证密码是否合理
       	 $('#pwd').blur(function(){     
       		$('#pwd').next().next().next().css({"display":"none"});
       		 var pwd = $('#pwd').val();
       		 var psdReg = /^[0-9a-zA-Z_]{6,15}$/;//密码正则
       			if (!psdReg.test(pwd)) {
       				$('#pwd').addClass('error');
       				$('#pwd').next().next().css({"display":"block"}).css({"padding-top":"10px"});
       			    $('#pwd').next().next().text("6-15 bits contain numbers or letters");
       			    p_judgment = false;
       				return false;
       			} 
       		 $('#pwd').next().next().css({"display":"none"});
       		 $('#pwd').next().next().next().css({"display":"block"});
       	     p_judgment = true;
       		 return false;
       	 });
       	 
       	 
       	 //验证两次密码是否相同
       	  $('#pwd1').blur(function(){     
       		$('#pwd1').next().next().next().css({"display":"none"});
       		 var pwd = $('#pwd').val();
       		 var pwd1 = $('#pwd1').val();
       			if (pwd != pwd1) {
       				$('#pwd1').addClass('error');
       				$('#pwd1').next().next().css({"display":"block"}).css({"padding-top":"10px"});
       			    $('#pwd1').next().next().text("Passwords must match");
       			 dp_judgment = false;
       				return false;
       			} 
       			
       		 var psdReg = /^[0-9a-zA-Z_]{6,15}$/;//密码正则
    			if (!psdReg.test(pwd1)) {
    				$('#pwd1').addClass('error');
    				$('#pwd1').next().next().css({"display":"block"}).css({"padding-top":"10px"});
    			    $('#pwd1').next().next().text("6-15 bits contain numbers or letters");
    			    p_judgment = false;
    				return false;
    			} 	
       			
       		 $('#pwd1').next().next().css({"display":"none"});
       		 $('#pwd1').next().next().next().css({"display":"block"});
       		 dp_judgment = true;
       		 return false;
       	 });
       	 
       	 
       	 
       	 
       	 //光标切入事件，移除提醒
       	 $('#pwd').focus(function(){
       		 $('#pwd').removeClass('error');
       		 $('#pwd').next().next().css({"display":"none"});
       	 })   
       	 $('#pwd1').focus(function(){
       		 $('#pwd1').removeClass('error');
       		 $('#pwd1').next().next().css({"display":"none"});
       	 })   
       	  	
            /**
             *光标切入事件
             */
             $('#email').focus(function(){
            	 $('#email').removeClass('error');
            	 $('#e_message').css({"display":"none"}); 
             }) 
             
           
           /**
            *验证邮箱是否合法
            */
            $('#email').blur(function(){
             $('#e_message').next().css({"display":"none"});
           	 var email = $('#email').val(); 
           	 if(email == null || email == ''){
           		 $('#email').addClass('error'); 
           		 $('#e_message').css({"display":"block"}).css({"padding-top":"10px"});
           		 $('#e_message').text("E-mail can not empty");
           		 e_judgment = false;
           		 return false;
           	 }
   	       	   //验证邮箱是否合法
   	    	   var szReg=/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+/;     	    	   
   	    	   if(!(email == null || email.length==0)){
   	    		   var bChk = szReg.test(email);
   	   			
   	   			if(!bChk){
   	   			    $('#email').addClass('error');
   	   				$('#e_message').css({"display":"block"}).css({"padding-top":"10px"});
   	   				$('#e_message').text("E-mail format is incorrect");
   	   				e_judgment = false;
   	   				return false;
   	   			}
   	   		   }         	 
           	 
           	  $.ajax({
     				url:"/crm/account/verifycEmail.do",
     				data:{
     					"email" : email	
     					  },
     				type:"post",
     				dataType:"text",
     				success:function(result){	
     					 $('#e_message').css({"display":"none"});
     	                 $('#e_message').next().css({"display":"block"});
     	                 e_judgment = true;
     					},
     			    error:function(){
     			    	 $('#email').addClass('error');
     			    	 $('#e_message').css({"display":"block"}).css({"padding-top":"10px"});
     			    	 $('#e_message').text("The mailbox already exists");
     			    	 e_judgment = false;
     			    }
     			});
             })  
            
             
              /**
               *客户注册
               */
            $('.btn-large').click(function(){
           	     $('#pwd').blur(); 
          	     $('#email').blur();
          	     flag = e_judgment && p_judgment && dp_judgment;
          	     if(!flag){
          	    	return false; 
          	     }
          	  var email = $('#email').val(); 
          	  var pwd = $('#pwd').val(); 
          	  var tel = $('#tel').val(); 
          	  var addr = $('#addr').val(); 
          	  var mainBusiness = $('#main_business').val(); 
          	  alert(userid);
              $(this).css({"background-color":"#bbb"}).attr("disabled","true");
          	  $.ajax({
   				url:"/crm/account/customerRegister.do",
   				data:{
   					"email" : email,	
   					"pwd" : pwd,	
   					"tel" : tel,		
   					"addr" : addr,	
   					"mainBusiness" : mainBusiness,
   					"userid":userid
   					  },
   				type:"post",
   				dataType:"text",
   				success:function(result){
   				
   				 $(this).css({"background-color":"#006dcc"}).removeAttr("disabled");	
   				   //发送注册成功邮件
   				   $.post("/crm/port/sendInfoToCustomer.do",
	       	            	  { 
             		      "loginEmail" : result
	       	            	  },
	       	        	   function(data){
	       	        	     
	       	        	  }); 					
   					
   					window.location.href = "${ctx}/login.jsp";
   					},
   			    error:function(){
   			    	
   			     $(this).css({"background-color":"#006dcc"}).removeAttr("disabled");		
   			    	easyDialog.open({
                  		   container : {
                      		     header : ' Prompt information',
                      		     content : '*Registration failed, please try again!*'
                  		   },
         					  drag : false,
         					  overlay : false,
         					  autoClose : 1000
                  		 });   
   			    }
   			});  
          	     
          	     
           	 
            })
        
       	 
        }) 
     
        
        </script>
<style>
    body{background-color: #fff;}
    .btn-success{color: #fff;
        background-color:  #08c;}
    .btn-success:hover{color: #fff;
        background-color: #04c;}
        
     input[type=text].error,input[type=password].error{
	  border-color: red;
	  }
	  
    .form-horizontal .help-block{color:#d14;}   
    
    
    .form-horizontal .control-group{position: relative;}
    .form-horizontal .control-group .controls img{    
    position: absolute;
    top: 43px;
    right: -22px;} 
</style>

    </head>
    <body style="height:60%;">
        <div id="loginbox">            
            <div id="loginform" class="form-vertical">
				 <div class="control-group normal_text"> <h3><img src="img/logo2.png" alt="Logo" /></h3></div>
                <div class="widget-box">
                    <div class="widget-title" style="text-align: -webkit-center;">
                        <h4>Register</h4>
                    </div>
                    <p class="z-note-p">If your company already have an account with us, please have your colleague send you an invitation email (available in his importX page), so that you can share access to the same information.</p>
                    <div class="widget-content nopadding">
                        <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">Email</label>
                                <div class="controls">
                                    <input type="text" name="email" id="email" class="span3">
                                    <span class="w-red">*</span><span class="help-block" id="e_message"></span><img src="img/check.png" style="display:none;"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Password</label>
                                <div class="controls">
                                    <input type="password" name="password" id="pwd" class="span3">
                                    <span class="w-red">*</span><span class="help-block"></span><img src="img/check.png" style="display:none;"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Re-enter password</label>
                                <div class="controls">
                                    <input type="password" name="password" id="pwd1" class="span3">
                                    <span class="w-red">*</span><span class="help-block"></span><img src="img/check.png" style="display:none;"/>
                                </div>
                            </div>
<!--                             <div class="control-group"> -->
<!--                                 <label class="control-label">Telephone</label> -->
<!--                                 <div class="controls"> -->
<!--                                     <input type="text" id="tel" class="span3"> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="control-group"> -->
<!--                                 <label class="control-label">Address</label> -->
<!--                                 <div class="controls"> -->
<!--                                     <input type="text" id="addr" class="span3"> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="control-group"> -->
<!--                                 <label class="control-label">Main business</label> -->
<!--                                 <div class="controls"> -->
<!--                                     <input type="text" id="main_business" class="span3"> -->
<!--                                 </div> -->
<!--                             </div> -->
                         </div>
                    </div>
                </div>
            <div class="w-footer">
                <div class="w-text">If you have already registered, please
                    <a href="#" onclick="location.href='/crm/login.jsp'">login</a>
                </div>
                <div class="w-btn">
                    <a href="#"><button class="btn btn-primary btn-large">Submit</button></a>
                </div>
            </div>
           </div>
        </div>
        <div class="a-section a-spacing-top-extra-large">





<!--             <div class="a-divider a-divider-section"><div class="a-divider-inner"></div></div> -->
<!--             <div class="a-section a-spacing-small a-text-center a-size-mini"> -->
<!--                 <span class="auth-footer-seperator"></span> -->


<!--                 <a class="a-link-normal" target="_blank" href=""> -->
<!--                     关于我们 -->
<!--                 </a> -->
<!--                 <span class="auth-footer-seperator"></span> -->


<!--                 <a class="a-link-normal" target="_blank" href=""> -->
<!--                     服务条款 -->
<!--                 </a> -->
<!--                 <span class="auth-footer-seperator"></span> -->


<!--                 <a class="a-link-normal" target="_blank" href=""> -->
<!--                     法律说明 -->
<!--                 </a> -->
<!--                 <span class="auth-footer-seperator"></span> -->
<!--                 <a class="a-link-normal" target="_blank" href="" style="border-right: none;"> -->
<!--                     联系我们 -->
<!--                 </a> -->
<!--                 <span class="auth-footer-seperator"></span> -->

<!--             </div> -->
            
            <div class="a-section a-spacing-none a-text-center">
  <span class="a-size-mini a-color-secondary">
 
  </span>
            </div>

        </div>
    </body>

</html>
