package com.cbt.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cbt.entity.ClientDrawings;
import com.cbt.entity.ClientOrder;
import com.cbt.entity.User;
import com.cbt.service.ClientDrawingsService;
import com.cbt.service.ClientOrderService;
import com.cbt.service.UserService;
import com.cbt.util.DateFormat;
import com.cbt.util.Md5Util;
import com.cbt.util.SerializeUtil;
import com.cbt.util.UploadAndDownloadPathUtil;

/**
 * 动态获取数据，并存入数据库
 * @author polo
 *
 */
@Controller
@RequestMapping("/port")
public class ReceiveDataPort {
 
public static final String loginURL = "/crm/account/login.do";	
//public static final String oldDrawingPath = UploadAndDownloadPathUtil.getOldDrawingUpLoadAndDownLoadPath();//图纸路径

	  @Resource
	  private ClientOrderService clientOrderService;
	  @Resource
	  private ClientDrawingsService clientDrawingsService;
	  @Resource
	  private UserService userService;
	  @ResponseBody
	  @RequestMapping("/receiveAllData.do")	  
	   public String queryAllClientOrder(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, ParseException{
		  
	      /* 设置格式为text/json    */
          response.setContentType("text/json"); 
          /*设置字符集为'UTF-8'*/
          response.setCharacterEncoding("UTF-8");
		  //获取接收的数据
		  String jsonStr = request.getParameter("result");
		  
		  jsonStr = URLDecoder.decode(jsonStr, "utf-8"); 
		  //将json数据反序列化为map格式
		  Map<Object,Object> map = SerializeUtil.JsonToMap(jsonStr);
		  
		  
		  /**
		   * 解析customer数据
		   * 
		   */
          //获取customer对象
          //实例：Customer=[{"id":34,"name":"zhanglan"},{"id":35,"name":"qiaoyue"}]
          List<Object> user = (List<Object>)map.get("Customer");
         //创建存放对象的list集合
          List<Object> list3 = new ArrayList<Object>();
         //循环list先将底层map转换为json字符串，再反序列化为map
          for (Object c: user) {	
			  User u = new User();
			  String str = null;
			  str = c.toString();
			  Map<Object, Object> cl = SerializeUtil.JsonToMap(str);

			  if(!(cl.get("id") == null || "".equals(cl.get("id")))){
				   u.setUserid(cl.get("id").toString());
				  
			  }else{
				  u.setUserid("");
			  }
			  if(!(cl.get("name") == null || "".equals(cl.get("name")))){
				  u.setUserName((String) cl.get("name"));
				  
			  }else{
				  u.setUserName("");
			  }
			  u.setEmail("");
			  //密码为随机数通过Md5加密
			  Random random =new Random();
			  String r = random.toString();
			  r = Md5Util.encoder(r);
			  u.setPwd(r);
			  u.setTel("");
			  
			  long time = System.currentTimeMillis();
		  	  Date date = new Date(time);    	
		  	  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		  	  String updateTime = sdf.format(date);
			  u.setUpdateTime(updateTime);
//			  String token =  u.getUserid() + "&" + u.getPwd();
//			  String encryptTxt = "";
//			  try {
//				encryptTxt = SecurityHelper.encrypt("token", token);
//				u.setToken(loginURL + "?" + "userInfo =" + encryptTxt);
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
			  u.setToken("");
			  list3.add(u);
          }
//          System.out.println(list3);
//          userService.insertUser(list3);
          
		  /**
		   * 解析ClientOrder数据
		   * 
		   */
		  //转换为list对象 
		  List<Object> list = (List<Object>)map.get("ClientOrder");	
		  //存放对象的list1集合
		  List<Object> list1 = new ArrayList<Object>();
		  //循环list先将底层map转换为json字符串，再反序列化为map
		  //实例：{amount=3541.00, createTime=2015-10-25 09:56:01.33, customerId=34, caseStatus=14, saildate=, orderId=SHS11426}		  	
		  for (Object c: list) {	
			  ClientOrder clientOrder = new ClientOrder();
			  String str = null;
			  str = c.toString();
			  Map<Object, Object> cl = SerializeUtil.JsonToMap(str);	  

			  if(!(cl.get("amount") == null || "".equals(cl.get("amount")))){
				  
				  Double d = Double.parseDouble (cl.get("amount").toString());
				  clientOrder.setAmount(d); 
			  }else{
				  clientOrder.setAmount(0.0);
			  }
			  if(!(cl.get("createTime") == null || "".equals(cl.get("createTime")))){
				  clientOrder.setCreateTime(DateFormat.formatToDate((String) cl.get("createTime"))); 
			  }else{
				  clientOrder.setCreateTime(null);
			  }

			  if(!(cl.get("orderId") == null || "".equals(cl.get("orderId")))){
				  clientOrder.setOrderId((String) cl.get("orderId"));
			  }else{
				  clientOrder.setOrderId(null);
			  }
			  			  
			  if(!(cl.get("caseStatus") == null || "".equals(cl.get("caseStatus")))){
					Integer i = Integer.valueOf((String) cl.get("caseStatus"));
					clientOrder.setOrderStatus(i);
			  }else{
				  	clientOrder.setOrderStatus(0);
			  }
			  if(!(cl.get("saildate") == null || "".equals(cl.get("saildate")))){
				clientOrder.setOutputTime(DateFormat.formatToDate((String) cl.get("saildate")));
			  }else{
				  clientOrder.setOutputTime(null);
			  }
//			  clientOrder.setInvoicePath("");
			  clientOrder.setPoPath("");
			  clientOrder.setQcReportPath("");
			  clientOrder.setShippingDocPath("");
			  if(!(cl.get("customerId") == null || "".equals(cl.get("customerId")))){
				 String s = cl.get("customerId").toString();
				 clientOrder.setUserid(s);
			  }
			  

              list1.add(clientOrder);
//              clientOrderService.insertClientOrder(clientOrder);
		   }
		  clientOrderService.insertClientOrders(list1);
		  

		  /**
	        * 解析clientDrawing数据
			* 	  
			*/
		  List<Object> clientDrawings = (List<Object>)map.get("ClientDrawings");
		  //存放对象的list1集合
		  List<Object> list2 = new ArrayList<Object>();
		  //解析clientDrawing数据
		  for (Object c: clientDrawings) {	
			 ClientDrawings cld = new ClientDrawings();
			  String str = null;
			  str = c.toString();
			  System.out.println("str:"+str);

			  Map<Object, Object> cl = SerializeUtil.JsonToMap(str);
			  System.out.println("cl:"+cl);		  
			    
			  if(!(cl.get("upload") == null || "".equals(cl.get("upload")))){				  
				  cld.setDrawingsName((String) cl.get("upload"));
			  }else{
				  cld.setDrawingsName(null);
			  }
		  
				  cld.setDrawingsPath(UploadAndDownloadPathUtil.getOldDrawingUpLoadAndDownLoadPath());				  
	
				  cld.setMoldPrice(0.0);
			  			  
			  if(!(cl.get("caseNo") == null || "".equals(cl.get("caseNo")))){					
					cld.setOrderId((String) cl.get("caseNo"));
			  }else{
				  	cld.setOrderId("");
			  }
                    
			        
	          if(!(cl.get("projectDescc") == null || "".equals(cl.get("projectDescc")))){
	        	  cld.setProjectCname((String) cl.get("projectDescc"));
	          }else{
	        	  cld.setProjectCname("");
	          }
	          
	          if(!(cl.get("projectDescc") == null || "".equals(cl.get("projectDescc")))){
	        	  cld.setProjectName((String) cl.get("projectDescc"));
	          }else{
	        	  cld.setProjectName("");
	          }
//	          
//	          if(!(cl.get("createTime") == null || "".equals(cl.get("createTime")))){
//	        	  cld.setQuoteTime((String) cl.get("createTime"));
//	          }
//	              	          
	          cld.setUnitPrice(0.0);
	          
	          cld.setUpdateTime(null);
	          cld.setDrawingState("1");
	          
	          if(!(cl.get("cid") == null || "".equals(cl.get("cid")))){
	        	  cld.setUserid(cl.get("cid").toString());
	          }		        			    
              list2.add(cld);
		   }
		  clientDrawingsService.insertClientDrawings(list2);
		  
		  return "SUCCESS";
	  }
	  
	  
	  
	  

	  
}
