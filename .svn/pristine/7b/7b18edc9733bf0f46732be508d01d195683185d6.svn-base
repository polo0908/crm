package com.cbt.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;



public class WebCookie {
	public static String cookie(HttpServletRequest request,String cookiev){
		Cookie[] cookie= request.getCookies();
		if(cookie!=null){
			for (Cookie cookie2 : cookie) {
				if(cookie2.getName().equals(cookiev)){
					return cookie2.getValue();
				}
			}
		}
		return null;
	}
	
	
	
	public static String getSessionValue(HttpServletRequest request,String cookiev){
		HttpSession session = request.getSession();
		Object val = session.getAttribute(cookiev);
        if(val == null || "".equals(val)){
        	return null;
        }
		return val.toString();
	}
	
 
	/**
	 * 根据名字获取cookie
	 * @param request
	 * @param name cookie名字
	 * @return
	 */
	public static Cookie getCookieByName(HttpServletRequest request,String name){
		Map<String,Cookie> cookieMap = ReadCookieMap(request);
	    if(cookieMap.containsKey(name)){
	        Cookie cookie = cookieMap.get(name);
	        return cookie;
	    }else{
	        return null;
	    }   
	}
	/**
	 * 将cookie封装到Map里面
	 * @param request
	 * @return
	 */
	private static Map<String,Cookie> ReadCookieMap(HttpServletRequest request){
		Map<String,Cookie> cookieMap = new HashMap<String,Cookie>();
		Cookie[] cookies = request.getCookies();
		if(null!=cookies){
			for(Cookie cookie : cookies){
	            cookieMap.put(cookie.getName(), cookie);
	        }
		}
		return cookieMap;
	}
	
	 
	
	/**
	 * 判断用户是否登录
	 */
	public static  String[] getUser(HttpServletRequest request){
		    String user = WebCookie.getSessionValue(request, "userInfo");
		    if(user == null || "".equals(user)){
		    	user = WebCookie.cookie(request, "userInfo");
		    }		  
		    String[] userInfo = null;
		    if(user != null && !"".equals(user)){
		    try {
				user = SecurityHelper.decrypt("userInfo", user);
			    userInfo = user.split("&");
			    } catch (Exception e) {
				 e.printStackTrace();
			    }
		    }
			return userInfo;
	}
	
	// 从cookies中获取userid
	public static String getUserid(HttpServletRequest request){
		
		 String userid = null;
		 String user = WebCookie.getSessionValue(request, "userInfo");
		    if(user == null || "".equals(user)){
		    	user = WebCookie.cookie(request, "userInfo");
		    }		  
		 if(user != null && !"".equals(user)){
			 try {
				user = SecurityHelper.decrypt("userInfo", user);
				String[] userInfo = user.split("&");
				userid = userInfo[0];
			    } catch (Exception e) {
				 e.printStackTrace();
			    }
			 

		}
		
		return userid;		
	}
	// 从cookies中获取loginEmail
	public static String getLoginEmail(HttpServletRequest request){
		
		 String loginEmail = "";
		 String user = WebCookie.getSessionValue(request, "userInfo");
		    if(user == null || "".equals(user)){
		    	user = WebCookie.cookie(request, "userInfo");		    	
		    }		  
		 if(user != null && !"".equals(user)){
			 
		    try {
				user = SecurityHelper.decrypt("userInfo", user);
				String[] userInfo = user.split("&");
				loginEmail = userInfo[1];
				} catch (Exception e) {
				  e.printStackTrace();
				} 

		} 
		return loginEmail;		
	}
	
	
	
	// 从cookies中获取用户密码的信息
		public static String getPwd(HttpServletRequest request){

		   String pwd = "";
		   String userStr = WebCookie.getSessionValue(request, "userInfo");
		    if(userStr == null || "".equals(userStr)){
		    	userStr = WebCookie.cookie(request, "userInfo");
		    }		  
			if (!("".equals(userStr) || userStr == null)) {
				 try {
					    userStr = SecurityHelper.decrypt("userInfo", userStr);
						String[] userInfo = userStr.split("&");
						pwd = userInfo[2];
					} catch (Exception e) {
					  e.printStackTrace();
					} 
				
			} 
			
			return pwd;		
		}
		
		
		
		
		
		// 从session中获取访问链接
		public static Object getPayUrl(HttpServletRequest request){
		
			HttpSession session = request.getSession();
			Object url = session.getAttribute("payUrl");							
			return url;		
		}
		
		
		
}
