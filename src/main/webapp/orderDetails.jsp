
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.cbt.util.WebCookie"%>		
<%@page import="com.cbt.entity.ClientOrder"%>		
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@page import="java.util.List"%>
<%@page import="com.cbt.entity.Milestone"%>
<%@page import="com.cbt.entity.ProductionPhotoTimeline"%>


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
  <link rel="stylesheet" href="css/select2.css"/>
  <link rel="stylesheet" href="/crm/css/details.css"/>
  <link rel="stylesheet" href="css/easydialog.css" />
  <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
  <link rel="stylesheet" href="css/jquery.gritter.css" />
  <link href="css/css.css" rel="stylesheet" type="text/css" />
  <link type="text/css" href="css/iF.step.css" rel="stylesheet">
  <link type="text/css" href="css/download/download.css" rel="stylesheet">
  <link type="text/css" href="css/lunbo/lunbo.css" rel="stylesheet">
  <link type='image/x-ico' rel='icon' href='img/favicon.ico' />
  
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/easydialog.min.js"></script>  
<script type="text/javascript" src="js/base64.js"></script>  
<script src="js/slider.js" type="text/javascript"></script>  
<script src="js/dateFormat.js" type="text/javascript"></script>  


<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-115010583-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-115010583-1');
</script>
<script type="text/javascript">

<%ClientOrder clientOrder = (ClientOrder)request.getAttribute("clientOrder");%>
<%List<Milestone> milestones = (List<Milestone>)request.getAttribute("milestones");%>
<%List<ProductionPhotoTimeline> productionPhotoTimeline = (List<ProductionPhotoTimeline>)request.getAttribute("productionPhotoTimeline");%>
<%List<List<ProductionPhotoTimeline>> list = (List<List<ProductionPhotoTimeline>>)request.getAttribute("productionPhotoTimelines");%>
<%Integer tl = milestones.size();%>
<%Integer p_tl = productionPhotoTimeline.size();%>

<%-- var poPath = '<%=clientOrder.getPoPath()%>'; --%>
<%-- var qcPath = '<%=clientOrder.getQcReportPath()%>'; --%>
<%-- var shippingPath = '<%=clientOrder.getShippingDocPath()%>'; --%>



      
</script>
<style>
  #slider{
  z-index: 999;
  }

</style>
<style type="text/css">






  body,div,ul,li,a,img{margin: 0;padding: 0;}
  ul,li{list-style: none;}
  a{text-decoration: none;}
 .w-weui_dialog {
    z-index: 5000;
    top:45%;
    left:50%;
    position: fixed;
    margin: 30px auto;
    width: 800px;
    height: 600px;
    -webkit-transform: translate(-50%, -50%);
    transform: translate(-50%, -50%);
}

  #banner{
  	position: relative;
    width: 800px;
    height: 600px;
    overflow: hidden;
    }
  .imgList{
  	position: relative;
    width: 32000px;
    height: 600px;
    z-index: 10;
    overflow: hidden;
    }
  .imgList li{float:left;display: inline;}
  .imgList li img{width:800px;height:600px;}
  #prev,
  #next{ 
  	position: absolute;
    top: 250px;
    z-index: 20;
    cursor: pointer;
    opacity: 0.2;
    filter: alpha(opacity=20);
    }
  #prev{left: 10px;}
  #next{right: 10px;}
  #prev:hover,
  #next:hover{opacity: 0.5;filter:alpha(opacity=50);}
 .bg{position: absolute;bottom:0px;width: 800px;height: 37px;z-index:20;opacity: 0.4;filter:alpha(opacity=40);background: black;}
 .infoList{position: absolute;left: 10px;bottom: 10px;z-index: 30;}
  .infoList li{display: none;}
  .infoList .infoOn{display: inline;color: white;}
  .indexList{position: absolute;right: 10px;bottom: 5px;z-index: 30;}
  .indexList li{float: left;margin-right: 5px;padding: 2px 4px;border: 2px solid black;background: grey;cursor: pointer;color: white;}
  .indexList .indexOn{background: red;font-weight: bold;color: white;}
  .w-fork{position: absolute;top: -50px;right: -100px;z-index: 9999;}
  
  
  .z-fork{position: absolute;
    margin-top: -19px;
    margin-left: -18px;}
    
    
    
.w-label{
	background:url(img/new.png) no-repeat !important;
	position: absolute;
    margin-left: 5px;
}
.w-label1{
    margin-left: 18px;
    margin-top: -39px;
}
.label{padding: 2px 5px;
	font-weight: normal;}
.w-widget-a{text-decoration: underline;}
.container-fluid .w-row .span12 {
    width: 100%;
}








</style>

</head>
<body>
<jsp:include page="base.jsp"></jsp:include>

<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="#" onclick="listClientOrder()" class="tip-bottom" data-original-title="Go to Drawings"><i class="icon icon-file"></i>My Orders</a> <a href="#" class="current w_current_a" data-original-title="">Order Details</a>
    	<div class="w-rt">
<%--        	 	<button class="btn btn-primary" onclick="open_push_message('${clientOrder.orderId}','${clientOrder.factoryId}','1')">Push for Lead Time</button> --%>
        	<button class="btn btn-info" onclick="open_push_message('${clientOrder.orderId}','${clientOrder.factoryId}','2')">Report Quality Issues</button>
