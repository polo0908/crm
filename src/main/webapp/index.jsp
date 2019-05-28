	<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.cbt.util.WebCookie"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@page import="java.util.List"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%List<Object> emailReceive = (List<Object>)request.getAttribute("emailReceive");%>
<%List<Object> emailSend = (List<Object>)request.getAttribute("emailSend");%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>ImportX</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<!--<link rel="stylesheet" href="css/fullcalendar.css" />-->
<link rel="stylesheet" href="css/font-awesome.css" />
<link rel="stylesheet" href="css/matrix-style.css" />
<link rel="stylesheet" href="css/matrix-media.css" />
 <link rel="stylesheet" href="css/select2.css" />
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" href="css/jquery.gritter.css" />
<link rel="stylesheet" href="css/easydialog.css" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/orders.css" />
<link type='image/x-ico' rel='icon' href='img/favicon.ico' />
<link rel="stylesheet" type="text/css" href="css/highchart/BigDataShow.css" />
<link rel="stylesheet" type="text/css" href="css/lunbo/lunbo.css" />

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-115010583-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-115010583-1');
</script>


<style>
.table td{
	    padding:13px 8px;
}
.w-label{
	background:url(img/new.png) no-repeat !important;
}
.label{padding: 2px 5px;
	font-weight: normal;}
