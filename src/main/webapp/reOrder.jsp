<%@page import="com.cbt.util.DateFormat"%>
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
  <link rel="stylesheet" href="css/easydialog.css" />
  <link type='image/x-ico' rel='icon' href='img/favicon.ico' />
  <link rel="stylesheet" href="css/ui.css">
  <link rel="stylesheet" href="css/ui.progress-bar.css">
  <link rel="stylesheet" href="css/upload-base.css">
  
    <script type="text/javascript" src="js/upload-base.js"></script>
    <script type="text/javascript" src="js/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="js/easydialog.min.js"></script>   
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
    
    
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
   <%--  <% String[] userinfo = WebCookie.getUser(request); %>
    var userid = '<%=userinfo != null ? userinfo[0] : ""%>';
    //用户名
    var userName = '<%=userinfo != null ? userinfo[1] : ""%>'; --%>
    
	
			$(function(){
		    	$('#sidebar_ul').find('li').eq(0).addClass('active');
		    	
		    	$('#factory_list').change(function(){
		    		$('#select_factory').text($(this).val());
		    	})
		    	
		    	
		    })
    
    
			 //得到行对象  
			function getRowObj(obj)  
			{  
			var i = 0;  
			while(obj.tagName.toLowerCase() != "tr"){  
			obj = obj.parentNode;  
			if(obj.tagName.toLowerCase() == "table")return null;  
			}  
			return obj;  
			}  
			//根据得到的行对象得到所在的行数  
			function getRowNo(obj){  
			var trObj = getRowObj(obj);  
			var trArr = trObj.parentNode.children;  
			for(var trNo= 0; trNo < trArr.length; trNo++){  
			if(trObj == trObj.parentNode.children[trNo]){  
			alert(trNo+1);  
			}  
			}  
			}  
            //移除tr      
           function removeDrawing(obj){
        	var tr = this.getRowObj(obj);  
        	if(tr != null){  
        	tr.parentNode.removeChild(tr); 
        	//计算总额
        	toSum();
        	}else{  
        	throw new Error("the given object is not contained by the table");  
        	}  
         }
            
   		   
           
   		    //页面加载计算订单总额 
           window.onload = function(){
        	   $('#username').text(userName);
            	toSum();
            }     
            
            function toSum(){ 
            	var s = 0;
           		var tl= $("#cartTable").find("tr").length;         		 
        		for(var i=1;i<tl;i++){
        			var price = $("#cartTable tr:eq("+i+")").children("td:eq(3)").text(); 
//         			console.log($("#cartTable tr:eq("+i+")").children("td:eq(3)"));
        			var quantity = $("#cartTable tr:eq("+i+")").children("td:eq(2)").find("input").val();
        			var sumPrice = 0;
        			if(!(quantity == "" ) || isNaN(quantity)){
        			   sumPrice= (parseInt(quantity) * parseFloat(price)).toFixed(2);	
        			}       			      			
        			s +=Number(sumPrice);
        			}
        		   $("#totalPrice").html(Number(s).toFixed(2));

        		}

             //点击插入数据
              function addReOrder(){
            	 
            	    var factoryName = $('#select_factory').text();
            	    var clientDrawings = '';
            	    var idss = [];
            		var tl= $("#drawingBody").find("tr").length;
            		//图纸不能为空
            		if(tl == 0){
          			  easyDialog.open({
                  		   container : {
                      		     header : '  Prompt message',
                      		     content : '*  Reorder can not be empty *'
                  		   },
         					  drag : false,
         					  overlay : false,
         					  autoClose : 1000
                  		 });  
                 	  return false; 
          		  }
            		for(var i=0;i<tl;i++){
            			var price = $("#drawingBody tr:eq("+i+")").children("td:eq(3)").text();          			
            			var quantity = $("#drawingBody tr:eq("+i+")").children("td:eq(2)").find("input").val();             			
            			var id = $("#drawingBody tr:eq("+i+")").children("td:eq(3)").find("input").val(); 
            			var drawingsName = $("#drawingBody tr:eq("+i+")").children("td:eq(0)").find("span").eq(1).text();
            			var drawingsPath = $("#drawingBody tr:eq("+i+")").children("td:eq(0)").find("input").val();
            			var productName = $("#drawingBody tr:eq("+i+")").children("td:eq(1)").text();
            			var moldPrice = $("#drawingBody tr:eq("+i+")").children("td:eq(1)").find("input").val();
            			var drawingState = $("#drawingBody tr:eq("+i+")").children("td:eq(4)").find("input").val();
            			var projectName = $("#drawingBody tr:eq("+i+")").children("td:eq(5)").find("input").val();
            			var status = $("#drawingBody tr:eq("+i+")").children("td:eq(6)").find("input").val();
            			idss[i] = id;       			               
						clientDrawings += "-" + price+"%"+ "-" + quantity+"%"+ "-" + drawingsName+"%"+ "-" + drawingsPath+"%"+ "-" + productName+"%"+ "-" + moldPrice+"%"+ "-" + drawingState+"%"+ "-" + projectName+"%"+ "-" + status+",";
            		}
//                        console.log(clientDrawings);
            	  var requiredTime = $('#requiredTime').val();            	  
            	  var d=new Date(Date.parse(requiredTime.replace(/-/g,"/")));
        		  var curDate = new Date();
        		  //交期不能为空
        		  if(requiredTime.length == 0){
        			  easyDialog.open({
                		   container : {
                    		     header : '  Prompt message',
                    		     content : '*  Required Delivery can not be empty *'
                		   },
       					  drag : false,
       					  overlay : false,
       					  autoClose : 1000
                		 });  
               	  return false; 
        		  }
        		//判断交期时间是否大于当前时间
        		  if(d < curDate){
        			  easyDialog.open({
                  		   container : {
                      		     header : '  Prompt message',
                      		     content : '*  The time can not be less than the current time  *'
                  		   },
         					  drag : false,
        					  overlay : false,
        					  autoClose : 1000
                  		 });   
        			  return false;  
        		   }
        		
            	  var comments = $('#comments').val();           	  
                  var ids = JSON.stringify(idss);
                  var s = $("#totalPrice").text();           
                  //发送ajax请求
    				$.ajax({
    					url:"${ctx}/insertReOrderDrawings.do",
    					data:{
    						  "totalAmount":s,
    						  "ids":ids,
    						  "requiredTime":requiredTime,
    						  "comments":comments,
   						      "clientDrawings":clientDrawings,
   						      "factoryName" :factoryName
    						  },
    					type:"post",
    					dataType:"text",
    					success:function(res){
    						
    				        window.location.href = "${ctx}/reOrder-ok.jsp";
    						
    						},
    				    error:function(){
    				    	easyDialog.open({
    		             		   container : {
    		                 		     header : '  Prompt message',
    		                 		     content : '  Submit failed'
    		             		   },
    		    					  drag : false,
    		 					  overlay : false,
    		 					  autoClose : 1000
    		             		 });   
    				    }
    				});
              }
             
             
            //更新图纸信息
              function doUpload(obj,id){
            	  
                $('#drawingId').val(id);
                var path = $(obj).val();
				sppath = path.split("\\");
				var drawingName = sppath[sppath.length-1]; 
                $('#getDrawingName').val(drawingName);  
  	    	     if(drawingName == null || drawingName == '' || drawingName == undefined){
  	              	easyDialog.open({
  	             		   container : {
  	                 		     header : '  Prompt message',
  	                 		     content : '  Please select a file'
  	             		   },
  	    					  drag : false,
  		 					  overlay : false,
  		 					  autoClose : 1000
  	             		 });   
  	 		    	return false;
  	 		    }else{
  		 		    autTime();
  	 		    }	 		    	              
                
//                 document.getElementById("file_upload_id").submit();
                
          // 	发送ajax请求,提交form表单    
      		$("#file_upload_id").ajaxSubmit({
    			type: "post",
    			url: "${ctx}/updateDrawingsById.do",
    	     	dataType: "text",
    	     	success: function(result){
    	     		 easyDialog.open({
                     	  container : {
                     		header :  '  Prompt message',
                     	    content : 'upload complete'
                     	  },
      				  drag : false,
    					  overlay : false,
    					  autoClose : 1000
                     	});  
    	     		$('#show_upload_dialog').hide();
    	     		 //设置定时器，1s后刷新界面
    	     		setTimeout(function(){location.reload()},1000);
    	     	},
    			error: function(){
    				 easyDialog.open({
             		   container : {
                 		     header : '  Prompt message',
                 		     content : '  Upload failed,Please try again.'
             		   },
    					  drag : false,
 					  overlay : false,
 					  autoClose : 1000
             		 });  
    				 $('#show_upload_dialog').hide();
    			}
    	 	});
         
              
      }
					   
                
    </script>
    <style>
    .uploard{position: absolute;
    margin-left: 60px;
    width: 130px;
    height: 30px;
    z-index: 99;
    opacity: 0;
    }
    .a2{
    margin-left: 60px;}
    
    
    
    input[type="file"] {
      width: 21%;
     }
     
     .z-a-btn{
	     background-color :#5bb75b;
     }
     .z-a-btn:hover{
       background-color :#51a351;     
     }
     
    </style>