<%--         	<button class="btn btn-success" onclick="open_push_message('${clientOrder.orderId}','${clientOrder.factoryId}','3')">Other Issues</button> --%>
        	<button class="btn btn-warning" onclick= "reOrder('${clientOrder.orderId}')">Reorder </button>
        </div>
    </div>
    <div class="w-text">
      <div class="row-fluid w-table">
       <div class="span4" style="margin-left: 0;">
        <table>
          <tbody>
          <tr>
            <td class="w-td">Supplier Project# :</td>
            <td>${clientOrder.projectName}</td>
          </tr>
          <tr>
            <td class="w-td">PO # :</td>
            <td>${clientOrder.poNumber}</td>
          </tr>
          </tbody>
        </table>
        </div>
        <div class="span4">
          <table>
            <tbody>
            <tr>
              <td class="w-td">Status :</td>
              <td id="order_state">${clientOrder.orderStatus == 0 ? 'In Process' : 'Finished'}</td>
            </tr>
            <tr>
              <td class="w-td">Create Date :</td>
              <td><fmt:formatDate value='${clientOrder.createTime}' pattern='MM/dd/yyyy'/></td>
            </tr>
            </tbody>
          </table>
        </div>
        <div class="span4">
          <table>
            <tbody>
            <tr>
              <td class="w-td">Amount :</td>
              <td>$${clientOrder.amount}</td>
            </tr>
            <tr>
              <td class="w-td">Delivery Date :</td>
              <td><fmt:formatDate value='${clientOrder.deliveryTime}' pattern='MM/dd/yyyy'/></td>
            </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
  <div class="out-box out-box2">
		    <div class="w-font">
		      <h2 style="position: static;">Download</h2>
		    </div>
            <div class="row">
            <div class="col-xs-3">
                <div class="thumbnail">
                    <div class="caption">
                        <h3>PO</h3>
                        <c:if test="${pos.size() != 0}">  
                         	<c:forEach var="obj" items="${pos}" varStatus="i">
	                        <p>
	                            <span>File${i.index+1}:</span>
	                            <a href="###" onclick="doDownload_po('${obj.id}',this)" title="${obj.poPath}">${obj.poPath}</a>
	                            <em class="pull-right"><fmt:formatDate value='${obj.uploadDate}' pattern='MM/dd/yyyy'/></em>
	                        </p>
                            </c:forEach>
                        </c:if>
                    </div>
                    <div class="bgc">P</div>
                </div>
            </div>
            <div class="col-xs-3" style="width:16%;">
                <div class="thumbnail thum2">
                    <div class="caption">
                        <h3>Invoice</h3>
                        <p>
                            <a href="###" onclick="show_invoice('${clientOrder.orderId}')">Invoice</a>
                        </p>                        
                    </div>
                        <div class="bgc">I</div>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="thumbnail thum3">
                    <div class="caption">
                        <h3>QC Report</h3>
                         <c:if test="${qcReports.size() != 0}">
                           <c:forEach var="obj" items="${qcReports}" varStatus="i">
	                        <p>
	                            <span>File${i.index+1}:</span>
	                            <a href="###" onclick="doDownload_qc('${obj.id}',this)" title="${obj.qcReportPath}">${obj.qcReportPath}	                           
	                            </a>	
	                             <c:if test="${obj.oldOrNewQc != null && obj.oldOrNewQc != ''}">
	                            <i></i>
	                            </c:if>                            
	                            <em class="pull-right"><fmt:formatDate value='${obj.uploadDate}' pattern='MM/dd/yyyy'/></em>
	                        </p>
	                        </c:forEach>
                        </c:if>
                    </div>
                    <div class="bgc">Q</div>
                </div>
            </div>
            <div class="col-xs-3" style="width:34%;">
                <div class="thumbnail thum4">
                    <div class="caption">
                        <h3>Shipping Doc</h3>
                 <c:forEach var="obj" items="${shippingDocs}" varStatus="i">                        
                     <c:if test="${obj.BLPath != null || obj.invoicePath !=null || obj.packingListPath !=null || obj.formAPath !=null 
		           	    || obj.packagingPath !=null || obj.BLCopyPath !=null || obj.otherPath !=null}">
	                       <c:if test="${obj.BLPath !=null}">
		                        <p>
		                            <span>BL File:</span>		           
		                            <a href="###"onclick="doDownload_shippingDoc('${obj.id}',this,'1')" title="${obj.BLPath}">${obj.BLPath}                           
		                            </a>
		                             <c:if test="${obj.oldOrNewBL != null && obj.oldOrNewBL != ''}">
			                         <i></i>
			                         </c:if> 
		                            <em class="pull-right"><fmt:formatDate value='${obj.BLUploadDate}' pattern='MM/dd/yyyy'/></em>
		                        </p>
	                        </c:if>
	                       <c:if test="${obj.invoicePath !=null}">
		                        <p>
		                            <span>Invoice:</span>
		                            <a href="###"onclick="doDownload_shippingDoc('${obj.id}',this,'2')" title="${obj.invoicePath}">${obj.invoicePath}		                   
		                            </a>
		                            <c:if test="${obj.oldOrNewInvoice != null && obj.oldOrNewInvoice != ''}">
			                         <i></i>
			                         </c:if>
		                            <em class="pull-right"><fmt:formatDate value='${obj.invoiceUploadDate}' pattern='MM/dd/yyyy'/></em>
		                        </p>
	                        </c:if>
	                       <c:if test="${obj.packingListPath !=null}">
		                        <p>
		                            <span>Packing List:</span>
		                            <a href="###"onclick="doDownload_shippingDoc('${obj.id}',this,'3')" title="${obj.packingListPath}">${obj.packingListPath}		                            
		                            </a>		  
		                             <c:if test="${obj.oldOrNewPackingList != null && obj.oldOrNewPackingList != ''}">
			                         <i></i>
			                         </c:if>                           
		                            <em class="pull-right"><fmt:formatDate value='${obj.packingListUploadDate}' pattern='MM/dd/yyyy'/></em>
		                        </p>
	                        </c:if>
	                       <c:if test="${obj.formAPath !=null}">
		                        <p>
		                            <span>Form A:</span>
		                            <a href="###"onclick="doDownload_shippingDoc('${obj.id}',this,'4')" title="${obj.formAPath}">${obj.formAPath}		                            
		                            </a>
		                            <c:if test="${obj.oldOrNewFormA != null && obj.oldOrNewFormA != ''}">
			                         <i></i>
			                         </c:if> 
		                            <em class="pull-right"><fmt:formatDate value='${obj.formAUploadDate}' pattern='MM/dd/yyyy'/></em>
		                        </p>
	                        </c:if>
	                       <c:if test="${obj.packagingPath !=null}">
		                        <p>
		                            <span>Packaging:</span>
		                            <a href="###"onclick="doDownload_shippingDoc('${obj.id}',this,'5')" title="${obj.packagingPath}">${obj.packagingPath}		                            
		                            </a>
		                             <c:if test="${obj.oldOrNewPackaging != null && obj.oldOrNewPackaging != ''}">
			                         <i></i>
			                         </c:if>
		                            <em class="pull-right"><fmt:formatDate value='${obj.BLCopyUploadDate}' pattern='MM/dd/yyyy'/></em>
		                        </p>
	                        </c:if>
	                       <c:if test="${obj.BLCopyPath !=null}">
		                        <p>
		                            <span>BL Copy File:</span>
		                            <a href="###"onclick="doDownload_shippingDoc('${obj.id}',this,'6')" title="${obj.BLCopyPath}">${obj.BLCopyPath}		                           
		                            </a>	
		                             <c:if test="${obj.oldOrNewBLCopy != null && obj.oldOrNewBLCopy != ''}">
			                         <i></i>
			                         </c:if>                             
		                            <em class="pull-right"><fmt:formatDate value='${obj.BLCopyUploadDate}' pattern='MM/dd/yyyy'/></em>
		                        </p>
	                        </c:if>
	                       <c:if test="${obj.otherPath !=null}">
		                        <p>
		                            <span>Other:</span>
		                            <a href="###"onclick="doDownload_shippingDoc('${obj.id}',this,'7')" title="${obj.otherPath}">${obj.otherPath}
		                            </a>
		                             <c:if test="${obj.oldOrNewOther != null && obj.oldOrNewOther != ''}">
			                         <i></i>
			                         </c:if>		                            
		                            <em class="pull-right"><fmt:formatDate value='${obj.otherUploadDate}' pattern='MM/dd/yyyy'/></em>
		                        </p>
	                        </c:if>
	                        <br>
                       </c:if> 
                   </c:forEach>    
                    </div>
                    <div class="bgc">S</div>
                </div>

            </div>
        </div>
  </div>
  
  
  
  <div class="out-box">

  <c:if test="${milestones.size() > 1}">
  <div class="w-font">
  <h2>Milestone</h2>
