<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.cbt.util.WebCookie"%>	
<%@page import="java.util.List"%>
<%@page import="com.cbt.entity.UpdateDrawing"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>ImportX</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/matrix-style.css" />
<link rel="stylesheet" href="css/matrix-media.css" />
<link rel="stylesheet" href="css/bootstrap-wysihtml5.css" />
<link rel="stylesheet" href="css/email.css" />
<link rel="stylesheet" href="css/uniform.css" />
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" href="css/easydialog.css" />
<link rel="stylesheet" href="css/ui.css">
<link rel="stylesheet" href="css/ui.progress-bar.css">
<link rel="stylesheet" href="css/upload-base.css">
<link type='image/x-ico' rel='icon' href='img/favicon.ico' />
 
<script type="text/javascript" src="js/upload-base.js"></script>
<script type="text/javascript" src="js/easydialog.min.js"></script>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/base64.js"></script>  

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-115010583-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-115010583-1');
</script>
<script type="text/javascript">
      
 /*
  *消息类型判断打开窗口
  */
 $(function(){
	 
	 $('#sidebar_ul').find('li').eq(0).addClass('active');
	 
   	var message_type = $('#message_type').val(); 	
   	if(message_type == 2){
   		$('.container-fluid:first').hide();
   		$('.container-fluid:last').show();
   		$('#message_title').text("Report Quality Issues");
   	}else if(message_type == 1){
   		$('.container-fluid:last').hide();
   		$('.container-fluid:first').show(); 
   		$('#message_title').text("Push for Lead Time");
   	}else if(message_type == 3){
   		$('.container-fluid:last').hide();
   		$('.container-fluid:first').show();   
   		$('#message_title').text("Other Issues");
   	}
 })
      
      
      
//发送push for lead time 消息 
function send_push_message(orderId,factoryId,messageType){
	   
	   var pushMessage = $('#push_message_remark').val();
	   if(pushMessage == null || pushMessage == "" || pushMessage == undefined){
		   easyDialog.open({
	    		  container : {
	    		    header : 'Prompt message',
	    		    content : 'Please enter message'
	    		  },
	    		  overlay : false,
	    		  autoClose : 1000				    		  
	    		});	
		   return false;
	   }		   
	   $.post("/crm/savePushMessageByOrderId.do", 
			   {
		       "pushMessage": pushMessage,
		       "orderId" : orderId,
		       "factoryId" : factoryId,
		       "messageType":messageType
			   },
			   function(result){
				   if(result.state == 0){
			        window.location = "/crm/submitSuccess.do?orderId="+orderId;						
					}else{
						easyDialog.open({
				    		  container : {
				    		    header : 'Prompt message',
				    		    content : 'Failed to send,please try again'
				    		  },
				    		  overlay : false,
				    		  autoClose : 1000
				    		  
				    		});			
					}
			   });	 
}  

//发送质量问题消息 
function send_quality_message(){		   		   	 
	   var orderId = $('#order_id').val();
	   var qualityMessage = $('#qualityMessage').val();		   
	   if(qualityMessage == "" || qualityMessage == null || qualityMessage == undefined){
		   easyDialog.open({
	    		  container : {
	    		    header : 'Prompt message',
	    		    content : 'Please enter message'
	    		  },
	    		  overlay : false,
	    		  autoClose : 1000
	    		  
	    		});		
		   return false;
	   }
	   
	   $("#file_upload_id").ajaxSubmit({
			type: "post",
			url: "${ctx}/saveQualityMessageByOrderId.do",
	     	dataType: "text",
	        success: function(data){
	        	var result	= eval("("+data+")");
	        	if(result.state == 0){
	        		 window.location = "/crm/submitSuccess.do?orderId="+orderId;		
				}else{
					easyDialog.open({
			    		  container : {
			    		    header : 'Prompt message',
			    		    content : 'Failed to send,please try again'
			    		  },
			    		  overlay : false,
			    		  autoClose : 1000				    		  
			    		});		
				}   
   	       }
		   
 	 });
}  

/*查询订单详情*/
function order_details(orderId){
	   var base = new Base64();
	   orderId=base.encode(orderId);
	   window.location.href = "${ctx}/queryOrderDetails.do?orderId="+orderId;	   
}
/*
 *文件上传框改变事件 
 */
function getFileName(){
	  
   	        var path = $('#file_upload').val();
   	        
   	        //判断上传格式，必须为图片
   	        var gen = path.lastIndexOf("."); 
   	        var type = path.substr(gen); 
   	        if(!(type.toLowerCase()  == ".jpg" || type.toLowerCase()==".gif" || type.toLowerCase() ==".jpeg"
   	        	||type.toLowerCase()==".bmp" || type.toLowerCase()  == ".png")){
   	        	easyDialog.open({
		    		  container : {
		    		    header : 'Prompt message',
		    		    content : 'File type is not supported'
		    		  },
		    		  overlay : false,
		    		  autoClose : 2000				    		  
		    		});	
   	        	return false;
   	        }
   	        
		    sppath = path.split("\\");
		    var drawingName = sppath[sppath.length-1];	   
		    $('#fileName').text(drawingName);
		    if(drawingName == null || drawingName == '' || drawingName == undefined){
 		    	return false;
 		    }else{
	 		    autTime();
 		    }	 		    	
		    
		    $("#file_upload_id").ajaxSubmit({
				type: "post",
				url: "${ctx}/uploadQualityMessage.do",
		     	dataType: "text",
		        success: function(data){
		        	var result	= eval("("+data+")");
		        	console.log(result.data);
		        	if(result.state == 0){
		        		$('#drawings_map').val(result.data); 	
		        		console.log($('#drawings_map').val());
					}else{
						easyDialog.open({
				    		  container : {
				    		    header : 'Prompt message',
				    		    content : 'Failed to upload'
				    		  },
				    		  overlay : false,
				    		  autoClose : 1000				    		  
				    		});		
					}   
	   	       }
			   
	 	 });	    
  }
  
  