.cusalldiv{
	padding-left:20px;
	padding-right:20px;
}
.cusalldiv .usermatd1{
	padding: 5px 0;
	font-size:14px;
}
tr:hover{background:#eee;}
.link-a{   
	text-decoration:none;
    font-size: 14px;
    margin-left: 20px;
    color: #08c;
    } 
.link-a:hover,.link-a:focus{
    text-decoration: none;
    color: #666;
} 
.w_link_reorder{    float: right;
    margin-right: 15px;
    margin-top:3px;}
    
.z-line-float{
text-decoration:underline;
color: #08c;
float: right;
}    
.z-line{
text-decoration:underline;
color: #08c;
cursor: pointer;
}    
.z-factory-name{color: #000 !important;
    font-size: 18px !important;
    line-height: 8px !important;}    
.shuru .shuruming .bianhao2{
	float:left;
}    
    
.z-report li {float: left;}   
.t_a{	
	cursor:pointer;
	float:right;	
	border:1px solid #08c;
	padding:4px 8px;	
	color: #08c;
	position:relative;
} 
.t_a:hover{
	color: #0eaaf7;
	border:1px solid #0eaaf7;
}
.div_con{
	position: fixed;
    top: 265px;
    left: 50%;
    border: 1px solid #ddd;
    z-index: 10000;
    background-color: #fff;
    width: 500px;
    margin-left: -251px;
    padding:20px 15px;
    box-shadow:3px 3px 6px rgba(0,0,0,0.5),-3px -3px 6px rgba(0,0,0,0.5);
    display:none;
}
.div_con span{
	position:absolute;
	top:10px;
	right:10px;
	cursor:pointer;
	font-size:14px;
}
.div_con input{
    margin-bottom: 1px;
    height: 16px;
}
.error{
border-color: red;
}
.w-top1{
    margin-top: -20px;
    margin-bottom: -15px;
}

</style>

</head>
<body>
<jsp:include page="base.jsp"></jsp:include>


<div id="content">

<div>
  <div id="content-header">
    <div id="breadcrumb"> <a href="#"  onclick="listClientOrder();"class="tip-bottom"><i class="icon icon-file"></i> My Order</a> <a href="#" class="current"></a>
    </div>
  
 <!-- 显示NBmail收、发件信息 -->   
<div class="cusalldiv" id="show_send_content" style="display:none;">
<%-- 		 <c:forEach var="obj" items="${emailSend}" varStatus="i">   --%>
<!-- 		 <table class="eretable">  -->
<!-- 		      <tr> -->
<!-- 		        <td class="usermatd1">Sender:</td> -->
<%-- 				<td><div class="nui-addr"><span class="nui-addr-name"></span><span class="nui-addr-email">${obj.saleName}</span></div></td> --%>
<!-- 		      </tr> -->
<!-- 		      <tr> -->
<!-- 		        <td class="usermatd1">Receive:</td> -->
<%-- 		        <td><div class="nui-addr"><span class="nui-addr-name"></span>${obj.cName }</div></td> --%>
<!-- 		      </tr>	 -->
<!-- 		      <tr> -->
<!-- 		        <td class="usermatd1">Date:</td> -->
<%-- 		        <td>${obj.sendDate != null ?fn:substring(obj.sendDate,0,fn:indexOf(obj.sendDate,".")):""}</td> --%>
<!-- 		      </tr> -->
<!-- 		      <tr> -->
<!-- 		      <td valign="top" class="usermatd1">Title :</td> -->
<%-- 		        <td>${obj.title}</td> --%>
<!-- 		       </tr> -->
<!-- 		      <tr> -->
<!-- 		        <td valign="top" class="usermatd1">Content :</td> -->
<%-- 		        <td>${obj.content }</td> --%>
<!-- 		      </tr>		  -->
<!-- 		   </table> -->
<%-- 		</c:forEach>   --%>
</div>
<div class="cusalldiv" id="show_receive_content" style="display:none;">
<%-- 		 <c:forEach var="obj" items="${emailReceive}" varStatus="i">   --%>
<!-- 		 <table class="eretable">  -->
<!-- 		      <tr> -->
<!-- 		        <td class="usermatd1">Sender:</td> -->
<%-- 				<td><div class="nui-addr"><span class="nui-addr-name"></span><span class="nui-addr-email">${obj.saleName}</span></div></td> --%>
<!-- 		      </tr> -->
<!-- 		      <tr> -->
<!-- 		        <td class="usermatd1">Receive:</td> -->
<%-- 		        <td><div class="nui-addr"><span class="nui-addr-name"></span>${obj.cName }</div></td> --%>
<!-- 		      </tr>	 -->
<!-- 		      <tr> -->
<!-- 		        <td class="usermatd1">Date:</td> -->
<%-- 		        <td>${obj.sendDate != null ?fn:substring(obj.sendDate,0,fn:indexOf(obj.sendDate,".")):""}</td> --%>
<!-- 		      </tr> -->
<!-- 		      <tr> -->
<!-- 		      <td valign="top" class="usermatd1">Title :</td> -->
<%-- 		        <td>${obj.title}</td> --%>
<!-- 		       </tr> -->
<!-- 		      <tr> -->
<!-- 		        <td valign="top" class="usermatd1">Content :</td> -->
<%-- 		        <td>${obj.content }</td> --%>
<!-- 		      </tr>		  -->
<!-- 		   </table> -->
<%-- 		</c:forEach>   --%>
</div>
 <!-- 显示NBmail收、发件信息end -->  
 
    
 </div>
 <div id="client_order_div" style="margin-bottom:10px;"> 
	<input id="factory_name" type="hidden" value="${factoryName}"/>     
  <div class="container-fluid">
   <!--  <hr> -->
    <div class="row-fluid" >
        <div class="span12">
                  
           <div class="w-top w-top1">
	         <div class="shuru">
	           <div class="shuruming">
	             <p class="bianhao">
	               Total Active Orders : ${total}
	             </p>
	             <p class="bianhao2">
	               Total Suppliers : ${totalFactory}
	               ${chart}
	             </p>
	             <p class="t_a" onclick="open_invite()">Shared Account Access</p>
	             
	             <div class="div_con">
	             	<p>Invite your colleague to join.  (Please only invite colleague from your company, because they will be able to see sensitive business information)</p>
	             	<p>Email Address:<input type="email" id="email"/><button onclick="invite(this)">Invite</button><em id="e_message" style="color:#d14;"></em></p>
	             	<span onclick="close_invite(this)">x</span>
	             </div>
	           </div>
	        </div>
              </div>
      <!--   <div class="w-link">
       		 <a href="/crm/toCreateRfqInfo.do" class="link-a"><button class="btn btn-primary">Send New RFQ</button></a>
        	<a href="#" class="link-a" onclick="show_reorder()"><button class="btn btn-primary">Reorder</button></a>
        </div> -->
          <div class="widget-box" style="border-bottom:1px solid #cdcdcd;">
	          <div class="widget-title">
	            <ul class="nav nav-tabs" id="ul_toggle">
	              <li class="active" id="li_tab1"><a data-toggle="tab" href="#tab1">In Process</a></li>
	              <li class="" id="li_tab2">	                
	                <a data-toggle="tab" href="#tab2" >
	                <c:if test="${finishedClientOrder.size() == 0}">
	                Finished
	                </c:if>
	                <c:if test="${finishedClientOrder.size() != 0}">
	                Finished<b style="color:#d14;">(${finishedClientOrder.size()})</b>
	                </c:if>
	                </a>
	              </li>
	            </ul>
	          </div>
	        <div class="widget-content tab-content" style="padding: 0px;border: none;">
            <div class="widget-content nopadding tab-pane active" id="tab1">
          		<div class="w-top">
          		  
          		<div class="w-two">
                  <label class="control-label">Supplier: </label>
                  <div class="controls">
                    <select class="xiala_select" name="select" id="select1" onchange="select_factory()">
                      <option value="All">All</option>
                       <c:forEach var="obj" items="${factoryInfos}" varStatus="i">  
                       <option value="${obj.factoryName}">${obj.factoryName}</option>                   
                       </c:forEach>                     
                    </select>
                  </div>
                </div>
              </div>
            <c:forEach var="obj" items="${factoryInfos}" varStatus="i">  
            <c:if test="${processClientOrder.get(i.count-1).size() > 0}">
            <div class="w-box" style="border-top:none;"> 
            <div class="widget-box" style="margin-top:0;"> 
             <div class="widget-title" style="background: #fff;">
                <h5>Order History</h5>
	         <c:if test="${i.index == 0}">      
	             <c:if test="${totalReorderOrder != 0}">      
			         <div class="w_link_reorder">
			       		 <a href="#" class="link-a" onclick="show_reorder()"><button class="btn btn-primary">Reorder</button></a>
			         </div>
		         </c:if>     
	         </c:if>
              </div>
            <div class="widget-title">
                <h5 class="z-factory-name">${obj.factoryName}</h5>
                <h5 style="color:#d14;font-size:14px;">Total Invoice: $<fmt:formatNumber type="number" value="${amountClientOrders.size() != 0 ? amountClientOrders.get(i.count-1).sumAmount : ''}" maxFractionDigits="0"/>/ Total Paid: $<fmt:formatNumber type="number" value="${amountClientOrders.size() != 0 ? (amountClientOrders.get(i.count-1).sumTotalPaid == null ? 0 : amountClientOrders.get(i.count-1).sumTotalPaid):''}" maxFractionDigits="0"/></h5>
              </div>
              <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper" role="grid">
              	<table class="table table-bordered data-table dataTable"  id="DataTables_Table_0">
                <thead>
                  <tr role="row">
                    <th class="ui-state-default default-th" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">
                      <div class="DataTables_sort_wrapper">Project Name
                        <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
                      </div>
                    </th>
                    <th class="ui-state-default default-th" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">
                      <div class="DataTables_sort_wrapper">My PO #
                        <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
                      </div>
                    </th>
                    <th class="ui-state-default default-th" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending">
                      <div class="DataTables_sort_wrapper">Amount Due/Actual Payment
                        <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
                      </div>
                    </th>                
                    <th class="ui-state-default default-th" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">
                      <div class="DataTables_sort_wrapper">Order Date
                        <span class="DataTables_sort_icon css_right ui-icon ui-icon-triangle-1-n"></span>
                      </div>
                    </th>
                    <th class="ui-state-default default-th" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width:13%;">
                      <div class="DataTables_sort_wrapper">Finished Date<span style="font-weight: 300;color: #08c;">(Predicted)</span>
                        <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
                      </div>
                    </th>
                    <th class="ui-state-default default-th" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width:13%;">
                      <div class="DataTables_sort_wrapper">Contact Person
                        <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
                      </div>
                    </th>
                  
                  </tr>
                </thead>
                <tbody role="alert" aria-live="polite" aria-relevant="all">  
                <c:forEach begin="1" end="${processClientOrder.get(i.count-1).size()}" varStatus="j" step="1">                                                 
                  <tr class="gradeA odd">
                    <td>
                    <a class="z-line" onclick="order_details('${processClientOrder.get(i.count-1).get(j.count-1).orderId}');">${processClientOrder.get(i.count-1).get(j.count-1).projectName}</a>                                       
                    </td>
                    <td>${processClientOrder.get(i.count-1).get(j.count-1).poNumber == null ? 'N/A' : processClientOrder.get(i.count-1).get(j.count-1).poNumber}
                    <c:if test="${messageCounts.get(i.count-1).get(j.count-1) !=0 }">
                     <div style="float:right;">                  
                      <a class="z-line" onclick="queryMessageByOrderId('${processClientOrder.get(i.count-1).get(j.count-1).orderId}')">view message</a>
                        <c:if test="${counts.get(i.count-1).get(j.count-1) !=0 }">
	                       <span class="label label-important w-label" style="margin-right:5px;">new</span>
	                    </c:if>  
                      </div>
                    </c:if>
                    </td>
                    <td>
                    <c:choose>
                    <c:when test="${processClientOrder.get(i.count-1).get(j.count-1).amount - processClientOrder.get(i.count-1).get(j.count-1).actualAmount > 50}">
	                    <span style="color:#d14;">$
	                    <fmt:formatNumber type="number" value="${processClientOrder.get(i.count-1).get(j.count-1).amount}" maxFractionDigits="0"/>
	                    &nbsp;/&nbsp;
	                    $
	                    <fmt:formatNumber type="number" value="${processClientOrder.get(i.count-1).get(j.count-1).actualAmount}" maxFractionDigits="0"/>
	                    </span>
                    </c:when>
                    <c:when test="${processClientOrder.get(i.count-1).get(j.count-1).actualAmount - processClientOrder.get(i.count-1).get(j.count-1).amount  > 50}">
	                    <span style="color:#ed8743;">$
	                    <fmt:formatNumber type="number" value="${processClientOrder.get(i.count-1).get(j.count-1).amount}" maxFractionDigits="0"/>
	                    &nbsp;/&nbsp;
	                    $
	                    <fmt:formatNumber type="number" value="${processClientOrder.get(i.count-1).get(j.count-1).actualAmount}" maxFractionDigits="0"/>
	                    </span>
                    </c:when>
                    <c:otherwise>
                        <span>$
	                    <fmt:formatNumber type="number" value="${processClientOrder.get(i.count-1).get(j.count-1).amount}" maxFractionDigits="0"/>
	                    &nbsp;/&nbsp;
	                    $
	                    <fmt:formatNumber type="number" value="${processClientOrder.get(i.count-1).get(j.count-1).actualAmount}" maxFractionDigits="0"/>
	                    </span>
                    </c:otherwise>
                    </c:choose>
                    </td>                                 
                    <td><fmt:formatDate value='${processClientOrder.get(i.count-1).get(j.count-1).createTime}' pattern='MM/dd/yyyy'/></td>
                    <td>
                    <img src="img/img2.png" style="display:none;" onmouseover="show_message(this);" onmouseout="close_message(this);"/>
                    <fmt:formatDate value='${processClientOrder.get(i.count-1).get(j.count-1).deliveryTime}' pattern='MM/dd/yyyy'/><input value="${processClientOrder.get(i.count-1).get(j.count-1).deliveryTime}" type="hidden">                   
                    <div style="display:none;"><span style="color:red;">Warning:Your order has been delayed!</span></div>
                    </td>                  
                    <td>${processClientOrder.get(i.count-1).get(j.count-1).salesName == null ? "" : processClientOrder.get(i.count-1).get(j.count-1).salesName}</td>                                                                      
                 </tr>
                 </c:forEach>
                </tbody>
              </table> 
             </div>
             </div>
             
        
         <!-- 显示周报 -->
      <c:if test="${productionPhotoss.get(i.count-1).size() != 0}">
    <div class="weekly_report">
    <h4 style="margin-left: -14px;">Weekly Report</h4>
        <div class="row">      
        <c:forEach begin="1" end="${productionPhotoss.get(i.count-1).size()}" varStatus="k" step="1">
            <div class="col-xs-0-3">
                <div class="thumbnail">
                    <div class="imgs">
                        <c:if test="${productionPhotoss.get(i.count-1).get(k.count-1).isDocument == 0}">
                        <img src="${productionPhotoss.get(i.count-1).get(k.count-1).photoPathCompress}" alt="" onclick="order_details('${productionPhotoss.get(i.count-1).get(k.count-1).orderId}')" class="img-responsive">
                        </c:if>
                        <c:if test="${productionPhotoss.get(i.count-1).get(k.count-1).isDocument == 1}">
	                        <c:if test="${fn:endsWith(productionPhotoss.get(i.count-1).get(k.count-1).documentPath,'.xls') == true || fn:endsWith(productionPhotoss.get(i.count-1).get(k.count-1).documentPath,'.xlsx') == true}">
	                        <img src="img/excel.png" alt="" onclick="order_details('${productionPhotoss.get(i.count-1).get(k.count-1).orderId}')" class="img-responsive">
	                        </c:if>
	                        <c:if test="${fn:endsWith(productionPhotoss.get(i.count-1).get(k.count-1).documentPath,'.doc') == true || fn:endsWith(productionPhotoss.get(i.count-1).get(k.count-1).documentPath,'.docx') == true}">
	                        <img src="img/word.png" alt="" onclick="order_details('${productionPhotoss.get(i.count-1).get(k.count-1).orderId}')" class="img-responsive">
	                        </c:if>
	                        <c:if test="${fn:endsWith(productionPhotoss.get(i.count-1).get(k.count-1).documentPath,'.ppt') == true || fn:endsWith(productionPhotoss.get(i.count-1).get(k.count-1).documentPath,'.pptx') == true}">
	                        <img src="img/ppt.png" alt="" onclick="order_details('${productionPhotoss.get(i.count-1).get(k.count-1).orderId}')" class="img-responsive">
	                        </c:if>
	                        <c:if test="${fn:endsWith(productionPhotoss.get(i.count-1).get(k.count-1).documentPath,'.pdf') == true}">
	                        <img src="img/pdf.png" alt="" onclick="order_details('${productionPhotoss.get(i.count-1).get(k.count-1).orderId}')" class="img-responsive">
	                        </c:if>
                        </c:if>
                        
                    </div>
                    <div class="caption">
                        <p>${productionPhotoss.get(i.count-1).get(k.count-1).remarks}</p>
                        <p class="p2"><span style="float:left;">by:${productionPhotoss.get(i.count-1).get(k.count-1).inputSales}</span><fmt:formatDate value='${productionPhotoss.get(i.count-1).get(k.count-1).uploadDate}' pattern='MM/dd/yyyy'/></p>
                    </div>
                </div>
            </div>
         </c:forEach>
        </div> 
      </div>      
     </c:if>        
             
             
         
         <!-- 周报显示结束 -->     
             
        <!-- 	rfq订单 开始 -->    
        <c:if test="${rfqInfo.get(i.count-1).size() != 0}">     
             <div class="widget-box">
						<div class="widget-title">
				            <h5>RFQ History</h5>
		 <c:if test="${i.index == 0}">		            
		 <div class="w_link_reorder">				            
       		<a href="/crm/toCreateRfqInfo.do" class="link-a"><button class="btn btn-primary">Send New RFQ</button></a>
         </div>
         </c:if>
				          </div>
						<div id="DataTables_Table_0_wrapper" class="widget-content nopadding"
								role="grid">

								<table class="table table-bordered data-table dataTable"
									id="DataTables_Table_0">
									<thead>
										<tr role="row">	
										   <th class="ui-state-default" role="columnheader" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												aria-label="Platform(s): activate to sort column ascending">
												<div class="DataTables_sort_wrapper">
													Product Name <span
														class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
												</div>
											</th>
											<th class="ui-state-default" role="columnheader" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												aria-label="Engine version: activate to sort column ascending">
												<div class="DataTables_sort_wrapper">
													Drawing <span
														class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
												</div>
											</th>		
											<th class="ui-state-default" role="columnheader" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												aria-label="Browser: activate to sort column ascending">
												<div class="DataTables_sort_wrapper">
													Create Time<span
														class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
												</div>
											</th>
											
											<th class="ui-state-default" role="columnheader" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												aria-label="Engine version: activate to sort column ascending">
												<div class="DataTables_sort_wrapper">
													Status <span
														class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
												</div>
											</th>
											<th class="ui-state-default" role="columnheader" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												aria-label="Engine version: activate to sort column ascending">
												<div class="DataTables_sort_wrapper">
													Contact Person <span
														class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
												</div>
											</th>						
										</tr>
									</thead>

									<tbody role="alert" aria-live="polite" aria-relevant="all"
										id="rfqTbody">
										<c:forEach begin="1" end="${rfqInfo.get(i.count-1).size()}" varStatus="p" step="1"> 
											<tr class="gradeA odd">
											    <td>${rfqInfo.get(i.count-1).get(p.count-1).productName}</td>
												<td class="center"><a
													href="/crm/fileDownload_drawing.do?id=${rfqInfo.get(i.count-1).get(p.count-1).id}">${rfqInfo.get(i.count-1).get(p.count-1).drawingName}</a>
												</td>
												<td>
												<fmt:parseDate value='${rfqInfo.get(i.count-1).get(p.count-1).createTime != null ?fn:substring(rfqInfo.get(i.count-1).get(p.count-1).createTime,0,fn:indexOf(rfqInfo.get(i.count-1).get(p.count-1).createTime,".")):""}' var="date" pattern="yyyy-MM-dd HH:mm:ss"/> 
												<fmt:formatDate value="${date}" pattern="MM/dd/yyyy" var="createTime"/> 
												${createTime}										
												</td>											
												<td>${rfqInfo.get(i.count-1).get(p.count-1).drawingState}</td>
												<td>${rfqInfo.get(i.count-1).get(p.count-1).followUp}</td>																							
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</c:if>
<!-- 	rfq订单 结束 -->
            </div>      
            </c:if>  
            </c:forEach>            
            </div>             
            
              <div class="widget-content nopadding tab-pane" id="tab2">
              <div class="control-group">
                  <label class="control-label">Supplier: </label>
                  <div class="controls">
                     <select class="xiala_select" name="select" id="select2" onchange="select_factory1(this)">                      
                       <c:forEach var="obj" items="${factoryInfos}" varStatus="i">  
                       <option value="${obj.factoryName}" <c:if test="${obj.factoryName eq factoryInfo.factoryName}"> selected="selected"</c:if>>${obj.factoryName}</option>                   
                       </c:forEach>
                    </select>
                     <c:if test="${finishedClientOrder.size() != 0}">
                     <h5 style="color:#d14;font-size:14px;display: inline-block;">Total Invoice: $<fmt:formatNumber type="number" value="${finishedClientOrder.get(0).sumAmount}" maxFractionDigits="0"/>/ Total Paid: $<fmt:formatNumber type="number" value="${finishedClientOrder.get(0).sumTotalPaid == null ? 0 : finishedClientOrder.get(0).sumTotalPaid}" maxFractionDigits="0"/></h5>
                     </c:if>
                  </div>
                </div>
                <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper" role="grid">
                
                  <table class="table table-bordered data-table dataTable" id="DataTables_Table_0">
                    <thead>
                    <tr role="row">
                     <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">
                        <div class="DataTables_sort_wrapper">Project Name
                          <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
                        </div>
                      </th>
                      <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">
                        <div class="DataTables_sort_wrapper">My PO #
                          <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
                        </div>
                      </th>
                      <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending">
                        <div class="DataTables_sort_wrapper">Amount Due/Actual Payment
                          <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
                        </div>
                      </th>      
                      <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">
                        <div class="DataTables_sort_wrapper">Order Date
                          <span class="DataTables_sort_icon css_right ui-icon ui-icon-triangle-1-n"></span>
                        </div>
                      </th>                
                      <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">
                        <div class="DataTables_sort_wrapper">Finished Date
                          <span class="DataTables_sort_icon css_right ui-icon ui-icon-triangle-1-n"></span>
                        </div>
                      </th>                
                      <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">
                        <div class="DataTables_sort_wrapper">Contact Person
                          <span class="DataTables_sort_icon css_right ui-icon ui-icon-triangle-1-n"></span>
                        </div>
                      </th>                
<!--                       <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending"> -->
<!--                         <div class="DataTables_sort_wrapper">Status -->
<!--                           <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span> -->
<!--                         </div> -->
<!--                       </th> -->
                      <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">
                        <div class="DataTables_sort_wrapper">
                          <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
                        </div>
                      </th>
                    </tr>
                    </thead>
                    <tbody role="alert" aria-live="polite" aria-relevant="all" id="clientOrders2">
                    <c:forEach var="order" items="${finishedClientOrder}" varStatus="i">
                    <tr class="gradeA odd">                      
                      <td><a href="#" class="z-line" onclick="order_details('${order.orderId}');">${order.projectName}</a></td>
                      <td>${order.poNumber == null?'N/A':order.poNumber}
                      <c:if test="${finishedMessageCounts.get(i.count-1) !=0 }">	
                      <div style="float:right;">                                      
                       <a class="z-line" onclick="queryMessageByOrderId('${order.orderId}')">view message</a>
                        <c:if test="${finishedCounts.get(i.count-1) !=0 }">
	                       <span class="label label-important w-label" style="margin-right:5px;">new</span>
	                    </c:if>  
	                   </div>     
                      </c:if>
                      </td>
                      <td>
                       <c:choose>
	                       <c:when test="${order.amount - order.actualAmount > 50}">
	                       <span style="color: #d14;">
	                       $<fmt:formatNumber type="number" value="${order.amount}" maxFractionDigits="0"/>&nbsp;/&nbsp;$<fmt:formatNumber type="number" value="${order.actualAmount}" maxFractionDigits="0"/>
	                       </span>
	                      </c:when>
	                       <c:when test="${order.actualAmount - order.amount > 50}">
	                       <span style="color: #ed8743;">
	                       $<fmt:formatNumber type="number" value="${order.amount}" maxFractionDigits="0"/>&nbsp;/&nbsp;$<fmt:formatNumber type="number" value="${order.actualAmount}" maxFractionDigits="0"/>
	                       </span>
	                      </c:when>
	                      <c:otherwise>
	                       <span>
	                       $<fmt:formatNumber type="number" value="${order.amount}" maxFractionDigits="0"/>&nbsp;/&nbsp;$<fmt:formatNumber type="number" value="${order.actualAmount}" maxFractionDigits="0"/>
	                       </span>
	                      </c:otherwise>
                      </c:choose>
                      </td>
                      <td><fmt:formatDate value='${order.createTime}' pattern='MM/dd/yyyy'/></td>                    
                      <td><fmt:formatDate value='${order.outputTime}' pattern='MM/dd/yyyy'/></td>                    
                      <td>${order.salesName}</td>                 
                      <td class="center"><a href="#" onclick="reOrder('${order.orderId}');">Reorder</a>
                      </td>
                    </tr> 
                    </c:forEach> 
                    </tbody>
                  </table>
                <div class="fg-toolbar ui-toolbar ui-widget-header ui-corner-bl ui-corner-br ui-helper-clearfix" style="border-bottom:none;">      
  
                </div>
                   <!-- 已结束显示周报 -->
                     <c:if test="${finishPhotos.size() == 0}">
				       <div class="weekly_report report2" id="weekly_report">
				        <h4 style="margin-left: -14px;">Weekly Report</h4>
				        <div class="row" id="finish_report">
				        </div> 
				      </div>      
				     </c:if>
				    <!--已结束显示周报-->				       				       
				    <c:if test="${finishPhotos.size() != 0}">
				    <div class="weekly_report report2" id="weekly_report">
				     <h4 style="margin-left: -14px;">Weekly Report</h4>
				        <div class="row" id="finish_report">
				        <c:forEach var="obj" items="${finishPhotos}" varStatus="i">
				            <div class="col-xs-0-3">
				                <div class="thumbnail">
				                    <div class="imgs">
									        <c:if test="${obj.isDocument == 0}">
					                        <img src="${obj.photoPathCompress}" alt="" onclick="order_details('${obj.orderId}')" class="img-responsive">
					                        </c:if>
					                        <c:if test="${obj.isDocument == 1}">
						                        <c:if test="${fn:endsWith(obj.documentPath,'.xls') == true || fn:endsWith(obj.documentPath,'.xlsx') == true}">
						                        <img src="img/excel.png" alt="" onclick="order_details('${obj.orderId}')" class="img-responsive">
						                        </c:if>
						                        <c:if test="${fn:endsWith(obj.documentPath,'.doc') == true || fn:endsWith(obj.documentPath,'.docx') == true}">
						                        <img src="img/word.png" alt="" onclick="order_details('${obj.orderId}')" class="img-responsive">
						                        </c:if>
						                        <c:if test="${fn:endsWith(obj.documentPath,'.ppt') == true || fn:endsWith(obj.documentPath,'.pptx') == true}">
						                        <img src="img/ppt.png" alt="" onclick="order_details('${obj.orderId}')" class="img-responsive">
						                        </c:if>
						                        <c:if test="${fn:endsWith(obj.documentPath,'.pdf') == true}">
						                        <img src="img/pdf.png" alt="" onclick="order_details('${obj.orderId}')" class="img-responsive">
						                        </c:if>
					                        </c:if>				                
				                    </div>
				                    <div class="caption">
				                        <p>${obj.remarks}</p>
				                        <p class="p2"><span style="float:left;">by:${obj.inputSales}</span><fmt:formatDate value='${obj.uploadDate}' pattern='MM/dd/yyyy'/></p>
				                    </div>
				                </div>
				            </div>
				         </c:forEach>
				        </div> 
				      </div>      
				     </c:if>        
              </div>
            </div>
            
            <!-- 订单饼状图显示 -->
                <div class="w-container-fluid" id="show_pie" style="display:none;">
			      <h4 style="padding-left:20px;">Order Chart</h4>
			      <div style="padding-left:20px;">
				      <table id='myTable1'>
							<caption></caption>
							<thead>
								<tr>
									<th></th>
									<th>In Process</th>
									<th>Finished</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>${totalProcess + finishedProcess}</th>
									<td id="process_total">${totalProcess}</td>
									<td>${finishedProcess}</td>
									</tr>
							</tbody>
				      </table> 

				 <table id='myTable2'>  
                    <caption>  
			         Quarterly Summary of Your Projects(USD)
		                    </caption>  
		                    <thead>  
		                        <tr>  
		                            <th></th>  
		                            <th>${quarter4}</th>  
		                            <th>${quarter3}</th>  
		                            <th>${quarter2}</th>
									<th>${quarter1}</th>
									<th>${quarter}</th> 
		                    </thead>  
		                    <tbody>  
		                        <tr>  
		                            <th>Amount</th>  
		                            <td>${sumAmount4}</td>  
		                            <td>${sumAmount3}</td>  
		                            <td>${sumAmount2}</td>   
		                            <td>${sumAmount1}</td>   
		                            <td>${sumAmount}</td>   
		                        </tr>  
		                    </tbody>  
		                </table>  
				      
			      </div>
			    </div>   
			    		
			    
		    
			    
          </div>
        </div>
  </div>
 </div>
</div>
</div>
<!-- <a href="#"  class="link-a"onclick="show_reorder()">Reorder order</a>
<a href="#"  class="link-a" onclick="show_rfqInfo()">New RFQ order</a> -->
 
<div class="container-fluid" id="nbmail_div" style="clear:both;display:none;">
        <div class="row-fluid">
            <div class="span6">
                <div class="widget-box">
                    <div class="widget-title w-widget-title"> <span class="icon"> <i class="icon-envelope-alt"></i> </span>
                        <h5>Recent Emails</h5>
                    </div>
                    <div class="widget-title" style="background:#fff;"><span class="icon"> <i class="icon icon-signout"></i> </span>
                        <h5>Inbox</h5>
                    </div>
                    <div class="widget-content nopadding">
                          <table class="table table-bordered data-table dataTable" id="DataTables_Table_0">
                           <thead>
                               <tr role="row">
			                      <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending" style="width:15%;">
			                        <div class="DataTables_sort_wrapper">Sender
			                          <span class="DataTables_sort_icon css_right ui-icon ui-icon-triangle-1-n"></span>
			                        </div>
			                      </th>
			                      <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width:25%;">
			                        <div class="DataTables_sort_wrapper">Date
			                          <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
			                        </div>
			                      </th>
			                      <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width:45%;">
			                        <div class="DataTables_sort_wrapper">Subject
			                          <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
			                        </div>
			                      </th>  
			                      <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">
			                        <div class="DataTables_sort_wrapper">
			                          <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
			                        </div>
			                      </th>  
			                   </tr>
			               </thead>
			               <tbody role="alert" aria-live="polite" aria-relevant="all" id="send_tbody">
			                <c:forEach var="obj" items="${emailSend}" varStatus="i">			                 
			                  <tr class="gradeA odd">
			                     <td>${obj.saleName}</td>
			                     <td>${obj.sendDate != null ?fn:substring(obj.sendDate,0,fn:indexOf(obj.sendDate,".")):""}</td>
			                     <td>${obj.title}</td>
			                     <td class="center"><a href="#" onclick="show_send_content('${i.index}')">View More</a></td>
			                     <td style="display:none"><input value="${obj.content}" type="hidden"></td>	
			                  </tr>  
                           </c:forEach>
			               </tbody>
			             </table>          
                    </div>
                    <div class="widget-title" style="background:#fff;"><span class="icon"> <i class="icon icon-signin"></i> </span>
                        <h5>Outbox</h5>
                    </div>
                    <div class="widget-content nopadding">
                          <table class="table table-bordered data-table dataTable" id="DataTables_Table_0">
                           <thead>
                               <tr role="row">
			                      <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending" style="width:15%;">
			                        <div class="DataTables_sort_wrapper">Receive
			                          <span class="DataTables_sort_icon css_right ui-icon ui-icon-triangle-1-n"></span>
			                        </div>
			                      </th>
			                      <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width:25%;">
			                        <div class="DataTables_sort_wrapper">Date
			                          <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
			                        </div>
			                      </th>
			                      <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width:45%;">
			                        <div class="DataTables_sort_wrapper">Subject
			                          <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
			                        </div>
			                      </th>  
			                      <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending">
			                        <div class="DataTables_sort_wrapper">
			                          <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
			                        </div>
			                      </th>  
			                   </tr>
			               </thead>
			               <tbody role="alert" aria-live="polite" aria-relevant="all" id="receive_tbody">
			                <c:forEach var="obj" items="${emailReceive}" varStatus="i">
			                  <tr class="gradeA odd">
			                     <td>${obj.saleName}</td>
			                     <td>${obj.sendDate != null ?fn:substring(obj.sendDate,0,fn:indexOf(obj.sendDate,".")):""}</td>
			                     <td>${obj.title}</td>
			                     <td class="center"><a href="#" onclick="show_receive_content('${i.index}')">View More</a></td>
			                  </tr>  
			                 </c:forEach>
			               </tbody>
			             </table>          
                    </div>
                    </div>
                </div>
            </div>
        </div> 
        <div class="container-fluid">
        <hr>
	        <a href="/crm/toCreateRfqInfo.do">
	    		<button class="btn btn-primary btn-large">Send New RFQ</button>
	 		</a>
    	</div>
        </div>
    </div>



<div class="row-fluid">
  <div id="footer" class="span12"> 
  </div>
</div>

</body>


<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/easydialog.min.js"></script>  
<script type="text/javascript" src="js/base64.js"></script>  
<script type="text/javascript">
function AutoResizeImage(maxWidth, maxHeight, objImg) {
	var img = new Image();
	img.src = objImg.src;
	var hRatio;
	var wRatio;
	var Ratio = 1;
	var w = img.width;
	var h = img.height;
	wRatio = maxWidth / w;
	hRatio = maxHeight / h;
	if(maxWidth == 0 && maxHeight == 0) {
		Ratio = 1;
	} else if(maxWidth == 0) { 
		if(hRatio < 1) Ratio = hRatio;
	} else if(maxHeight == 0) {
		if(wRatio < 1) Ratio = wRatio;
	} else if(wRatio < 1 || hRatio < 1) {
		Ratio = (wRatio <= hRatio ? wRatio : hRatio);
	}
	if(Ratio < 1) {
		w = w * Ratio;
		h = h * Ratio;
	}
	objImg.height = h;
	objImg.width = w;
}


    $(function(){
    	
       $('#sidebar_ul').find('li').eq(0).addClass('active');
    	
//        $('base').attr('href','');
    	
    	//页面加载后,收发邮件隐藏
 	    $('#show_send_content').hide();
 	    $('#show_receive_content').hide();
 	    //状态是In Process的页面显示处理
    	var tl= $("#process_total").text();
 	    
 	    //当 In process无数据时，显示finished
 	    if(tl == 0){  
	 	    $('#li_tab1').removeClass("active");
	 	    $('#li_tab2').addClass("active");
	  	    $('#tab1').removeClass("active");
	  	    $('#tab2').addClass("active"); 
	  	    $('#tab1').hide();
 	    }
 	    //当finish无数据时，不显示表头
 	    var finish_tl = $('#clientOrders2').find('tr').length;
 	    if(finish_tl == 0){
 	    	 $('#tab2').hide();
 	    }
 	    
 	    
 	  	 for(var i=0;i<tl;i++){
 		   var trl = $("#tab1").find(".w-box").eq(i).find("tbody").eq(0).find("tr").length;
 		   var rfq_trl =  $("#tab1").find(".w-box").eq(i).find("tbody").eq(1).find("tr").length;
 		   
 		   if(trl == 0){
 			  $("#tab1").find(".w-box").eq(i).css({"display":"none"});
 		   }else{
 			  $("#tab1").find(".w-box").eq(i).show(); 
 		   }
 		   
 		   //判断新图纸是否存在，如不存在则不显示
 		   if(rfq_trl == 0){
 			  $("#tab1").find(".w-box").eq(i).eq(i).find("tbody").parent(".row-fluid").css({"display":"none"});
 		   }else{
 			  $("#tab1").find(".w-box").eq(i).eq(i).find("tbody").parent(".row-fluid").show(); 
 		   }
 		   
 		   //循环新图纸询盘显示
 		  for( var q =0; q<rfq_trl; q++){
 			   var status = $("#tab1").find(".w-box").eq(i).find("tbody").eq(1).find("tr").eq(q).children("td:eq(3)").text();  
 			   if(status == 3){
 				  $("#tab1").find(".w-box").eq(i).find("tbody").eq(1).find("tr").eq(q).children("td:eq(3)").text("Closed"); 
 			   }
 			   if(status == 2){
 				  $("#tab1").find(".w-box").eq(i).find("tbody").eq(1).find("tr").eq(q).children("td:eq(3)").text("Processed"); 
 			   }
 			   if(status == 1){
 				  $("#tab1").find(".w-box").eq(i).find("tbody").eq(1).find("tr").eq(q).children("td:eq(3)").text("Untreated"); 
 			   }
 		   }
 		   
 		   
 		   
 		   for(var j=0;j<trl;j++){			  
 			  //判断处理中的订单是否延期（提醒）
 			 var deliveryTime =  $("#tab1").find(".w-box").eq(i).find("tbody").eq(0).find("tr").eq(j).children("td:eq(4)").find("input").val(); 
 			 var str = DateDiff(deliveryTime); 
 			 if(str == false){
 				$("#tab1").find(".w-box").eq(i).find("tbody").eq(0).find("tr").eq(j).children("td:eq(4)").find("img").css({"display":"inline-block"}); 				 				
 			 }else{
 				$("#tab1").find(".w-box").eq(i).find("tbody").eq(0).find("tr").eq(j).children("td:eq(4)").find("img").css({"display":"none"});								
 			 } 
 			 //处理图纸名显示，当有图纸可点击查看
//  			 var drawingNames = $("#tab1").find(".w-box").eq(i).find("tbody").eq(0).find("tr").eq(j).children("td:eq(3)").find("span").text();
//  			 if(drawingNames == "" || drawingNames == null){
//  				$("#tab1").find(".w-box").eq(i).find("tbody").eq(0).find("tr").eq(j).children("td:eq(3)").find("span").next().css({"display":"none"}); 
//  			 }
 			 
//  			 var poPath = $("#tab1").find(".w-box").eq(i).find("tbody").eq(0).find("tr").eq(j).children("td:eq(5)").find("input").val(); 
//  			 if(poPath == "" || poPath == null){
//  				$("#tab1").find(".w-box").eq(i).find("tbody").eq(0).find("tr").eq(j).children("td:eq(7)").find('div:eq(0)').css('display','none');
	 		   	
//  			 }
//  			var qcReportPath = $("#tab1").find(".w-box").eq(i).find("tbody").eq(0).find("tr").eq(j).children("td:eq(2)").find("input").val();  
//  			if(qcReportPath == "" || qcReportPath == null){
//  				$("#tab1").find(".w-box").eq(i).find("tbody").eq(0).find("tr").eq(j).children("td:eq(7)").find("div:eq(1)").removeAttr('onclick').css({color:"#888"}).css('display','none');
// 	 			}	  
//  			var shippingDocPath = $("#tab1").find(".w-box").eq(i).find("tbody").eq(0).find("tr").eq(j).children("td:eq(6)").find("input").val();
//  			if(shippingDocPath == "" || shippingDocPath == null){
//  				$("#tab1").find(".w-box").eq(i).find("tbody").eq(0).find("tr").eq(j).children("td:eq(7)").find("div:eq(3)").removeAttr('onclick').css({color:"#888"}).css('display','none');
//  				}
//  			var status = $("#tab1").find(".w-box").eq(i).find("tbody").eq(0).find("tr").eq(j).children("td:eq(6)").find("span").text();
// 		 			//显示订单状态  
// 		 			//订单状态(0：In Process，1：Finished)
// 		    	        if(status == 0){
// 		    	        	$("#tab1").find(".w-box").eq(i).find("tbody").eq(0).find("tr").eq(j).children("td:eq(6)").find("span").text("In Process");	
// 		    	        }
// 		    	        if(status == 1){
// 		    	        	$("#tab1").find(".w-box").eq(i).find("tbody").eq(0).find("tr").eq(j).children("td:eq(6)").find("span").text("Finished");	
// 		    	        }						
 		   }
 		   
 		   
 	     }
//  	  	check_clientOrders2();	
 	  		  	
 	  	var factoryName = $('#factory_name').val();
 	  	if(factoryName != null && factoryName != ''){
 	  	$("#select1").find("option[value='"+factoryName+"']").attr("selected",true);	
 	  		select_factory();
 	  		$(".container-fluid").eq(0).show();
 	  	}else{
 	  		$(".container-fluid").eq(0).show();
 	  	}
 	  	
 	  	
 	  	
 	  	//图片宽度
 	  	$('.weekly_report').find('img').each(function(){
 	  		var w = $(this).css('width');
 	  		var h = $(this).css('height');
 	  		if(w > h){
 	  			$(this).css({'width':'218px','height':'auto'});
 	  		}else{
 	  			$(this).css({'width':'auto','height':'218px'});
 	  		}
 	  		
 	  	})
 	  	
		
    });
    
    //处理已结束订单显示
//     function check_clientOrders2(){
		//状态是Finished的页面显示处理
// 		var tl= $("#clientOrders2").find("tr").length;
// 		for(var i=0;i<tl;i++){			
			
// 			 var drawingNames = $("#clientOrders2 tr:eq("+i+")").children("td:eq(3)").find("span").text();
//  			 if(drawingNames == "" || drawingNames == null){
//  				$("#clientOrders2 tr:eq("+i+")").children("td:eq(3)").find("span").css({"display":"none"}); 
//  			 }
			
// 			var poPath = $("#clientOrders2 tr:eq("+i+")").children("td:eq(4)").find("input").val();
// 			if(poPath == "" || poPath == null){
// 			  $("#clientOrders2 tr:eq("+i+")").children("td:eq(6)").find("div:eq(0)").removeAttr("href").removeAttr('onclick').css({"color":"#666"}).hide();
// 			}
			
// 			var qcReportPath = $("#clientOrders2 tr:eq("+i+")").children("td:eq(2)").find("input").val(); 
// 			if(qcReportPath == "" || qcReportPath == null){
// 			  $("#clientOrders2 tr:eq("+i+")").children("td:eq(6)").find("div:eq(1)").removeAttr('onclick').css({color:"#888"}).hide();
// 			}
// 			var shippingDocPath = $("#clientOrders2 tr:eq("+i+")").children("td:eq(5)").find("input").val();
// 			if(shippingDocPath == "" || shippingDocPath == null){
// 				  $("#clientOrders2 tr:eq("+i+")").children("td:eq(6)").find("div:eq(3)").removeAttr('onclick').css({color:"#888"}).hide();
// 				}
			
// 			var status = $("#clientOrders2 tr:eq("+i+")").children("td:eq(5)").find("span").text();
// 			//显示订单状态  
// 			//订单状态(0：In Process，1：Finished)
//    	        if(status == 0){
//    	        	$("#clientOrders2 tr:eq("+i+")").children("td:eq(5)").find("span").text("In Process");	
//    	        }
//    	        if(status == 1){
//    	        	$("#clientOrders2 tr:eq("+i+")").children("td:eq(5)").find("span").text("Finished");	
//    	        }
// 		}
// 	}

    
   /*
    *根据订单号展现所有图纸信息在reOrder界面
    */
   function reOrder(orderId){
	   var base = new Base64();
	   orderId = base.encode(orderId);
	   window.location.href = "${ctx}/queryDrawingsByOrderId.do?orderId="+orderId;	
   }
   /*查询订单详情*/
   function order_details(order){
	   var base = new Base64();
	   var orderId=base.encode(order);
	   window.location.href = "${ctx}/queryOrderDetails.do?orderId="+orderId;	   
   }

   
 
   /*
    *根据点击显示当前发件的邮件信息
    */
   function show_send_content(index){
	   $('#show_send_content').show();
	   var tl = $('#show_send_content').find("table").length;
	   for(var i = 0;i<tl;i++){
		  if(i == index){
			  $('#show_send_content').find("table").eq(index).show();	
		  }else{
			  $('#show_send_content').find("table").eq(i).hide();
		  }
	   }	   
	   $('#client_order_div').hide();
   }
   /*
    *根据点击显示当前收件的邮件信息
    */
   function show_receive_content(index){
	   $('#show_receive_content').show();
	   var tl = $('#show_receive_content').find("table").length;
	   for(var i = 0;i<tl;i++){
		  if(i == index){
			  $('#show_receive_content').find("table").eq(index).show();	
		  }else{
			  $('#show_receive_content').find("table").eq(i).hide();
		  }
	   }	   
	   $('#client_order_div').hide();
   }
   
   //查看reorder订单
   function show_reorder(){
	   window.location.href = "/crm/queryAllReOrder.do";
   }
   //查看新图纸询盘
   function show_rfqInfo(){
	   window.location.href = "/crm/queryAllRfqInfo.do";
   }
   //查看新Invoice
   function show_invoice(orderId){
	   var base = new Base64();
	   orderId=base.encode(orderId);
	   window.location.href = "/crm/queryInvoiceByOrderId.do?orderId="+orderId;
   }
   
   
   //筛选工厂(处理中)
   function select_factory(){	   	   	   
	  var factoryName = $('#select1').val();
	  var tl= $("#tab1").find("div.w-box").length;
	  if(factoryName == 'All'){
		  $("#tab1").children("div.w-box").each(function(){
			 $(this).css('display','block'); 		  
		  });  
		  return false;
	  }	 
	  if(factoryName == 'China Synergy Group'){
		  $('.container-fluid').eq(1).show();
	  }else{
		  $('.container-fluid').eq(1).hide();
	  }
	  
      for(var i=0;i<tl;i++){		   
    	 var f = $("#tab1").find("div.w-box").eq(i).find('.z-factory-name').text();
         if(factoryName == f){
        	 $("#tab1").find("div.w-box").eq(i).css({"display":"block"}); 
         }else{
        	 $("#tab1").find("div.w-box").eq(i).css({"display":"none"});
         } 
         
       }
     }
   
   
	   //筛选工厂(已结束)
	   function select_factory1(obj){	   	   	   
		  var factoryName = $('#select2').val();
		  $('#clientOrders2').empty();
		  $.ajax({
				url:"/crm/queryFinishedOrder.do",
				data:{
					"factoryName" : factoryName,
					"userid" : userid
					  },
				type:"post",
				dataType:"text",
				success:function(data){	
				var result	= eval("("+data+")");
				var orders = result.clientOrders;
				var unRead = result.finishedUnReadCounts;
				var count = result.finishedMessageCounts;
				var finishPhotos = result.finishPhotos;
				$('#finished_ul').empty();
				var tl = orders.length;
				
				//订单数大于0，表头显示
			    if(tl>0){
			      $('#tab2').show();
			    }	
				
				
					for(var i=0;i<tl;i++){									                    
		                var message = '';
	                    if(count[i] != 0){
	                    	var n_message = '';
	                      if(unRead[i] != 0){
	                    		n_message = '<span class="label label-important w-label" style="margin-right:5px;">new</span>';
	                    	}
	                    	message = '<div style="float:right;">     '+                                 
		                            '<a class="z-line" onclick="queryMessageByOrderId(\''+orders[i].orderId+'\')">view message</a>'+n_message+'</div>';   
	                       }
		                    
		                   //判断预计金额和实际付款金额，当预计付款-实际付款大于50USD ，红色显示
		                   //判断预计金额和实际付款金额，当实际付款-预计付款大于50USD ，橙色显示
		                 var s = '<span>$'+orders[i].amount+'&nbsp;/&nbsp;$'+orders[i].actualAmount+'</span>'; 
	                     if(Number(orders[i].amount) - Number(orders[i].actualAmount) > 50){
	                    	 s = '<span style="color:#d14;">$'+orders[i].amount+'&nbsp;/&nbsp;$'+orders[i].actualAmount+'</span>';  
	                     }
	                     if(Number(orders[i].actualAmount) - Number(orders[i].amount) > 50){
	                    	 s = '<span style="color:#ed8743;">$'+orders[i].amount+'&nbsp;/&nbsp;$'+orders[i].actualAmount+'</span>';  
	                     }
		                   
		                   
		                  var tr ='<tr class="gradeA odd">'+
		                    '<td><a href="#" class="z-line" onclick="order_details(\''+orders[i].orderId+'\');">'+(orders[i].projectName == null ? '' : orders[i].projectName)+'</a></td>'+
		                      '<td>'+(orders[i].poNumber == null?'N/A':orders[i].poNumber) + message +		                 
		                      '</td>'+
		                      '<td>'+s+'</td>'+
		                      '<td>'+(new Date(orders[i].createTime)).Format("MM/dd/yyyy")+'</td>   '+                 
		                      '<td>'+(new Date(orders[i].outputTime)).Format("MM/dd/yyyy")+'</td> '+                   
		                      '<td>'+(orders[i].salesName == null ? '' : orders[i].salesName)+'</td>  '+               
		                      '<td class="center"><a href="#" onclick="reOrder(\''+orders[i].orderId+'\');">ReOrder</a>'+
		                      '</td></tr>';		                    	                    
						     $('#clientOrders2').append(tr);	
						}	
					    
					    if(tl > 0){
						    $(obj).next().text('Total Invoice: $'+orders[0].sumAmount+'/ Total Paid: $'+(orders[0].sumTotalPaid == null ? 0 : orders[0].sumTotalPaid));
					    }else{
					    	 $(obj).next().text('');
					    }
					    
					    //周报显示
					    if(finishPhotos.length != 0){
					    	
					    	
					    	
					    	for(var j=0;j<finishPhotos.length;j++){
					    		
					    		
					    		
					    	    var div='';
		                        if(finishPhotos[j].isDocument != 1){
			                       div = '<div class="col-xs-0-3">'+
						                '<div class="thumbnail">'+
						                    '<div class="imgs">'+
						                        '<img src="'+finishPhotos[j].photoPathCompress+'" alt="" onclick="order_details('+finishPhotos[j].orderId+')" class="img-responsive">'+
						                    '</div>'+
						                    '<div class="caption">'+
						                        '<p>'+finishPhotos[j].remarks+'</p>'+
						                        '<p class="p2"><span style="float:left;">by:'+finishPhotos[j].inputSales+'</span>'+(new Date(finishPhotos[j].uploadDate)).Format("MM/dd/yyyy")+'</p>'+
						                    '</div>'+
						                '</div>'+
			                         '</div>';
		                         }else{
		                        	    var img = '';
		                            	var path = finishPhotos[j].documentPath;
		                            	 //判断上传格式，显示对应图片
		                       	        var gen = path.lastIndexOf("."); 
		                       	        var type = path.substr(gen); 
		                       	        if(type.toLowerCase()  == ".doc" || type.toLowerCase()==".docx"){
		                       	        	img = '<img src="img/word.png" onclick="order_details('+finishPhotos[j].orderId+')" class="img-responsive">';
		                       	        }else if(type.toLowerCase()  == ".xls" || type.toLowerCase()==".xlsx"){
		                       	        	img = '<img src="img/excel.png" onclick="order_details('+finishPhotos[j].orderId+')" class="img-responsive">';
		                       	        }else if(type.toLowerCase()  == ".pdf"){
		                       	        	img = '<img src="img/pdf.png" onclick="order_details('+finishPhotos[j].orderId+')" class="img-responsive">';
		                       	        }else if(type.toLowerCase()  == ".ppt" || type.toLowerCase()==".pptx"){
		                       	        	img = '<img src="img/ppt.png" onclick="order_details('+finishPhotos[j].orderId+')" class="img-responsive">';
		                       	        }
		                        	 
		                       	        
		                       	     div = '<div class="col-xs-0-3">'+
						                '<div class="thumbnail">'+
						                    '<div class="imgs">'+img+	                        
						                    '</div>'+
						                    '<div class="caption">'+
						                        '<p>'+finishPhotos[j].remarks+'</p>'+
						                        '<p class="p2"><span style="float:left;">by:'+finishPhotos[j].inputSales+'</span>'+(new Date(finishPhotos[j].uploadDate)).Format("MM/dd/yyyy")+'</p>'+
						                    '</div>'+
						                '</div>'+
			                        '</div>';
		                        }
				            
				            $('#finish_report').append(div);      
						    }
					    	$('#weekly_report').show();
					    }else{
					    	$('#weekly_report').hide();
					    }
					
					},
			    error:function(){
			    	
			    }
			});
	  }
   
	 //交期日期和当前日期比较
	   function  DateDiff(deliveryTime){    //deliveryTime是2002-12-18格式  
		   var   d=new   Date(Date.parse(deliveryTime .replace(/-/g,"/")));
		   var   curDate=new   Date();
	       if(d < curDate){
	    	   return false; 
	       }else{
	    	   return true;  
	       }	      
	   }
	 
	 
	 //鼠标移至delay图片提示延期信息 
	  function show_message(obj){
		  $(obj).next().next().css({"display":"block"});		  
	  }
     function close_message(obj){
    	  $(obj).next().next().css({"display":"none"});
      }
	  
      //跳转显示订单图纸
      function show_drawings(orderId){
    	  window.location.href = "/crm/queryListByOrderId.do?orderId="+orderId; 
      }
     
	  
</script>







<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/chart/jsapi.js"></script>
<script type="text/javascript" src="js/chart/corechart.js"></script>		
<script type="text/javascript" src="js/chart/jquery.gvChart-1.0.1.min.js"></script>
<script type="text/javascript" src="js/chart/jquery.ba-resize.min.js"></script>

<script type="text/javascript">

 $(function(){
	var tl1= $("#tab1").find("div.w-box").find('tbody').find('tr').length;
	var tl2= $("#clientOrders2").find('tr').length; 
	if(tl1 != 0 || tl2 != 0){
	$('#show_pie').show();	
	gvChartInit();
	$(document).ready(function(){
			$('#myTable1').gvChart({
				chartType: 'PieChart',
				gvSettings: {
				vAxis: {title: 'In Process'},
				hAxis: {title: 'Finished'},
				width: 500,
				height: 350
			}
		});
	});
}
	
	
	
	
	
	
// 	jQuery('#myTable2').gvChart({  
//         chartType: 'ColumnChart',  
//         gvSettings: {  
//             vAxis: { title: '金额' },  
//             hAxis: { title: '月份' },  
//             width: 720,  
//             height: 300  
//         }  
//     });  
	
	
	
})	
</script>
<script type="text/javascript">
$(function(){
	var tl1= $("#tab1").find("div.w-box").find('tbody').find('tr').length;
	var tl2= $("#clientOrders2").find('tr').length;
    if(tl1 != 0 || tl2 != 0){
    	$('#show_pie').show();	    	
    	gvChartInit();
     	$(document).ready(function(){
    			$('#myTable2').gvChart({
     				chartType: 'ColumnChart',
     				gvSettings: {
     				vAxis: {title: 'Total Amount'},
     				hAxis: {title: ''},
     				width: 500,
     				height: 350
     			}
     		});
     	});
    }
    
    
    $.post("/crm/queryNBMail.do",
     	   function(result){
     	     if(result.state == 0){
     	    	 var emailReceive = result.data.emailReceive;
     	    	 var emailSend = result.data.emailSend;
     	    	 
     	    	 if(!(emailReceive == null || emailReceive == "")){
     	    		$('#show_receive_content').empty();
     	    		$('#receive_tbody').empty();
     	    		 var tl = emailReceive.length;  	    		 
     	    		 for(var i=0;i<tl;i++){
     	    			 var tab =  '<table class="eretable">'+ 
				     	  		      '<tr>'+
				     			        '<td class="usermatd1">Sender:</td>'+
				     					'<td><div class="nui-addr"><span class="nui-addr-name"></span><span class="nui-addr-email">'+emailReceive[i].saleName+'</span></div></td>'+
				     			      '</tr>'+
				     			      '<tr>'+
				     			        '<td class="usermatd1">Receive:</td>'+
				     			        '<td><div class="nui-addr"><span class="nui-addr-name"></span>'+emailReceive[i].cName+'</div></td>'+
				     			      '</tr>'+	
				     			      '<tr>'+
				     			        '<td class="usermatd1">Date:</td>'+
				     			        '<td>'+emailReceive[i].sendDate+'</td>'+
				     			      '</tr>'+
				     			      '<tr>'+
				     			      '<td valign="top" class="usermatd1">Title :</td>'+
				     			        '<td>'+emailReceive[i].title+'</td>'+
				     			       '</tr>'+
				     			      '<tr>'+
				     			        '<td valign="top" class="usermatd1">Content :</td>'+
				     			        '<td>'+emailReceive[i].content+'</td>'+
				     			      '</tr>'+		 
				     			   '</table>';
				         $('#show_receive_content').append(tab);  	
				         
				         
				         
				         var tr =  '<tr class="gradeA odd">'+
	                     '<td>'+emailReceive[i].saleName+'</td>'+
	                     '<td>'+emailReceive[i].sendDate+'</td>'+
	                     '<td>${obj.title}</td>'+
	                     '<td class="center"><a href="#" onclick="show_send_content('+i+')">View More</a></td>'+
	                    '</tr>';       
	                     $('#receive_tbody').append(tr);
     	    		 }
     	    		 $('#nbmail_div').show();
     	    	 }
     	    	 
     	    	 
     	    	 
     	   	 if(!(emailSend == null || emailSend == "")){
  	    		$('#show_send_content').empty();
  	    	    $('#send_tbody').empty();
  	    		 var tl = emailSend.length;  	    		 
  	    		 for(var i=0;i<tl;i++){
  	    			 var tab =  '<table class="eretable">'+ 
				     	  		      '<tr>'+
				     			        '<td class="usermatd1">Sender:</td>'+
				     					'<td><div class="nui-addr"><span class="nui-addr-name"></span><span class="nui-addr-email">'+emailSend[i].saleName+'</span></div></td>'+
				     			      '</tr>'+
				     			      '<tr>'+
				     			        '<td class="usermatd1">Receive:</td>'+
				     			        '<td><div class="nui-addr"><span class="nui-addr-name"></span>'+emailSend[i].cName+'</div></td>'+
				     			      '</tr>'+	
				     			      '<tr>'+
				     			        '<td class="usermatd1">Date:</td>'+
				     			        '<td>'+emailSend[i].sendDate+'</td>'+
				     			      '</tr>'+
				     			      '<tr>'+
				     			      '<td valign="top" class="usermatd1">Title :</td>'+
				     			        '<td>'+emailSend[i].title+'</td>'+
				     			       '</tr>'+
				     			      '<tr>'+
				     			        '<td valign="top" class="usermatd1">Content :</td>'+
				     			        '<td>'+emailSend[i].content+'</td>'+
				     			      '</tr>'+		 
				     			   '</table>';
				         $('#show_send_content').append(tab);  
				         
				     var tr =  '<tr class="gradeA odd">'+
				                     '<td>'+emailSend[i].saleName+'</td>'+
				                     '<td>'+emailSend[i].sendDate+'</td>'+
				                     '<td>${obj.title}</td>'+
				                     '<td class="center"><a href="#" onclick="show_send_content('+i+')">View More</a></td>'+
				                 '</tr>';       
				         $('#send_tbody').append(tr);
  	    		 }
  	    		$('#nbmail_div').show();
  	    	 }
     	     	 
     	    	 
     	 }
    }); 					
    
})	


//根据订单号查询消息
function queryMessageByOrderId(orderId){
	var base = new Base64();
	orderId=base.encode(orderId);
	window.location = "/crm/queryMessageByOrderId.do?orderId="+orderId;	
}


//关闭邀请注册
function close_invite(obj){
	$(obj).parents('.div_con').hide();
}
//打开邀请注册
function open_invite(){
	$('.div_con').show();
}


/**
 *验证邮箱是否合法
 */
 var e_judgment = false;
 $('#email').blur(function(){
  $('#e_message').css({"display":"none"});
	 var email = $('#email').val(); 
	 if(email == null || email == ''){
		 $('#email').addClass('error'); 
		 $('#e_message').show().css({"padding-top":"10px"});
		 $('#e_message').text("E-mail can not empty.");
		 e_judgment = false;
		 return false;
	 }
   	   //验证邮箱是否合法
	   var szReg=/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+/;     	    	   
	   if(!(email == null || email.length==0)){
		   var bChk = szReg.test(email);
			
			if(!bChk){
			    $('#email').addClass('error');
				$('#e_message').show().css({"padding-top":"10px"});
				$('#e_message').text("Incorrect email format");
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
               e_judgment = true;
				},
		    error:function(){
		    	 $('#email').addClass('error');
		    	 $('#e_message').show().css({"padding-top":"10px"});
		    	 $('#e_message').text("Email exist");
		    	 e_judgment = false;
		    }
		});
  })  
  
  /**
   *光标切入事件
   */
   $('#email').focus(function(){
  	 $('#email').removeClass('error');
  	 $('#e_message').css({"display":"none"}); 
   }) 
  
 
//邀请同事注册
function invite(obj){
	 	
	 $('#email').blur();
	 if(!e_judgment){
		 return false;
	 }
	 $(obj).css({"color":"#aaa"}).attr("disabled","true");
	 $.ajax({
			url:"/crm/account/inviteSign.do",
			data:{
				"email" : $('#email').val()	
				  },
			type:"post",
			dataType:"text",
			success:function(result){	
		    $(obj).css({"color":"#333"}).removeAttr("disabled");	
				easyDialog.open({
           		   container : {
               		     header : 'Prompt message',
               		     content : 'Send successfully'
           		   },
  					  overlay : false,
  					  autoClose : 1000
           		 });  
				$('#email').val('');
				$('.div_con').hide();
			},
		    error:function(){
		    	$(obj).css({"color":"#333"}).removeAttr("disabled");
		    	easyDialog.open({
	           		   container : {
	               		     header : 'Prompt message',
	               		     content : 'Send failed'
	           		   },
	  					  overlay : false,
	  					  autoClose : 1000
	           		 });  
		    }
	 });		
}



</script>

<style>
   .gvChart{
	   float: left;
	    width: 50%;
	    margin-bottom: 20px;
	   }
</style>

</html>