</div>
  <div class="container-fluid">
    <hr>
  </div>
  <div class="container-fluid">
    <div class="w-row row-fluid" style="margin-top: 0px;height:277px;">   
     <div class="milestone-n-div">
                        <c:if test="${milestones.size() < 6}">                      
				        <ol class="milestone-n-ol">
				            <c:forEach var="obj" items="${milestones}" varStatus="i">
				             <c:if test="${i.index > 0 && i.index != milestones.size()-1}">  
				              <li class="milestone-n-li">Milestone${i.index}: ${obj.milestoneName}</li>  
				             </c:if> 
				            </c:forEach>                 				                            
				        </ol>
				        </c:if>
				        <c:if test="${milestones.size() > 5}"> 				            
						        <ol class="milestone-n-ol">
						            <c:forEach var="obj" items="${milestones}" varStatus="i">
							          <c:if test="${i.index < 5 && i.index >0}">
							             <li class="milestone-n-li">Milestone${i.index}: ${obj.milestoneName}</li> 
							          </c:if>  
						            </c:forEach>                 				                            
						        </ol>					         
						         <ol class="milestone-n-ol">
						            <c:forEach var="obj" items="${milestones}" varStatus="i">
							            <c:if test="${i.index > 4 && i.index != milestones.size()-1}">
							            <li class="milestone-n-li">Milestone${i.index}: ${obj.milestoneName}</li> 
							            </c:if>  
						            </c:forEach>                           				                     
						        </ol>
				        </c:if>	
	</div>        
     <div class="z-milestone-div" style="width:80%;"> 
     <div class="milestone-n-div" style="width:80%;">
                   <ol style=" float:right;margin-top: -54px;">				            
			            <li class="milestone-n-li" style="list-style: none;"><span class="ui-step-cont-number milestone-pie" style="background-color: rgb(185, 185, 185);"></span><span style="margin-left: 12px;">:Predict Date</span></li> 
			            <li class="milestone-n-li" style="list-style: none;"><span class="ui-step-cont-number milestone-pie" style="background-color: rgb(40, 183, 121);"></span><span style="margin-left: 12px;">:Actual Date</span></li>                				                            
			      </ol>
     </div>  
		<div class="ui-step-line2 z-step-line2">	
			<img src="img/img4.png" class="w-img z-img"/>
			<div class="w-item dot-right2"></div>		
			<span class="w-img z-img z-font"></span>	
			<p class="w-img z-img" style="margin-top:-81px;">Today</p>		
		</div>
		<div class="ui-step-line"></div>
		<ul class="ui-step ui-step-5"  id="milestone_ul">
			
		   <%
		   if(tl > 1){
              for(int i = 0;i<tl;i++){           	
               if(i == 0){	
           %>  	
            	 <li class="step-start step-done">
            	    
					<div class="ui-step-cont">
						<span class="ui-step-cont-number"><%=milestones.get(i).getMilestoneDate() == null ? "" : milestones.get(i).getMilestoneDate()%></span>
						<span style="display:none;"><%=milestones.get(i).getMilestoneDate()%></span>
						<span style="display:none;"><%=milestones.get(i).getExpectedOrActually()%></span>
						 <span class="w_img_s" style="top: -17px;"><img src="images/w_bottom.png"/></span>
						<span class="ui-step-cont-text w-top-text" style="color:#666;width:40px;left:15px;top:-30px;height: 23px;" title="<%=milestones.get(i).getMilestoneName()%>"><%=milestones.get(i).getMilestoneName()%></span>
						
	                    <span style="display:none;"><%=milestones.get(i).getDelayStatus()%></span>
						<div style="display:none;" class="z-img-div">
			              <img src="img/img2.png" class="z-img-delay"/>
			              <textarea disabled>Delay reason : <%=milestones.get(i).getDelayRemark() == null ? "" : milestones.get(i).getDelayRemark()%></textarea>
			            </div>
					</div>				
			     </li>
			  <%
               }
			  if(i>0 && i<tl-1){
			  %>   
			     <li class="step-start z-step-done">			     
					<div class="ui-step-cont">
						<span class="ui-step-cont-number"><%=milestones.get(i).getMilestoneDate() == null ? "" : milestones.get(i).getMilestoneDate()%></span>
						<span style="display:none;"><%=milestones.get(i).getMilestoneDate()%></span>
						<span style="display:none;"><%=milestones.get(i).getExpectedOrActually()%></span>
<!-- 							 <div class="w_bottom_div"> -->
							 <span class="w_img_s"><img src="images/w_top.png"></span>
							 <span class="ui-step-cont-text w-top-text" style="color:#666;" title="<%=milestones.get(i).getMilestoneName()%>"><%=(i)%></span>
							
				        <span style="display:none;"><%=milestones.get(i).getDelayStatus()%></span>
						<div style="display:none;" class="z-img-div">
			              <img src="img/img2.png" class="z-img-delay"/>
			              <textarea disabled>Delay reason : <%=milestones.get(i).getDelayRemark() == null ? "" : milestones.get(i).getDelayRemark()%></textarea>
			            </div>
					</div>
			    </li>
			  <%	  
			   }
			  if(i == tl-1){
			  %>  
			     <li class="step-end">
					<div class="ui-step-cont">
						<span class="ui-step-cont-number"><%=milestones.get(i).getMilestoneDate() == null ? "" : milestones.get(i).getMilestoneDate()%></span>
						<span style="display:none;"><%=milestones.get(i).getMilestoneDate()%></span>					
						<span style="display:none;"><%=milestones.get(i).getExpectedOrActually()%></span>					
								<span class="w_img_s" style="top: -17px;"><img src="images/w_bottom.png"></span>
								<span class="ui-step-cont-text w-top-text" style="color:#666;width:60px;top:-30px;left:5px;height: 23px;" title="<%=milestones.get(i).getMilestoneName()%>"><%=milestones.get(i).getMilestoneName()%></span>
							
			            <span style="display:none;"><%=milestones.get(i).getDelayStatus()%></span>
						<div style="display:none;" class="z-img-div">
			              <img src="img/img2.png" class="z-img-delay"/>
			              <textarea disabled>Delay reason : <%=milestones.get(i).getDelayRemark() == null ? "" : milestones.get(i).getDelayRemark()%></textarea>
			            </div>
					</div>
				 </li>	          		  	   
		     <% 			  
              }
             }
		    }
		   %>

		</ul>
		</div>
	  </div>	      
   </div>      
    </c:if>     
         
         
        <!--图片轮播 -->
<!--          <div  style="display:none;"> -->
<!--         <div class="weui_mask" onclick="close_wrapper()"></div> -->
        
<!--         <div class="w-weui_dialog">最外层部分 -->
<!--         <div class="w-fork"><img src="images/fork.png" onclick="close_wrapper()"></div> -->
<!--           <div class="bg"></div> 图片底部背景层部分 -->
<!-- 	      <ul class="infoList">图片左下角文字信息部分 -->
<!-- 	         <li></li> -->
<!-- 	      </ul> -->
<!-- 	      <ul class="indexList">图片右下角序号部分 -->
<!-- 	        <li></li> -->
<!-- 	        <li>1/N</li> -->
<!-- 	      </ul> -->
<!-- 		    <div id="banner">轮播部分 -->
<!-- 		      <ul class="imgList" id="imgList">图片部分 -->
		      
<!-- 		      </ul> -->
<!-- 		      <img src="images/arrow-left.png" width="20px" height="40px" id="prev"> -->
<!-- 		      <img src="images/arrow-right.png" width="20px" height="40px" id="next"> -->
      
<!-- 		    </div> -->
<!-- 		  </div>          -->
<!--          </div> -->
<!--     </div> -->
    
    
    <!-- 最外层部分 -->
    <div class="row weekly_lunbo" id="wrapper" style="display:none;">     
    <div class="weui_mask" onclick="close_wrapper()"></div>  
    <div class="row colxls10">
        <div class="lunbo col-xs-8">
            <div class="lg">
                <img src="" alt="" class="img-responsive"/>
            </div>
            <div class="img_list">
                <div class="uls row">
                    <ul class="colxs12 clearfix" id="imgList">
                        <li class="colxs2">
                            <a href="###">
                                <img src="" alt="" class="img-responsive"/>
                            </a>
                        </li>
                    </ul>
                    
                </div>
            	<span class="btnL"></span>
                <span class="btnR"></span>
            
            </div>
        </div>
        <div class="introduce col-xs-8">
            <span style="font-size: 16px;color: #333;">Weekly report:</span>
            <p id="photo_remark"></p>

        </div>
        <em class="emlunbo" onclick="close_wrapper()"></em>
        <span class="spanlunbo">2017/10/04</span>
        </div>
    </div>
    
    
    
    
    
    
  
    
    
    
    
    
    
    
    
    
    

