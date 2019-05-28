package com.cbt.controller;
import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.net.URL;
import java.net.URLConnection;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cbt.entity.AmountUnit;
import com.cbt.entity.ClientDrawings;
import com.cbt.entity.ClientOrder;
import com.cbt.entity.ClientOrderPo;
import com.cbt.entity.ClientOrderQcReport;
import com.cbt.entity.ClientOrderShippingDoc;
import com.cbt.entity.FactoryInfo;
import com.cbt.entity.InvoiceInfo;
import com.cbt.entity.RfqInfo;
import com.cbt.entity.User;
import com.cbt.entity.UserFactoryRelation;
import com.cbt.entity.Milestone;
import com.cbt.entity.ProductionPhotoTimeline;
import com.cbt.entity.UserRelationEmail;
import com.cbt.service.AmountUnitService;
import com.cbt.service.ClientDrawingsService;
import com.cbt.service.ClientOrderPoService;
import com.cbt.service.ClientOrderQcReportService;
import com.cbt.service.ClientOrderService;
import com.cbt.service.ClientOrderShippingDocService;
import com.cbt.service.FactoryInfoService;
import com.cbt.service.InvoiceInfoService;
import com.cbt.service.MessageCenterService;
import com.cbt.service.ReOrderService;
import com.cbt.service.RfqInfoService;
import com.cbt.service.UserFactoryRelationService;
import com.cbt.service.MilestoneService;
import com.cbt.service.ProductionPhotoTimelineService;
import com.cbt.service.UserService;
import com.cbt.util.Base64Encode;
import com.cbt.util.DateFormat;
import com.cbt.util.GetRecentQuarter;
import com.cbt.util.JsonUtil;
import com.cbt.util.Md5Util;
import com.cbt.util.SecurityHelper;
import com.cbt.util.SerializeUtil;
import com.cbt.util.WebCookie;





@Controller 

public class ClientOrderController {
  @Resource
  private ClientOrderService clientOrderService;
  @Resource
  private UserService userService;
  @Resource
  private ClientDrawingsService clientDrawingsService;
  @Resource
  private UserFactoryRelationService userFactoryRelationService;
  @Resource
  private FactoryInfoService factoryInfoService;
  @Resource
  private MilestoneService milestoneService;
  @Resource
  private ProductionPhotoTimelineService productionPhotoTimelineService;	
  @Resource
  private RfqInfoService rfqInfoService;
  @Resource
  private InvoiceInfoService invoiceInfoService;
  @Resource
  private AmountUnitService amountUnitService;
  @Resource
  private MessageCenterService messageCenterService;
  @Resource
  private ClientOrderPoService clientOrderPoService;
  @Resource
  private ClientOrderQcReportService clientOrderQcReportService;
  @Resource
  private ClientOrderShippingDocService clientOrderShippingDocService;
  @Resource
  private ReOrderService reOrderService;
  
  public static final Logger Log = Logger.getLogger(ClientOrderController.class);
  
 
   
