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
<title>Importx</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/matrix-style.css" />
<link rel="stylesheet" href="css/matrix-media.css" />
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" href="css/news.css" />
<link rel="stylesheet" href="css/easydialog.css" />

<script type="text/javascript" src="js/easydialog.min.js"></script>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>

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
			$('#sidebar_ul').find('li').eq(0).addClass('active');
			
			var index = $('.recent-posts').find('li:last').find('a').prev().text();
			if(index == "" || index == null){
				$('#show_no_message').show();
			}else{
				$('#show_no_message').hide();
			}
		})
		
		//显示消息详情
		function show_details(messageCenterId,obj){
			if($(obj).parent().next().css('display') == 'none'){
				$(obj).parent().next().show();
			}else{
				$(obj).parent().next().hide();
				return false;
			}
			
			$.post("queryMessageDetails.do", 
					{ "messageCenterId": messageCenterId},
					function(result){						
				     if(result.state == 0){				    	
				    	 $(obj).find("span:last").hide();			    	 
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
				  });	
		}
		
		
		
		//打开工厂回复弹框
		function reply_message(obj){
			if($(obj).parent().parent().parent().parent().parent().next().css('display') == 'none'){
				$(obj).parent().parent().parent().parent().parent().next().show();
				$(obj).parent().parent().parent().parent().parent().next().find('input').focus();		
			}else{
				$(obj).parent().parent().parent().parent().parent().next().hide();
			}
	
		}
		
	   //保存回复消息	
       function send_message(messageCenterId,obj){
    	   var message = $(obj).next().find("input").val();		
    	   if(message == null || message == "" || message == "undefined"){
    		   easyDialog.open({
					  container : {
					    header : 'Prompt message',
					    content : '消息不能为空 '
					  },
		    		  overlay : false,
		    		  autoClose : 1000
					});
    		   return false;
    	   }
			$.post("saveCustomerMessage.do", 
					{
				     "messageCenterId": messageCenterId,
				     "messageDetails" : message,
				     "factoryId" : $('#factory_id').val()
					},
					function(result){
				     if(result.state == 0){
				    	$(obj).next().find("input").val('');
				    	var orderMessage = result.data;
                  	    var customer_div =   '<div class="w-text-div">'+
                                            ' <div class="article-post msg-block">'+
                                            ' <div class="fr"><a class="btn btn-primary btn-mini" onclick="reply_message(this)">Reply</a></div>'+
                                             '  <span class="w-user-info"> Reply: ['+orderMessage.userid+'] / Date:'+(orderMessage.messageSendTime).slice(0,(orderMessage.messageSendTime).indexOf("."))+'</span>'+
                                              ' <p class="w-user-p"><a>'+orderMessage.messageDetails+'</a></p>'+
                                             '</div>'+
                                           '</div>'; 
                  	   $(obj).parent().prev().children("div.chat-messages-inner").append(customer_div);
                  	   $(obj).parent().hide();
                        
				     }else{
				    	 easyDialog.open({
							  container : {
							    header : 'Prompt message',
							    content : '发送失败 '
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
  <div id="content-header">
    <div id="breadcrumb"> 
    <a href="#" onclick="listClientOrder()" class="tip-bottom" data-original-title="Go to Drawings"><i class="icon icon-file"></i>My Orders</a> <a href="#" class="current w_current_a" data-original-title="">Order Message</a>
     </div>
      <h1 class="bread-h1">Order Message</h1>
  </div>
    <div class="container-fluid">
        <hr>
        <div class="row-fluid">
            <div class="span12">
                <div class="accordion">
                   <c:forEach var="obj" items="${messageCenters}" varStatus="i">
                    <div class="accordion-group widget-box">
                        <div class="accordion-heading">
                            <div class="widget-title" onclick="show_details('${obj.id}',this)"><a data-parent="" href="#" data-toggle=""> <span class="icon"><i class="icon-comments"></i></span>
                                <c:if test="${obj.messageType != 4}">  
                                  <c:if test="${counts[i.count-1] == 0}">
                                    <p style="color:#b7b3b3;">${obj.messageTitle} message to the order[${obj.orderId}]</p>
                                  </c:if>
                                  <c:if test="${counts[i.count-1] != 0}">
                                    <p>${obj.messageTitle} message to the order[${obj.orderId}]</p>
                                  </c:if>
                                </c:if>
                                <c:if test="${obj.messageType == 4}">  
                                    <c:if test="${counts[i.count-1] == 0}">
                                    <p style="color:#b7b3b3;">${obj.messageTitle} to the quotation[${obj.quotationId}]</p>
                                    </c:if>
                                    <c:if test="${counts[i.count-1] != 0}">
                                    <p>${obj.messageTitle} to the quotation[${obj.quotationId}]</p>
                                    </c:if>
                                </c:if>
                                <span class="label label-important">${counts[i.count-1] == 0 ? "" : counts[i.count-1]}</span>
                                <c:if test="${counts[i.count-1] == 0}">
                                <p style="color:#b7b3b3;" class="fr w-widget-p">${obj.maxSendTime != null ?fn:substring(obj.maxSendTime,0,fn:indexOf(obj.maxSendTime,".")):""}</p>
                                </c:if>
                                <c:if test="${counts[i.count-1] != 0}">
                                <p class="fr w-widget-p">${obj.maxSendTime != null ?fn:substring(obj.maxSendTime,0,fn:indexOf(obj.maxSendTime,".")):""}</p>
                                </c:if>
                            </a> </div>
                        </div>
                        <div class="collapse in accordion-body" style="display:none;">
                            <div class="chat-content">
                                <div class="chat-messages">
                                    <div class="chat-messages-inner">
                                        <c:forEach begin="1" end="${orderMessages.get(i.count-1).size()}" varStatus="j" step="1">   
                                        <c:if test="${orderMessages.get(i.count-1).get(j.count-1).customerOrFactory == 1 && obj.messageType != 4}"> 
                                        <div class="w-text-div">
                                            <div class="article-post msg-block">
                                                <div class="fr"><a class="btn btn-primary btn-mini" onclick="reply_message(this)">Reply</a></div>
                                                <span class="w-user-info"> By: [${obj.userid}] / Date: ${orderMessages.get(i.count-1).get(j.count-1).messageSendTime != null ?fn:substring(orderMessages.get(i.count-1).get(j.count-1).messageSendTime,0,fn:indexOf(orderMessages.get(i.count-1).get(j.count-1).messageSendTime,".")):""} </span>
                                                <p style="margin: 0 0 10px;"><a href="#">${orderMessages.get(i.count-1).get(j.count-1).messageDetails}</a> </p>
                                                <c:if test="${orderMessages.get(i.count-1).get(j.count-1).picStatus == 1}"> 
                                                   <c:forEach begin="1" end="${orderMessages.get(i.count-1).get(j.count-1).qualityIssuesPic.size()}" varStatus="k" step="1">  
                                                   <img src="${orderMessages.get(i.count-1).get(j.count-1).qualityIssuesPic.get(k.count-1).picturePathCompress}" style="width: 80px;">
                                                   </c:forEach>
                                                </c:if>
                                            </div>
                                        </div>
                                        </c:if>
                                        <c:if test="${orderMessages.get(i.count-1).get(j.count-1).customerOrFactory == 2 && obj.messageType != 4}"> 
                                        <div class="w-text-div2">
                                            <div class="w-bg article-post">
                                                <div class="fr"><a class="btn btn-primary btn-mini" onclick="reply_message(this)">Reply</a></div>
                                                <span class="w-user-info"> Reply: ${obj.factoryName} / Date: ${orderMessages.get(i.count-1).get(j.count-1).messageSendTime != null ?fn:substring(orderMessages.get(i.count-1).get(j.count-1).messageSendTime,0,fn:indexOf(orderMessages.get(i.count-1).get(j.count-1).messageSendTime,".")):""} </span>
                                                <p class="w-user-p"><a>${orderMessages.get(i.count-1).get(j.count-1).messageDetails}</a> </p>
                                            </div>
                                        </div>
                                        </c:if>                                      
                                        </c:forEach> 
<%--                                         <c:if test="${obj.messageType == 4}">  --%>
<!--                                         <div class="w-text-div2"> -->
<!--                                             <div class="article-post msg-block"> -->
<%--                                                  <a href="http://192.168.1.54:8099/crm/queryQuotationById.do?quotationInfoId=${obj.quotationInfoId}" style="text-decoration:underline;">http://192.168.1.54:8099/crm/queryQuotationById.do?quotationInfoId=${obj.quotationInfoId}</a> --%>
<!--                                             </div> -->
<!--                                         </div> -->
<%--                                         </c:if> --%>
                                    </div>
                                </div>
                                <div class="chat-message well" style="display:none;">
                                    <input type="hidden" value="${obj.factoryId}" id="factory_id"/>
                                    <button class="btn btn-success" onclick="send_message('${obj.id}',this)">Send</button>
                                    <span class="input-box">
                                        <input type="text" name="msg-box" >
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
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
</html>