<c:if test="${productionPhotoTimeline.size() > 0}">
        <div class="container-fluid"><hr style="clear:both;">
        <div class="row-fluid">
            <div class="span12">
                <h1 style="font-size:16px;margin: 0;">Weekly Report</h1>
                
            </div>
        </div>
        
        
        
        
         <div class="weekly_report report3">   
			<div class="row">
			<c:forEach var="obj" items="${productionPhotoTimeline}" varStatus="i"> 
			            <div class="col-xs-0-3">
			                <div class="thumbnail">
			                    <div class="imgs">
			                      <c:if test="${obj.isDocument == 0}">
			                         <img src="${obj.photoPathCompress == null ? '' : obj.photoPathCompress}" alt="" onclick="show_photos('${obj.orderId}','<fmt:formatDate value='${obj.uploadDate}' pattern='yyyy-MM-dd'/>');" class="img-responsive">
			                         <span>1/${productionPhotoTimelines.get(i.count-1).size()}</span>
			                      </c:if>
			                      <c:if test="${obj.isDocument == 1}">
			                           <c:if test="${fn:endsWith(obj.documentPath,'.xls') == true || fn:endsWith(obj.documentPath,'.xlsx') == true}">
			                           <img src="img/excel.png" class="img-responsive" onclick="download_document('${obj.id}')">
			                           </c:if>
			                           <c:if test="${fn:endsWith(obj.documentPath,'.doc') == true || fn:endsWith(obj.documentPath,'.docx') == true}">
			                           <img src="img/word.png" class="img-responsive" onclick="download_document('${obj.id}')">
			                           </c:if>
			                           <c:if test="${fn:endsWith(obj.documentPath,'.ppt') == true || fn:endsWith(obj.documentPath,'.pptx') == true}">
			                           <img src="img/word.png" class="img-responsive" onclick="download_document('${obj.id}')">
			                           </c:if>
			                           <c:if test="${fn:endsWith(obj.documentPath,'.pdf') == true}">
			                           <img src="img/pdf.png" class="img-responsive" onclick="download_document('${obj.id}')">
			                           </c:if>
			                      </c:if>
			                    </div>
			                    <div class="caption">
                                    <p>${obj.remarks == null ? '' : obj.remarks}</p>
			                        <p class="p2"><span style="float:left;">by:${obj.inputSales}</span><fmt:formatDate value='${obj.uploadDate}' pattern='MM/dd/yyyy'/></p>
			                    </div>
			                </div>
			            </div>
			  </c:forEach>         
			</div>    
		</div>  
    
    </div>
</c:if>




<c:if test="${shippingDocs.size() != 0}">
<div class="container-fluid" style="margin-bottom:100px;">
        <div class="row-fluid">
            <div class="span12">
                <h1 style="font-size:16px;margin: 0;">Shipping</h1>
                
            </div>
        </div>
<c:forEach var="obj" items="${shippingDocs}" varStatus="i">
<c:if test="${obj.shippingStartDate != null && obj.shippingStartDate != ''}">
<div class="shipping-progress" style="width:80%;">
   <div class="shipping-bl-div">
        <ol>
           <c:if test="${obj.destinationPort != null && obj.destinationPort != ''}">
            <li class="shipping-bl-li">Destination: &nbsp;&nbsp;${obj.destinationPort}</li>    
           </c:if>   
           <c:if test="${obj.ISFDate != null && obj.ISFDate != ''}">
            <li class="shipping-bl-li">ISF Date: &nbsp;&nbsp;<fmt:formatDate value='${obj.ISFDate}' pattern='MM/dd/yyyy'/></li>    
           </c:if>   
            <c:if test="${obj.BLAvailableDate != null && obj.BLAvailableDate != ''}">     
            <li class="shipping-bl-li">BL &nbsp;Date: &nbsp;&nbsp;<fmt:formatDate value='${obj.BLAvailableDate}' pattern='MM/dd/yyyy'/></li>  
            </c:if>                    
        </ol>
    </div>
		<div class="ui-step-line2">	
			<img src="img/img3.png" class="w-img" style="position: relative;"/>
			<span style="position: absolute;top: -40px;margin-left: 98%;color: #666;"></span>
		</div>
		<div class="ui-step-line shipping-step-h"></div>
		<ul class="ui-step ui-step-5">
			<li class="step-start step-done">
				<div class="ui-step-cont">
					<span class="ui-step-cont-number">${obj.shippingStartDate == null ? '' : obj.shippingStartDate}</span>
					<span style="display:none;">${obj.shippingStartDate}</span>
<!-- 					<span class="ui-step-cont-text w-top-text" style="top:32px;">Start</span> -->
				</div>
			</li>
			<li class="step-end">
				<div class="ui-step-cont">
					<span class="ui-step-cont-number">${obj.shippingArrivalDate == null ? '' : obj.shippingArrivalDate}</span>
					<span style="display:none;">${obj.shippingArrivalDate}</span>					
<!-- 					<span class="ui-step-cont-text w-ui-step-cont-text" style="top:32px;" title="Arrival Date">Arrival Date</span> -->
				</div>
			</li>
		</ul>
	</div>	
   </c:if>
 </c:forEach>	
  </div>
</c:if>


</div>
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
    <!-- 图纸列表内容 -->
