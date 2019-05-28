package com.cbt.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;



/**
 * @Description 判断过滤器放开的链接是否登录，未登录，跳转注册页
 * @author POLO
 * @Date 2017年7月28日
 * @Version v1.0
 */
public final class JudgmentLoginUtil {
   
	
	
	 public static boolean identify(HttpServletRequest request){
			//检查Cookie中是否有Token 没有就去登录
			Cookie[] cookies = request.getCookies();
			Cookie token = null;
			if(cookies != null){
			for(Cookie cookie :cookies){
				if(cookie.getName().equals("token")){
					token = cookie;
					break;
				}			
			}
		   }
		
			
			if(token == null){
				//如果没有找到，就重定向到登录界面
				String path = request.getContextPath();
				String registerURL = path+"/c_register.jsp";
				return false;
			}
			//处理token是否合格
			String value = token.getValue();
			String[] data = value.split("\\|");
			String time = data[0];
			String md5 = data[1];
			if(md5.equals(Md5Util.encoder(time))){
				return true;
			}
			//如果token验证不合理，去登录页面
			String path = request.getContextPath();
			String registerURL = path+"/c_register.jsp";
			return false;
			
	}
}