   /**
    * 查询客户订单
    * @param request
    * @param response
    * @return
 * @throws Exception 
    */
   @RequestMapping("/queryAllClientOrder.do")
   public String queryAllClientOrder(HttpServletRequest request, HttpServletResponse response) throws Exception{
	   
	   try {	   
		   String userId = WebCookie.getUserid(request);
		   if(userId == null || "".equals(userId)){
			  return "login.jsp";
		   }   	   		  
		   
		   String factoryName = request.getParameter("factoryName");
		   if(StringUtils.isNotBlank(factoryName)){
			   factoryName = Base64Encode.getFromBase64(factoryName);
		   }
		   int totalFactory = userFactoryRelationService.totalFactory(userId);
		   List<UserFactoryRelation> factoryUserRelation = userFactoryRelationService.queryByUserid(userId);	   
		   List<List<ClientOrder>> processClientOrder = new ArrayList<List<ClientOrder>>();	   
		   List<List<RfqInfo>> rfqInfos = new ArrayList<List<RfqInfo>>();	   
		   List<ClientOrder> finishedClientOrder = new ArrayList<ClientOrder>();	
		   List<FactoryInfo> factoryInfos = new ArrayList<FactoryInfo>();
		   FactoryInfo factoryInfo = new FactoryInfo();
		   //订单消息未读数
		   List<List<Integer>> counts = new ArrayList<List<Integer>>();
		   //订单消息数
		   List<List<Integer>> messageCounts = new ArrayList<List<Integer>>();
		   //获取每个厂家订单总金额、实际到账金额
		   List<ClientOrder> list = new ArrayList<ClientOrder>();
		   //显示每个订单周报（首张图显示  处理中）
           List<List<ProductionPhotoTimeline>> productionPhotoss = new ArrayList<List<ProductionPhotoTimeline>>();
		   
		   for (UserFactoryRelation factoryUserRelation2 : factoryUserRelation) { 		
			   int orderStatus = 0; //(status:In Process)
			   String factoryId = factoryUserRelation2.getFactoryId();
			   List<ClientOrder> clientOrder1 = clientOrderService.queryByFactoryId(userId, factoryId,orderStatus);
			   List<Integer> count = new ArrayList<Integer>();
			   List<Integer> messageCount = new ArrayList<Integer>();
			   if(clientOrder1.size() != 0){
				   list.add(clientOrder1.get(0));
			   }else{
				   ClientOrder clientOrder3 = new ClientOrder();
				   clientOrder3.setActualAmount(0.0);
				   clientOrder3.setSumAmount(0.0);
				   list.add(clientOrder3);
			   }
			   
			    
			   //订单周报图片
			   List<ProductionPhotoTimeline> productionPhotos = new ArrayList<ProductionPhotoTimeline>();
			   //查询消息数
			   for (ClientOrder clientOrder : clientOrder1) {
				  int totalUnReadMessage = messageCenterService.totalUnReadMessageByOrderId(clientOrder.getOrderId());
				  count.add(totalUnReadMessage);
                  int totalMessage = messageCenterService.totalMessageByOrderId(clientOrder.getOrderId());
                  messageCount.add(totalMessage);
                  
                  ProductionPhotoTimeline productionPhoto = productionPhotoTimelineService.queryByOrderId(clientOrder.getOrderId());
                  if(!(productionPhoto == null || "".equals(productionPhoto))){
                	  productionPhotos.add(productionPhoto);
                  }                  
			    }

			   factoryInfo = factoryInfoService.queryByFactoryId(factoryId);
			   processClientOrder.add(clientOrder1);
			   factoryInfos.add(factoryInfo);
			   counts.add(count);
			   messageCounts.add(messageCount);	
			   if(productionPhotos != null)
			   productionPhotoss.add(productionPhotos);
			   
			   //客户新图纸询盘首页显示
			   List<RfqInfo> rfqInfo = rfqInfoService.queryByUserId(userId, factoryId);
				for (RfqInfo r : rfqInfo) {
					 String dt = r.getDrawingName();
				     String[] dts = dt.split("&");
				     String drawingName = dts[0]+FilenameUtils.getExtension(dt);
					 r.setDrawingName(drawingName);
				}
				rfqInfos.add(rfqInfo);		   
			   
		    }	
		   
		   //已结束未读消息数
		   List<Integer> finishedCounts = new ArrayList<Integer>();
		   //已结束订单消息数
		   List<Integer> finishedMessageCounts = new ArrayList<Integer>();
		   
		   //查询最近完成订单的厂家
		   String factoryId = clientOrderService.queryLastFinishedFactoryId(userId);
		   factoryInfo = factoryInfoService.queryByFactoryId(factoryId);
		   //获取已结束的订单信息
		   Integer orderStatus = 1;     //(status:finished)
		   //获取已结束的订单weekly report
		   List<ProductionPhotoTimeline> finishPhotos = new ArrayList<ProductionPhotoTimeline>();
		   
		   finishedClientOrder = clientOrderService.queryByFactoryId(userId, factoryId, orderStatus);
		   for (ClientOrder c : finishedClientOrder) {
			   finishedCounts.add(messageCenterService.totalUnReadMessageByOrderId(c.getOrderId()));
			   finishedMessageCounts.add(messageCenterService.totalMessageByOrderId(c.getOrderId()));
			   
			   
			   ProductionPhotoTimeline productionPhoto = productionPhotoTimelineService.queryByOrderId(c.getOrderId());
			   if(!(productionPhoto == null || "".equals(productionPhoto))){
			   finishPhotos.add(productionPhoto);
			   }
		    }
		    //查询处理中订单数
		    int total = clientOrderService.total(userId, 0);   
		    //查询再订购订单数
		    int totalReorderOrder = reOrderService.totalAmount(userId);
		   
		   
		   request.setAttribute("counts", counts);
		   request.setAttribute("messageCounts", messageCounts);
		   request.setAttribute("amountClientOrders", list);
		   request.setAttribute("processClientOrder", processClientOrder);
		   request.setAttribute("finishedClientOrder", finishedClientOrder);
		   request.setAttribute("factoryUserRelation",factoryUserRelation);
		   request.setAttribute("factoryInfo",factoryInfo);
		   request.setAttribute("factoryInfos",factoryInfos);
		   request.setAttribute("total",total);
		   request.setAttribute("totalFactory",totalFactory);
		   request.setAttribute("factoryName",factoryName);
		   request.setAttribute("rfqInfo", rfqInfos);
		   request.setAttribute("totalReorderOrder", totalReorderOrder);		   
		   request.setAttribute("productionPhotoss", productionPhotoss);
		   request.setAttribute("finishPhotos", finishPhotos);
		   
		   //查询处理中订单个数
		   orderStatus = 0; 
		   int totalProcess = clientOrderService.total(userId, orderStatus);
		   orderStatus = 1;  
		   int finishedProcess = clientOrderService.total(userId, orderStatus);
		   
		   int totalDelay = clientOrderService.totalDelay(userId);
		   int totalOnTime = finishedProcess - totalDelay;
		   /*
		    *显示处理中、已结束饼状图  
		    *显示按时完成、延期的饼状图
		    */       
		   request.setAttribute("totalProcess", totalProcess);
		   request.setAttribute("finishedProcess", finishedProcess);
		   request.setAttribute("totalOnTime", totalOnTime);
		   request.setAttribute("totalDelay", totalDelay);
		   request.setAttribute("finishedCounts", finishedCounts);
		   request.setAttribute("finishedMessageCounts", finishedMessageCounts);
		   
		   
		   /**
		    * 当前季度订单金额和时间
		    */
		   Map<Object, Object> currentQuarter = clientOrderService.currentQuarter(userId);
		   if(!(currentQuarter == null || "".equals(currentQuarter))){
			   if(!(currentQuarter.get("sumAmount") == null || "".equals(currentQuarter.get("sumAmount")))){
				   if(StringUtils.isNotBlank(currentQuarter.get("sumAmount").toString())){
					   Double sumAmount = Double.parseDouble(currentQuarter.get("sumAmount").toString());
					   sumAmount = new BigDecimal(sumAmount).setScale(0,BigDecimal.ROUND_HALF_UP).doubleValue();
					   request.setAttribute("sumAmount", sumAmount);
				   }			   
		      }
		   }
		   /**
		    * 当前时间前一个季度订单金额和时间
		    */
		   Map<Object, Object> currentQuarter1 = clientOrderService.currentQuarter1(userId);
		   if(!(currentQuarter1 == null || "".equals(currentQuarter1))){
			   if(!(currentQuarter1.get("sumAmount") == null || "".equals(currentQuarter1.get("sumAmount")))){
				   if(StringUtils.isNotBlank(currentQuarter1.get("sumAmount").toString())){
					   Double sumAmount1 = Double.parseDouble(currentQuarter1.get("sumAmount").toString());
					   sumAmount1 = new BigDecimal(sumAmount1).setScale(0,BigDecimal.ROUND_HALF_UP).doubleValue();
					   request.setAttribute("sumAmount1", sumAmount1);
				   }
			  }
		   }
		   /**
		    * 当前时间前两个季度订单金额和时间
		    */
		   Map<Object, Object> currentQuarter2 = clientOrderService.currentQuarter2(userId);
		   if(!(currentQuarter2 == null || "".equals(currentQuarter2))){
			   if(!(currentQuarter2.get("sumAmount") == null || "".equals(currentQuarter2.get("sumAmount")))){
				   if(StringUtils.isNotBlank(currentQuarter2.get("sumAmount").toString())){				  
					   Double sumAmount2 = Double.parseDouble(currentQuarter2.get("sumAmount").toString());
					   sumAmount2 = new BigDecimal(sumAmount2).setScale(0,BigDecimal.ROUND_HALF_UP).doubleValue();
					   request.setAttribute("sumAmount2", sumAmount2);
				   }
			 }		   
		   }
		   /**
		    * 当前时间前三个季度订单金额和时间
		    */
		   Map<Object, Object> currentQuarter3 = clientOrderService.currentQuarter3(userId);
		   if(!(currentQuarter3 == null || "".equals(currentQuarter3))){
			   if(!(currentQuarter3.get("sumAmount") == null || "".equals(currentQuarter3.get("sumAmount")))){
				   if(StringUtils.isNotBlank(currentQuarter3.get("sumAmount").toString())){			   
					   Double sumAmount3 = Double.parseDouble(currentQuarter3.get("sumAmount").toString());
					   sumAmount3 = new BigDecimal(sumAmount3).setScale(0,BigDecimal.ROUND_HALF_UP).doubleValue();
					   request.setAttribute("sumAmount3", sumAmount3);
				     }
			   }
		  }
		   /**
		    * 当前时间前四个季度订单金额和时间
		    */
		   Map<Object, Object> currentQuarter4 = clientOrderService.currentQuarter4(userId);
		   if(!(currentQuarter4 == null || "".equals(currentQuarter4))){
			   if(!(currentQuarter4.get("sumAmount") == null || "".equals(currentQuarter4.get("sumAmount")))){
				   if(StringUtils.isNotBlank(currentQuarter4.get("sumAmount").toString())){
					   Double sumAmount4 = Double.parseDouble(currentQuarter4.get("sumAmount").toString());
					   sumAmount4 = new BigDecimal(sumAmount4).setScale(0,BigDecimal.ROUND_HALF_UP).doubleValue();
					   request.setAttribute("sumAmount4", sumAmount4);
				   }
			   }
		   }
		   
		   String quarter = GetRecentQuarter.getCurrentQuarter(DateFormat.format());
		   request.setAttribute("quarter", quarter); 
		   String quarter1 = GetRecentQuarter.getCurrentQuarter(GetRecentQuarter.getFirstQuarterStartTime());
		   request.setAttribute("quarter1", quarter1); 
		   String quarter2 = GetRecentQuarter.getCurrentQuarter(GetRecentQuarter.getSecondQuarterStartTime());
		   request.setAttribute("quarter2", quarter2); 
		   String quarter3 = GetRecentQuarter.getCurrentQuarter(GetRecentQuarter.getThirdQuarterStartTime());
		   request.setAttribute("quarter3", quarter3); 
		   String quarter4 = GetRecentQuarter.getCurrentQuarter(GetRecentQuarter.getFourthQuarterStartTime());
		   request.setAttribute("quarter4", quarter4); 
		
	} catch (Exception e) {
		e.printStackTrace();
		Log.error("===============ClientOrderController   queryAllClientOrder==============="+e.getMessage());
		throw new Exception(e.getMessage());
	}	            	         
	         

	   return "index.jsp";
   }
   
   
   
   
   /**
    * 查询客户订单
    * @param request
    * @param response
    * @return
    * @throws Exception 
    */
   @RequestMapping("/queryByAdmin.do")
   public String queryByAdmin(HttpServletRequest request, HttpServletResponse response) throws Exception{
	   String loginEmail = "";
	   String pwd = "";
	   try {	 
		      String userInfo = "";
	   	      if(!(request.getParameter("userInfo") == null || "".equals(request.getParameter("userInfo")))){
	   	    	   userInfo = request.getParameter("userInfo");
	   	    	   userInfo = Base64Encode.getFromBase64(userInfo);
	   	    	   String[] obj = userInfo.split("&");
	   	    	   loginEmail = obj[0];
	   	    	   pwd= obj[1];
    	      }
    		  UserRelationEmail userRelationEmail = userService.login(loginEmail, pwd);
    		  User user = userService.queryByUserId(userRelationEmail.getUserid());
    		  //保存cookie token
    		  String now = String.valueOf(System.currentTimeMillis());
    		  String token = Md5Util.encoder(now);
    		  Cookie cookie = new Cookie("token",now+"|"+token);
    		  cookie.setPath("/");
    		  cookie.setMaxAge(60*60*24*365);
    		  response.addCookie(cookie);
    		  String userid = user.getUserid();     		  
    		  pwd = user.getPwd();
//  			  String encryptTxt = SecurityHelper.encrypt("token", pwd);
    		  
  			  
  			  //存放Cookie
    		  String str = userid +"&"+loginEmail +"&"+pwd +"&"+(user.getTempUser() == null ? "1" : user.getTempUser()).toString();  		 
    		  Cookie userCookie = new Cookie("userInfo",SecurityHelper.encrypt("userInfo", str));           
    		  userCookie.setPath("/");
    		  userCookie.setMaxAge(60*60*24*365);
    		  response.addCookie(userCookie);   		  
    		  
    		  //客户登录信息存放到session
    		  HttpSession session = request.getSession();
    		  session.setAttribute("userInfo",SecurityHelper.encrypt("userInfo", str));
    		  session.setMaxInactiveInterval(60*60*24*365);
    		  	  
   		   
   		   String factoryName = request.getParameter("factoryName");
   		   if(StringUtils.isNotBlank(factoryName)){
   			   factoryName = Base64Encode.getFromBase64(factoryName);
   		   }
   		   int totalFactory = userFactoryRelationService.totalFactory(userid);
   		   List<UserFactoryRelation> factoryUserRelation = userFactoryRelationService.queryByUserid(userid);	   
   		   List<List<ClientOrder>> processClientOrder = new ArrayList<List<ClientOrder>>();	   
   		   List<List<RfqInfo>> rfqInfos = new ArrayList<List<RfqInfo>>();	   
   		   List<ClientOrder> finishedClientOrder = new ArrayList<ClientOrder>();	
   		   List<FactoryInfo> factoryInfos = new ArrayList<FactoryInfo>();
   		   FactoryInfo factoryInfo = new FactoryInfo();
   		   //订单消息未读数
   		   List<List<Integer>> counts = new ArrayList<List<Integer>>();
   		   //订单消息数
   		   List<List<Integer>> messageCounts = new ArrayList<List<Integer>>();
   		   //获取每个厂家订单总金额、实际到账金额
   		   List<ClientOrder> list = new ArrayList<ClientOrder>();
   		   //显示每个订单周报（首张图显示  处理中）
              List<List<ProductionPhotoTimeline>> productionPhotoss = new ArrayList<List<ProductionPhotoTimeline>>();
   		   
   		   for (UserFactoryRelation factoryUserRelation2 : factoryUserRelation) { 		
   			   int orderStatus = 0; //(status:In Process)
   			   String factoryId = factoryUserRelation2.getFactoryId();
   			   List<ClientOrder> clientOrder1 = clientOrderService.queryByFactoryId(userid, factoryId,orderStatus);
   			   List<Integer> count = new ArrayList<Integer>();
   			   List<Integer> messageCount = new ArrayList<Integer>();
   			   if(clientOrder1.size() != 0){
   				   list.add(clientOrder1.get(0));
   			   }else{
   				   ClientOrder clientOrder3 = new ClientOrder();
   				   clientOrder3.setActualAmount(0.0);
   				   clientOrder3.setSumAmount(0.0);
   				   list.add(clientOrder3);
   			   }
   			   
   			    
   			   //订单周报图片
   			   List<ProductionPhotoTimeline> productionPhotos = new ArrayList<ProductionPhotoTimeline>();
   			   //查询消息数
   			   for (ClientOrder clientOrder : clientOrder1) {
   				  int totalUnReadMessage = messageCenterService.totalUnReadMessageByOrderId(clientOrder.getOrderId());
   				  count.add(totalUnReadMessage);
                     int totalMessage = messageCenterService.totalMessageByOrderId(clientOrder.getOrderId());
                     messageCount.add(totalMessage);
                     
                     ProductionPhotoTimeline productionPhoto = productionPhotoTimelineService.queryByOrderId(clientOrder.getOrderId());
                     if(!(productionPhoto == null || "".equals(productionPhoto))){
                   	  productionPhotos.add(productionPhoto);
                     }                  
   			    }

   			   factoryInfo = factoryInfoService.queryByFactoryId(factoryId);
   			   processClientOrder.add(clientOrder1);
   			   factoryInfos.add(factoryInfo);
   			   counts.add(count);
   			   messageCounts.add(messageCount);	
   			   if(productionPhotos != null)
   			   productionPhotoss.add(productionPhotos);
   			   
   			   //客户新图纸询盘首页显示
   			   List<RfqInfo> rfqInfo = rfqInfoService.queryByUserId(userid, factoryId);
   				for (RfqInfo r : rfqInfo) {
   					 String dt = r.getDrawingName();
   				     String[] dts = dt.split("&");
   				     String drawingName = dts[0]+FilenameUtils.getExtension(dt);
   					 r.setDrawingName(drawingName);
   				}
   				rfqInfos.add(rfqInfo);		   
   			   
   		    }	
   		   
   		   //已结束未读消息数
   		   List<Integer> finishedCounts = new ArrayList<Integer>();
   		   //已结束订单消息数
   		   List<Integer> finishedMessageCounts = new ArrayList<Integer>();
   		   
   		   //查询最近完成订单的厂家
   		   String factoryId = clientOrderService.queryLastFinishedFactoryId(userid);
   		   factoryInfo = factoryInfoService.queryByFactoryId(factoryId);
   		   //获取已结束的订单信息
   		   Integer orderStatus = 1;     //(status:finished)
   		   //获取已结束的订单weekly report
   		   List<ProductionPhotoTimeline> finishPhotos = new ArrayList<ProductionPhotoTimeline>();
   		   
   		   finishedClientOrder = clientOrderService.queryByFactoryId(userid, factoryId, orderStatus);
   		   for (ClientOrder c : finishedClientOrder) {
   			   finishedCounts.add(messageCenterService.totalUnReadMessageByOrderId(c.getOrderId()));
   			   finishedMessageCounts.add(messageCenterService.totalMessageByOrderId(c.getOrderId()));
   			   
   			   
   			   ProductionPhotoTimeline productionPhoto = productionPhotoTimelineService.queryByOrderId(c.getOrderId());
   			   if(!(productionPhoto == null || "".equals(productionPhoto))){
   			   finishPhotos.add(productionPhoto);
   			   }
   		    }
   		    //查询处理中订单数
   		    int total = clientOrderService.total(userid, 0);   
   		    //查询再订购订单数
   		    int totalReorderOrder = reOrderService.totalAmount(userid);
   		   
   		   
   		   request.setAttribute("counts", counts);
   		   request.setAttribute("messageCounts", messageCounts);
   		   request.setAttribute("amountClientOrders", list);
   		   request.setAttribute("processClientOrder", processClientOrder);
   		   request.setAttribute("finishedClientOrder", finishedClientOrder);
   		   request.setAttribute("factoryUserRelation",factoryUserRelation);
   		   request.setAttribute("factoryInfo",factoryInfo);
   		   request.setAttribute("factoryInfos",factoryInfos);
   		   request.setAttribute("total",total);
   		   request.setAttribute("totalFactory",totalFactory);
   		   request.setAttribute("factoryName",factoryName);
   		   request.setAttribute("rfqInfo", rfqInfos);
   		   request.setAttribute("totalReorderOrder", totalReorderOrder);		   
   		   request.setAttribute("productionPhotoss", productionPhotoss);
   		   request.setAttribute("finishPhotos", finishPhotos);
   		   
   		   //查询处理中订单个数
   		   orderStatus = 0; 
   		   int totalProcess = clientOrderService.total(userid, orderStatus);
   		   orderStatus = 1;  
   		   int finishedProcess = clientOrderService.total(userid, orderStatus);
   		   
   		   int totalDelay = clientOrderService.totalDelay(userid);
   		   int totalOnTime = finishedProcess - totalDelay;
   		   /*
   		    *显示处理中、已结束饼状图  
   		    *显示按时完成、延期的饼状图
   		    */       
   		   request.setAttribute("totalProcess", totalProcess);
   		   request.setAttribute("finishedProcess", finishedProcess);
   		   request.setAttribute("totalOnTime", totalOnTime);
   		   request.setAttribute("totalDelay", totalDelay);
   		   request.setAttribute("finishedCounts", finishedCounts);
   		   request.setAttribute("finishedMessageCounts", finishedMessageCounts);
   		   
   		   
   		   /**
   		    * 当前季度订单金额和时间
   		    */
   		   Map<Object, Object> currentQuarter = clientOrderService.currentQuarter(userid);
   		   if(!(currentQuarter == null || "".equals(currentQuarter))){
   			   if(!(currentQuarter.get("sumAmount") == null || "".equals(currentQuarter.get("sumAmount")))){
   				   if(StringUtils.isNotBlank(currentQuarter.get("sumAmount").toString())){
   					   Double sumAmount = Double.parseDouble(currentQuarter.get("sumAmount").toString());
   					   sumAmount = new BigDecimal(sumAmount).setScale(0,BigDecimal.ROUND_HALF_UP).doubleValue();
   					   request.setAttribute("sumAmount", sumAmount);
   				   }			   
   		      }
   		   }
   		   /**
   		    * 当前时间前一个季度订单金额和时间
   		    */
   		   Map<Object, Object> currentQuarter1 = clientOrderService.currentQuarter1(userid);
   		   if(!(currentQuarter1 == null || "".equals(currentQuarter1))){
   			   if(!(currentQuarter1.get("sumAmount") == null || "".equals(currentQuarter1.get("sumAmount")))){
   				   if(StringUtils.isNotBlank(currentQuarter1.get("sumAmount").toString())){
   					   Double sumAmount1 = Double.parseDouble(currentQuarter1.get("sumAmount").toString());
   					   sumAmount1 = new BigDecimal(sumAmount1).setScale(0,BigDecimal.ROUND_HALF_UP).doubleValue();
   					   request.setAttribute("sumAmount1", sumAmount1);
   				   }
   			  }
   		   }
   		   /**
   		    * 当前时间前两个季度订单金额和时间
   		    */
   		   Map<Object, Object> currentQuarter2 = clientOrderService.currentQuarter2(userid);
   		   if(!(currentQuarter2 == null || "".equals(currentQuarter2))){
   			   if(!(currentQuarter2.get("sumAmount") == null || "".equals(currentQuarter2.get("sumAmount")))){
   				   if(StringUtils.isNotBlank(currentQuarter2.get("sumAmount").toString())){				  
   					   Double sumAmount2 = Double.parseDouble(currentQuarter2.get("sumAmount").toString());
   					   sumAmount2 = new BigDecimal(sumAmount2).setScale(0,BigDecimal.ROUND_HALF_UP).doubleValue();
   					   request.setAttribute("sumAmount2", sumAmount2);
   				   }
   			 }		   
   		   }
   		   /**
   		    * 当前时间前三个季度订单金额和时间
   		    */
   		   Map<Object, Object> currentQuarter3 = clientOrderService.currentQuarter3(userid);
   		   if(!(currentQuarter3 == null || "".equals(currentQuarter3))){
   			   if(!(currentQuarter3.get("sumAmount") == null || "".equals(currentQuarter3.get("sumAmount")))){
   				   if(StringUtils.isNotBlank(currentQuarter3.get("sumAmount").toString())){			   
   					   Double sumAmount3 = Double.parseDouble(currentQuarter3.get("sumAmount").toString());
   					   sumAmount3 = new BigDecimal(sumAmount3).setScale(0,BigDecimal.ROUND_HALF_UP).doubleValue();
   					   request.setAttribute("sumAmount3", sumAmount3);
   				     }
   			   }
   		  }
   		   /**
   		    * 当前时间前四个季度订单金额和时间
   		    */
   		   Map<Object, Object> currentQuarter4 = clientOrderService.currentQuarter4(userid);
   		   if(!(currentQuarter4 == null || "".equals(currentQuarter4))){
   			   if(!(currentQuarter4.get("sumAmount") == null || "".equals(currentQuarter4.get("sumAmount")))){
   				   if(StringUtils.isNotBlank(currentQuarter4.get("sumAmount").toString())){
   					   Double sumAmount4 = Double.parseDouble(currentQuarter4.get("sumAmount").toString());
   					   sumAmount4 = new BigDecimal(sumAmount4).setScale(0,BigDecimal.ROUND_HALF_UP).doubleValue();
   					   request.setAttribute("sumAmount4", sumAmount4);
   				   }
   			   }
   		   }
   		   
   		   String quarter = GetRecentQuarter.getCurrentQuarter(DateFormat.format());
   		   request.setAttribute("quarter", quarter); 
   		   String quarter1 = GetRecentQuarter.getCurrentQuarter(GetRecentQuarter.getFirstQuarterStartTime());
   		   request.setAttribute("quarter1", quarter1); 
   		   String quarter2 = GetRecentQuarter.getCurrentQuarter(GetRecentQuarter.getSecondQuarterStartTime());
   		   request.setAttribute("quarter2", quarter2); 
   		   String quarter3 = GetRecentQuarter.getCurrentQuarter(GetRecentQuarter.getThirdQuarterStartTime());
   		   request.setAttribute("quarter3", quarter3); 
   		   String quarter4 = GetRecentQuarter.getCurrentQuarter(GetRecentQuarter.getFourthQuarterStartTime());
   		   request.setAttribute("quarter4", quarter4); 
		
	} catch (Exception e) {
		e.printStackTrace();
		Log.error("===============ClientOrderController   queryByAdmin==============="+e.getMessage());
		throw new Exception(e.getMessage());
	}	            	         
	         

	   return "index.jsp";
   }
   

   
   
   
   