<c:if test="${clientDrawings.size()>0}">    
  <div class="out-box">
    <div class="w-font">
      <h2 style="position: static;">Parts List</h2>
    </div>
    <div class="container-fluid">
        <div class="control-group">
            <div class="controls">
			<div class="row-fluid">
            <div class="span12">
                <div class="widget-box">

                    <div class="widget-content nopadding">
                        <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper" role="grid">
                            <table class="table table-bordered data-table dataTable" id="DataTables_Table_0">
                                <thead>
                                <tr role="row">
                                    <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending">
                                        <div class="DataTables_sort_wrapper">Product Name
                                            <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
                                        </div>
                                    </th>                      
                                    <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending">
                                        <div class="DataTables_sort_wrapper">File Name
                                            <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
                                        </div>
                                    </th>                      
                                    <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">
                                        <div class="DataTables_sort_wrapper">Unit Price(USD)
                                            <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
                                        </div>
                                    </th>
                                    <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">
                                        <div class="DataTables_sort_wrapper">Quantity
                                            <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
                                        </div>
                                    </th>
                                    <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">
                                        <div class="DataTables_sort_wrapper">Mold Price(USD)
                                            <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
                                        </div>
                                    </th>
                                    <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">
                                        <div class="DataTables_sort_wrapper">Operation
                                            <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
                                        </div>
                                    </th>
                                </tr>
                                </thead>
                                <tbody role="alert" aria-live="polite" aria-relevant="all" id="product_tbody">  
                                <c:forEach var="obj" items="${clientDrawings}" varStatus="i">  
                                <tr class="gradeA odd">
                                    <td>${obj.productName}</td>
                                    <td>
                                     <c:if test="${obj.drawingsName == null || obj.drawingsName == ''}">
                                    <a class="w-widget-a" style="text-decoration:none;">${obj.drawingsName}</a>
                                     </c:if>
                                     <c:if test="${obj.drawingsName != null && obj.drawingsName != ''}">
                                    <a class="w-widget-a" style="color: #08c;cursor:pointer;" onclick="download_drawing('${obj.id}')">${obj.drawingsName}</a>
                                     </c:if>
                                    </td>              
                                    <td>${obj.unitPrice}</td>
                                    <td>${obj.quantity}</td>
                                    <td>${obj.moldPrice}</td>
                                    <td class="center">
                                        <c:if test="${obj.drawingsName == null || obj.drawingsName == ''}">
                                        <a><button class="btn btn-primary" style="text-align:center;background-color: #bbb;">Download Drawing</button></a>
                                        </c:if>
                                        <c:if test="${obj.drawingsName != null && obj.drawingsName != ''}">
                                        <a><button class="btn btn-primary" style="text-align:center;" onclick="download_drawing('${obj.id}')">Download Drawing</button></a>
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
    </div>
  </div>
  </c:if>
  
  
  
    <!-- 发票列表内容 -->

  <c:if test="${invoiceInfos.size() != 0}">
		  <div class="out-box">
		    <div class="w-font">
		      <h2 style="position: static;">Invoices List</h2>
		    </div>
		    
		      <div class="span4">
		          <table>
		            <tbody>
		            <tr style="color:#f00;">
		              <td class="w-td">Invoice Amount :</td>
		              <td>${total}&nbsp;USD</td>
		            </tr>
		            </tbody>
		          </table>
		     </div>
		    <div class="container-fluid">
		        <div class="control-group">
		            <div class="controls">
					<div class="row-fluid">
		            <div class="span12">
		                <div class="widget-box">
		
		                    <div class="widget-content nopadding">
		                        <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper" role="grid">
		                            <table class="table table-bordered data-table dataTable" id="DataTables_Table_0">
		                                <thead>
		                                <tr role="row">
		                                    <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending">
		                                        <div class="DataTables_sort_wrapper">Serial Number 
		                                            <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
		                                        </div>
		                                    </th>                      
		                                    <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending">
		                                        <div class="DataTables_sort_wrapper">Invoice Number
		                                            <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
		                                        </div>
		                                    </th>                      
		                                    <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">
		                                        <div class="DataTables_sort_wrapper">Create Date
		                                            <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
		                                        </div>
		                                    </th>
		                                    <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">
		                                        <div class="DataTables_sort_wrapper">Invoice Amount
		                                            <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
		                                        </div>
		                                    </th>          
		                                    <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">
		                                        <div class="DataTables_sort_wrapper">Total Paid
		                                            <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
		                                        </div>
		                                    </th>          
		                                    <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">
		                                        <div class="DataTables_sort_wrapper">Unpaid
		                                            <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
		                                        </div>
		                                    </th>          
<!-- 		                                    <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending"> -->
<!-- 		                                        <div class="DataTables_sort_wrapper">Recently Paid Date -->
<!-- 		                                            <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span> -->
<!-- 		                                        </div> -->
<!-- 		                                    </th>           -->
		                                    <th class="ui-state-default" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending">
		                                        <div class="DataTables_sort_wrapper">
		                                            <span class="DataTables_sort_icon css_right ui-icon ui-icon-carat-2-n-s"></span>
		                                        </div>
		                                    </th>
		                                </tr>
		                                </thead>
		                                <tbody role="alert" aria-live="polite" aria-relevant="all">  
		                                <c:forEach var="obj" items="${invoiceInfos}" varStatus="i">  
		                                <tr class="gradeA odd">
		                                    <td>${i.index+1}</td>
		                                    <td>${obj.invoiceId}</td>
		                                    <td><fmt:formatDate value='${obj.createTime}' pattern='MM/dd/yyyy'/></td>
		                                    <td>${obj.amount}&nbsp;<span style="color:red">${amountUnit[i.count-1].currencyShorthand}</span></td>		                            
		                                    <td>${obj.sumAmountActual}&nbsp;<span style="color:red">${amountUnit[i.count-1].currencyShorthand}</span></td>
		                                    <td>${obj.amount - obj.sumAmountActual}&nbsp;<span style="color:red">${amountUnit[i.count-1].currencyShorthand}</span></td>
<%-- 		                                    <td><fmt:formatDate value='${obj.paymentTime}' pattern='MM/dd/yyyy'/></td> --%>
		                                    <td class="center">
		                                    <c:if test="${obj.invoicePath == null || obj.invoicePath == ''}">
		                                        <a><button class="btn btn-primary" style="background-color: #bbb;visibility: hidden;">Download</button></a>
		                                    </c:if>
		                                    <c:if test="${obj.invoicePath != null && obj.invoicePath != ''}">
		                                        <a><button class="btn btn-primary" onclick="doDownload('${obj.invoiceId}','${obj.factoryId}')">Download</button></a>
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
		    </div>
		  </div>
  </c:if>
  <c:if test="${clientOrder.orderRequest != '' && clientOrder.orderRequest != null}">
  <!-- 原始邮件内容 -->
  <div class="out-box">
    <div class="w-font">
      <h2 style="position: static;">Original Order Request</h2>
    </div>
    <div class="container-fluid">
        <div class="control-group">
            <label class="control-label">Email Content: </label>
            <div class="controls">
               
            </div>
       		<div class="controls">
				<textarea style="width:800px;height:200px;" disabled>${clientOrder.orderRequest}</textarea>
			</div>
        </div>   
    </div>
  </div>
  </c:if>
  
  

<div class="row-fluid">
  <div id="footer" class="span12"> 
  </div>
</div>
<!--end-Footer-part-->
</body>

<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/easydialog.min.js"></script>  
<script type="text/javascript" src="js/base64.js"></script>  
<script src="js/jquery.min.js"></script>
<script src="js/slider.js" type="text/javascript"></script>  
<script type="text/javascript">
var outputTime = '<%=clientOrder.getOutputTime()%>';
var orderStatus = '<%=clientOrder.getOrderStatus()%>';
var curIndex = 0; //当前图片页数
var ulkey = 0;

// function AutoResizeImage(maxWidth, maxHeight, objImg) {
// 	var img = new Image();
// 	img.src = objImg.src;
// 	var hRatio;
// 	var wRatio;
// 	var Ratio = 1;
// 	var w = img.width;
// 	var h = img.height;
// 	wRatio = maxWidth / w;
// 	hRatio = maxHeight / h;
// 	if(maxWidth == 0 && maxHeight == 0) {
// 		Ratio = 1;
// 	} else if(maxWidth == 0) { 
// 		if(hRatio < 1) Ratio = hRatio;
// 	} else if(maxHeight == 0) {
// 		if(wRatio < 1) Ratio = wRatio;
// 	} else if(wRatio < 1 || hRatio < 1) {
// 		Ratio = (wRatio <= hRatio ? wRatio : hRatio);
// 	}
// 	if(Ratio < 1) {
// 		w = w * Ratio;
// 		h = h * Ratio;
// 	}
// 	objImg.height = h;
// 	objImg.width = w;
// }


