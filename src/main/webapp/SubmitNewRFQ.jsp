<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.cbt.util.WebCookie"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@page import="com.cbt.util.DateFormat"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>ImportX</title>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="css/bootstrap.min.css" />
  <link rel="stylesheet" href="css/uniform.css" />
  <link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
  <link rel="stylesheet" href="css/font-awesome.css" />
  <link rel="stylesheet" href="css/matrix-style.css" />
  <link rel="stylesheet" href="css/matrix-media.css" />
  <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
  <link rel="stylesheet" href="css/jquery.gritter.css" />
  <link rel="stylesheet" href="css/easydialog.css" />
  <link rel="stylesheet" href="css/ui.css">
  <link rel="stylesheet" href="css/ui.progress-bar.css">
  <link rel="stylesheet" href="css/upload-base.css">
  <link type='image/x-ico' rel='icon' href='img/favicon.ico' />
 
    <script type="text/javascript" src="js/upload-base.js"></script>
    <script type="text/javascript" src="js/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="js/easydialog.min.js"></script>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
	
	<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-115010583-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-115010583-1');
</script>
	<script type="text/javascript">
	<%-- //获取session的登录用户id和登录名
	  <% String[] userinfo = WebCookie.getUser(request); %>
	  var userid = '<%=userinfo != null ? userinfo[0] : ""%>';
	  //用户名
	  var userName = '<%=userinfo != null ? userinfo[1] : ""%>'; --%>

                     
		
			$(function(){
		     $('#sidebar_ul').find('li').eq(1).addClass('active');
		    })
	  
			  
     /*
      *文件上传框改变事件 
      */
	 function getFileName(){
		  
	    	    var path = $('#file_upload').val();
			    sppath = path.split("\\");
			    var drawingName = sppath[sppath.length-1];	   
			    $('#fileName').text(drawingName);
	 		    $('#drawings').val(drawingName);	
	 		    if(drawingName == null || drawingName == '' || drawingName == undefined){
	 		    	return false;
	 		    }else{
		 		    autTime();
	 		    }	 		    	
	     		$("#file_upload_id").ajaxSubmit({    			
	       			type: "post",
	       			url: "${ctx}/uploadRfqInfo.do",
	       	     	dataType: "text",
	       	     	success: function(result){
	 	             $('#drawing_name_to_time').val(result);
	       	     	},
	       			error: function(){
	       				 easyDialog.open({
	                		   container : {
	                    		     header : '  Prompt message',
	                    		     content : '  Upload failed. Please try again !'
	                		   },
	    					  overlay : false,
	    					  autoClose : 1000
	                		 });   
	       				$('#show_upload_dialog').hide();
	       			}
	       	 	}); 
	 		    
	   }
	  /*
	   * 文件上传，判断不能为空
	   */
	  function insertTitle(){  		 
//           var path = $('#file_upload').val();
		  var productName = $('#productName').val();
		  if(productName.length == 0){
	          	easyDialog.open({
	           		   container : {
	               		     header : '  Prompt message',
	               		     content : '  product name can not be empty !'
	           		   },
	  					  drag : false,
						  overlay : false,
						  autoClose : 2000
	           		 });   
	          	
	          	return false;
	          }
		  /**  
		     输入框日期必须大于当前时间  
		  */ 
// 		  var deliveryTime = $('#deliveryTime').val();
// 		  var d=new Date(Date.parse(deliveryTime.replace(/-/g,"/")));
// 		  var curDate = new Date();
	     
		  //判断交期时间是否为空
// 		  if(deliveryTime.length == 0){
//         	  easyDialog.open({
//          		   container : {
//              		     header : '  Prompt message',
//              		     content : '*  Required Delivery can not be empty  *'
//          		   },
// 					  drag : false,
// 					  overlay : false,
// 					  autoClose : 2000
//          		 });  
//         	  return false; 
// 		  }
        	//判断交期时间是否大于当前时间
// 		  if(d < curDate){
// 			  easyDialog.open({
//           		   container : {
//               		     header : '  Prompt message',
//               		     content : '*  The time can not be less than the current time  *'
//           		   },
//  					  drag : false,
// 					  overlay : false,
// 					  autoClose : 2000
//           		 });   
// 			  return false;  
// 		   }
     	
        	$('.btn-success').css({"background-color":"#666"}).attr("disabled","true");
// 		 	发送ajax请求,提交form表单    
     		$("#file_upload_id").ajaxSubmit({    			
   			type: "post",
   			url: "${ctx}/saveRfqInfo.do",
   			dataType: "text",
   	     	success: function(str){
   	     	   $('.btn-success').css({"background-color":"#51a351"}).removeAttr("disabled");
   	     	   var result = eval('(' + str + ')'); 
   	     	   //同步发送新图纸询盘到NBMail(调用NBMail接口)
   	     		$.post("/crm/port/rfqSYNC.do", 
   	     			   { 
   	     			    "result": result.data,
   	     			    "id" : result.rfqId
   	     			   },
   	     		   function(data){  	     		    
   	     		   });
   	     	
   	     	
   	         window.location = "${ctx}/SubmitNewRFQ-ok.jsp";  	 	         
   	     	},
   			error: function(){
   			$('.btn-success').css({"background-color":"#51a351"}).removeAttr("disabled");
   				 easyDialog.open({
            		   container : {
                		     header : '  Prompt message',
                		     content : ' Submit failed,please try again !'
            		   },
   					  drag : false,
					  overlay : false,
					  autoClose : 2000
            		 });   
   			}
   	 	});

	  }


	</script>
	<style>
		.form-horizontal .control-group{width:100%;margin-left: 18px;}
	</style>
