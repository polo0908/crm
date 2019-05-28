<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@page import="com.cbt.util.WebCookie"%>
<%@page import="com.cbt.util.DateFormat"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>ImportX</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${ctx}/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${ctx}/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${ctx}/css/matrix-style.css" />
<link rel="stylesheet" href="${ctx}/css/matrix-media.css" />
<link rel="stylesheet" href="${ctx}/css/select2.css" />
<link rel="stylesheet" href="${ctx}/css/easydialog.css" />
<link rel="stylesheet" href="${ctx}/css/drawing.css" />
<link href="${ctx}/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<!--<link rel="stylesheet" href="css/jquery.gritter.css" />-->
<link rel="stylesheet" href="${ctx}/css/style.css" />
<link type='image/x-ico' rel='icon' href='${ctx}/img/favicon.ico' />
<style>
.shuruming {
	margin-top: 20px;
	float: none;
	text-shadow: 0 1px 0 #ffffff;
	margin-left: 20px;
	position: relative;
}
.w-right{
	position: absolute;
    right: 20px;
    top: 6px;}
.shuru  input {
	width: 15%;
}
/* .btn-warning { */
/*     background-color: #5bb75b ; */
/* } */
</style>

<script type="text/javascript" src="${ctx}/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/js/easydialog.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="${ctx}/js/base64.js"></script>  

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-115010583-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-115010583-1');
</script>
<script type="text/javascript">
var q_info = '<%=request.getParameter("info")%>';
var beginDate_select = '<%=request.getParameter("beginDate")%>';
var endDate_select = '<%=request.getParameter("endDate")%>';
	
	$(function(){
		
	    $('#sidebar_ul').find('li').eq(2).addClass('active');
		
		
		if(q_info != null && q_info != '' && q_info != 'null'){
			$('#quotation_input').val(q_info);
		}
		if(beginDate_select != null  &&  beginDate_select != '' && beginDate_select != 'null'){
			$('#beginDate').val(beginDate_select);
		}
		if(endDate_select != null && endDate_select != '' && endDate_select != 'null'){
			$('#endDate').val(endDate_select);
		}	
		
	});
	
	/*
	 *根据userName、时间进行查询
	 */
	var info;
	var beginDate;
	var endDate;
	var userId;
	function queryByDate() {
		info = $('#quotation_input').val();
		beginDate = $('#beginDate').val();
		endDate = $('#endDate').val();
        userId = $('#user_id').val();
		
		window.location = "/crm/queryAllQuotation.do?info=" + info
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
	
	//查看报价单详情
	function show_quotation(id){
		var base = new Base64();
		var quotationInfoId=base.encode(id);
		window.location.href = "/crm/queryQuotationById.do?quotationInfoId="+quotationInfoId;	
	}
	
	
	
</script>
</head>
<body>
<jsp:include page="base.jsp"></jsp:include>
	<!--sidebar-menu-->
    <input type="hidden" value="${userId}" id="user_id">
	<!--main-container-part-->
	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="/crm/queryAllQuotation.do" class="tip-bottom"><i
					class="icon icon-picture"></i>Quotation</a> 
					<div class="w-right">
                  </div>
			</div>
			<div class="shuru">
				<div class="shuruming">
					<input type="text" class="span11" id="quotation_input"
						placeholder="Project Id/Factory Name"> <input type="text"
						data-date="01-02-2013" data-date-format="dd-mm-yyyy"
						id="beginDate" placeholder="<%=DateFormat.currentDate()%>" value=""
						onclick="WdatePicker({skin:'whyGreen',lang:'en'})"
						class="datepicker span11" style="margin-left: 5%;">&nbsp;<span
						style="font-size: 14px;">To</span>&nbsp;<input type="text"
						id="endDate" data-date="01-02-2013" data-date-format="dd-mm-yyyy"
						value="" 
						onclick="WdatePicker({skin:'whyGreen',lang:'en'})"
						placeholder="<%=DateFormat.currentDate()%>" class="datepicker span12">
				</div>
				<button class="btn btn-info btn-left" style="padding: 4px 20px;left: 57%;"
					onclick="queryByDate()">Search</button>
					
				<a href="/crm/toCreateRfqInfo.do">
			    	<button class="btn btn-info btn-left" style="padding: 4px 20px;left: 75%;">Send New RFQ</button>
			    </a>
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
												aria-sort="ascending"
												aria-label="Rendering engine: activate to sort column descending" style="width: 12%;">
												<div class="DataTables_sort_wrapper">
													Project Id <span
														class="DataTables_sort_icon css_right ui-icon ui-icon-triangle-1-n"></span>
												</div>
											</th>
											<th class="ui-state-default" role="columnheader" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												aria-label="Browser: activate to sort column ascending">
												<div class="DataTables_sort_wrapper">
													Supplier <span
														class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
												</div>
											</th>
											<th class="ui-state-default" role="columnheader" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												aria-label="Platform(s): activate to sort column ascending">
												<div class="DataTables_sort_wrapper">
													Subject <span
														class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
												</div>
											</th>
											<th class="ui-state-default" role="columnheader" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												aria-label="Engine version: activate to sort column ascending">
												<div class="DataTables_sort_wrapper">
													Quoter <span
														class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
												</div>
											</th>
											<th class="ui-state-default" role="columnheader" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												aria-label="Engine version: activate to sort column ascending">
												<div class="DataTables_sort_wrapper">
													RFQ Date <span
														class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
												</div>
											</th>
											<th class="ui-state-default" role="columnheader" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												aria-label="Engine version: activate to sort column ascending">
												<div class="DataTables_sort_wrapper">
													Quote Date <span
														class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
												</div>
											</th>
											<th class="ui-state-default" role="columnheader" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												aria-label="Engine version: activate to sort column ascending">
												<div class="DataTables_sort_wrapper">
													Price Range <span
														class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
												</div>
											</th>
<!-- 											<th class="ui-state-default" role="columnheader" tabindex="0" -->
<!-- 												aria-controls="DataTables_Table_0" rowspan="1" colspan="1" -->
<!-- 												aria-label="Engine version: activate to sort column ascending"> -->
<!-- 												<div class="DataTables_sort_wrapper"> -->
<!-- 													Read <span -->
<!-- 														class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span> -->
<!-- 												</div> -->
<!-- 											</th> -->
											<th class="ui-state-default" role="columnheader" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												aria-label="Engine version: activate to sort column ascending">
												<div class="DataTables_sort_wrapper">
													Operate <span
														class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
												</div>
											</th>
										</tr>
									</thead>
									<tbody role="alert" aria-live="polite" aria-relevant="all" id="rfqTbody">
									<c:forEach var="obj" items="${quotationInfos}" varStatus="i">
									<c:if test="${obj.readStatus == 0}">
									<tr style="color:#1d1c1c;">
										<td style='text-align:center'><a href="#" style="color:#1d1c1c;text-decoration: underline;" onclick="show_quotation('${obj.id}')">${obj.projectId}</a></td>
										<td style='text-align:center'>${obj.factoryName}</td>
										<td style='text-align:center'>${obj.quotationSubject}</td>
										<td style='text-align:center'>${obj.quoter}</td>
										<td style='text-align:center'>
										<fmt:parseDate value="${obj.createTime}" pattern="yyyy-MM-dd" var="masterDate"/>
										<fmt:formatDate value="${masterDate}" pattern="yyyy-MM-dd" />
										</td>
										<td style='text-align:center'>${obj.quotationDate}</td>
										<td style='text-align:center'>${obj.quotationPriceRange}</td>
										<td style='text-align:center'>
										<a href="#"><button class="btn btn-info" onclick="show_quotation('${obj.id}')">View Details</button></a>
										<a href="#"><button class="btn btn-success" onclick="download_quotation('${obj.id}')">Download</button></a>
									</tr>
									</c:if>
									<c:if test="${obj.readStatus == 1}">
									<tr style="color:#b7b3b3;">
										<td style='text-align:center'><a href="#" style="color:#b5a9a9;text-decoration: underline;" onclick="show_quotation('${obj.id}')">${obj.projectId}</a></td>
										<td style='text-align:center'>${obj.factoryName}</td>
										<td style='text-align:center'>${obj.quotationSubject}</td>
										<td style='text-align:center'>${obj.saleName}</td>
										<td style='text-align:center'>
										<fmt:parseDate value="${obj.createTime}" pattern="yyyy-MM-dd" var="masterDate"/>
										<fmt:formatDate value="${masterDate}" pattern="yyyy-MM-dd" />
										</td>
										<td style='text-align:center'>${obj.quotationDate}</td>
								    	<td style='text-align:center'>${obj.quotationPriceRange} (${obj.currency})</td>
										<td style='text-align:center'>
										<a href="#"><button class="btn btn-info" onclick="show_quotation('${obj.id}')">View Details</button></a>
										<a href="#"><button class="btn btn-success" onclick="download_quotation('${obj.id}')">Download</button></a>
									</tr>
									</c:if>
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
		</div>
	</div>

	<div class="row-fluid">
		<div id="footer" class="span12">
		
		</div>
	</div>



</body>
</html>