$(function(){
	
$('#sidebar_ul').find('li').eq(0).addClass('active');

// if(orderStatus == 1){	
// $('.container-fluid:last').show();
// }else{
// $('.container-fluid:last').hide();	
// }

$('.z-download-ul').find('li').each(function(){
	var tl = $(this).find('.row-fluid').length;
	if(tl > 1){
		$(this).find('.row-fluid').hide();	
		$(this).find('.row-fluid').eq(0).show();	
	}
})


   //图片宽度
$('.weekly_report').find('img').each(function(){
	var w = $(this).css('width');
	var h = $(this).css('height');
	if(w > h){
		$(this).css({'width':'188px','height':'auto'});
	}else{
		$(this).css({'width':'auto','height':'188px'});
	}
	
})



$('.z-download-ul').find('li').find('i').click(function(){
	
	if($(this).attr('class') == 'i-show'){
		$(this).removeClass('i-show');
		$(this).next().css({"background-color": "#fff"}).siblings('.row-fluid').hide();
	}else{
		$(this).siblings('.row-fluid').show().css({"background-color": "#eee"});
		$(this).addClass('i-show');
	}
})
	
	
	

//左箭头点击处理
 
 
$(".btnL").click(function(){	
        ulkey--;
        if(ulkey<0){
            ulkey=0;
            curIndex = 0;
            $('.img_list ul').css('left','0');
            var id = $("#imgList li").eq(curIndex).find('input').val();	 
            This = $("#imgList li").eq(curIndex).find('a');  	 
         	show(id,This);
         	return false;
        }

        var move=ulkey* -136;
        curIndex--;
        $('.img_list ul').stop().animate({'left':move+'px'},500);
        var id = $("#imgList li").eq(curIndex).find('input').val();	 
        This = $("#imgList li").eq(curIndex).find('a');  	 
     	show(id,This);
  
	
	
	
})
/* $(".btnL").click(function(){
  var imgLen = $("#imgList li").length;
  var tl = Math.ceil(imgLen/6);
  if(curIndex == 1){
	 return false; 
  }else{
	  curIndex --;
	  
	  $("#imgList li").each(function(i){
		   if(i>=(curIndex-1)*6 && i<curIndex*6){
			  $(this).show();
		   }else{
			  $(this).hide(); 
		   } 		 
	  })
	  var id = $("#imgList li").eq((curIndex-1)*6).find('input').val();	 
      This = $("#imgList li").eq((curIndex-1)*6).find('a');  	 
	  show(id,This);
  } 
});
 */
//右箭头点击处理
$('.btnR').click(function(){
	
	 ulkey++;
	 var imgLen = $("#imgList li").length;
     if(ulkey > imgLen-1){
//          ulkey = 0;
         curIndex = 0;
         $('.img_list ul').css('left','0');
         var id = $("#imgList li").eq(curIndex).find('input').val();	 
         This = $("#imgList li").eq(curIndex).find('a');  	 
    	 show(id,This);
    	 return false;
     } 
     var move = ulkey * -136;
     curIndex++;
     $('.img_list ul').stop().animate({'left':move+'px'},500);
     var id = $("#imgList li").eq(curIndex).find('input').val();	 
     This = $("#imgList li").eq(curIndex).find('a');  	 
	 show(id,This);
			
})



/* $(".btnR").click(function(){ 
	var imgLen = $("#imgList li").length;
	var tl = Math.ceil(imgLen/6);
	 if(curIndex == tl){
		 return false; 
	  }else{
		  curIndex ++;
		  $("#imgList li").each(function(i){		  
			  if(i>((curIndex-1)*6-1) && i<(curIndex*6)){
				  $(this).show();
			  }else{
				  $(this).hide(); 
			  }
		  })
		  
          var id = $("#imgList li").eq((curIndex-1)*6).find('input').val();	  
		  This = $("#imgList li").eq((curIndex-1)*6).find('a');
		  show(id,This);
	  } 
}); */


	 show_milestone();
	   	
	
})