</head>
<body>
	<jsp:include page="base.jsp"></jsp:include>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="#" class="tip-bottom" data-original-title="Go to Drawings"><i class="icon icon-inbox"></i> Drawings</a> <a href="#" class="tip-bottom" data-original-title="">Send New RFQ</a>
    </div>
    <h1>Send New RFQ</h1>
  </div>
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
            <h5>Send New RFQ</h5>
          </div>
          <div class="widget-content nopadding">
             <!-- 采用 fileUpload_multipartFile ， file.transferTo 来保存上传的文件 -->
              <form id="file_upload_id" action="${ctx}/saveRfqInfo.do" method="post" enctype="multipart/form-data"  class="form-horizontal" onsubmit="return false;">
             <%--  <form class="form-horizontal" action="${ctx}/saveRfqInfo.do" method="post" enctype="multipart/form-data">
              --%>
              <input type="hidden" id="drawing_name_to_time" name="drawingNameToTime">
             <div class="control-group">
                  <label class="control-label">Supplier: </label>
                  <div class="controls">
                     <select class="xiala_select span3" name="factoryName" id="select_factory">                      
                       <c:forEach var="obj" items="${factoryInfos}" varStatus="i">  
                       <option value="${obj.factoryName}" <c:if test="${obj.factoryName eq factoryInfo.factoryName}"> selected="selected"</c:if>>${obj.factoryName}</option>                   
                       </c:forEach>
                    </select>
                  </div>
              </div>
              <div class="control-group">
                <label class="control-label">Product Name :</label>
                <div class="controls">
                  <input type="text" class="span3" placeholder="name" id="productName" name="productName">
                </div>
              </div>
              <div class="control-group">
                <label class="control-label">Drawings :</label>
                <div class="controls">
                  <div class="uploader" id="uniform-undefined">                     
                     <input type="file" id="file_upload" name="file_upload" size="19" style="opacity: 0;" onChange="getFileName()"><span class="filename" id="fileName">No file selected</span><span class="action">Choose File</span><span id="prompt_file"></span>
                     <input name="drawingName" value="" type="hidden" id="drawings">
                  </div>
                  <span style="margin-left: 20px;color: red;font-size: 13px;">( if you need to send multiple files,  please zip them into one file then upload.)</span>
                </div>
              </div>
              
             <div class="control-group">
                <label class="control-label">Order Batch Quantity :</label>
                <div class="controls">
                  <input type="text" class="span3" value="1" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" id="batchQuantity" name="batchQuantity">
                </div>
              </div>   
                
              <div class="control-group">
                <label class="control-label">Annual Order Quantity :</label>
                <div class="controls">
                  <input type="text" class="span3" value="1" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" id="annualQuantity" name="annualQuantity">
                </div>
              </div>
<!--               <div class="control-group"> -->
<!--                 <label class="control-label">Required Delivery :</label> -->
<!--                 <div class="controls"> -->
<%--                   <input name="requiredTime" onclick="WdatePicker({skin:'whyGreen',lang:'en'})" id="deliveryTime" type="text" data-date="2016-09-08" data-date-format="dd-mm-yyyy" value="" placeholder="<%=DateFormat.weekLaterDate()%>" class="datepicker span3"> --%>
<!--                 </div> -->
<!--               </div> -->
              <div class="control-group">
                <label class="control-label">Other Comments :</label>
                <div class="controls">
                  <textarea class="span3" name="comment" style="height:120px;"></textarea>
                </div>
              </div>
               <div class="form-actions">
                	<input type="button" value="Send New RFQ" class="btn btn-success" style="font-family:'Helvetica Neue',Helvetica,Arial,sans-serif;" onclick="insertTitle();"/>
                </div>
             </form>
          </div>
        </div>
      </div>
    </div>
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

<script type="text/javascript" src="js/jquery-form.js"></script>
</body>
</html>
