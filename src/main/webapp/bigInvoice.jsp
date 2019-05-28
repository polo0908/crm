<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.List"%>
<%@page import="com.cbt.entity.InvoiceInfo"%>
<%@page import="com.cbt.util.WebCookie"%>
<%@page import="com.cbt.entity.AmountUnit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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


<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-115010583-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-115010583-1');
</script>

<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/easydialog.min.js"></script>  
<script type="text/javascript">
<%-- 
	<%String[] userinfo = WebCookie.getUser(request);%>
	var userid = '<%=userinfo != null ? userinfo[0] : ""%>';
	//用户名
	var userName = '<%=userinfo != null ? userinfo[1] : ""%>'; --%>

    $(function(){
    	
    	$('#sidebar_ul').find('li').eq(0).addClass('active');
    	
    	var tl= $("#invoice_tbody").find("tr").length;
    	for(var i=0;i<tl;i++){	
    		var invoicePath = $("#invoice_tbody tr:eq("+i+")").children("td:eq(5)").find("input").val();
   
    		if(invoicePath == null || invoicePath == "" || invoicePath == "null"){
    			
    			$("#invoice_tbody tr:eq("+i+")").children("td:eq(5)").find("button").removeAttr("button").removeAttr('onclick').css("background-color","#888");
    		}
    		
    	}
    	
    });


	function doDownload(invoiceId,factoryId){
		
		//使用ajax提交下载
		$.ajax({
			url:"/crm/fileDownload_invoice.do",
			data:{
				  "invoiceId":invoiceId,
				  "factoryId":factoryId
				  },
			type:"post",
			dataType:"text",
			success:function(res){
				
				window.location.href = "/crm/fileDownload_invoice.do?invoiceId=" + invoiceId +"&factoryId=" +factoryId;
				
				},
		    error:function(){
		    	
		    	easyDialog.open({
		    		  container : {
		    		    header : 'Prompt message',
		    		    content : 'Download failed !'
		    		  },
		    		  overlay : false,
		    		  autoClose : 1000
		    		});
		    }
		});
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
</style>
</head>
<body>
<jsp:include page="base.jsp"></jsp:include>

	<div id="content">	 
		<div id="content-header">
			<div id="breadcrumb">
				<a href="#" onclick="listClientOrder()" class="tip-bottom"><i
					class="icon  icon-paste"></i>My Order</a> <a href="/crm/queryInvoiceByOrderId.do?orderId=${orderId}"
					class="current">Invoice</a>

			</div>
			<div class="shuru">
				<div class="shuruming">
					<p class="bianhao">Supplier : ${factoryInfo.factoryName}</p>
					<p class="bianhao" style="margin-left: 110px;">Project Name: ${projectName}</p>
					<p class="bianhao2">Invoice Total : ${total}&nbsp;${currency}</p>
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
													Serial Number <span
														class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
												</div>
											</th>
											<th class="ui-state-default" role="columnheader" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												aria-label="Engine version: activate to sort column ascending">
												<div class="DataTables_sort_wrapper">
													Invoice Number <span
														class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
												</div>
											</th>
											<th class="ui-state-default" role="columnheader" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												aria-label="Engine version: activate to sort column ascending">
												<div class="DataTables_sort_wrapper">
													Create Date <span
														class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
												</div>
											</th>
											<th class="ui-state-default" role="columnheader" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												aria-label="Engine version: activate to sort column ascending">
												<div class="DataTables_sort_wrapper">
													Invoice Amount <span
														class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
												</div>
											</th>
											<th class="ui-state-default" role="columnheader" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												aria-label="Engine version: activate to sort column ascending">
												<div class="DataTables_sort_wrapper">
													Total Paid <span
														class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
												</div>
											</th>
											<th class="ui-state-default" role="columnheader" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												aria-label="Engine version: activate to sort column ascending">
												<div class="DataTables_sort_wrapper">
													Unpaid <span
														class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
												</div>
											</th>
<!-- 											<th class="ui-state-default" role="columnheader" tabindex="0" -->
<!-- 												aria-controls="DataTables_Table_0" rowspan="1" colspan="1" -->
<!-- 												aria-label="Engine version: activate to sort column ascending"> -->
<!-- 												<div class="DataTables_sort_wrapper"> -->
<!-- 													Recently Paid Date <span -->
<!-- 														class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span> -->
<!-- 												</div> -->
<!-- 											</th> -->
											<th class="ui-state-default" role="columnheader" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												aria-label="Engine version: activate to sort column ascending">
												<div class="DataTables_sort_wrapper">
													 <span
														class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
												</div>
											</th>
										</tr>
									</thead>

									<tbody role="alert" aria-live="polite" aria-relevant="all" id="invoice_tbody">

                                        <c:forEach var="obj" items="${invoiceInfos}" varStatus="i">
										<tr class="gradeA odd">
											<td>${i.index+1}</td>
											<td>${obj.invoiceId}</td>
											<td><fmt:formatDate value='${obj.createTime}' pattern='MM/dd/yyyy'/></td>
										    <td>${obj.amount}&nbsp;<span style="color:red">${amountUnit[i.count-1].currencyShorthand}</span></td>											
											<td>${obj.sumAmountActual}&nbsp;<span style="color:red">${amountUnit[i.count-1].currencyShorthand}</span></td>
											<td>${obj.amount - obj.sumAmountActual}&nbsp;<span style="color:red">${amountUnit[i.count-1].currencyShorthand}</span></td>
<%-- 											<td><fmt:formatDate value='${obj.paymentTime}' pattern='MM/dd/yyyy'/></td> --%>
											<td class="center">
										<input value="${obj.invoicePath}" type="hidden">
										<c:if test="${obj.invoicePath != null}">
      							        <button class="btn btn-primary"
													onclick="doDownload('${obj.invoiceId}','${obj.factoryId}')">download</button>
										</c:if>
										<c:if test="${obj.invoicePath == null}">
      							        <button class="btn btn-primary" style="visibility: hidden;"  
													onclick="doDownload('${obj.invoiceId}','${obj.factoryId}')">download</button>
										</c:if>
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