function show_milestone(){
	 //根据日期计算进度
 	var d = new Date();
 	var str = d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
 	$('.z-font').text(DateConversion(str));

     //里程碑显示，根据时间计算进度
    var start = $('#milestone_ul').find("li:first").find("span").eq(1).text();
	var finish = $('#milestone_ul').find("li:last").find("span").eq(1).text();
   
	if(start != null && start != '' && finish != null && finish != ''){
		total_days = DateDiff(start,finish);
		now_days = DateDiff(start,str);
		if(total_days > now_days){
		 var s_width = Math.floor(now_days / total_days * 77);	
		 $('#milestone_ul').prev().prev().find('img').css({"margin-left":"98%"});
		 $('#milestone_ul').prev().prev().css({"width":s_width+"%"});
		}else{
		 $('.z-milestone-div').find('.ui-step-line2').css({"width":"77%"});
		 $('.z-milestone-div').find('.ui-step-line2').children().hide();
		}	
	}else{
	  $('.ui-step-line2').css({"width":"0%"});	  
	}
	

	 
     var mile_tl = $('#milestone_ul').find("li").length;         
     if(mile_tl == 0 || mile_tl == 1){
//     	 $('.out-box').eq(1).hide();
     }else{
//     	 $('.out-box').eq(1).show(); 
    	 
    	 for(var i = 0;i<mile_tl;i++){
    		 var milestone_date = $('#milestone_ul').find("li").eq(i).find("span").eq(1).text(); 
    		 $('#milestone_ul').find("li").eq(i).find("span").eq(0).text(DateConversion(milestone_date));
    		 
    		 var flag = DateDiff1(milestone_date);
    			if(flag == true){
    				$('#milestone_ul').find("li").eq(i).find("span").eq(0).css({"background-color":"#28b779"});
    			}else{
    				$('#milestone_ul').find("li").eq(i).find("span").eq(0).css({"background-color":"#b9b9b9"});
    			}
    	
    		var expectedOrActually = $('#milestone_ul').find("li").eq(i).find("span").eq(2).text();
    		if(expectedOrActually == 0){
    			$('#milestone_ul').find("li").eq(i).find("span").eq(0).css({"background-color":"#b9b9b9"});
    		}else{
    			$('#milestone_ul').find("li").eq(i).find("span").eq(0).css({"background-color":"#28b779"});
    		}
    		 
    		 //计算li偏移量
    		 if(i>0){
    	      var prev_date	= "";
    	      var next_date	= "";
    	      var li_left_2 = "";
//     	       if(i>0){
    	    	prev_date = $('#milestone_ul').find("li").eq(i-1).find("span").eq(1).text();
    	    	var prev_days = DateDiff(start,  prev_date);  
    	    	li_left_2 = Math.floor(prev_days / total_days * 98);   
//     	       }
    	       if(i<mile_tl -1){
    	    	next_date = $('#milestone_ul').find("li").eq(i+1).find("span").eq(1).text();   
    	       }		 	
             var start_currency_days = DateDiff(start,  milestone_date);   
             var li_left =  Math.floor(start_currency_days / total_days * 98);          
             
             //用于处理里程碑距离过近问题，当两个里程碑相距小于5%时，限制最小5%                     
             if(next_date != ""){   
                 var next_days = DateDiff(start,  next_date);   
                 var li_left_1 =  Math.floor(next_days / total_days * 98);
                 if(li_left_1 != ""){
                	 if(li_left_1 - li_left < 5){
                		 li_left = li_left_1 - 5;            		               		 
                		 if(prev_date != ""){
                             if((li_left - li_left_2 < 5) && (li_left - li_left_2 > -1)){
                             	$('#milestone_ul').find("li").eq(i-1).css({"margin-left": (li_left-5)+"%"}); 
                             }
                             if(li_left - li_left_2 < 5 && i == 1){
                            	 $('#milestone_ul').find("li").eq(i-1).css({"margin-left": "0"}); 
                             }
                             if(li_left - li_left_2 < 5 && i == 2){
                            	 $('#milestone_ul').find("li").eq(i-1).css({"margin-left": "4%"}); 
                             }
                             if(li_left - li_left_2 < 5 && i == 3){
                            	 $('#milestone_ul').find("li").eq(i-1).css({"margin-left": "8%"}); 
                             }
                         }
                	 }
                   }
                 }else{
                	 if(prev_date != ""){
                         if((li_left - li_left_2 <5) && (li_left - li_left_2 > -1)){
                         	$('#milestone_ul').find("li").eq(i-1).css({"margin-left": (li_left-5)+"%"}); 
                         }
                 }
             }           
           
             $('#milestone_ul').find("li").eq(i).css({"margin-left": li_left+"%"});            
    	     } 
    		 
    		 var delayState = $('#milestone_ul').find("li").eq(i).find(".ui-step-cont").find('span:last').text();
    		 if(delayState == 1){
    			 $('#milestone_ul').find("li").eq(i).find(".ui-step-cont").find('span:last').next().show();
    			 $('#milestone_ul').prev().prev().css({"background-color":"#f74d4d"});
    			 $('#milestone_ul').prev().prev().find('div').addClass("dot-right-red");
    		 }
    		 
    		 
    		 //处理图纸下标显示
//     		    var total_img = $('#milestone_ul').find("li").eq(i).find('span.z-line-span').text();
//     		    if(total_img == '1/0'){
//     		    	$('#milestone_ul').find("li").eq(i).find('span.z-line-span').hide();
//     		    }else{
//     		    	$('#milestone_ul').find("li").eq(i).find('span.z-line-span').show();
//     		    }
    	 }
 	 
    	 
    	 
    	 
    	 
    	//根据日期计算上传图片的位置
//    		var upload_days = '';
//    		var pic_tl = $('.w-div-img').length;
//      	for(var k = 0;k<pic_tl;k++){
//      	   	var uploadDate = $('.w-div-img').eq(k).find('span:last').text();
//      	    $('.w-div-img').eq(k).find('span:last').prev().text(DateConversion(uploadDate));
//      	   	var upload_days = DateDiff(start,uploadDate);
//      	   	var pic_width = Math.floor(upload_days/total_days * 94);
//      	   	if(pic_width < 94){
//      	   		$('.w-div-img').eq(k).css({"left":pic_width+"%"});  	 	 
//        		 }else{
//        			$('.w-div-img').eq(k).css({"left":"94%"}); 
//        		 }                         	   
//      	}            		
     }








	
	/*
	 *计算船移动js，根据到岗时间和出货时间计算
	 */	
	var s_tl = $('.shipping-progress').length; 
	for(var k = 0;k<s_tl;k++){		
	This = $('.shipping-progress').eq(k).find('ul');
	var outputDate = This.find("li:first").find("span").eq(1).text();
	var arrivalDate = This.find("li:last").find("span").eq(1).text();
	var width = This.prev().css("width");	
	
	if(outputDate != null && outputDate != '' && arrivalDate != null && arrivalDate != ''){
		
		    var flag = DateDiff1(outputDate);      //如果还没开始运输，船在起点
			total_days = DateDiff(outputDate,  arrivalDate);			
			now_days = DateDiff(outputDate,str);
			This.prev().prev().find('span').text(DateConversion(str));
			if(total_days > now_days){
			 var s_width = Math.floor(now_days / total_days * 77);	
			 This.prev().prev().find('img').css({"margin-left":"96%"});
			 This.prev().prev().css({"width":s_width+"%"});
			}else{
			 This.prev().prev().css({"width":"77%"});
			 This.prev().prev().find('img').css({"margin-left":"96%"}).css({"margin-top":"-84px"});
			 This.prev().prev().find('span').hide();
			}	
			if(!(flag)){
				This.prev().prev().css({"width":"0%"});
				This.prev().prev().find('span').hide();
			}
	}else{
		This.prev().prev().css({"width":"0%"});
		return false;
	}
	
	var tl = This.find("li").length;
	var start_currency_days = "";
	var prev_left = ""; 
	for(var i = 0;i<tl;i++){
		var shipping_date = This.find("li").eq(i).find("span").eq(1).text();
		This.find("li").eq(i).find("span").eq(0).text(DateConversion(shipping_date));
		var flag = DateDiff1(shipping_date);
		if(flag == true){
			This.find("li").eq(i).find("span").eq(0).css({"background-color":"#28b779"});
			This.find("li").eq(i).find("span").eq(2).css({"color":"#28b779"});
		}else{
			This.find("li").eq(i).find("span").eq(0).css({"background-color":"#b9b9b9"});
			This.find("li").eq(i).find("span").eq(2).css({"color":"#666"});
		}
		
		//计算li偏移量
        if(i>0){
//           prev_date = $('#shipping_ul').find("li").eq(i-1).find("span").eq(1).text();	
          start_currency_days = DateDiff(outputDate,  shipping_date);  
//           var prev_days = DateDiff(outputDate,  prev_date);  
          var li_left =  Math.floor(start_currency_days / total_days * 98);
          if(li_left - prev_left < 5){
             This.find("li").eq(i).css({"margin-left": (prev_left+5)+"%"}); 
          }else{            
             This.find("li").eq(i).css({"margin-left": li_left+"%"});
          }   
        }
		
	  }	
	}
}



