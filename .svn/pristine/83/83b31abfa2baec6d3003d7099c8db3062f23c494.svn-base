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
  //获取session的登录用户id和登录名
<%--   <% String[] userinfo = WebCookie.getUser(request); %>
  var userid = '<%=userinfo != null ? userinfo[0] : ""%>';
  //用户名
  var userName = '<%=userinfo != null ? userinfo[1] : ""%>'; --%>

  
  
		$(function(){
	    	$('#sidebar_ul').find('li').eq(0).addClass('active');
	    })

		/*查询订单详情*/
		function order_details(orderId){
			   var base = new Base64();
			   orderId=base.encode(orderId);
			   window.location.href = "${ctx}/queryOrderDetails.do?orderId="+orderId;	   
		}
		
		
		//根据订单号查询消息
		function queryMessageByOrderId(orderId){
			var base = new Base64();
			orderId=base.encode(orderId);
			window.location = "/crm/queryMessageByOrderId.do?orderId="+orderId;	
		}
</script>		  
</head>
<body>
	<jsp:include page="base.jsp"></jsp:include>

<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="#" onclick="listClientOrder();" class="tip-bottom" data-original-title="Go to Drawings">
      <i class="icon icon-file"></i>My Orders</a> <a href="#" onclick="order_details('${orderId}')" class="tip-bottom">Order Details</a> 
      <a href="#" class="current">Send Message-ok</a>
    </div>
<!--     <h1>Send New RFQ Confirmation</h1> -->
  </div>
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
			<div class="widget-content">
            <div class="error_ex">
            <h3 style="margin-bottom: 20px;">Send Sucessfully!</h3>
            <a class="btn btn-warning btn-big" href="#" onclick="queryMessageByOrderId('${orderId}');">Go to message center</a>
            <a class="btn btn-warning btn-big" href="#" onclick="order_details('${orderId}');">Continue send message</a> </div>
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

<script type="text/javascript">
  // This function is called from the pop-up menus to transfer to
  // a different page. Ignore if the value returned is a null string:
  function goPage (newURL) {

    // if url is empty, skip the menu dividers and reset the menu selection to default
    if (newURL != "") {

      // if url is "-", it is this page -- reset the menu:
      if (newURL == "-" ) {
        resetMenu();
      }
      // else, send page to designated URL
      else {
        document.location.href = newURL;
      }
    }
  }

  // resets the menu selection upon entry to this page:
  function resetMenu() {
    document.gomenu.selector.selectedIndex = 2;
  }



//   var test = document.getElementById("test");
//   test.ondblclick = function()
//   {
//     this.readOnly = false;
//     this.className = "s";
//     test.select();
//   }
//   test.onblur = function(){
//     this.readOnly = true;
//     this.className = "t";
//   }

</script>
</body>
</html>
