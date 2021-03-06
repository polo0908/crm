<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="com.cbt.util.WebCookie"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
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
<link type='image/x-ico' rel='icon' href='/crm/img/favicon.ico' />

<script type="text/javascript" src="/crm/js/jquery-1.10.2.js"></script>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-115010583-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-115010583-1');
</script>

<style>
    body{
        font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
    }
    .shuruming{
        margin-top: 20px;
         float: none;
        text-shadow: 0 1px 0 #ffffff;
        margin-left: 20px;
        position: relative;
    }
.shuru  input{width: 15%;}
</style>
<script type="text/javascript">

	<%-- <%String[] userinfo = WebCookie.getUser(request);%>
	var userid = '<%=userinfo != null ? userinfo[0] : ""%>';
	//用户名
	var userName = '<%=userinfo != null ? userinfo[1] : ""%>'; --%>
	
	$(function(){
    	$('#sidebar_ul').find('li').eq(0).addClass('active');
    })
      

</script>
</head>
<body>
<jsp:include page="base.jsp"></jsp:include>
<!--Header-part-->
<!-- <div id="header">
  <h1><a href="dashboard.html">China Synergy Group</a></h1>
</div> -->
<!--close-Header-part--> 


<!--top-Header-menu-->
<%-- <div id="user-nav" class="navbar navbar-inverse">
  <ul class="nav">
    <li  class="dropdown" id="profile-messages" ><a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle"><i class="icon icon-user"></i>  <span class="text"><%=userinfo != null ? userinfo[1] : ""%></span></a>
     </li>
   <!-- <li class="">
        <a title="" href="#">
            <span class="text">ReOrder
               &lt;!&ndash; <li class=""><a title="" href="#"><span >ReOrder</span></a></li>
                <li class=""><a title="" href="#"> <span >Send New RFQ</span></a></li>&ndash;&gt;
            </span>
        </a>
    </li>
    <li class=""><a title="" href="#"> <span class="text">Send New RFQ</span></a></li>-->
  </ul>
</div> --%>
<!--close-top-Header-menu-->
<!--start-top-serch-->
<!-- <div id="search">
  <a title="" href="login.jsp"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a>
</div> -->
<!--close-top-serch-->

<!-- <div id="sidebar">
  <ul>

    <li><a href="#" onclick="listClientOrder();"><i class="icon icon icon-file"></i> <span>My Orders</span></a> </li>

    <li> <a href="#" onclick="listDrawing();"><i class="icon icon-inbox"></i> <span>Drawings</span> </a></li>
    
    <li> <a href="#" onclick="listSupplier();"><i class="icon icon-group"></i> <span>My Supplier</span> </a></li>
    
    <li> <a href="#" onclick="listShippingInfo();"><i class="icon icon-map-marker"></i> <span>My Account</span> </a></li>
  </ul>
</div> -->
<!--sidebar-menu-->

<!--main-container-part-->
<!--<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="#"  class="tip-bottom"><i class="icon  icon-paste"></i>客户订单管理</a> <a href="#" class="current"></a>
    </div>
      <div class="container-fluid">
          <hr>
          <div class="row-fluid">
              <div class="span12">
                  <div class="widget-box">

                      <div class="widget-content">
                          <div class="error_ex">
                              <h1>404</h1>
                              <h3>Opps, You're lost.</h3>
                              <p>We can not find the page you're looking for.</p>
                              <a class="btn btn-warning btn-big" href="index.html">Back to Home</a> </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </div>

</div>-->
<!--end-main-container-part-->
<div id="content">
    <div id="content-header">
        <div id="breadcrumb"> <a href="#"  class="tip-bottom"><i class="icon  icon-paste"></i>Orders & Invoices</a> <a href="#" class="current"></a>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span12">
                <div class="widget-box">
                   <!-- <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
                        <h5>Error 404</h5>
                    </div>-->
                    <div class="widget-content">
                        <div class="error_ex">
<!--                             <h1>404</h1> -->
                            <h3>Opps, You're lost.</h3>
                            <p>We can not find the page you're looking for.</p>
                            <a class="btn btn-warning btn-big" href="#" onclick="listClientOrder()">Back to Home</a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Footer-part-->

<div class="row-fluid">
  <div id="footer" class="span12"> 
  </div>
</div>

</body>
</html>
