<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.cbt.util.WebCookie"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
  <title>ImportX</title>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="css/bootstrap.min.css" />
  <link rel="stylesheet" href="css/uniform.css" />
  <link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
  <link rel="stylesheet" href="css/fullcalendar.css" />
  <link rel="stylesheet" href="css/font-awesome.css" />
  <link rel="stylesheet" href="css/matrix-style.css" />
  <link rel="stylesheet" href="css/matrix-media.css" />
  <link rel="stylesheet" href="css/select2.css" />
  <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
  <link rel="stylesheet" href="css/jquery.gritter.css" />
  <link type='image/x-ico' rel='icon' href='img/favicon.ico' />

</head>
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
  //获取session的登录用户id和登录名
  <%-- <% String[] userinfo = WebCookie.getUser(request); %>
  var userid = '<%=userinfo != null ? userinfo[0] : ""%>';
  //用户名
  var userName = '<%=userinfo != null ? userinfo[1] : ""%>'; --%>

	
		$(function(){
		  	$('#sidebar_ul').find('li').eq(0).addClass('active');
		  })
  
  
</script>		  
<body>
	<jsp:include page="base.jsp"></jsp:include>

<div id="content">
  <div id="content-header">
    <div id="breadcrumb">
      <a href="drawings.html" class="tip-bottom" data-original-title="Go to Drawings"><i class="icon icon-inbox"></i> Drawings</a>
      <a href="reOrder.jsp" class="tip-bottom" data-original-title="">Reorder</a>
      <a href="reOrder-ok.jsp" class="current">Reorder-ok</a>
    </div>
    <h1>Request Price Confirmation</h1>
  </div>
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
        	<div class="widget-content">
            <div class="error_ex">
            <h3 style="margin-bottom: 20px;">Thank you for reordering.  We value your business.  We will follow up  with you shortly.You may also email your account contact person anytime. </h3>
				<a class="btn btn-warning btn-big" href="#" onclick="listDrawing();">Back to Drawings</a> </div>
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