</head>
<body>
	<jsp:include page="base.jsp"></jsp:include>
<!-- <form method="get"> -->

<!--   <!-- 存储图纸id信息 --> -->
<%--   <c:forEach var="obj" items="${clientDrawing}" varStatus="i"> --%>
<%--    <input name="ids" value="${obj.id}" type="hidden">  --%>
<%--   </c:forEach> --%>

<!--Header-part-->
<!-- <div id="header" style="margin-top:-20px;">
  <h1><a href="dashboard.html">上海策融</a></h1>
</div> -->
<%-- <div id="user-nav" class="navbar navbar-inverse">
  <ul class="nav">
 	 <li  class="dropdown" id="profile-messages" ><a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle"><i class="icon icon-user"></i>  <span class="text"><%=userinfo != null ? userinfo[1] : ""%></span></a>
     </li>
  </ul>
</div> --%>
<!-- <div id="search">
  <a title="" href="login.jsp"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a>
</div> -->
<!-- <div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-inbox"></i> Drawings</a>
       <ul>		
		    <li><a href="#" onclick="listClientOrder();"><i class="icon icon icon-file"></i> <span>My Orders</span></a> </li>
		
		    <li class="active"> <a href="#" onclick="listDrawing();"><i class="icon icon-inbox"></i> <span>My Drawings</span> </a></li>
		    
		    <li> <a href="#" onclick="listSupplier();"><i class="icon icon-group"></i> <span>My Supplier</span> </a></li>
		    
		    <li> <a href="#" onclick="listShippingInfo();"><i class="icon icon-map-marker"></i> <span>My Account</span> </a></li>
       </ul>
