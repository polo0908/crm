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
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/matrix-style.css" />
<link rel="stylesheet" href="css/matrix-media.css" />
 <link rel="stylesheet" href="css/select2.css" />
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="css/reset.css" rel="stylesheet" />
 <link rel="stylesheet" href="css/easydialog.css" />
 <link type='image/x-ico' rel='icon' href='img/favicon.ico' />


<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="${ctx}/js/city_state.js"></script>
<script type="text/javascript" src="js/easydialog.min.js"></script> 

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-115010583-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-115010583-1');
</script>
<script type="text/javascript">
		
		$(function(){
	    	$('#sidebar_ul').find('li').eq(4).addClass('active');
	    })
		

	   /*
	    *修改密码
	    */	   
	   function reset_pwd(){
		   
		   window.location = "/crm/resetPassword.do";
	   }
	   
		
		//点击编辑地址信息
		var begin_country;
		var begin_state;
		function editAddress(){
			//按钮样式的更改
		    $('#editAddress').hide();
		    $('#cancel').show();
            $('#saveAddress').show();
            $('.span12 input').removeAttr("disabled").removeAttr("readOnly");
            $('#country').removeAttr("disabled").removeAttr("readOnly");
            $('#state').removeAttr("disabled").removeAttr("readOnly");
            $('#saveAddress').css({backgroundColor:"#888"});
            begin_country = $('#hidden_country').val();
            begin_state = $('#hidden_state').val();
              
             
            //根据country信息获取下拉城市信息           
             var temp=$("#country option[value='-1']").html();
             for(var i=0;i<country_arr.length;i++){            
            	 if(country_arr[i]==temp){
            		   var state_arr = s_a[i+1].split("|");           		           		    
            		    for (var j = 0; j < state_arr.length; j++) {
            		      $("#state").append("<option>"+state_arr[j]+"</option>");
            		  
            		}
            	 }
             }
           
		}
	
		
   		//获取更改的国家
   		function changeCountry(){
   	        var t = document.getElementById("country"); 
   		    var country = t.options[t.selectedIndex].value;
   		    $('#hidden_country').val(country);  		    
   		    $('#saveAddress').css({backgroundColor:"#006dcc"});
   		    if(country == '-1'){
   		    $('#saveAddress').css({backgroundColor:"#888"});
	        }
   		    return country;
   		}
   		//获取更改的省/州
   		function changeState(){
   	        var t = document.getElementById("state"); 
   		    var state = t.options[t.selectedIndex].value;
   		    $('#hidden_state').val(state);
   		    $('#saveAddress').css({backgroundColor:"#006dcc"});
   		    if(state == '-1'){
    		  $('#saveAddress').css({backgroundColor:"#888"});
 	        }
   		    return state;
   		}
   		
   		//input框更改后按钮颜色改变
   		//判断是否改变输入框内容，如果未更改，则显示灰色(#888)
   		function check_Button(){
   			var result = false;
   			var colInput = document.getElementsByTagName("input");  //获取输入框控件  
   			for (var i=0; i<colInput.length; i++){  
   			if(colInput[i].value != colInput[i].defaultValue){
   				result = true;
             $('#saveAddress').css({backgroundColor:"#006dcc"});  
   			 }
   		   }
   			if(result == false){
   			$('#saveAddress').css({backgroundColor:"#888"});	
   			}
   		}
   		
       //更新shipping地址信息
       function saveAddress(){       	   	    
    	    	   var recipients = $('#recipients').val();
    	    	   var telephone1 = $('#telephone1').val();
    	    	   var tel = $('#tel').val();
    	    	   //验证固话、手机是否合法
//     	    	   var telReg = /^\s*\+?\s*(\(\s*\d+\s*\)|\d+)(\s*-?\s*(\(\s*\d+\s*\)|\s*\d+\s*))*\s*$/;
//     	    	   if(!(telephone1 == null || telephone1.length == 0)){
//     	    		   var bChk = telReg.test(telephone1);     			
//     	      			if(!bChk){     				
//     	      				$('#span_telephone1').text("* Wrong format !").fadeIn().fadeOut(2000);
    	      				
//     	      				return false;
//     	      			}    		   
//     	    	   }
//     	    	   if(!(tel == null || tel.length == 0)){
//     	    		   var bChk = telReg.test(tel);     			
//     	      			if(!bChk){     				
//     	      				$('#tel').text("* Wrong format !").fadeIn().fadeOut(2000);
    	      				
//     	      				return false;
//     	      			}    		   
//     	    	   }
   	    	   
    	    	   var postcode = $('#postcode').val();

                   var mainBusiness = $('#main_business').val();
    	    	   var userid = $('#getUserId').val();
    	    	   var customerName = $('#customer_name').val();
    	    	   var city = $('#city').val();
    	    	   var detailedAddress = $('#detailedAddress').val();
    	    	   var country = $('#hidden_country').val();
    	    	   var state = $('#hidden_state').val();
    	    	   
    	    	   //判断当前页面是否有修改 
    	    	    var result = false;                                     //初始化返回值                          
    			    var colInput = document.getElementsByTagName("input");  //获取输入框控件  
    			    if(country != begin_country || state != begin_state){    //判断国家、城市是否更改
   			        	result = true;
   			        }
    			    for (var i=0; i<colInput.length; i++){                   //逐个判断页面中的input控件    			    
    			        if (colInput[i].value != colInput[i].defaultValue){ //判断输入的值是否等于初始值  
    			            result = true;                                  //如果不相等，返回true，表示已经修改      			            
//    	 		            colInput[i].style.backgroundColor = "#eee";     //改变被修改控件的背景色  
    			        }     			 
    			     }  
    	    	     if(result==false){
    	    	    	 return;
    	    	    }else{
    	   		   //ajax后台传值
    	   		   $.ajax({  
					        type : "POST",  
					        url : "${ctx}/updateShippingInfo.do",  
					        data : {  
					        	   "customerName" : customerName,
					        	   "userId" : userid,
		    	    		       "userName" : recipients, 
		    	    		       "telephone1" : telephone1,
		    	    		       "tel" : tel,
		    	    		       "postcode" : postcode,
		    	    		       "country" : country,
		    	    		       "state" : state,
		    	    		       "city" : city,
		    	    		       "detailedAddress" : detailedAddress,
		    	    		       "mainBusiness" : mainBusiness
					        },  
					        dataType: "text",  
					        success : function(result) {     
					        		easyDialog.open({
							     		   container : {
							         		     header : '  Prompt message',
							         		     content :  "Saved successfully"
							     		               },
												  drag : false,
												  overlay : false,
												  autoClose : 1000
							     		   }); 
						       		setTimeout(function(){location.reload()},1000);
					       		
					        },        
					        error: function(data) {            
					        	easyDialog.open({
					        		  container : {
					        		    content : 'Operation failed.Please try again'
					        		  },
					        		  autoClose : 2000,
					        		  overlay : false
					        		});
 
					        }  
					    });  
    	   		      	    	  
    	    	    }
    	     }
		