</script>
</head>
<body>
<jsp:include page="base.jsp"></jsp:include>
<div id="content">
  <div id="content-header">
      <h1 id="message_title" class="bread-h1" style="float:left;">Push for Lead Time</h1>
<!--       <h1 class="bread-h1" style="float:left;">Other Issues</h1> -->
  </div>
  <div id="content-header">
        <div id="breadcrumb"> <a href="#" onclick="listClientOrder();" class="tip-bottom" data-original-title="Go to Drawings"><i class="icon icon-file"></i>My Orders</a> <a href="#" onclick="order_details('${orderId}')" class="tip-bottom">Order Details</a> <a href="#" class="current">Send Message</a>
    </div>
  </div>
  <div class="container-fluid">
     <hr style="margin-top: 45px;">
      <div class="row-fluid"><p style="text-align: left;width: 100%;display: inline-block;color: #cc0000;font-weight: 500;">Project Name:${clientOrder.projectName}</p>
          <div class="widget-box">
               <div class="widget-content">
                  <div class="control-group">
                          <div class="controls">
                              <textarea class="textarea_editor span12" rows="6" placeholder="Enter text ..." id="push_message_remark"></textarea>
                          </div>
                  </div>
              </div>
          </div>
      </div>
      <a href="#">
          <button class="btn btn-primary" style="margin:20px 0px 10px 20px;" onclick="send_push_message('${orderId}','${factoryId}','${messageType}')">Send</button>
      </a>    
  </div>
  <div class="container-fluid" style="display:none;">
     <hr style="margin-top: 45px;">
      <form id="file_upload_id" action="${ctx}/saveQualityMessageByOrderId.do" onsubmit="return false;" method="post" enctype="multipart/form-data">
      <input type="hidden" value="${orderId}" name="orderId" id="order_id">
      <input type="hidden" value="${factoryId}" name="factoryId" id="factory_id">
      <input type="hidden" value="${messageType}" name="messageType" id="message_type">
      <input type="hidden" name="drawingsMap" id="drawings_map">
      <div class="row-fluid"><p style="text-align: left;width: 100%;display: inline-block;color: #cc0000;font-weight: 500;">Project Name:${clientOrder.projectName}</p>
          <div class="widget-box">
               <div class="widget-content">
                  <div class="control-group">
                          <div class="controls">
                              <textarea class="textarea_editor span12" rows="6" placeholder="Enter text ..."  name="qualityMessage" id="qualityMessage"></textarea>
                          </div>
                  </div>
              </div>
          </div>
      </div>
          <div class="controls">
            <div class="uploader" id="uniform-undefined">                     
               <input type="file" size="19" multiple name="file_upload" id="file_upload" style="opacity: 0;" onChange="getFileName()"><span class="filename" id="fileName">No file selected</span><span class="action">Choose File</span>
            </div>
            <span style="margin-left: 20px;color: red;font-size: 13px;">problematic pictures upload  </span><span style="color: #0fba0f;">&nbsp;&nbsp;File types(.jpg .gif .jpeg .bmp .png)</span>
          </div>
      <a href="#">
          <button class="btn btn-primary" style="margin:20px 0px 10px 20px;" onclick="send_quality_message()">Send</button>
      </a>
      </form>
  </div>
  
</div>

<div class="row-fluid">
  <div id="footer" class="span12">
  </div>
</div>




<!-- 上传进度显示 -->
<div class="w-out-box" id="show_upload_dialog" style="display:none;">
<div class="weui_mask"></div>
<div class="w-weui_dialog" style="width:510px;">
  <div id="container">

	<div class="content">
		<h1>Upload Progress</h1>
	</div>
	
	<!-- Progress bar -->
	<div id="progress_bar" class="ui-progress-bar ui-container">
	<div class="ui-progress" style="width: 0%;" id="ui-progress-upload">
	<span class="ui-label" style="display:none;">loading...<b class="value">0%</b></span>
	</div>
	</div>
	<!-- /Progress bar -->
    <a class="close-reveal-modal" style="color:#eee;font-size:22px;" href="javascript:void(0);" onclick="cancel_upload()">×</a>
	<div class="content" id="main_content" style="display: none;">
		<p>Upload completed</p>
	</div>
   </div>
   </div>
 </div>
</body>
<script type="text/javascript" src="js/jquery-form.js"></script>
</html>
