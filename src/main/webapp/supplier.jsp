<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.cbt.util.WebCookie"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="/crm/js/jquery-1.8.3.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="/crm/css/bootstrap.min.css" />
<link rel="stylesheet" href="/crm/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="/crm/css/matrix-style.css" />
<link rel="stylesheet" href="/crm/css/matrix-media.css" />
<link href="/crm/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" href="/crm/css/uniform.css" />
<link rel="stylesheet" href="/crm/css/bigInvoice.css" />
<link rel="stylesheet" href="css/easydialog.css" />
<link type='image/x-ico' rel='icon' href='img/favicon.ico' />
<title>ImportX</title>

<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/easydialog.min.js"></script>  
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
<%-- 
	<%String[] userinfo = WebCookie.getUser(request);%>
	var userid = '<%=userinfo != null ? userinfo[0] : ""%>';
	//用户名
	var userName = '<%=userinfo != null ? userinfo[1] : ""%>'; --%>

	$(function(){
		$('#sidebar_ul').find('li').eq(3).addClass('active');
	})

	/*
	 *根据用户名、供应商名展现订单信息
 	*/
	function listClientOrder1(factoryName){
		   var base = new Base64();
		   var factoryName=base.encode(factoryName);
	       window.location.href = "/crm/queryAllClientOrder.do?factoryName="+factoryName; 
	}
	   
	   function query_supplierInfo(factoryId){
		   var base = new Base64();
		   var factoryId=base.encode(factoryId);
		   window.location.href = "/crm/querySupplierInfo.do?factoryId="+factoryId;	    
	   }

</script>
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


.shuruming .bianhao3 {
    font-size: 14px;
    margin: 0;
    padding: 0;
    float: left;
    margin-left: 8%;
    margin-bottom: 20px;
}
</style>
</head>
<body>
	<jsp:include page="base.jsp"></jsp:include>

	<div id="content">	 
		<div id="content-header">
			<div id="breadcrumb">
				<a href="#"  class="tip-bottom"><i
					class="icon  icon-paste"></i>My Supplier</a>
			</div>
			<div class="shuru">
				<div class="shuruming">
					<p class="bianhao">Total Purchase  : ${totalPrice}</p>
					<p class="bianhao3">Number of PO in last 12 Months : ${total}</p>
				</div>
			</div>
		</div>
		<div class="container-fluid">
			<hr style="clear: both;">
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
													Serial number <span
														class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
												</div>
											</th>
											<th class="ui-state-default" role="columnheader" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												aria-label="Engine version: activate to sort column ascending">
												<div class="DataTables_sort_wrapper">
													Supplier Name <span
														class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
												</div>
											</th>
											<th class="ui-state-default" role="columnheader" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												aria-label="Engine version: activate to sort column ascending">
												<div class="DataTables_sort_wrapper">
													Total Purchase <span
														class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
												</div>
											</th>
											<th class="ui-state-default" role="columnheader" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												aria-label="Engine version: activate to sort column ascending">
												<div class="DataTables_sort_wrapper">
													Number of PO in last 12 Months <span
														class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
												</div>
											</th>
											<th class="ui-state-default" role="columnheader" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												aria-label="Engine version: activate to sort column ascending">
												<div class="DataTables_sort_wrapper">
													Last order time <span
														class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
												</div>
											</th>
											<th class="ui-state-default" role="columnheader" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												aria-label="Engine version: activate to sort column ascending">
												<div class="DataTables_sort_wrapper">
													Operation <span
														class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
												</div>
											</th>
										</tr>
									</thead>

									<tbody role="alert" aria-live="polite" aria-relevant="all" id="invoice_tbody">
									   <tbody role="alert" aria-live="polite" aria-relevant="all" id="clientOrders2">
                                       <c:forEach var="obj" items="${factoryInfos}" varStatus="i">
										<tr class="gradeA odd">
											<td>${i.index+1}</td>											
											<td><a href="#" style="color: #08c;text-decoration: underline;" onclick="query_supplierInfo('${obj.factoryId}');">${obj.factoryName}</a></td>											
											<td>${factoryAmounts[i.count-1]}USD</td>											
											<td>${factoryTotals[i.count-1]}</td>											
											<td>${lastOrderDates[i.count-1]}											
											</td>											
											<td class="center">
                                             <div><a href="#" class="a2" onclick="listClientOrder1('${obj.factoryName}');">Order History</a></div>
											</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
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

</body>
</html>