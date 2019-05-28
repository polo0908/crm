<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.cbt.util.WebCookie"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
  <link rel="stylesheet" href="css/details.css" />
  <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
  <link rel="stylesheet" href="css/jquery.gritter.css" />
  <link type='image/x-ico' rel='icon' href='img/favicon.ico' />
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
		$(function(){
			$('#sidebar_ul').find('li').eq(3).addClass('active');
		})

</script>	




</head>
<body>

<jsp:include page="base.jsp"></jsp:include>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="#" onclick="listSupplier();" class="tip-bottom" data-original-title="Go to Drawings"><i class="icon icon-file"></i>My Supplier</a> <a href="#" class="current" data-original-title="">Supplier details</a>
    </div>
    <div class="w-container-fluid">
      <h4>${factoryInfo.factoryName}</h4>
      <div class="bianhaolan">
        <p class="bianhao">
          Total Purchase : $${factoryAmount}
        </p>
        <p class="bianhao">
          Number of PO : ${factoryTotal}
        </p>
      </div>
    </div>
    <div class="w-text">
      <div class="w-table">
        <hr style="clear:both;" class="w-hr">
        <table>
          <tbody>
          <tr>
            <td class="w-td">Email :</td>
            <td>${factoryInfo.factoryAdminEmail == null ? '' : factoryInfo.factoryAdminEmail}</td>
          </tr>
          <tr>
            <td class="w-td">Telephone :</td>
            <td>${factoryInfo.factoryAdminTel == null ? '' : factoryInfo.factoryAdminTel}</td>
          </tr>
          <tr>
            <td class="w-td">Country :</td>
            <td>${factoryInfo.factoryAddr == null ? '' : factoryInfo.country}</td>
          </tr>
          <tr>
            <td class="w-td">Date of establishment :</td>
            <td>${factoryInfo.factoryAddr == null ? '' : factoryInfo.establishmentDate}</td>
          </tr>
           <tr>
            <td class="w-td">Number of factories :</td>
            <td>${factoryInfo.factoryAddr == null ? '' : factoryInfo.factoryNumber}    (The number of people)</td>
          </tr>
          <tr>
            <td class="w-td">Address :</td>
            <td>${factoryInfo.factoryAddr == null ? '' : factoryInfo.factoryAddr}</td>
          </tr>
          <tr>
            <td class="w-td">Main business :</td>
            <td>${factoryInfo.mainBusiness == null ? '' : factoryInfo.mainBusiness}</td>
          </tr>
          <tr>
            <td class="w-td">Factory website :</td>
            <td>${factoryInfo.mainBusiness == null ? '' : factoryInfo.website}</td>
          </tr>
          <tr>
            <td class="w-td">Factory logo :</td>
            <td> <div class="w-img6">
                   <img src="${factoryInfo.factoryLogo == null ? '' : factoryInfo.factoryLogo}" style="width: 120px;">
                 </div>
            </td>
          </tr>
          <tr>
            <td class="w-td">Factory license :</td>
            <td>
                 <div class="w-img6">
                   <img src="${factoryInfo.factoryLicense == null ? '' : factoryInfo.factoryLicense}" style="width: 120px;">
                 </div>
            </td>
          </tr>
         </tbody>
        </table>
      </div>
    </div>
    
  </div>
         <div class="w-container-fluid" style="background-color:#eee;">
           <h4>Factory Order Chart:</h4>
    	   <table id="myTable1">
				<caption></caption>
				<thead>
					<tr>
						<th></th>
						<th>In Process</th>
						<th>Finished</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>${totalProcess + totalFinished}</th>
						<td>${totalProcess}</td>
						<td>${totalFinished}</td>
						</tr>
				</tbody>
			</table>  
        </div>
</div>
<div class="row-fluid">
  <div id="footer" class="span12"> 
  </div>
</div>

<!--end-Footer-part-->
<script type="text/javascript" src="js/chart/jsapi.js"></script>
<script type="text/javascript" src="js/chart/corechart.js"></script>		
<script type="text/javascript" src="js/chart/jquery.gvChart-1.0.1.min.js"></script>
<script type="text/javascript" src="js/chart/jquery.ba-resize.min.js"></script>
<script type="text/javascript">
    
    var total = $('#myTable1').find('tbody').find('th').text();
    if(total != 0){
    	gvChartInit();
    	$(document).ready(function(){
    			$('#myTable1').gvChart({
    				chartType: 'PieChart',
    				gvSettings: {
    				vAxis: {title: 'In Process'},
    				hAxis: {title: 'Finished'},
    				width: 550,
    				height: 350
    			}
    		});
    	});
    }		
</script>
</body>




</html>
