<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="com.cbt.util.WebCookie"%>
<%@page import="com.cbt.util.DateFormat"%>

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
<link type='image/x-ico' rel='icon' href='img/favicon.ico' />


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
		
	});
	
	/*
	 *根据userName、时间进行查询
	 */
	var userName;
	var beginDate;
	var endDate;
	function queryByDate() {
		userName = $('#userName').val();
		beginDate = $('#beginDate').val();
		endDate = $('#endDate').val();
        
		window.location = "/supplier/queryAllQuotation.do?user=" + userName
				+ "&beginDate=" + beginDate + "&endDate=" + endDate;

	}
	
	
	
	//预览下载报价单
	function download_quotation(quotationInfoId){
		
		
		
		var base = new Base64();
		quotationInfoId=base.encode(quotationInfoId);
		//使用ajax提交下载
		$.ajax({
			url:"/crm/fileDownload_quotation.do",
			data:{
				  "quotationInfoId":quotationInfoId
				  },
			type:"post",
			dataType:"text",
			success:function(res){			
				window.location.href = "/crm/fileDownload_quotation.do?quotationInfoId="+quotationInfoId;				
				},
		    error:function(){
		    	
		    	easyDialog.open({
		    		  container : {
		    		    header : 'Prompt message',
		    		    content : 'Download failed'
		    		  },
		    		  overlay : false,
		    		  autoClose : 1000
		    		});
		    }
		});
	}
	
	
	
	/*
	 *发送消息
	 */	
	function send_message(quotationId,targetPriceReply,factoryId,userId){
		
		var messageDetails = $('#message_input').val();
		
		if($.trim(messageDetails) == '' || $.trim(messageDetails) == null){
			easyDialog.open({
	    		  container : {
	    		    header : 'Prompt message',
	    		    content : 'You have not entered a message yet'
	    		  },
	    		  overlay : false,
	    		  autoClose : 1000
	    		});
			return false;
		}
		
		$.post("/crm/saveQuotationMessage.do",
              { 
			  "quotationId": quotationId, 
			  "messageDetails": messageDetails,
			  "targetPriceReply":targetPriceReply,
			  "factoryId" : factoryId,
			  "userId" : userId
			  },
			function(result){
				  
			  if(result.state == 0){
				  
				  var message = result.data;
				  var li = '<li>'+
                            '<div class="article-post">'+
			                  '<div class="fr">'+
			                      '<span class="w-user-info">'+message.messageSendTime+'</span>'+
			                  '</div>'+
			                  '<span class="user-info">'+message.loginEmail+'</span>'+
			                  '<p>'+message.messageDetails+
			                  '</p>'+
			               '</div>'+
                           '</li>';
                   $('.recent-posts').prepend(li);
                   $('#message_input').val('');
                    
                  
                   
                   /*
                    *增加消息后同步到后台报价系统
                    */
                   $.post("/crm/port/sendClientMessage.do",
                           { 
             			   "projectId" : $('#project_id').val(),
             			   "messageDetails" : messageDetails,
             			   "id" : message.id,
             			   "userId" : userId
             			   },
             			 function(result){
             				  
             			 })
             			  
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
	
	//打开关闭目标价窗口
	function show_target_div(){
		$('#w-div').show();
	}
	function close_target_div(){
		$('#w-div').hide();
	}
	
	//发送目标价消息
	function save_target_message(quotationId,targetPriceReply,factoryId,userId){

		var flag = false;
		$("#w-div").find('tbody').find('.z-input-price').each(function(index, element){
			if($(this).text() != null && $(this).text() != ''){
				flag = true;
			}
			
		})
		if(!flag){
			easyDialog.open({
	    		  container : {
	    		    header : 'Prompt message',
	    		    content : 'Please enter the target price'
	    		  },
	    		  overlay : false,
	    		  autoClose : 1000
	    		});
			return;
		}
		$('#w-div').find('.container-fluid').find('tbody').find('div').removeClass('z-input-price');
		var comment = '';
		var messageDetails = $('#w-div').find('.container-fluid').html();	
		comment = $('#comment').val();
	    var label = '<label>comment:'+comment+'</label>';
	    if(comment != '' && comment != null && comment != undefined){
	    	messageDetails = messageDetails + label;
	    }
	    console.log(messageDetails);
	    
		$.post("/crm/saveQuotationMessage.do",
	              { 
				  "quotationId": quotationId, 
				  "messageDetails": messageDetails,
				  "targetPriceReply":targetPriceReply,
				  "factoryId" : factoryId,
				  "userId" : userId
				  },
				function(result){
				
				$('#w-div').find('.container-fluid').find('tbody').find('div').addClass('z-input-price');  
				  if(result.state == 0){
					  
					  easyDialog.open({
			    		  container : {
			    		    header : 'Prompt message',
			    		    content : 'Send successfully'
			    		  },
			    		  overlay : false,
			    		  autoClose : 1000
			    		});
					   var message = result.data;
					   var li = '<li>'+
								     '<div class="article-post">'+
					                  '<div class="fr">'+
					                      '<span class="w-user-info">'+message.messageSendTime+'</span>'+
					                  '</div>'+
					                  '<span class="user-info">'+message.loginEmail+'</span>'+
					                 message.messageDetails+
					             '</div>'+
					             '</li>';
	                   $('.recent-posts').prepend(li);
	                   $('#message_input').val('');
	                   close_target_div();   
	                   $("#w-div").find('tbody').find('.z-input-price').each(function(index, element){
	                	   $(this).text('');
	                   })
	                   
	                   
	                   
	               /*
                    *增加消息后同步到后台报价系统
                    */
                   $.post("/crm/port/sendClientMessage.do",
                           { 
             			   "projectId" : $('#project_id').val(),
             			   "messageDetails" : messageDetails,
             			   "id" : message.id,
             			   "userId" : userId
             			   },
             			 function(result){
             				  
             			 })
	                   
	                   
	                   
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
	
	function goto_question(quotationId,factoryId,userId){
		
		window.location = "/crm/toAddRequirement.do?quotationId="+quotationId+"&factoryId="+factoryId+"&userId="+userId;
	}
	
	
	//下载留言消息附件
	function download_attachment(id){
				
		var base = new Base64();
		id=base.encode(id);
		$.ajax({
			url:"/crm/fileDownload_quotation_attachment.do",
			data:{
				  "id":id
				  },
			type:"post",
			dataType:"text",
			success:function(res){			
				window.location.href = "/crm/fileDownload_quotation_attachment.do?id="+id;				
				},
		    error:function(){
		    	
		    	easyDialog.open({
		    		  container : {
		    		    header : 'Prompt message',
		    		    content : 'Download failed'
		    		  },
		    		  overlay : false,
		    		  autoClose : 1000
		    		});
		    }
		});
	}
	
	
	//显示回复消息板
	function show_message_board(obj){
	   $(obj).parent().next().show().next().show().next().show().next().show();		
	}
	
	
</script>
<style type="text/css">
   .table-striped thead th{text-align: center;}
    #price_ul li{cursor: default;}
</style>
</head>
<body>
<jsp:include page="base.jsp"></jsp:include>
 
<!--main-container-part-->
<input type="hidden" value="${quotationBean.projectId}" id="project_id">
 <div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href=""  class="tip-bottom"><i class="icon  icon-paste"></i>Quotation Details</a>
       <%--  <div class="w-rt">
            <button class="btn btn-info btn-mini" onclick="show_target_div()">Give target price</button>
            <button class="btn btn-success btn-mini" onclick="goto_question('${quotationBean.id}','${quotationBean.factoryId}','${quotationBean.userId}')">Ask question or comment</button>
        </div> --%>
    </div>
      <h1 class="bread-h1">The Quotation Of CSG</h1>
  </div>
    <div class="container-fluid"><hr style="clear:both;">

        <div class="row-fluid">
            <div class="span8" style="border-right: 1px solid #ccc;">
                <div class="span6">
                    <table class="span6-table">
                        <tbody class="table-tbody">
                        <tr>
                            <td class="w-td">Project No:</td>
                            <td>${quotationBean.projectId}</td>
                        </tr>
                       </tbody>
                    </table>
                </div>
            </div>
          <div class="span12" style="margin-left: 0;">
            <div class="span8 w-span8" style="margin-left: 0;">
                    <div class="span6">
                        <table class="span6-table">
                            <tbody class="table-tbody">
                            <tr>
                                <td class="w-td">Subject :</td>
                                <td>${quotationBean.quotationSubject}</td>
                            </tr>
                            <tr>
                                <td class="w-td">Currency :</td>
                                <td>${quotationBean.currency}</td>
                            </tr>
                            <tr>
                                <td class="w-td">Quote Date :</td>
                                <td>${quotationBean.quotationDate}</td>
                            </tr>
                          </tbody>
                        </table>
                    </div>
                <div class="span6">
                    <table class="span6-table">
                        <tbody class="table-tbody">
                        <tr>
                            <td class="w-td">Client Name :</td>
                            <td>${quotationBean.customerName}</td>
                        </tr>
                        <tr>
                            <td class="w-td">Inco Term :</td>
                            <td>${quotationBean.incoTerm}</td>
                        </tr>
                        <tr>
                            <td class="w-td">Valid :</td>
                            <td>${quotationBean.quotationValidity} days</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
          </div>
            <div class="span4">
                <table class="span6-table">
                    <tbody class="table-tbody">
                    <tr>
                        <td class="w-td">Quoter :</td>
                        <td>${quotationBean.quoter}</td>
                    </tr>
                    <tr>
                        <td class="w-td">Email :</td>
                        <td>${quotationBean.quoterEmail}</td>
                    </tr>
                    <tr>
                        <td class="w-td">TEL :</td>
                        <td>${quotationBean.quoterTel}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
          </div>
     </div>
 </div>

    <div class="out-box">
        <div class="container-fluid">
            <div class="w-font">
                <h2 class="w-font-h2">Product details</h2>
               <!--  <div class="w-rt">
		            <button class="btn btn-info btn-mini" onclick="show_target_div()">Give target price</button>
		            <button class="btn btn-success btn-mini" onclick="goto_question('19','f1010','97361')">Ask question or comment</button>
		        </div> -->
            </div>
           <hr>
          <div class="widget-box">
              <div class="widget-content nopadding">
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>NO.</th>
                            <th>Product</th>
                            <th>Material</th>
                            <th>Mold cost(${quotationBean.currency})</th>
                            <th>Quantity</th>
                            <th>Unit Price(${quotationBean.currency})</th>
                            <th>Notes</th>
                        </tr>
                        </thead>
                        <tbody>
                         <c:forEach var="obj" items="${quotationProductions}" varStatus="i">
                        <tr class="odd gradeX w-gradeX">
                            <td>${i.index+1}</td>
                            <td>${obj.productName}</td>
                            <td>${obj.material}</td>
                            <td>${obj.moldPrice}</td>
                            <td>
                            <c:forEach begin="1" end="${productionPrices.get(i.count-1).size()}" varStatus="k" step="1">  
                            <span>${productionPrices.get(i.count-1).get(k.count-1).quantity}</span><br>
                            </c:forEach>                                
                            </td>
                            <td>
                            <c:forEach begin="1" end="${productionPrices.get(i.count-1).size()}" varStatus="j" step="1"> 
                            <span>${productionPrices.get(i.count-1).get(j.count-1).productPrice}</span>
                            <c:if test="${quotationBean.weightStatus != 0 || quotationBean.processStatus != 0}">
                            <a class="z-a-price" onclick="show_price_detalis('${productionPrices.get(i.count-1).get(j.count-1).id}','${obj.id}','${quotationBean.id}')">Price Details</a>
                            </c:if>
                            <br>
                            </c:forEach>
                            </td>
                           
                            <td>${obj.productNotes}</td>
                        </tr>
                        </c:forEach>
                       </tbody>
                    </table>
                </div>
            </div>

       </div>
    </div>
    
     <div class="out-box">
        <div class="container-fluid">
            <div class="w-font">
                <h2 class="w-font-h2">Remarks information</h2>
            </div>
            <div class="w-hr">
                <hr>
            </div>
            	<div class="row-fluid">
	            	<div class="span12">
	                	<textarea class="span11 w-textarea-span11"  id="select_temp_remark" disabled="disabled">${quotationBean.remark}</textarea>
	                </div>
	            </div> 
            	<div class="row-fluid">
	            	<div class="span12">
	                	<p class="span11 w-textarea-span11 w-p-span11"  id="select_temp_pic">${quotationBean.remarkImg}</p>
	                </div>
	            </div>
            </div>
           <div class="w-button div-w-button">
                <button class="btn btn-primary" style="margin-left: 10px;" onclick="download_quotation('${quotationBean.id}')">Download</button>
            </div>
    </div>
    
    
      <div class="out-box">
        <div class="container-fluid">
            <div class="w-font">
                <h2 class="w-font-h2">Original email for quotation</h2>
            </div>
            <div class="w-hr">
                <hr>
            </div>
            	<div class="row-fluid" id="quotation_email_content">
	               
	            </div>    
	   </div>      
    </div>
    
    
    <div class="container-fluid">
    <div class="row-fluid">
		            <button class="btn btn-info btn-mini" onclick="show_target_div()">Give target price</button>
<%-- 		            <button class="btn btn-success btn-mini" onclick="goto_question('${quotationBean.id}','${quotationBean.factoryId}','${quotationBean.userId}')">Ask question or comment</button> --%>
<!-- 		            <button class="btn btn-warning btn-mini" onclick="show_message_board(this)">Send Message</button> -->
		        </div>
        <div class="w-font" style="display:none;">
            <h2 class="w-font-h2">Send Message</h2>
        </div>
        <hr>
        <div class="row-fluid"  style="display:none;">
            	<div class="span12">
                	<textarea class="span11 w-textarea-span11"  id="message_input"></textarea>
                </div>
        </div>
        <div class="w-button"  style="display:none;">
            <button class="btn btn-success" style="float: right;" onclick="send_message('${quotationBean.id}','0','${quotationBean.factoryId}','${quotationBean.userId}')">Send</button>
        </div>
    </div>
    <div class="container-fluid">
        <hr>
        <div class="row-fluid">
            <div class="span12">
                <div class="widget-content nopadding">
                        <ul class="recent-posts">
                           <c:forEach var="obj" items="${messages}" varStatus="i">
                           <c:if test="${obj.targetPriceReply == 2}">
                            <li>
                            	<div class="article-post">
                                    <div class="fr">
                                        <span class="w-user-info">${obj.messageSendTime != null ?fn:substring(obj.messageSendTime,0,fn:indexOf(obj.messageSendTime,".")):""}</span>
                                    </div>
                                    <span class="user-info">${obj.loginEmail}</span>
                                    <p>
                                        ${obj.messageDetails}
                                    </p>
                                </div>
                                <div class="w-button9">
                                	 <a href="#" style="float:right;color:#08c;text-decoration: underline;">${obj.attachmentPath}</a><p style="float:right;">Download：</p>
                                </div> 
                                
                            </li>
                            </c:if>
                           <c:if test="${obj.targetPriceReply != 2}">
                            <li>
                                <div class="article-post">
                                    <div class="fr">
                                        <span class="w-user-info">${obj.messageSendTime != null ?fn:substring(obj.messageSendTime,0,fn:indexOf(obj.messageSendTime,".")):""}</span>
                                    </div>
                                    <span class="user-info">${obj.loginEmail}</span>
                                    <p>
                                        ${obj.messageDetails}
                                    </p>
                                </div>
                            </li>
                            </c:if>
                            </c:forEach>
                        </ul>
                    </div>
            </div>
        </div>
    </div>
    
    <!-- 价格详情 -->
        	<div class="weui_dialog_alert" id="price_div" style="display:none;">
				    <div class="weui_mask"></div>
				    <div class="weui_dialog" style="width:40%;">
				        <div class="row-fluid">
				            <div class="span12">
				                <div class="">
				                    <div class="widget-title">
				                        <h5 style="float: initial;">Price Details</h5>
				                    </div>
				                    <div class="widget-content">
				                        <div class="row-fluid">
				                            <div class="span12 btn-icon-pg">
				                                <ul id="price_ul">

				                                </ul>
				                            </div>
				                        </div>
				                    </div>
				                </div>
				            </div>
				        </div>
				        <a class="close-reveal-modal" href="javascript:void(0);" onclick="close_price_div()">×</a>
				    </div>
				</div>
    
    
    
    <div class="w-block row-fluid" id="w-div" style="display:none;">
        <div class="weui_mask"></div>
        <div class="weui_dialog span6">
        	<div style="width:100%；">
            <div class="w-hook">
                <div class="w-padding">
                    <div class="w-right" onclick="close_target_div()">X</div>
                </div>
            </div>
            <div class="container-fluid">
                 <div class="widget-box">
                        <div class="widget-content nopadding">
                            <table class="table table-bordered table-striped">
                                <thead>                               
                                <tr>
                                    <th>NO.</th>
                                    <th>Quotation Date</th>
                                    <th>Product</th>
                                    <th>Mold cost(${quotationBean.currency})</th>
                                    <th>Quantity</th>
                                    <th>Unit Price(${quotationBean.currency})</th>
                                    <th>Target Price(${quotationBean.currency})</th>
                                    <th>Feedback Date</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="obj" items="${quotationProductions}" varStatus="i">
                                <tr class="odd gradeX w-gradeX">
                                    <td>${i.index+1}</td>
                                    <td>${quotationBean.quotationDate}</td>
		                            <td>${obj.productName}</td>
		                            <td>${obj.moldPrice}</td>		                
		                            <td>
		                            <c:forEach begin="1" end="${productionPrices.get(i.count-1).size()}" varStatus="k" step="1">  
		                            <span>${productionPrices.get(i.count-1).get(k.count-1).quantity}</span><br>
		                            </c:forEach>                                
		                            </td>
		                            <td>
		                            <c:forEach begin="1" end="${productionPrices.get(i.count-1).size()}" varStatus="j" step="1"> 
		                            <span>${productionPrices.get(i.count-1).get(j.count-1).productPrice}</span><br>
		                            </c:forEach>
		                            </td>
		                            <td>
		                            <c:forEach begin="1" end="${productionPrices.get(i.count-1).size()}" varStatus="k" step="1">  
		                            <div contenteditable="true" style="color:red;" class="z-input-price"></div>
		                            </c:forEach>                 
		                            </td>
		                            <td><%=DateFormat.currentDate()%></td>
                                </tr>
                                </c:forEach>                           
                                </tbody>
                            </table>
                        </div>                        
                </div>  
                           
            </div>
            <span style="float: left;margin-left: 15px;">Comment:</span>
            <textarea style="width: 620px;" rows="3" id="comment"></textarea>
            <div class="weui_dialog_ft" style="margin-top: 0;">
                <a href="javascript:;" class="weui_btn_dialog primary" onclick="save_target_message('${quotationBean.id}','1','${quotationBean.factoryId}','${quotationBean.userId}')">Send</a>
            </div>
            </div>
        </div>
    </div>

</div>

<div class="row-fluid">
  <div id="footer" class="span12">
  
   </div>
</div>
</body>
<script type="text/javascript">
   $(function(){
	   $.post("/crm/port/receiveNewRFQEmail.do",
               { 
 			   "projectId" : $('#project_id').val()
 			   },
 			 function(result){
 				  if(result.state == 0){
 					  $('#quotation_email_content').append(result.data.content);
 					  if(!(result.data.attachmentName == null || result.data.attachmentName == "" || result.data.attachmentName == undefined)){
 					  $('#quotation_email_content').append("<a style='float:right;color: #08c;text-decoration: underline;' href='http://112.64.174.34:43888/New-Quotation/download1?filename="+result.data.attachmentName+"'>"+result.data.attachmentName+"</a><span style='float:right;margin-right: 9px;font-size: 16px;'>Attachment Download:</span>");
 					  $('#quotation_email_content').find('a:last').before("<button class='btn btn-success btn-mini' onclick='show_all_email(this)'>Show All</button>");
 					 }
 					  
 					  $('#divtagdefaultwrapper').children().each(function(i){
 						 if(i > 6){
 							$('#quotation_email_content').find('button:last').show();
 							$(this).hide(); 
 						 }else{
 							$('#quotation_email_content').find('button:last').hide();
 						 }					  
 					 })					  
 				  }
 			 })
 			 
 			 
 		//隐藏后台操作button	 
 	   $('#select_temp_pic').find('button').hide();		 
 			 
   })  
   
   
   //显示邮件全部内容
   function show_all_email(obj){
	    
	   var btn_val = $(obj).text();
	   if(btn_val == 'Show All'){
		   $('#divtagdefaultwrapper').children().each(function(i){
		        if(i > 6){
					$(this).show();
					$(obj).text("Pack Up");
		        }				  
	      })					
	   }
	   if(btn_val == 'Pack Up'){
		   $('#divtagdefaultwrapper').children().each(function(i){
		        if(i > 6){
					$(this).hide();
					$(obj).text("Show All");
		        }				  
	      })					
	   }
	       
   }
   
   
   
    //显示价格详情
   function show_price_detalis(priceId,productId,quotationInfoId){
 	  
 	  $.post("/crm/queryPriceDetails.do", 
  			  { 
  		        "priceId" : priceId,
  		        "productId" : productId,
  		        "quotationInfoId" : quotationInfoId 
  		      },
  			   function(result){
  		    	  if(result.state == 0){
  	 		    	  var productionBean = result.data.productionBean;
  	 		    	  var quotationBean = result.data.quotationBean;
  	 		    	  var processList = result.data.processList;
  	 		    	  var priceBean = result.data.priceBean;
  	 		    	  var tl = processList.length;
  	 		    	  $('#price_ul').empty(); 
  	 		    	  var process = '';
  	 		          
  	 		    	  for(var i=0;i<tl;i++){
  	 		    		  process +='<li><span>Process'+(i+1)+':'+processList[i].processName+'</span></li>';
  	 		    	  }
  	 		    	  if(quotationBean.weightStatus == 0 && quotationBean.processStatus == 1){
  	 		    		$('#price_ul').append(process);  
  	 		    	  }else if(quotationBean.weightStatus == 1 && quotationBean.processStatus == 0){
  	 		    		$('#price_ul').append('<li><span>Material weight:'+priceBean.materialWeight+'kg</span></li>');  
  	 		    	  }else if(quotationBean.weightStatus == 1 && quotationBean.processStatus == 1){
  	 		    		$('#price_ul').append('<li><span>Material weight:'+priceBean.materialWeight+'kg</span></li>'+process); 
  	 		    	  }
  	 		    	 	 		    	  
  	 		    	  $('#price_div').show();
  	 		    	  
  	 		    	  
  		    	  }else{
  		    		  easyDialog.open({
  						  container : {
  						    header : 'Prompt message',
  						    content : '查询失败 '
  						  },
  			    		  overlay : false,
  			    		  autoClose : 1000
  						}); 
  		    	  }

  		      })
   }
  
   //关闭价格详情
   function close_price_div(){
 	  $('#price_div').hide();
   }
   
   
   

</script>
</html>