</div> -->
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="#" onclick="listDrawing();" class="tip-bottom" data-original-title="Go to Drawings"><i class="icon icon-inbox"></i> Drawings</a> <a href="#" class="tip-bottom" data-original-title="">Reorder</a>
    </div>
  </div>
  <div class="container-fluid">
     <div class="control-group" style="margin-top: 23px;">
                  <label class="control-label w_con_label">Supplier: </label>
                  <div class="controls w_con_div">
                    <c:if test="${factoryName == null || factoryName == ''}">
                     <span id="select_factory" style="display:none;">${factoryInfos.get(0).factoryName}</span>
                      <select class="xiala_select" id="factory_list">                      
                       <c:forEach var="obj" items="${factoryInfos}" varStatus="i">  
                        <option value="${obj.factoryName}">${obj.factoryName}</option>                   
                       </c:forEach>
                     </select>
                    </c:if>
                   <c:if test="${factoryName != null && factoryName != ''}"> 
                   <label id="select_factory">${factoryName}</label>
                   </c:if>
                  </div>
    </div>
    <hr>
     <i style="color:black;">
*The unit price may be changed based on the latest currency or material fee. Please press 'Request Price Confirmation' firstly before your reordering.</i>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon icon-inbox"></i> </span>
            <h5>Drawings</h5>
          </div>
          <div class="widget-content nopadding">  
            <!-- 采用 fileUpload_multipartFile ， file.transferTo 来保存上传的文件 -->
            <form id="file_upload_id" action="${ctx}/updateDrawingsById.do" method="post" enctype="multipart/form-data">
            <input name="drawingName" id="getDrawingName" value="" type="hidden">
            <input name="id" id="drawingId" value="" type="hidden"> 
             <table class="table table-bordered table-striped" id= 'cartTable'>
              <thead>
              <tr>
                <th>File Name</th>
                <th>Name</th>
                <th>Quantity</th>
                <th>Unit Price(USD)</th>
                <th>Delete</th>
              </tr>
              </thead>             
              <tbody id="drawingBody">
              <c:forEach var="obj" items="${clientDrawing}" varStatus="i">                              
                <tr class="odd gradeX" id="tr${i.index}">
	                <td>
	                    <span>${obj.drawingsName}</span>
		                <span style="display:none;">${drawingsName[i.count-1]}</span>
		                <input name="drawingsPath" value="${obj.drawingsPath}" type="hidden">&nbsp;&nbsp;
		                <fmt:formatDate value='${obj.updateTime}' pattern='MM/dd/yyyy'/>
	                </td>
	                <td>${obj.productName}<input name="moldPrice" value="${obj.moldPrice}" type="hidden"></td>
	                <td><input name= "quantity" value="${obj.quantity}" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" style="width:100%;" oninput="toSum()"/></td>
	                <td><span>${obj.unitPrice}</span><input value="${obj.id}" type="hidden"></td>	                
	                <td style="position:relative">
	                	<input name="drawingState" value="${obj.drawingState}" type="hidden">
	                	<button class="btn btn-danger" id="tr_drawing" onclick="removeDrawing(this);">Delete</button>
	                	<c:if test="${obj.productName != null && obj.productName != ''}">
	                	<input type="file" style="cursor: pointer;" class="uploard" id="file_upload_drawing" name="file_upload_drawing" onChange="doUpload(this,'${obj.id}')" />
	                	<a class="a2" style="cursor: pointer;"><button class="btn btn-primary">Update Drawing</button></a>
	                	</c:if>
	                </td>
	                <td style="display:none"><input name="projectName" value="${obj.projectName}" type="hidden"></td>	                
	                <td style="display:none"><input name="status" value="${obj.status}" type="hidden"></td>	                
                </tr>
              </c:forEach>
              </tbody>            
            </table>
            </form>
          </div>
        </div>
       
		<div class="widget-box">
		<div class="widget-content nopadding">
			<form class="form-horizontal">
				<div class="control-group span12">
		                <label class="control-label">Required Delivery：</label>
		                <div class="controls">
		                  <input type="text" id="requiredTime" class="span5" onclick="WdatePicker({skin:'whyGreen',lang:'en'})"  value='<%=DateFormat.currentDate()%>' placeholder="01/01/2017" data-date="01/01/2017" data-date-format="mm/dd/yyyy" class="datepicker span11">
		                </div>
	            </div>
	                <div class="control-group" style="width:100%;">
		                <label class="control-label">Other Comments：</label>
		                <div class="controls">
		                  <textarea class="span5" id="comments"></textarea>
		                </div>
	                 </div>
	              </form>
	
		 </div>
        </div>
        <div class="pull-right" style="float: left;">
          <h4 style="float:left;"><span>Total:$<span id="totalPrice"></span></span></h4>
          <br><br><br><br><br>   
          <div class="w_ryry">      
          <button class="btn btn-primary btn-large"  onclick="addReOrder()">Request Price Confirmation</button>         
          <a class="btn btn-primary btn-large z-a-btn" onclick="history.back()">Cancel</a> </div>   </div>     
      </div>
    </div>
  </div>
</div>
<div class="row-fluid">
  <div id="footer" class="span12">
   </div>
</div>

<!-- 上传进度显示 -->
<div class="w-out-box" id="show_upload_dialog" style="display:none;">
<div class="weui_mask"></div>
<div class="w-weui_dialog" style="width:510px;">
  <div id="container">

	<div class="content">
		<h1>Upload Progress</h1>
	</div>
	
	<!-- Progress bar -->
	<div id="progress_bar" class="ui-progress-bar ui-container">
	<div class="ui-progress" style="width: 0%;" id="ui-progress-upload">
	<span class="ui-label" style="display:none;">loading...<b class="value">0%</b></span>
	</div>
	</div>
	<!-- /Progress bar -->
    <a class="close-reveal-modal" style="color:#eee;font-size:22px;" href="javascript:void(0);" onclick="cancel_upload()">×</a>
	<div class="content" id="main_content" style="display: none;">
		<p>Upload completed</p>
	</div>
   </div>
   </div>
 </div>

 <script type="text/javascript" src="js/jquery-form.js"></script>
</body>

</html>
