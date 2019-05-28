<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="com.cbt.util.WebCookie"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>ImportX</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="/crm/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/crm/css/bootstrap-responsive.min.css" />
<!--<link rel="stylesheet" href="css/fullcalendar.css" />-->
<!--<link rel="stylesheet" href="css/font-awesome.css" />-->
<link rel="stylesheet" href="/crm/css/matrix-style.css" />
<link rel="stylesheet" href="/crm/css/matrix-media.css" />
<link rel="stylesheet" href="/crm/css/select2.css" />
<link rel="stylesheet" href="/crm/css/easydialog.css" />
<link rel="stylesheet" href="/crm/css/drawing.css" />
<link href="/crm/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<!--<link rel="stylesheet" href="css/jquery.gritter.css" />-->
<link rel="stylesheet" href="/crm/css/style.css" />
<link type='image/x-ico' rel='icon' href='img/favicon.ico' />
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
/* .btn-warning { */
/*     background-color: #5bb75b ; */
/* } */
</style>
<script type="text/javascript" src="/crm/js/easydialog.min.js"></script>
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


	<%-- <%String[] userinfo = WebCookie.getUser(request);%>
	var userid = '<%=userinfo != null ? userinfo[0] : ""%>';
	//用户名
	var userName = '<%=userinfo != null ? userinfo[1] : ""%>'; --%>

	
	$(function(){
		$('#sidebar_ul').find('li').eq(0).addClass('active');
    })
	
  
 
   $(function(){
	   var tl = $('#rfqTbody').find('tr').length;
	   for( var i =0; i<tl; i++){
		   var status = $("#rfqTbody tr:eq("+i+")").children("td:eq(3)").text();  
		   if(status == 3){
			   $("#rfqTbody tr:eq("+i+")").children("td:eq(3)").text("Closed"); 
		   }
		   if(status == 2){
			   $("#rfqTbody tr:eq("+i+")").children("td:eq(3)").text("Processed"); 
		   }
		   if(status == 1){
			   $("#rfqTbody tr:eq("+i+")").children("td:eq(3)").text("Untreated"); 
		   }
	   }
	   
   })
   
  
  
  

</script>
</head>
<body>
<jsp:include page="base.jsp"></jsp:include>
<!-- <div id="header"> -->
<!-- 		<h1> -->
<!-- 			<a href="#">China Synergy Group</a> -->
<!-- 		</h1> -->
<!-- 	</div> -->
<!-- 	<div id="user-nav" class="navbar navbar-inverse"> -->
<!-- 		<ul class="nav"> -->
<!-- 			<li class="dropdown" id="profile-messages"><a title="" href="#" -->
<!-- 				data-toggle="dropdown" data-target="#profile-messages" -->
<!-- 				class="dropdown-toggle"><i class="icon icon-user"></i> <span -->
<%-- 					class="text"><%=userinfo != null ? userinfo[1] : ""%></span></a></li> --%>
<!-- 		</ul> -->
<!-- 	</div> -->
<!-- 	<div id="search"> -->
<!-- 	  <a title="" href="login.jsp"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a> -->
<!-- 	</div> -->
<!-- 	<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-inbox"></i> Drawings</a> -->
<!-- 	<ul> -->
<!-- 	    <li class="active"><a href="#" onclick="listClientOrder();"><i class="icon icon-file"></i> <span>My Orders</span></a> </li> -->
	
<!-- 	    <li><a href="#" onclick="listDrawing();"><i class="icon icon-inbox"></i> <span>My Drawings</span></a></li> -->
	    
<!-- 	    <li> <a href="#" onclick="listSupplier();"><i class="icon icon-group"></i> <span>My Supplier</span> </a></li> -->
		
<!-- 		<li> <a href="#" onclick="listShippingInfo();"><i class="icon icon-map-marker"></i> <span>My Account</span> </a></li> -->
	    
<!--     </ul> -->
<!-- 	</div> -->

	<!--main-container-part-->
	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="#" onclick="listClientOrder()" class="tip-bottom"><i
				class="icon  icon-paste"></i>Orders & Invoices</a>
				<a href="#" class="tip-bottom"><i class="icon icon-file"></i>New RFQ Order</a> <a href="#" class="current"></a>
			</div>
		</div>
		<div class="container-fluid">
			<hr>
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">

						<div class="widget-content nopadding">
							<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper"
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
													Sales Name <span
														class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
												</div>
											</th>						
										</tr>
									</thead>

									<tbody role="alert" aria-live="polite" aria-relevant="all"
										id="rfqTbody">
										<c:forEach var="obj" items="${rfqInfo}" varStatus="i">
											<tr class="gradeA odd" id="tr${i.index}">
											    <td>${obj.productName}</td>
												<td class="center"><a
													href="/crm/fileDownload_drawing.do?id=${obj.id}">${obj.drawingName}</a>
												</td>
												<td>${obj.createTime}</td>											
												<td>${obj.drawingState}</td>
												<td>${obj.followUp}</td>																							
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div
									class="fg-toolbar ui-toolbar ui-widget-header ui-corner-bl ui-corner-br ui-helper-clearfix">
									<div class="dataTables_filter" id="DataTables_Table_0_filter">
									</div>
									<div
										class="dataTables_paginate fg-buttonset ui-buttonset fg-buttonset-multi ui-buttonset-multi paging_full_numbers"
										id="DataTables_Table_0_paginate">${pager}</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--end-main-container-part-->
		</div>
	</div>


	<div class="row-fluid">
		<div id="footer" class="span12">

		</div>
	</div>



</body>
</html>