   /**
    * 获取NBMail沟通邮件
    * @param request
    * @param response
    * @return
    */
   @ResponseBody
   @RequestMapping("/queryNBMail.do")
   public JsonResult<Map<Object,Object>> queryNBMail(HttpServletRequest request, HttpServletResponse response){
	   
	   
	   try{
		       String userId = WebCookie.getUserid(request);
			    /*
			     *获取NBmail邮件数据（5封收件、5封发件）
			     */
			    String result1 = "";
			    PrintWriter out = null;		  
			    BufferedReader in = null;
		      		      	
		          //URL realUrl = new URL("http://112.64.174.34:43887/ERP-NBEmail/helpServlet?action=transAudit&className=ItCaseIdServlet");
		          URL realUrl = new URL("http://112.64.174.34:43887/NBEmail/helpServlet?action=getEmail&className=EmailReceiverServlet");
		          // 打开和URL之间的连接
		          URLConnection conn = realUrl.openConnection();
		          // 设置通用的请求属性
		         // conn.setRequestProperty("accept", "*/*");
		         conn.setRequestProperty("connection", "Keep-Alive");
		          conn.setRequestProperty("user-agent",
		                  "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
		          // 发送POST请求必须设置如下两行
		          conn.setDoOutput(true);
		          conn.setDoInput(true);
		          // 获取URLConnection对象对应的输出流
		          out = new PrintWriter(conn.getOutputStream());
		          // 发送请求参数emaillAddress, sm,map,path
		          out.print("&eid="+userId);
		          // flush输出流的缓冲
		          out.flush();
		          // 定义BufferedReader输入流来读取URL的响应
		          in = new BufferedReader(
		                  new InputStreamReader(conn.getInputStream()));
		          String line;
		          while ((line = in.readLine()) != null) {
		              result1 += line;
		          }
		          result1 = new String(result1.getBytes("gbk"),"utf-8");
		          result1 = Base64Encode.getFromBase64(result1);
//	          URLDecoder.decode("result1", "utf-8");
		          Map<Object, Object> cl = SerializeUtil.JsonToMap(result1);
			      //将json数据反序列化为map格式
				  String jsonStr1 = cl.get("EmailReceive").toString();
				  String jsonStr2 = cl.get("EmailInfo").toString();
				  List<Object> emailReceive = (List<Object>)JsonUtil.jsonToObject(jsonStr1, Object.class);
				  List<Object> emailSend = (List<Object>)JsonUtil.jsonToObject(jsonStr2, Object.class);

				  Map<Object,Object> map = new HashMap<Object, Object>();
				  map.put("emailReceive", emailReceive);
				  map.put("emailSend", emailSend);
				  
				  return new JsonResult<Map<Object,Object>>(map);
				  
		      } catch (Exception e) {
				Log.info("===============ClientOrderController   queryNBMail==============="+e.getMessage());	
				return new JsonResult<Map<Object,Object>>(1,"获取失败");
		      }
	   
   }
   
   
   
   
   
   
   
   
   
   /**
    * 查询已结束的订单
    * @param request
    * @param response
    * @return
    * @throws Exception 
    */
   @ResponseBody
   @RequestMapping("/queryFinishedOrder.do")
   public Map<String,Object> queryFinishedOrder(HttpServletRequest request, HttpServletResponse response) throws Exception{
	  List<ClientOrder> clientOrders = null;
	  Map<String,Object> map = new HashMap<String, Object>();
	try {
		String userid = request.getParameter("userid");
		  if(userid == null || "".equals(userid)){
			  throw new RuntimeException("Unable to get user id!");
		  }
		  String factoryName = request.getParameter("factoryName");
		  FactoryInfo factoryInfo = factoryInfoService.queryByFactoryName(factoryName);
		  String factoryId = "";
		  if(factoryInfo == null || "".equals(factoryInfo)){
			  throw new RuntimeException("Unable to get factory info!");
		  }
		  factoryId = factoryInfo.getFactoryId();
		  int orderStatus = 1;
		  clientOrders = clientOrderService.queryByFactoryId(userid, factoryId,orderStatus);
		  //已结束未读消息数
		  List<Integer> finishedUnReadCounts = new ArrayList<Integer>();
		  //已结束订单消息数
		  List<Integer> finishedMessageCounts = new ArrayList<Integer>();
		  //获取已结束的订单weekly report
		  List<ProductionPhotoTimeline> finishPhotos = new ArrayList<ProductionPhotoTimeline>();
		  
		  
		  
		  for (ClientOrder c : clientOrders) {
			  finishedUnReadCounts.add(messageCenterService.totalUnReadMessageByOrderId(c.getOrderId()));
			   finishedMessageCounts.add(messageCenterService.totalMessageByOrderId(c.getOrderId()));
			   
			   
			   ProductionPhotoTimeline productionPhoto = productionPhotoTimelineService.queryByOrderId(c.getOrderId());
			   if(!(productionPhoto == null || "".equals(productionPhoto))){
			   finishPhotos.add(productionPhoto);
			   }
		  }		   
		  map.put("clientOrders", clientOrders);
		  map.put("finishedUnReadCounts", finishedUnReadCounts);
		  map.put("finishedMessageCounts", finishedMessageCounts);
		  map.put("finishPhotos", finishPhotos);
		  
	} catch (Exception e) {
		e.printStackTrace();
		Log.error("===============ClientOrderController   queryFinishedOrder==============="+e.getMessage());
		throw new Exception(e.getMessage());
	}
	  return map;	   
   }
   

   /**
    * 查询订单详情
    * @param request
    * @param response
    * @return
 * @throws Exception 
    */
   @RequestMapping("/queryOrderDetails.do")
   public String queryOrderDetails(HttpServletRequest request, HttpServletResponse response) throws Exception{
	   try {
		   String orderId = request.getParameter("orderId");
		   orderId = Base64Encode.getFromBase64(orderId);
		   if(orderId == null || "".equals(orderId)){
			   throw new RuntimeException("orderId can not empty!");
		   }
		   ClientOrder clientOrder = clientOrderService.queryByOrderId(orderId);
			if(clientOrder == null || "".equals(clientOrder)){
				throw new RuntimeException("订单获取失败");
			}
			String factoryId = clientOrder.getFactoryId();
			FactoryInfo factoryInfo = factoryInfoService.queryByFactoryId(factoryId);
			List<Milestone> milestones = milestoneService.queryByOrderId(orderId);
			List<List<ProductionPhotoTimeline>> list = new ArrayList<List<ProductionPhotoTimeline>>();
			List<ProductionPhotoTimeline> list1 = productionPhotoTimelineService.queryByOrderIdGroupByDate(orderId);
			for (ProductionPhotoTimeline p : list1) {
				if(p.getIsDocument() == 0){
					List<ProductionPhotoTimeline> productionPhotoTimeline = productionPhotoTimelineService.queryByUploadDate(orderId, DateFormat.DateToStr(p.getUploadDate()));
				    list.add(productionPhotoTimeline);
				}else if(p.getIsDocument() == 1){
					List<ProductionPhotoTimeline> productionPhotoTimeline = productionPhotoTimelineService.queryDocumentByUploadDate(orderId, DateFormat.DateToStr(p.getUploadDate()));
				    list.add(productionPhotoTimeline);
				}
				
			}	
			
			
			//获取发票信息
			List<InvoiceInfo> invoiceInfos = invoiceInfoService.queryInvoiceByOrderId(orderId);			
			Double total = 0.00;		
			List<AmountUnit> amountUnits = new ArrayList<AmountUnit>();
			for (InvoiceInfo invoiceInfo : invoiceInfos) {
				
				AmountUnit amountUnit = amountUnitService.queryById(invoiceInfo.getAmountUnit());
				Double exchangeRate = amountUnit.getExchangeRate();
				
				Double productPrice = invoiceInfo.getProductPrice();
				if(productPrice == null || "".equals(productPrice)){
				   productPrice = 0.00;
				   invoiceInfo.setProductPrice(productPrice);
				}

				Double otherPrice = invoiceInfo.getOtherPrice();
				if(otherPrice == null || "".equals(otherPrice)){
					otherPrice = 0.00;
					invoiceInfo.setOtherPrice(otherPrice);
					}
				Double shippingFee = invoiceInfo.getShippingFee();
				if(shippingFee == null || "".equals(shippingFee)){
					shippingFee = 0.00;
					invoiceInfo.setShippingFee(shippingFee);
					}
				Double moldPrice = invoiceInfo.getMoldPrice();
				if(moldPrice == null || "".equals(moldPrice)){
					moldPrice = 0.00;
					invoiceInfo.setMoldPrice(moldPrice);
					}
				Double sum = invoiceInfo.getAmount() / exchangeRate;
				sum = new BigDecimal(sum).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();				
				total +=  sum;
				amountUnits.add(amountUnit);
			}
			Double f1 = new BigDecimal(total).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
      
			request.setAttribute("amountUnit", amountUnits);
			request.setAttribute("invoiceInfos", invoiceInfos);
			request.setAttribute("total", f1);
			
			
			   //获取订单图纸信息		  
			   List<ClientDrawings> clientDrawings = clientDrawingsService.queryListByOrderId(orderId);
			   int tl = clientDrawings.size();
			   if(tl != 0){
				   for (int i = 0; i < tl; i++) {											
			            /*
			             *去除时间节点，获取图纸名 
			             */
					     String dt = clientDrawings.get(i).getDrawingsName();
					     if(!(dt == null || "".equals(dt))){
					    	   String[] dts = dt.split("&");
							   String drawingName = dts[0];			
							   //获取图纸名显示		                     
							   clientDrawings.get(i).setDrawingsName(drawingName);
					     }					     
				    }
			   }
			
			
			//获取po、qc报告、shipping报告信息
			   List<ClientOrderPo> pos = clientOrderPoService.queryByClientOrderId(orderId);
			   for (ClientOrderPo po : pos) {
				   if(StringUtils.isNotBlank(po.getPoPath())){
					   po.setPoPath(new File(po.getPoPath().trim()).getName()); 
				   }
			   }
			 List<ClientOrderQcReport> qcReports = clientOrderQcReportService.queryByClientOrderId(orderId);
             for (ClientOrderQcReport clientOrderQcReport : qcReports) {
            	 if(StringUtils.isNotBlank(clientOrderQcReport.getQcReportPath())){
                	 clientOrderQcReport.setQcReportPath(new File(clientOrderQcReport.getQcReportPath().trim()).getName()); 
            	 }
			 }
             List<ClientOrderShippingDoc> shippingDocs = clientOrderShippingDocService.queryByClientOrderId(orderId);
             for (ClientOrderShippingDoc shippingDoc : shippingDocs) {
            	 if(StringUtils.isNotBlank(shippingDoc.getBLPath())){
            		 shippingDoc.setBLPath(new File(shippingDoc.getBLPath().trim()).getName());
            	 }
            	 if(StringUtils.isNotBlank(shippingDoc.getInvoicePath())){
            		 shippingDoc.setInvoicePath(new File(shippingDoc.getInvoicePath().trim()).getName());
            	 }
            	 if(StringUtils.isNotBlank(shippingDoc.getPackingListPath())){
            		 shippingDoc.setPackingListPath(new File(shippingDoc.getPackingListPath().trim()).getName());
            	 }
            	 if(StringUtils.isNotBlank(shippingDoc.getFormAPath())){
            		 shippingDoc.setFormAPath(new File(shippingDoc.getFormAPath().trim()).getName());
            	 }
            	 if(StringUtils.isNotBlank(shippingDoc.getPackagingPath())){
            		 shippingDoc.setPackagingPath(new File(shippingDoc.getPackagingPath().trim()).getName());
            	 }
            	 if(StringUtils.isNotBlank(shippingDoc.getBLCopyPath())){
            		 shippingDoc.setBLCopyPath(new File(shippingDoc.getBLCopyPath().trim()).getName());
            	 }
            	 if(StringUtils.isNotBlank(shippingDoc.getOtherPath())){
            		 shippingDoc.setOtherPath(new File(shippingDoc.getOtherPath().trim()).getName());
            	 }
     
			 } 
			   
			   
			   
			   
			
		   request.setAttribute("clientDrawings", clientDrawings);	
		   request.setAttribute("invoiceInfos", invoiceInfos);	
		   request.setAttribute("productionPhotoTimeline", list1);
		   request.setAttribute("productionPhotoTimelines", list);
		   request.setAttribute("milestones", milestones);
		   request.setAttribute("factoryInfo", factoryInfo);
		   request.setAttribute("clientOrder", clientOrder);
		   request.setAttribute("qcReports", qcReports);
		   request.setAttribute("pos", pos);
		   request.setAttribute("shippingDocs", shippingDocs);
		} catch (Exception e) {
			e.printStackTrace();
			Log.error("===============ClientOrderController  queryOrderDetails==============="+e.getMessage());
			throw new Exception(e.getMessage());
		}
	   
	   return "orderDetails.jsp";
   }
   
   
   /**
    * 根据订单和上传时间查询图片
    * @param request
    * @param response
    * @return
    */
   @ResponseBody
   @RequestMapping("/queryPhotoByUploadDate.do")
   public List<ProductionPhotoTimeline> queryPhotoByUploadDate(HttpServletRequest request, HttpServletResponse response){   
	   List<ProductionPhotoTimeline> productionPhotoTimelines = null;
	try {
		if(request.getParameter("uploadDate") == null || "".equals(request.getParameter("uploadDate"))){
			   throw new RuntimeException("upload date can not empty!");
		   }
		   if(request.getParameter("orderId") == null || "".equals(request.getParameter("orderId"))){
			   throw new RuntimeException("orderId date can not empty!");
		   }
		   String uploadDate = request.getParameter("uploadDate");
		   String orderId = request.getParameter("orderId");
		   productionPhotoTimelines = productionPhotoTimelineService.queryByUploadDate(orderId, uploadDate);
	} catch (Exception e) {
		e.printStackTrace();
		Log.error("===============ClientOrderController  queryPhotoByUploadDate==============="+e.getMessage());
	}
	   
	   return productionPhotoTimelines;
   }
   
   
   
   /**
    * 查询图片地址
    * @param request
    * @param response
    * @return
    */
   @ResponseBody
   @RequestMapping("/queryPhotoById.do")
   public JsonResult<String> queryPhotoById(HttpServletRequest request, HttpServletResponse response){  
	   	  if(StringUtils.isNotBlank(request.getParameter("id"))){
	   		  Integer id = Integer.parseInt(request.getParameter("id"));
	   		  String photoPath = productionPhotoTimelineService.queryPhotoById(id);
	   		  return new JsonResult<String>(0,"获取成功",photoPath);
	   	  }else{
	   		  return new JsonResult<String>(0,"获取失败");
	   	  }
   }
   
   
   
   
   
   
   
   
   /**
    * 根据订单号查询weekly report
    * @param request
    * @param response
    * @return
   * @throws Exception 
    */
   @ResponseBody
   @RequestMapping("/queryPhotoByOrderId.do")
   public JsonResult<Map<Object,Object>> queryPhotoByOrderId(HttpServletRequest request, HttpServletResponse response){   
	   List<ProductionPhotoTimeline> productionPhotoTimelines = null;
		try {
			   if(request.getParameter("orderId") == null || "".equals(request.getParameter("orderId"))){
				   throw new RuntimeException("orderId date can not empty!");
			   }
			   String orderId = request.getParameter("orderId");
			   productionPhotoTimelines = productionPhotoTimelineService.queryByOrderIdGroupByDate(orderId);
			   
			    Map<Object,Object> map = new HashMap<Object, Object>();
		        List<List<ProductionPhotoTimeline>> list2 = new ArrayList<List<ProductionPhotoTimeline>>();
		        for (ProductionPhotoTimeline productionPhotoTimeline : productionPhotoTimelines) {
		        	List<ProductionPhotoTimeline> productionPhoto = productionPhotoTimelineService.queryByUploadDate(orderId,  DateFormat.DateToStr(productionPhotoTimeline.getUploadDate()));
		        	list2.add(productionPhoto);
				}
		        map.put("productionPhotoes", productionPhotoTimelines);       
		        map.put("productionPhotoTimelines", list2);       
			   
			   return new JsonResult<Map<Object,Object>>(map);			   
		} catch (NumberFormatException e) {
			Log.error("======ClientOrderController  queryPhotoByMilestoneId======="+e.getMessage());
			e.printStackTrace();
			return new JsonResult<Map<Object,Object>>(1,"查询失败");
		} catch (ParseException e) {
			Log.error("======ClientOrderController  queryPhotoByMilestoneId======="+e.getMessage());
			e.printStackTrace();
			return new JsonResult<Map<Object,Object>>(1,"查询失败");
		}
	   
   }
   
   
   /**
    * 查询工厂信息
    */  
   @RequestMapping("/querySupplier.do")
   public String querySupplier(HttpServletRequest request, HttpServletResponse response) throws Exception{	   
	   
	   
	   try {
		   String userId = WebCookie.getUserid(request);
		   if(userId == null || "".equals(userId)){
			  throw new RuntimeException("未获取到用户信息"); 
		   }
		   int total = clientOrderService.total1(userId,null);
		   List<UserFactoryRelation> factoryUserRelation = userFactoryRelationService.queryByUserid(userId);
		   List<Double> factoryAmounts = new ArrayList<Double>();
		   List<Integer> factoryTotals = new ArrayList<Integer>();
		   List<Date> lastOrderDates = new ArrayList<Date>();
		   List<FactoryInfo> factoryInfos = new ArrayList<FactoryInfo>();
		   Double totalPrice = 0.0;
		   FactoryInfo factoryInfo = new FactoryInfo();
		   
		   
		   for (UserFactoryRelation factoryUserRelation2 : factoryUserRelation) { 	
			   Double factoryAmount = 0.0;
//			   Integer orderStatus = null; 
			   String factoryId = factoryUserRelation2.getFactoryId();
			   //最近一年的订单数
			   int factoryTotal = clientOrderService.total1(userId, factoryId);
			   
			   
			   String lastOrderDate = clientOrderService.queryLastOrder(userId, factoryId);
			   Date lastDate = null;
			   if(lastOrderDate != null && !"".equals(lastOrderDate)){
				   lastDate = DateFormat.formatToDate(lastOrderDate); 
			   }
			   
			   List<ClientOrder> list = clientOrderService.queryByFactoryId(userId, factoryId,null);
			   factoryInfo = factoryInfoService.queryByFactoryId(factoryId);
			   for (ClientOrder clientOrder : list) {
				   Double amount = clientOrder.getAmount();
				   
				   factoryAmount += new BigDecimal(amount).doubleValue();				   
			   }
			   factoryAmount = new BigDecimal(factoryAmount).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
			   factoryAmounts.add(factoryAmount);
			   factoryTotals.add(factoryTotal);
			   lastOrderDates.add(lastDate);
			   factoryInfos.add(factoryInfo);
			   totalPrice += new BigDecimal(factoryAmount).doubleValue();

		    }	   
		   totalPrice = new BigDecimal(totalPrice).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();	   
		   request.setAttribute("totalPrice", totalPrice);
		   request.setAttribute("total", total);
		   request.setAttribute("factoryAmounts", factoryAmounts);
		   request.setAttribute("factoryTotals", factoryTotals);
		   request.setAttribute("lastOrderDates", lastOrderDates);
		   request.setAttribute("factoryInfos", factoryInfos);
	} catch (Exception e) {
		e.printStackTrace();
		Log.error("===============ClientOrderController  querySupplier==============="+e.getMessage());
		throw new Exception(e.getMessage());

	}
	   
	   
	   
	   return "supplier.jsp";
   }
   
   
   /**
    * 查询工厂信息
    * @param request
    * @param response
    * @return
 * @throws Exception 
    */
   @RequestMapping("/querySupplierInfo.do")
   public String querySupplierInfo(HttpServletRequest request, HttpServletResponse response) throws Exception{	
	   try {
		String userId = WebCookie.getUserid(request);
		   if(userId == null || "".equals(userId)){
			  throw new RuntimeException("未获取到用户信息"); 
		   }
		   String factoryId = request.getParameter("factoryId");
		   factoryId = Base64Encode.getFromBase64(factoryId);
		   if(factoryId == null || "".equals(factoryId)){
			  throw new RuntimeException("未获取到工厂信息"); 
		   }
		   Integer orderStatus = null; 
		   Double factoryAmount = 0.0;
		   
		   FactoryInfo factoryInfo = factoryInfoService.queryByFactoryId(factoryId);
		   //查询工厂所有订单
		   int factoryTotal = clientOrderService.totalFactoryOrder(userId, factoryId);
		   List<ClientOrder> list = clientOrderService.queryByFactoryId(userId, factoryId,null);
		   for (ClientOrder clientOrder : list) {
			   Double amount = clientOrder.getAmount();
			   factoryAmount += new BigDecimal(amount).doubleValue();	
		    }
		   factoryAmount = new BigDecimal(factoryAmount).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
		   
		   request.setAttribute("factoryAmount", factoryAmount);
		   request.setAttribute("factoryTotal", factoryTotal);
		   request.setAttribute("factoryInfo", factoryInfo);
		   request.setAttribute("userId", userId);
		   
		   orderStatus = 0;
		   int totalProcess = clientOrderService.totalFinished(userId, orderStatus, factoryId);
		   orderStatus = 1;
		   int totalFinished = clientOrderService.totalFinished(userId, orderStatus, factoryId);
		     
		   
		   request.setAttribute("totalProcess", totalProcess);
		   request.setAttribute("totalFinished", totalFinished);
	   
		   
	} catch (Exception e) {
		e.printStackTrace();
		Log.error("===============ClientOrderController  querySupplierInfo==============="+e.getMessage());
		throw new Exception(e.getMessage());
	}
	   
	 return "supplier_info.jsp";  
   }
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   /**
    * 展示最近收发的各5封邮件
    * @param request
    * @param response
    * @return
    */
   @RequestMapping(value="/queryMailsByUserId.do",method = RequestMethod.POST)
   public String queryMailsByUserId(@RequestParam Map<String,String> map,HttpServletRequest request){
	      //将json数据反序列化为map格式
		  String jsonStr1 = map.get("EmailReceive");
		  String jsonStr2 = map.get("EmailInfo");
		  
//		  System.out.println(jsonStr);
		  List<Object> emailReceive = (List<Object>)JsonUtil.jsonToObject(jsonStr1, Object.class);
		  List<Object> emailSend = (List<Object>)JsonUtil.jsonToObject(jsonStr2, Object.class);
		  request.setAttribute("emailReceive", emailReceive);
		  request.setAttribute("emailSend", emailSend);
	   
	      return "index.jsp";
   }
   
   
   
}
