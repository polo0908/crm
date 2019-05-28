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
<link rel="stylesheet" href="/crm/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="/crm/css/matrix-style.css" />
<link rel="stylesheet" href="/crm/css/matrix-media.css" />
<link rel="stylesheet" href="/crm/css/select2.css" />
<link href="/crm/font-awesome/css/font-awesome.css" rel="stylesheet" />
 <link rel="stylesheet" href="/crm/css/easydialog.css" />
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
</style>


<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/crm/js/easydialog.min.js"></script>


<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-115010583-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-115010583-1');
</script>
<script type="text/javascript">


<%-- 	<%String[] userinfo = WebCookie.getUser(request);%>
	var userid = '<%=userinfo != null ? userinfo[0] : ""%>';
	//用户名
	var userName = '<%=userinfo != null ? userinfo[1] : ""%>'; --%>

	//计算每行图纸的价格(单价*数量)
	$(function() {
		
		$('#sidebar_ul').find('li').eq(0).addClass('active');
		
		var tl = $("#cartBody").find("tr").length;
		for (var i = 0; i < tl; i++) {
			var price = $("#cartBody tr:eq(" + i + ")").children("td:eq(1)")
					.find("span").text();
			var quantity = $("#cartBody tr:eq(" + i + ")").children("td:eq(3)")
					.text();
			var total = price * quantity;
			$("#cartBody tr:eq(" + i + ")").children("td:eq(4)").find("span")
					.text(total);
		}

	});

	//单个图纸下载
	function downloadDrawing(id) {

		//使用ajax提交下载
		$.ajax({
			url:"/crm/fileDownload_reOrderDrawing.do",
			data:{
				  "id":id
				  },
			type:"post",
			dataType:"text",
			success:function(res){
				
				window.location.href = "/crm/fileDownload_reOrderDrawing.do?id="+ id;
				
				},
		    error:function(){
		    	
		    	easyDialog.open({
		    		  container : {
		    		    header : 'Prompt message',
		    		    content : 'Download failed !'
		    		  },
		    		  overlay : false,
		    		  autoClose : 4000
		    		});
		    }
		});
			

	}

	//打包下载
	function downloadDrawings(id) {

		
		//使用ajax提交下载
		$.ajax({
			url:"/crm/fileDownload_compression.do",
			data:{
				  "reOrderId":id
				  },
			type:"post",
			dataType:"text",
			success:function(res){
				
				window.location.href = "/crm/fileDownload_compression.do?reOrderId="+ id;
				},
		    error:function(){
		    	
		    	easyDialog.open({
		    		  container : {
		    		    header : 'Prompt message',
		    		    content : 'Download failed !'
		    		  },
		    		  overlay : false,
		    		  autoClose : 4000
		    		});
		    }
		});

	}
	
	
</script>

</head>
<body>
	<jsp:include page="base.jsp"></jsp:include>
	<!--Header-part-->
	<!-- <div id="header">
		<h1>
			<a href="#">China Synergy Group</a>
		</h1>
	</div> -->
	<!--close-Header-part-->


	<!--top-Header-menu-->
	<%-- <div id="user-nav" class="navbar navbar-inverse">
		<ul class="nav">
			<li class="dropdown" id="profile-messages"><a title="" href="#"
				data-toggle="dropdown" data-target="#profile-messages"
				class="dropdown-toggle"><i class="icon icon-user"></i> <span
					class="text"><%=userinfo != null ? userinfo[1] : ""%></span></a></li>
		</ul>
	</div> --%>

	<!-- <div id="search">
	  <a title="" href="login.jsp"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a>
	</div> -->
	<!-- <div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-inbox"></i> Drawings</a>
    <ul>		
		    <li class="active"><a href="#" onclick="listClientOrder();"><i class="icon icon icon-file"></i> <span>My Orders</span></a> </li>
		
		    <li> <a href="#" onclick="listDrawing();"><i class="icon icon-inbox"></i> <span>My Drawings</span> </a></li>
		    
		    <li> <a href="#" onclick="listSupplier();"><i class="icon icon-group"></i> <span>My Supplier</span> </a></li>
		    
		    <li> <a href="#" onclick="listShippingInfo();"><i class="icon icon-map-marker"></i> <span>My Account</span> </a></li>
    </ul>
	</div> -->

	<!--sidebar-menu-->

	<!--main-container-part-->
	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="#" onclick="listClientOrder()" class="tip-bottom"><i
				class="icon  icon-paste"></i>Orders & Invoices</a>
				<a href="/crm/queryAllReOrder.do" class="tip-bottom"><i
					class="icon icon-picture"></i>ReOrder</a><a href="#"
					class="tip-bottom" data-original-title="">Project</a>

			</div>
			<h1>Project</h1>
		</div>
		<div class="container-fluid">
			<hr>
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon icon-inbox"></i>
							</span>
							<h5>Project</h5>
						</div>
						<div class="widget-content nopadding">
							<table class="table table-bordered table-striped">
								<thead>

									<tr>
										<th style="width: 310px;">Drawing</th>
										<th style="width: 310px;">Unit Price</th>
										<th style="width: 310px;">Mold Price</th>
										<th style="width: 310px;">Quantity</th>
										<th style="width: 310px;">Amount</th>
										<th style="width: 130px;">Download</th>
									</tr>
								</thead>
								<tbody id='cartBody'>
									<c:forEach var="obj" items="${reOrderDrawings}" varStatus="i">
										<tr class="odd gradeX" id="tr${i.index}">
											<td>${obj.drawingsName}</td>
											<td>$<span>${obj.unitPrice}</span></td>
											<td>$<span>${obj.moldPrice}</span></td>
											<td>${obj.quantity}</td>
											<td>$<span></span></td>
											<td><a href="#"><button class="btn btn-primary"
														onclick="downloadDrawing('${obj.id}');">Download</button></a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="widget-box">

						<div class="widget-content nopadding">
							<form class="form-horizontal">

								<div class="control-group" style="width:100%;">
									<div>
										<label class="control-label">Required Delivery：</label>
										<div class="controls">
											<input type="text" readonly id="requiredTime" class="span11"
												data-date="2016-09-08" data-date-format="yyyy-mm-dd"
												value="${reOrder.requiredTime}">
										</div>
									</div>
									<div>
										<label class="control-label">Other Comments：</label>
										<div class="controls">
											<textarea class="span11" readonly id="comments">${reOrder.comments}</textarea>
										</div>
									</div>
								</div>

							</form>
						</div>
					</div>
					<div class="pull-right">
						<h4 style="float: right;">
							<span>Total:$</span> ${reOrder.totalAmount }
						</h4>
						<br> <a class="btn btn-primary btn-large pull-right" href="#"
							style="margin-top: 15px;"
							onclick="downloadDrawings('${reOrder.id}')">Pack To Download</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--end-main-container-part-->

	<!--Footer-part-->

	<div class="row-fluid">
		<div id="footer" class="span12">
			
		</div>
	</div>


</body>
</html>
