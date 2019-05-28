package com.cbt.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cbt.entity.BackUser;
import com.cbt.entity.FactoryInfo;
import com.cbt.entity.LoginLog;
import com.cbt.entity.QuotationBean;
import com.cbt.entity.ShippingInfo;
import com.cbt.entity.User;
import com.cbt.entity.UserRelationEmail;
import com.cbt.service.BackUserService;
import com.cbt.service.FactoryInfoService;
import com.cbt.service.LoginLogService;
import com.cbt.service.QuotationService;
import com.cbt.service.ShippingInfoService;
import com.cbt.service.UserRelationEmailService;
import com.cbt.service.UserService;
import com.cbt.util.Base64Encode;
import com.cbt.util.DateFormat;
import com.cbt.util.Md5Util;
import com.cbt.util.NbMailAddressUtil;
import com.cbt.util.SecurityHelper;
import com.cbt.util.SplitPage;
import com.cbt.util.WebCookie;

@RequestMapping("/account")
@Controller
public class AccountController {

	  @Resource
      private UserService userService;
	  @Resource
	  private LoginLogService loginLogService;
      @Resource
	  private FactoryInfoService factoryInfoService;
      @Resource
      private BackUserService backUserService;
      @Resource
      private ShippingInfoService shippingInfoService;
      @Resource
      private UserRelationEmailService userRelationEmailService;
	  @Resource
	  private QuotationService quotationService;
      
      
      
      private FactoryInfo factoryInfo1 = new FactoryInfo();
      private BackUser backUser1 = new BackUser();
      private User user1 = new User();
      private ShippingInfo shippingInfo1 = new ShippingInfo();
      
      
      private final Logger Log = Logger.getLogger(AccountController.class);

	  @RequestMapping("/toLogin.do")
      public String toLogin(HttpServletRequest request,HttpServletResponse response){	  
    	  
    	  return "/login.jsp";
      }
      
