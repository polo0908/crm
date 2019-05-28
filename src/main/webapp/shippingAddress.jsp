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
  <title>China Synergy Group</title>
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
		//获取session的登录用户id和登录名
	<%-- 	<% String[] userinfo = WebCookie.getUser(request); %>
		var userid = '<%=userinfo != null ? userinfo[0] : ""%>';
		//用户名
		var userName = '<%=userinfo != null ? userinfo[1] : ""%>'; --%>

		
		$(function(){
	    	$('#sidebar_ul').find('li').eq(4).addClass('active');
	    })
		
		
		//页面加载，显示客户名
        $(function(){
        	$('#username').text(userName);  
        	$('#cancel').hide();
            $('#saveAddress').hide();           
        });
		
		//点击编辑地址信息
		var begin_country;
		var begin_state;
		function editAddress(){
			//按钮样式的更改
		    $('#editAddress').hide();
		    $('#cancel').show();
            $('#saveAddress').show();
            $('.mukuai input').removeAttr("disabled");
            $('#country').removeAttr("disabled");
            $('#state').removeAttr("disabled");
            $('#registerEmail').attr("disabled",true);
            $('#saveAddress').css({backgroundColor:"#888"});
            begin_country = $('#hidden_country').val();
            begin_state = $('#hidden_state').val();
              
           //alert($("#country option[value='-1']").html());
             
            //根据country信息获取下拉城市信息           
             var temp=$("#country option[value='-1']").html();
//              alert(temp);
             for(var i=0;i<country_arr.length;i++){            
            	 if(country_arr[i]==temp){
            		   var state_arr = s_a[i+1].split("|");           		           		    
            		    for (var j = 0; j < state_arr.length; j++) {
            		      //alert(state_arr[j]);
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
    	    	   var companyName = $('#companyName').val();
    	    	   var otherName1 = $('#otherName1').val();
    	    	   var otherName2 = $('#otherName2').val();
    	    	   var telephone1 = $('#telephone1').val();
    	    	   var telephone2 = $('#telephone2').val();
    	    	   var mobilePhone1 = $('#mobilePhone1').val();
    	    	   var mobilePhone2 = $('#mobilePhone2').val();
    	    	   //验证固话、手机是否合法
    	    	   var telReg = /^\s*\+?\s*(\(\s*\d+\s*\)|\d+)(\s*-?\s*(\(\s*\d+\s*\)|\s*\d+\s*))*\s*$/;
    	    	   if(!(telephone1 == null || telephone1.length == 0)){
    	    		   var bChk = telReg.test(telephone1);     			
    	      			if(!bChk){     				
    	      				$('#span_telephone1').text("* Wrong format !").fadeIn().fadeOut(5000);
    	      				
    	      				return false;
    	      			}    		   
    	    	   }
    	    	   if(!(telephone2 == null || telephone2.length == 0)){
    	    		   var bChk = telReg.test(telephone2);     			
    	      			if(!bChk){     				
    	      				$('#span_telephone2').text("* Wrong format !").fadeIn().fadeOut(5000);
    	      				
    	      				return false;
    	      			}    		   
    	    	   }
    	    	   if(!(mobilePhone1 == null || mobilePhone1.length == 0)){
    	    		   var bChk = telReg.test(mobilePhone1);     			
    	      			if(!bChk){     				
    	      				$('#span_mobilePhone1').text("* Wrong format !").fadeIn().fadeOut(5000);
    	      				
    	      				return false;
    	      			}    		   
    	    	   }
    	    	   if(!(mobilePhone2 == null || mobilePhone2.length == 0)){
    	    		   var bChk = telReg.test(mobilePhone2);     			
    	      			if(!bChk){     				
    	      				$('#span_mobilePhone2').text("* Wrong format !").fadeIn().fadeOut(5000);
    	      				
    	      				return false;
    	      			}    		   
    	    	   }
    	    	   var postcode = $('#postcode').val();
    	    	   var fax = $('#fax').val();
    	    	   var job = $('#job').val();
    	    	   var contactEmail = $('#contactEmail').val();
    	    	   //验证邮箱是否合法
    	    	   var szReg=/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+/;     	    	   
    	    	   if(!(contactEmail == null || contactEmail.length==0)){
    	    		   var bChk = szReg.test(contactEmail);
    	   			
    	   			if(!bChk){
    	   				$('#span_contactEmail').html("* E-mail format is incorrect !").fadeIn().fadeOut(5000);
    	   				return false;
    	   			}
    	   		   }    
    	    	   var userid = $('#getUserId').val();
    	    	   var city = $('#city').val();
    	    	   var address1 = $('#address1').val();
    	    	   var address2 = $('#address2').val();
    	    	   var detailedAddress = $('#detailedAddress').val();
    	    	   var siteUrl = $('#siteUrl').val();
    	    	   var country = $('#hidden_country').val();
//     	    	   alert(country);
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
					        	   "userId" : userid,
		    	    		       "userName" : recipients, 
		    	    		       "companyName" : companyName,
		    	    		       "otherName1" : otherName1,
		    	    		       "otherName2" : otherName2,
		    	    		       "telephone1" : telephone1,
		    	    		       "telephone2" : telephone2,
		    	    		       "mobilePhone1" : mobilePhone1,
		    	    		       "mobilePhone2" : mobilePhone2,
		    	    		       "postcode" : postcode,
		    	    		       "fax" : fax,
		    	    		       "job" : job,
		    	    		       "contactEmail" : contactEmail,
		    	    		       "country" : country,
		    	    		       "state" : state,
		    	    		       "city" : city,
		    	    		       "address1" : address1,
		    	    		       "address2" : address2,
		    	    		       "detailedAddress" : detailedAddress,
		    	    		       "siteUrl" : siteUrl    
					        },  
					        dataType: "text",  
					        success : function(data) {            
					        	var btnFn = function(){
					        		window.location.reload();
     	    		    		   return false;
     	    		    		 };

     	    		    		 easyDialog.open({
     	    		    		   container : {
     	    		    		     header : 'Prompt message',
     	    		    		     content : 'Saved Successfully !',   	    		    		   
     	    		    		     yesFn : btnFn,
     	    		    		     noFn : true,
     	    		    		     yesText : 'Confirm',
    	    		    		     noText : 'Cancel',
     	    		    		   }
     	    		    		 });
     	    		    	   
					        },        
					        error: function(data) {            
					        	easyDialog.open({
					        		  container : {
					        		    content : 'Operation failed,please try again'
					        		  },
					        		  autoClose : 1000,
					        		  overlay : false
					        		});
 
					        }  
					    });  
    	   		      	    	  
    	    	    }
    	     }
    	   
    	   
    	  