/*
 *下载PO数据
 */
 function doDownload_po(id,obj){
	   
 	//使用ajax提交下载
		$.ajax({
			url:"/crm/fileDownload_po.do",
			data:{
				  "id":id
				  },
			type:"post",
			dataType:"text",
			success:function(res){		
				$(obj).parent().next().next().text("");
				window.location.href = "/crm/fileDownload_po.do?id="+id;
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
 /*
  *下载QC数据
  */
  function doDownload_qc(id,obj){
	   
  	//使用ajax提交下载
		$.ajax({
			url:"/crm/fileDownload_qc.do",
			data:{
				  "id":id
				  },
			type:"post",
			dataType:"text",
			success:function(res){
				$(obj).parent().next().next().text("");
				window.location.href = "/crm/fileDownload_qc.do?id="+id;
				
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
 /*
  *下载Shipping数据
  */
  function doDownload_shippingDoc(id,obj,typeId){
	  
  	//使用ajax提交下载
		$.ajax({
			url:"/crm/fileDownload_shipping.do",
			data:{
				  "id":id,
				  "typeId":typeId
				  },
			type:"post",
			dataType:"text",
			success:function(res){
				$(obj).next().remove();
				window.location.href = "/crm/fileDownload_shipping.do?id="+id+"&typeId="+typeId;
				 //设置定时器，1s后刷新界面
// 	     		setTimeout(function(){location.reload()},1000);
				
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
 
  //查看Invoice
  function show_invoice(orderId){
	   var base = new Base64();
	   orderId=base.encode(orderId);
	   window.location.href = "/crm/queryInvoiceByOrderId.do?orderId="+orderId;
  }
  
  /*
   *根据订单号展现所有图纸信息在reOrder界面
   */
  function reOrder(orderId){
	   var base = new Base64();
	   orderId=base.encode(orderId);
	   window.location.href = "${ctx}/queryDrawingsByOrderId.do?orderId="+orderId;
  }
  
  //把日期格式化 2012-12-18 转化为12/18
  function DateConversion(sDate){
	    var aDate;
	    var oDate;
	    aDate  =  sDate.split("-");
	    oDate = aDate[1]+ '.' + aDate[2];  
	    if(oDate == 'undefined.undefined'){
	    	oDate = '';
	    }
	    return oDate;
	} 

  
//计算时间差
function  DateDiff(sDate1,  sDate2){    //sDate1和sDate2是2002-12-18格式  
    var  aDate,  oDate1,  oDate2,  iDays  
    aDate  =  sDate1.split("-"); 
    oDate1  =  new  Date(aDate[0]  +  '-'  +  aDate[1]  +  '-'  +  aDate[2]);    //转换为12-18-2002格式  
    aDate  =  sDate2.split("-");  
    oDate2  =  new  Date(aDate[0]  +  '-'  +  aDate[1]  +  '-'  +  aDate[2]);  
    iDays  =  parseInt(Math.abs(oDate1  -  oDate2)  /  1000  /  60  /  60  /24);    //把相差的毫秒数转换为天数  
    return  iDays;  
}

//交期日期和当前日期比较
function  DateDiff1(deliveryTime){     //deliveryTime是2002-12-18格式  
	   var   d=new   Date(Date.parse(deliveryTime.replace(/-/g,"/")));
	   var   curDate=new   Date();
    if(d > curDate){
 	   return false; 
    }else{
 	   return true;  
    }	      
}

   
   
   //点击弹出照片墙
   function show_photos(orderId,uploadDate,obj){
	   $('#wrapper').css({"display":"block"});
	   $("#imgList").empty();
	   $.ajax({
			url:"/crm/queryPhotoByUploadDate.do",
			data:{
				  "orderId":orderId,
				  "uploadDate":uploadDate
				  },
			type:"post",
			dataType:"text",
			success:function(data){
				var result	= eval("("+data+")");	
				$('.lg').find('img').attr('src',''+result[0].photoPath+'');
   				for(var i=0;i<result.length;i++){
   					if(i<6){
   	   					var img_li =  '<li class="colxs2">'+
					                    '<a href="###" onclick="show('+result[i].id+',this)">'+
					                    '<img src="'+result[i].photoPathCompress+'" alt="'+result[i].photoName+'"  class="img-responsive"/>'+
					                    '<input type="hidden" value="'+result[i].id+'"/>'+
					                    '</a>'+
					                  '</li>';
	                  $("#imgList").append(img_li);	
	                  $('#photo_remark').text(''+result[0].remarks+'');
   					}else{
   						var img_li =  '<li class="colxs2">'+
	                    '<a href="###" onclick="show('+result[i].id+',this)">'+
	                    '<img src="'+result[i].photoPathCompress+'" alt="'+result[i].photoName+'" class="img-responsive"/>'+
	                    '<input type="hidden" value="'+result[i].id+'"/>'+
	                    '</a>'+
	                  '</li>';
                      $("#imgList").append(img_li);	
   					}		
   				}	
   				$("#imgList").find('li:first').find('img').addClass('img-mark');
				$('.spanlunbo').text((new Date(uploadDate)).Format("MM/dd/yyyy"));
			},
		    error:function(){
		    	
		    	easyDialog.open({
		    		  container : {
		    		    header : 'Prompt message',
		    		    content : 'Failed to load'
		    		  },
		    		  overlay : false,
		    		  autoClose : 2000
		    		  
		    		});
		    }
		});
   }
   
   
   
   //查询图片地址
   function show(imgId,obj){
	      $('.lg').find('img').attr('src','');
	      $(obj).find('img').addClass('img-mark');
		   $.post("/crm/queryPhotoById.do",	
				    {"id":imgId},
					 function(result){
				      if(result.state == 0){
				        var photoPath = result.data;
				        $('.lg').find('img').attr('src',''+photoPath+'');
				        $(obj).parents('li').siblings().find('img').removeClass('img-mark');			        				       
				     }
		    })      
     }
   
//    function imgShowLeft(){
// 	   var tl = $("#imgList").find('li').length; 
// 		   if(curIndex > 5){
// 			   $("#imgList").find('li').eq(curIndex+1).hide();
// 			   $("#imgList").find('li').eq(curIndex - 6).show();  
// 		   }
//    }
//    function imgShowRight(){
// 			if(curIndex > 5){
// 				$("#imgList").find('li').eq(curIndex).show();
// 				$("#imgList").find('li').eq(curIndex - 6).hide();
// 				return false;
// 			}
//    }
   
   
   
   
   
   
   
   //查看所有weekly report
   function show_all_report(orderId,obj){
 	  
 	  if($(obj).html() == "Pack Up"){
 		  var l = $('.w-recent-posts').find('li').length;
 		  for(var i=0;i<l;i++){
 			  if(i>1 && i<l-1){
 			  $('.w-recent-posts').find('li').eq(i).hide(); 
 			  }
 		  }
 		  $(obj).html("Query All");
 		  return false;
 	  }else{
 		  var l = $('.w-recent-posts').find('li').length;
 		  if(l < 3){
 			 return false; 
 		  }
 	  }
 	  
 	  $.ajax({
  			url:"/crm/queryPhotoByOrderId.do",
  			data:{
  				  "orderId":orderId
  				  },
  			type:"post",
  			dataType:"text",
  			success:function(str){
  				var strr = eval('('+str+')');
 	        	if(strr.state == 0){
     	        	var result	= strr.data.productionPhotoes;
     	        	var productionPhotoTimelines = strr.data.productionPhotoTimelines;
     	        	var tl = result.length;
                     if(tl != 0){                       	
                     	$('.w-recent-posts').empty();
                         for(var i=0;i<tl;i++){			                            
				             var li = '<li>'+         
				                 '<span class="z-pro-tl">Qty:'+productionPhotoTimelines[i].length+'</span>'+     
				                 '<div class="user-thumb w-user-thumb">'+
				                 '<img style="width:160px;height:120px;" src="'+(result[i].photoPathCompress == null ? '' : result[i].photoPathCompress)+'" onclick="show_photos(\''+result[i].orderId+'\',\''+(new Date(result[i].uploadDate)).Format("yyyy-MM-dd")+'\')"></div>'+
				                 '<div class="article-post"> <span class="user-info">'+(new Date(result[i].uploadDate)).Format("MM/dd/yyyy")+'</span>'+
				                	((result[i].remarks == null || result[i].remarks == '') ? '' : "<p>Remark&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:"+result[i].remarks+"</p>")+  			                  
				                 '</div>'+
				               '</li>';               

                         	  $('.w-recent-posts').append(li); 
                        } 
                         $('.w-recent-posts').append("<li><button class=\"btn btn-warning btn-mini\" onclick=\"show_all_report(\'"+orderId+"',this)\">Pack Up</button></li>");
                     }
 	        	}
  			},
  		    error:function(){
  		    	
  		    	easyDialog.open({
  		    		  container : {
  		    		    header : 'Prompt message',
  		    		    content : '查询失败'
  		    		  },
  		    		  overlay : false,
  		    		  autoClose : 1000
  		    		  
  		    		});
  		    }
  		});
 	  
   }
   
   
   
   //关闭图片框
   function close_wrapper(){
	   $('#wrapper').hide();
   }

   
   
   //=================================消息中心======================================

       
   //跳转输入消息界面
      function open_push_message(orderId,factoryId,messageType){
   	  window.location = "/crm/toInputMessage.do?orderId="+orderId+"&factoryId="+factoryId+"&messageType="+messageType;
   }
      
   
   
      //下载图纸
      function download_drawing(id){     			
      	window.location.href = "/crm/fileDownload_clientDrawing.do?id="+id;     			
      }
	   
   
      
    //下载发票
	function doDownload(invoiceId,factoryId){
	  window.location.href = "/crm/fileDownload_invoice.do?invoiceId=" + invoiceId +"&factoryId=" +factoryId;
    }
       
    
    //下载周报文档   2017.12.07
    function download_document(id){
  	    window.location = "/crm/fileDownload_document.do?id="+id; 	 	
    }
</script>
</html>
