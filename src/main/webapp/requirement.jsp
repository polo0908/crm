<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>ImportX</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="/crm/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/crm/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="/crm/css/matrix-style.css" />
<link rel="stylesheet" href="/crm/css/matrix-media.css" />
<link rel="stylesheet" href="/crm/css/select2.css" />
<link rel="stylesheet" href="/crm/css/easydialog.css" />
<link rel="stylesheet" href="/crm/css/drawing.css" />
<link href="/crm/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link rel="stylesheet" href="css/uniform.css" />
<link rel="stylesheet" href="css/quotation.css" />
<link rel="stylesheet" href="/crm/css/style.css" />
<link rel="stylesheet" href="css/news.css" />
<link type='image/x-ico' rel='icon' href='img/favicon.ico' />
<link rel="stylesheet" href="css/ui.css">
<link rel="stylesheet" href="css/ui.progress-bar.css">
<link rel="stylesheet" href="css/upload-base.css">

 
 <script type="text/javascript" src="js/upload-base.js"></script>
<script type="text/javascript" src="/crm/js/easydialog.min.js"></script>
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

          $(function(){
        	
        	  $('#sidebar_ul').find('li').eq(2).addClass('active');
          })
 	
          
           /*
      *文件上传框改变事件 
      */
	 function getFileName(){
		  
	    	    var path = $('#file_upload').val();
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
	       			url: "/crm/uploadAttachment.do",
	       	     	dataType: "text",
	       	     	success: function(str){
	       	     	var result = eval('(' + str + ')');	
	       	     	if(result.state == 0){
		 	             $('#attachment_path').val(result.data);  
	       	     	}else{
		       	     	easyDialog.open({
	             		   container : {
	                 		     header : '  Prompt message',
	                 		     content : '  Upload failed '
	             		   },
	 					  overlay : false,
	 					  autoClose : 1000
	             		 });   
		       	     	$('#show_upload_dialog').hide();
	       	     	}	

	       	     	},
	       			error: function(){
	       				 easyDialog.open({
	                		   container : {
	                    		     header : '  Prompt message',
	                    		     content : '  Upload failed '
	                		   },
	    					  overlay : false,
	    					  autoClose : 1000
	                		 });   
	     	     		$('#show_upload_dialog').hide();
	       			}       	     	
	       	 	}); 	 		    
	   }
          
          
          //发送需求
         function send_requirement(quotationId,targetPriceReply,factoryId,userId){
        	 
        	 var requireText = $('#require_text').val();
        	 if(requireText == '' || requireText == null){
        		 easyDialog.open({
          		   container : {
              		     header : 'Prompt message',
              		     content : 'Demand can not be empty'
          		   },
					  overlay : false,
					  autoClose : 1000
          		 });   
        		 return false;
        	 }
        	 var attachmentPath = $('#attachment_path').val();
        	 
        	 $.post("/crm/saveQuotationMessage.do",
   	              { 
   				  "quotationId": quotationId, 
   				  "messageDetails": requireText,
   				  "targetPriceReply":targetPriceReply,
   				  "factoryId" : factoryId,
   				  "userId" : userId,
   				  "attachmentPath" : attachmentPath
   				  },
   				function(result){	  
   				  if(result.state == 0){
   					  
   					  easyDialog.open({
   			    		  container : {
   			    		    header : 'Prompt message',
   			    		    content : 'Send successfully'
   			    		  },
   			    		  overlay : false,
   			    		  autoClose : 1000
   			    		});
   					  
   	  				  /*
   	                   *增加消息后同步到后台报价系统
   	                   */
   	                  $.post("/crm/port/sendClientMessage.do",
   	                          { 
   	            			   "projectId" : $('#project_id').val(),
   	            			   "messageDetails" : requireText,
   	            			   "attachmentPath" : attachmentPath,
   	            			   "id" : result.data.id
   	            			   },
   	            			 function(result){
   	            				  
   	            			 })	  
   				  
   	              var base = new Base64();
   	               quotationId=base.encode(quotationId);   			 
   				  window.location = "/crm/queryQuotationById.do?quotationInfoId="+quotationId;   	         	                   
   				  
   				  }else{
   					  easyDialog.open({
   			    		  container : {
   			    		    header : 'Prompt message',
   			    		    content : 'send failed'
   			    		  },
   			    		  overlay : false,
   			    		  autoClose : 1000
   			    		});
   				  }
   					    
   				});
        	 
        	 
         } 
          
 	
</script>
</head>
<body>
<jsp:include page="base.jsp"></jsp:include>

<div id="content">
 <form id="file_upload_id"  method="post" enctype="multipart/form-data" class="form-horizontal" onsubmit="return false;">
<input type="hidden" value="${quotationId}" id="quotation_id" name="quotationId">
<input type="hidden" value="${quotation.factoryId}" name="factoryId">
<input type="hidden" value="${quotation.projectId}" id="project_id">
<input type="hidden" id="attachment_path" name="attachmentPath">
  <div id="content-header">
    <div id="breadcrumb"> <a href=""  class="tip-bottom"><i class="icon  icon-paste"></i>Update requirement</a>
     </div>
      <h1 class="bread-h1" style="float:left;">Update requirement</h1>
  </div>
    <div class="container-fluid"><hr style="clear:both;">

        <div class="row-fluid">
            <div class="span8">
                <textarea class="div-w-text" rows="10" cols="40" id="require_text" name="messageDetails"></textarea>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">Attachment: </label>
            <div class="controls">
                <div class="uploader" style="width:inherit;">
                    <input type="file" size="19" style="opacity: 0;" id="file_upload" name="file_upload" onChange="getFileName()">
                    <span class="filename" id="fileName">No file selected</span>
                    <span class="action">Choose File</span>
                </div>
                <span style="margin-left: 20px;color: red;font-size: 14px;">(If you need to send more please compression)</span>
            </div>
        </div>
        <button class="w-btn btn btn-primary" onclick="send_requirement('${quotationId}','2','${quotation.factoryId}','${quotation.userId}')">send</button>
 </div>

</form>
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

<script type="text/javascript" src="js/jquery-form.js"></script>


</body>
</html>