</script>
<style>
	.widget-box{border:none;}
	.widget-content {border-bottom: none;}
	.anniu{margin-top:20px;}
</style>
</head>
<body>
	<jsp:include page="base.jsp"></jsp:include>

<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="#" onclick="listShippingInfo();" class="tip-bottom" data-original-title="Go to Drawings"><i class="icon icon-map-marker"></i>Shipping Address</a> <a href="#" class="tip-bottom" data-original-title=""></a>
    </div>

    <!-- <h1>Shipping Address</h1> -->
  </div>
  <div class="container-fluid">
  <div class="anniu">
   	<button type="button" class="btn btn-success" id="editAddress" onclick="editAddress();">Edit</button>
 	<button type="button" class="btn btn-primary" id="saveAddress" onclick="saveAddress();" style="display: inline-block; background-color: rgb(136, 136, 136);">Save</button>
    <button type="button" class="btn btn-success" id="cancel" onclick="listShippingInfo();" style="display: inline-block;">Cancel</button>
   </div>
    <hr>
    <div class="row-fluid">
      <div class="span12" style="background:#f9f9f9;border:1px solid #cdcdcd;">
        <div class="widget-box">
          <div class="widget-content nopadding">
            <div class="form-horizontal">
              <div class="mukuai"  id="input_change">              
                <div class="div1">      
                  <div class="control-group group  div-con">
                    <label class="control-label">UserName :</label>
                    <input id="getUserId" value="${userId}" type="hidden">
                    <div class="controls">
                      <input type="text" id="recipients" class="div-in" value="${obj.userName}" oninput="check_Button()" disabled="disabled">
                    </div>
                  </div>                    
                  <div class="control-group group">
                    <label class="control-label">City :</label>
                    <div class="controls">
                      <input type="text" id="city" value="${obj.city}" disabled="disabled" oninput="check_Button()" class="div-in">
                    </div>
                  </div>
            
                  <div class="control-group group">
                    <label class="control-label">Postcode :</label>
                    <div class="controls">
                      <input type="text" id="postcode" value="${obj.postcode}" disabled=false;  oninput="check_Button()" class="div-in">
                    </div>
                  </div>
                </div>
                <div class="div2">
                  <div class="control-group group">
                    <label class="control-label">Street :</label>
                    <div class="controls">
                      <input type="text" id="detailedAddress" value="${obj.detailedAddress}" disabled=false; oninput="check_Button()" class="div-in">
                    </div>
                  </div>  
                  <div class="control-group group">
                    <label class="control-label">Country :</label>
                    <div class="controls" onchange="changeCountry();">
                      <input type="hidden" value="${obj.country}" id="hidden_country"/>
                      <select class="xiala_select div-in" id="country" name="country"disabled>
                            
                      </select>
                    </div>
                  </div>
                  <div class="control-group group">
                    <label class="control-label">State :</label>
                    <div class="controls" onchange="changeState();">
                      <input type="hidden" value="${obj.state}" id="hidden_state"/>
                      <select name="state" id="state" class="xiala_select div-in" disabled></select>
                    </div>
                  </div>
                  <script language="javascript">
			            populateCountries("country", "state");
			      </script>
       
                  <div class="control-group group">
                    <label class="control-label">Telephone :</label>
                    <div class="controls">
                      <input type="text" id="telephone1" value="${obj.telephone1}" disabled=false; oninput="check_Button()" class="div-in"><span class="div-in" id="span_telephone1" style="color:red;font-size:18px;"></span>
                    </div>
                  </div>              
                  </div>
                </div>
               </div>
              
             <!--  <div class="form-actions act">
                <button type="button" class="btn btn-success" id="editAddress" onclick="editAddress();">Edit</button>
              </div>
              <div class="form-actions act">
                <button  type="button" class="btn btn-primary" id="saveAddress" onclick="saveAddress();">Save</button>
                <button  type="button" class="btn btn-success" id="cancel" onclick="listShippingInfo();">Cancel</button>
              </div> -->
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