</script>		
<style>
    .shuruming{
        margin-top: 20px;
         float: none;
        text-shadow: 0 1px 0 #ffffff;
        margin-left: 20px;
        position: relative;
    }
.shuru  input{width: 15%;}
.controls{ color: #555;font-size: 14px;}
</style>
</head>
<body>
<jsp:include page="base.jsp"></jsp:include>
<!--Header-part-->
<!-- <div id="header">
  <h1>China Synergy Group</h1>
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

<!--sidebar-menu-->
<!-- <div id="sidebar"><a href="#" class="visible-phone"><i class="icon-paste"></i> 历史订单</a>
  <ul>

    <li><a href="#" onclick="listClientOrder();"><i class="icon icon icon-file"></i> <span>My Orders</span></a> </li>

    <li> <a href="#" onclick="listDrawing();"><i class="icon icon-inbox"></i> <span>My Drawings</span> </a></li>
    
    <li> <a href="#" onclick="listSupplier();"><i class="icon icon-group"></i> <span>My Supplier</span> </a></li>
    
    <li class="active"> <a href="#" onclick="listShippingInfo();"><i class="icon icon-map-marker"></i> <span>Personal Center</span> </a></li>
  </ul>
</div>
 -->
<!--sidebar-menu-->

<!--main-container-part-->
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="#"  class="tip-bottom"><i class="icon icon-user"></i>My Account</a>
        <button class="btn btn-info btn-mini w-btn-mini" onclick="reset_pwd();">change password</button>
    </div>
<h1 style="font-size: 26px;">My Account</h1>
  </div>
    <div class="container-fluid"><hr>
        <div class="row-fluid">
            <div class="span12">
                <div class="span5">
                    <div class="control-group" style="margin-left: 0;">
                        <label class="w-con control-label">Email: </label>
                        <input id="getUserId" value="${user.userid}" type="hidden">
                        <div class="controls2">
                            ${user.loginEmail}
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Name : </label>
                        <div class="controls">
                            <input type="text" class="span12" id="customer_name" oninput="check_Button()" disabled="true" readOnly="true" value="${user.userName != null ? user.userName : ''}">
                        </div>
                    </div>
                <div class="control-group">
                    <label class="control-label">Telephone : </label>
                    <div class="controls">
                        <input type="text" class="span12" id="tel" value="${user.tel != null ? user.tel : ''}" oninput="check_Button()" disabled="true" readOnly="true"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">Main business : </label>
                    <div class="controls">
                        <input type="text" class="span12" id="main_business" value="${user.mainBusiness != null ? user.mainBusiness : ''}" oninput="check_Button()" disabled="true" readOnly="true"/>
                    </div>
                </div>
              </div>
            </div>
        </div>
    </div>
    <div class="w-fluid">
        <div class="w-h1">
            <h1 style="font-size: 26px;">My shipping address</h1>
        </div>
        <div class="container-fluid"><hr>
            <div class="row-fluid">
                <div class="span12">
                    <div class="span5">
                       <div class="control-group">
                            <label class="control-label">Recipients : </label>
                            <div class="controls">
                                <input type="text" class="span12" id="recipients" value="${shippingInfo.userName}" oninput="check_Button()" disabled="true" readOnly="true"/>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Street : </label>
                            <div class="controls">
                                <input type="text" class="span12" id="detailedAddress" value="${shippingInfo.detailedAddress}" disabled="true" readOnly="true" oninput="check_Button()"/>
                            </div>
                        </div>
                        <div class="span12" style="margin-left: 0;">
                           <div class="span6">
                                <div class="control-group">
                                    <label class="control-label">Country : </label>
                                             <div class="controls" onchange="changeCountry();">
							                      <input type="hidden" value="${shippingInfo.country}" id="hidden_country"/>
							                      <select class="xiala_select div-in span12" id="country" name="country" disabled="true" readOnly="true">
							                            
                                                  </select>
                                            </div>
                                </div>
                            </div>
                            <div class="span6">
                                <div class="control-group">
                                    <label class="control-label">State : </label>
                                      <div class="controls" onchange="changeState();">
				                         <input type="hidden" value="${shippingInfo.state}" id="hidden_state"/>
				                         <select name="state" id="state" class="xiala_select div-in span12" disabled="true" readOnly="true">
				                         
				                         </select>
				                      </div>
                                </div>
                            </div>
                            <script language="javascript">
			                      populateCountries("country", "state");
			                </script>
                       </div>
                        <div class="span12" style="margin-left: 0;">                      
                             <div class="span6">
                                <div class="control-group">
                                    <label class="control-label">City : </label>
                                    <div class="controls">
                                        <input type="text" class="span12" id="city" value="${shippingInfo.city}" disabled="true" readOnly="true" oninput="check_Button()"/>
                                    </div>
                                </div>
                            </div>                         
                            
                            <div class="span6">
                                <div class="control-group">
                                    <label class="control-label">Zip Code : </label>
                                    <div class="controls">
                                        <input type="text" class="span12" id="postcode" value="${shippingInfo.postcode}" disabled="true" readOnly="true" oninput="check_Button()"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Phone : </label>
                            <div class="controls">
                                <input type="text" class="span12" id="telephone1" value="${shippingInfo.telephone1}" disabled="true" readOnly="true" oninput="check_Button()"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <hr>
    <button type="button" class="btn btn-success" id="editAddress" onclick="editAddress();">Edit</button>
 	<button type="button" class="btn btn-primary" id="saveAddress" onclick="saveAddress();" style="display: none; background-color: rgb(136, 136, 136);">Save</button>
    <button type="button" class="btn btn-success" id="cancel" onclick="listShippingInfo();" style="display: none;">Cancel</button>
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