      @ResponseBody
      @RequestMapping("/login.do")
      public JsonResult<String> login(HttpServletRequest request,HttpServletResponse response){
		  
		  String loginEmail = "";
		  String userName = "";
		  try { 	      
	          String pwd = "";
	          /*
	           * 获取userInfo（加密的用户登录邮箱和密码）
	           */
//    	      if(!(request.getParameter("userInfo") == null || "".equals(request.getParameter("userInfo")))){
//    	    	  String userInfo = request.getParameter("userInfo").trim();
//        	      String plainTxt = "";
//        	      try {
//        	    	  plainTxt = SecurityHelper.decrypt("userInfo", userInfo);
//    			} catch (Exception e) {
//    				e.printStackTrace();
//    			}
//        	      String[] u = plainTxt.split("&");
//        	      loginEmail = u[0];
//        	      pwd = u[1];    	  
//    	      }
    	    
    	      if(!(request.getParameter("loginEmail") == null || "".equals(request.getParameter("loginEmail")))){
    	    	  loginEmail = request.getParameter("loginEmail");
    	      }
    	      if(!(request.getParameter("pwd") == null || "".equals(request.getParameter("pwd")))){
    	    	  pwd = request.getParameter("pwd");
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
    		 
    		  try {
				  LoginLog loginLog = new LoginLog();
				  loginLog.setLoginEmail(loginEmail);
				  loginLog.setLoginIp(request.getRemoteAddr());
				  loginLog.setLoginStatus(0);
				  loginLog.setLoginTime(DateFormat.format());
				  loginLog.setUsername(user.getUserName());
				  loginLogService.insertLoginLog(loginLog);
				} catch (Exception e) {
					e.printStackTrace();
					Log.error("=========login========="+e.getMessage());
				}
     		 return new JsonResult<String>(0,"success login",userid);
    		  
			} catch (Exception e) {
				try {
					LoginLog loginLog = new LoginLog();
					loginLog.setLoginEmail(loginEmail);
					User user = userService.queryByLoginMail(loginEmail);
					if(user != null || "".equals(user)){
						userName = user.getUserName();	
					}
					
					loginLog.setLoginFailTime(DateFormat.format());
					loginLog.setLoginIp(request.getRemoteAddr());
					loginLog.setLoginStatus(1);
					loginLog.setUsername(userName);
					loginLog.setErrorInfo(e.toString());
					loginLogService.insertLoginLog(loginLog);
				} catch (Exception e1) {
					e1.printStackTrace();
				}	
				return new JsonResult<String>(1,e.getMessage());
			}
		    		  
      }
      
    
      
      
      
      /**
       * 邀请公司同事登录
       * @param request
       * @param response
       * @return
       */
      @ResponseBody
      @RequestMapping("/inviteSign.do")
      public JsonResult<String> inviteSign(HttpServletRequest request,HttpServletResponse response){
    	  
    	  String result1 = "";
    	  try {
			   String email = request.getParameter("email");
			   if(email == null || "".equals(email)){
				  throw new RuntimeException("Email can not be empty");
			   }	  
	           String userid = WebCookie.getUserid(request);
	           if(StringUtils.isBlank(userid)){
	        	  throw new RuntimeException("请先登录");
	           }
			    email= URLEncoder.encode(email, "UTF-8");
			   
			  String url = NbMailAddressUtil.getDomainName()+"crm/c_register.jsp?email="+email+"&userid="+Base64Encode.getBase64(userid);		    
			  PrintWriter out = null;			  
		      BufferedReader in = null;
		      
		      try {
		      	
		          URL realUrl = new URL("http://112.64.174.34:43887/NBEmail/helpServlet?action=SendEmail1&className=ExternalInterfaceServlet");
//		          URL realUrl = new URL("http://192.168.1.62:8080/NBEmail/helpServlet?action=SendEmail1&className=ExternalInterfaceServlet");
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
		          String content = "Your colleague invites you to join Importx. So you can see the business information.Click <a href="+url+">here</a>";
		        
		          content = URLEncoder.encode(content, "utf-8");
		          out.print("&email="+email+"&&title="+"Invite register"+"&content="+content);
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
		      } catch (Exception e) {
		    	 e.printStackTrace();
		    	 return new JsonResult<String>(1,e.getMessage());
		      }
			  
		} catch (Exception e) {			
			e.printStackTrace();
			Log.error("=========recoverPwd========="+e.getMessage());
			return new JsonResult<String>(1,e.getMessage());			
		}
     	  return new JsonResult<String>(0,result1);
      }
      
      
      
      
      
      
      
      
      
      
      /**
       * 找回密码
       * @param request
       * @param response
       * @return
       */
      @ResponseBody
      @RequestMapping("/recoverPwd.do")
      public JsonResult<String> recoverPwd(HttpServletRequest request,HttpServletResponse response){
    	  
    	  String result1 = "";
    	  try {
			String email = request.getParameter("email");
			  if(email == null || "".equals(email)){
				  throw new RuntimeException("Email can not be empty");
			  }
			  UserRelationEmail userRelationEmail = userRelationEmailService.queryUseridByEmail(email);
			  if(userRelationEmail == null || "".equals(userRelationEmail)){
				  throw new RuntimeException("Invalid mailbox"); 
			  }
			  
			  String pwd = userRelationEmail.getPwd();			  
	  
		    email= URLEncoder.encode(email, "UTF-8");
		    PrintWriter out = null;
			  
		      BufferedReader in = null;
		      
		      try {
		      	
		          URL realUrl = new URL("http://112.64.174.34:43887/NBEmail/helpServlet?action=SendEmail1&className=ExternalInterfaceServlet");
//		          URL realUrl = new URL("http://192.168.1.62:8080/NBEmail/helpServlet?action=SendEmail1&className=ExternalInterfaceServlet");
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
		          out.print("&email="+email+"&&title="+"Retrieve password"+"&content=Your password is"+pwd);
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
		      } catch (Exception e) {
		    	 e.printStackTrace();
		    	 return new JsonResult<String>(1,e.getMessage());
		      }
			  
		} catch (Exception e) {			
			e.printStackTrace();
			Log.error("=========recoverPwd========="+e.getMessage());
			return new JsonResult<String>(1,e.getMessage());			
		}
     	  return new JsonResult<String>(0,result1);
      }
      
      /**
       * 跳转工厂注册页
       * @param request
       * @param response
       * @return
       */
      @RequestMapping("/toFactoryRegister.do")
      public String toFactoryRegister(HttpServletRequest request,HttpServletResponse response){
    	  
 	     return "/f_register.jsp";
      }
      
      /**
       * 客户注册页
       * @param request
       * @param response
       * @return
       */
      @RequestMapping("/toCustomerRegister.do")
      public String toCustomerRegister(HttpServletRequest request,HttpServletResponse response){
    	  
    	  return "/c_register.jsp";
      }
      
      /**
       * 客户注册
       * @param request
       * @param response
       * @return
     * @throws Exception 
       */
      @ResponseBody
      @RequestMapping("/customerRegister.do")
      public String customerRegister(HttpServletRequest request,HttpServletResponse response) throws Exception{

		  try {
			   User user = new User();
		     
			  String loginEmail = "";
			  if(!(request.getParameter("email") == null || "".equals(request.getParameter("email")))){
				  loginEmail = request.getParameter("email");
			  }    
			  user.setLoginEmail(loginEmail);
			  user.setEmail(loginEmail);
			  String tel = "";
			  if(!(request.getParameter("tel") == null || "".equals(request.getParameter("tel")))){
				  tel = request.getParameter("tel");
			  }     
              user.setTel(tel);
			  
			  String pwd = "123456";
			  if(!(request.getParameter("pwd") == null || "".equals(request.getParameter("pwd")))){
				  pwd = request.getParameter("pwd");
			  }     
			  user.setPwd(pwd);
			  
			  String address = "";
			  if(!(request.getParameter("addr") == null || "".equals(request.getParameter("addr")))){
				  address = request.getParameter("addr");
			  }     
			  
			  String mainBusiness = "";
			  if(!(request.getParameter("mainBusiness") == null || "".equals(request.getParameter("mainBusiness")))){
				  mainBusiness = request.getParameter("mainBusiness");
			  }     
			  String userid = "";
			  if(!(request.getParameter("userid") == null || "".equals(request.getParameter("userid")))){
				  userid = request.getParameter("userid");
				  userid = Base64Encode.getFromBase64(userid);
			  }     
              user.setMainBusiness(mainBusiness);
			  user.setCreateTime(DateFormat.format());
			  user.setUpdateTime(DateFormat.format());  
			  user.setUserid(userid);
			  user1 = user;
			  
			  //插入shipping_info客户地址信息
			  ShippingInfo shippingInfo = new ShippingInfo();
			  shippingInfo.setDetailedAddress(address);
			  shippingInfo.setRegisterEmail(loginEmail);
			  shippingInfo.setTelephone1(tel);
			  shippingInfo.setUpdateTime(DateFormat.format());
			  shippingInfo.setCity("");
			  shippingInfo.setCountry("");
			  shippingInfo.setUserName("");
			  shippingInfo.setPostcode("");
			  shippingInfo.setState("");
              shippingInfo.setUserid(userid);
			  shippingInfo1 = shippingInfo;			  
			  register1(user,shippingInfo);
			  
			  return loginEmail;
			  
		} catch (Exception e) {
			Log.error("=========customerRegister========="+e.getMessage());
			e.printStackTrace();
			throw new Exception(e.getMessage());
		}
    	  
      }
      
      /**
       * 工厂注册
       * @param request
       * @param response
       * @return
     * @throws Exception 
       */
      @Transactional
      @RequestMapping("/factoryRegister.do")
      public String factoryRegister(HttpServletRequest request,HttpServletResponse response) throws Exception{
    	  
    	  try {
    		  FactoryInfo factoryInfo = new FactoryInfo();
    		  String factoryName = "";
    		  if(!(request.getParameter("factoryName") == null || "".equals(request.getParameter("factoryName")))){
    			  factoryName = request.getParameter("factoryName");
    		  }
    		  factoryInfo.setFactoryName(factoryName);
    		  
    		  String factoryAdminEmail = "";
    		  if(!(request.getParameter("email") == null || "".equals(request.getParameter("email")))){
    			  factoryAdminEmail = request.getParameter("email");
    		  }     
    		  factoryInfo.setFactoryAdminEmail(factoryAdminEmail);
    		  factoryInfo.setFactoryAdminName(factoryAdminEmail);
    		  
    		  String factoryAdminTel = "";
    		  if(!(request.getParameter("tel") == null || "".equals(request.getParameter("tel")))){
    			  factoryAdminTel = request.getParameter("tel");
    		  }     
    		  factoryInfo.setFactoryAdminTel(factoryAdminTel);
    		  
    		  String factoryAdminPwd = "123456";
    		  if(!(request.getParameter("pwd") == null || "".equals(request.getParameter("pwd")))){
    			  factoryAdminPwd = request.getParameter("pwd");
    		  }     
    		  factoryInfo.setFactoryAdminPwd(factoryAdminPwd);
    		  
    		  String factoryAddr = "";
    		  if(!(request.getParameter("addr") == null || "".equals(request.getParameter("addr")))){
    			  factoryAddr = request.getParameter("addr");
    		  }     
    		  factoryInfo.setFactoryAddr(factoryAddr);
    		  
    		  String mainBusiness = "";
    		  if(!(request.getParameter("mainBusiness") == null || "".equals(request.getParameter("mainBusiness")))){
    			  mainBusiness = request.getParameter("mainBusiness");
    		  }     
    		  factoryInfo.setFactoryLogo("");
    		  factoryInfo.setFactoryLicense("");
    		  factoryInfo.setMainBusiness(mainBusiness);
    		  factoryInfo.setRegisterTime(DateFormat.format());
    		  factoryInfo.setUpdateTime(DateFormat.format());
    		  factoryInfo1 = factoryInfo;
    		  
    		  
    		  //更新后台back_user表数据
    		  BackUser backUser = new BackUser();
    		  backUser.setCreateTime(DateFormat.format());
    		  backUser.setEmail(factoryAdminEmail);
    		  backUser.setUserName(factoryAdminEmail);
    		  backUser.setPwd(factoryAdminPwd);
    		  backUser.setPermission(1);
    		  backUser.setRealName("");
    		  backUser.setTel(factoryAdminTel);
    		  backUser.setRemark("");
    		  backUser.setBackUserid("1");
    		  backUser1 = backUser;
    		  
    		  register(factoryInfo,backUser);
    		  
    	  } catch (Exception e) {
  			Log.error("=========factoryRegister========="+e.getMessage());
  			e.printStackTrace();
  			throw new Exception(e.getMessage());
    	  }
    	  
    	  
    	  return "/login.jsp";
      }
      
      
      
      
      @ResponseBody
      @RequestMapping("/verifyfEmail.do")
      public String verifyfEmail(HttpServletRequest request,HttpServletResponse response){
    	String email = null;    	
		if(!(request.getParameter("email") == null || "".equals(request.getParameter("email")))){
			email = request.getParameter("email"); 
			if(!(factoryInfoService.queryByEmail(email) == null || "".equals(factoryInfoService.queryByEmail(email)))){
				throw new RuntimeException("email已经存在！");
			}
		}
    	return "legal";
       }
      
      
      /**
       * 验证客户邮箱是否存在
       * @Title verifycEmail 
       * @Description
       * @param request
       * @param response
       * @return
       * @return String
       */
      @ResponseBody
      @RequestMapping("/verifycEmail.do")
      public String verifycEmail(HttpServletRequest request,HttpServletResponse response){  	
    	  if(!(request.getParameter("email") == null || "".equals(request.getParameter("email")))){
    		  UserRelationEmail userRelationEmail = userRelationEmailService.queryUseridByEmail(request.getParameter("email"));
    		  if(!(userRelationEmail == null || "".equals(userRelationEmail))){
    			  throw new RuntimeException("email已经存在！");
    		  }
    	  }
    	  return "legal";
      }
 
      
      
      
      

      
      
      /**
       * 工厂注册（factory_id的线程处理）
       * @param factoryInfo
       * @param backUser
       */
     public void register(FactoryInfo factoryInfo,BackUser backUser){
  		ExecutorService pool = Executors.newSingleThreadExecutor();
           Runnable task1 = new SingelTask();           
  		   pool.execute(task1);		   	   
  		    // 等待已提交的任务全部结束 不再接受新的任务
  		   pool.shutdown(); 
  	   }  	   
  		   
  	  public class SingelTask implements Runnable{ 		  
  		    @Override
  		    public synchronized void run() {
  		     System.out.println(Thread.currentThread().getName() + "正在执行…");
  		     
  		     try {
				Integer id = factoryInfoService.queryMaxId();  		     
				   if(id == null || "".equals(id)){
					   id = 1001;
				   }else{
					   id = 1001 + id;
				   }
				   
				   factoryInfo1.setFactoryId("f"+id);
				   backUser1.setFactoryId("f"+id);
				   factoryInfoService.insert(factoryInfo1,backUser1);
				   
			} catch (Exception e) {
				Log.error("====SingelTask========"+e.getMessage());
				e.printStackTrace();
			}	
  		       
  		     System.out.println(Thread.currentThread().getName() + "执行完毕");
  		   }
  		  
  	   }
  	  
  	  
  	  
  	  
  	  
      /**
       * 客户注册（userid的线程处理）
       * @param factoryInfo
       * @param backUser
       */
      
     public void register1(User user,ShippingInfo shippingInfo){
  		ExecutorService pool = Executors.newSingleThreadExecutor();
           Runnable task1 = new SingelTask1();           
  		   pool.execute(task1);		   	   
  		    // 等待已提交的任务全部结束 不再接受新的任务
  		   pool.shutdown(); 
  	   }  	   
  		   
  	  public class SingelTask1 implements Runnable{ 		  
  		    @Override
  		    public synchronized void run() {
  		     System.out.println(Thread.currentThread().getName() + "正在执行…");
  		     
  		     try {
				Integer id = userService.queryMaxId();  		     
				   if(id == null || "".equals(id)){
					   id = 1001;
				   }else{
					   id = 1001 + id;
				   }
				   if(StringUtils.isBlank(user1.getUserid())){
					   user1.setUserid("c"+id);
					   shippingInfo1.setUserid(("c"+id));  
					   userService.insert(user1,shippingInfo1);
				   }else{
					   userService.insert(user1.getUserid(),user1); 
				   }
			} catch (Exception e) {
				Log.error("=========SingelTask1======= "+e.getMessage());
				e.printStackTrace();
			}	
  		       
  		     System.out.println(Thread.currentThread().getName() + "执行完毕");
  		   }
  		  
  	   }
  	  
  	  
  	  
  	  
  	  
  	  
  	  
  	  /**
  	   * 临时用户登录（主要用于新报价客户）
  	   * @param request
  	   * @param response
  	   * @return
  	   */
      @RequestMapping("/tempUserLogin.do")
      public String tempUserLogin(HttpServletRequest request,HttpServletResponse response){
		  
		  String loginEmail = "";
		  String userName = "";
		  try { 	      
	          String pwd = "";
	          /*
	           * 获取userInfo（加密的用户登录邮箱和密码）
	           */
    	      if(!(request.getParameter("userInfo") == null || "".equals(request.getParameter("userInfo")))){
    	    	  String userInfo = request.getParameter("userInfo").trim();
        	      String plainTxt = "";
        	      plainTxt = Base64Encode.getFromBase64(userInfo);  	
        	      String[] u = plainTxt.split("&");
        	      loginEmail = u[0];
        	      pwd = u[1];
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
    		  
    		  String str = userid +"&"+loginEmail +"&"+pwd +"&"+(user.getTempUser() == null ? "1" : user.getTempUser()).toString();
    		
    		  
    		  //存放cookie
    		  Cookie userCookie = new Cookie("userInfo",SecurityHelper.encrypt("userInfo", str));           
    		  userCookie.setPath("/");
    		  userCookie.setMaxAge(60*60*24*365);
    		  response.addCookie(userCookie);
    		  
    		  
    		  //客户登录信息存放到session
    		  HttpSession session = request.getSession();
    		  session.setAttribute("userInfo",SecurityHelper.encrypt("userInfo", str));
    		  session.setMaxInactiveInterval(60*60*24*365);
    		  
  			String str1 = request.getParameter("page");
  			String str2 = request.getParameter("pageSize");
  			String info = request.getParameter("info");
  			String begin = request.getParameter("beginDate");
  			String end = request.getParameter("endDate");
  		   
  		    int page = 1;
  			if(str1 != null) {
  				page = Integer.parseInt(str1);
  			}
  		    int pageSize = 10;   
  			if(str2 != null) {
  				pageSize = Integer.parseInt(str2);
  			}
  			int start = (page-1) * pageSize;  	  
  					   
  		List<QuotationBean> quotationInfos = quotationService.queryByUserid(info, begin, end, start, userid);
  		int total = quotationService.total(info, begin, end, userid);
  		SplitPage.buildPager(request, total, pageSize, page);
  		
  	
  			
  		request.setAttribute("userId", userid);
  		request.setAttribute("quotationInfos", quotationInfos);
    		  try {
				  LoginLog loginLog = new LoginLog();
				  loginLog.setLoginEmail(loginEmail);
				  loginLog.setLoginIp(request.getRemoteAddr());
				  loginLog.setLoginStatus(0);
				  loginLog.setLoginTime(DateFormat.format());
				  loginLog.setUsername(user.getUserName());
				  loginLogService.insertLoginLog(loginLog);
				} catch (Exception e) {
					Log.error("=========login========="+e.getMessage());
				}  		  
        return "/quotationList.jsp";
    		  
			} catch (Exception e) {
				try {
					LoginLog loginLog = new LoginLog();
					loginLog.setLoginEmail(loginEmail);
					User user = userService.queryByLoginMail(loginEmail);
					if(user != null || "".equals(user)){
						userName = user.getUserName();	
					}
					
					loginLog.setLoginFailTime(DateFormat.format());
					loginLog.setLoginIp(request.getRemoteAddr());
					loginLog.setLoginStatus(1);
					loginLog.setUsername(userName);
					loginLog.setErrorInfo(e.toString());
					loginLogService.insertLoginLog(loginLog);
				} catch (Exception e1) {
					e1.printStackTrace();
				}	
				return e.getMessage();
			}
		    		  
      }
  	  
  	  
  	  
  	  
  	  
  	  
  	  
  	  
  	  
  	  
  	  
  	  
  	  
  	  
  	  
  	  
  	  
  	  
  	  
  	  
}
