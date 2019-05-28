package com.cbt.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cbt.entity.User;
import com.cbt.entity.UserRelationEmail;
import com.cbt.service.UserRelationEmailService;
import com.cbt.service.UserService;
import com.cbt.util.WebCookie;

@Controller
public class PersonalInfoController {

	@Resource
    private UserService userService;
	
	@Resource
	private UserRelationEmailService userRelationEmailService;
	
	public static final Logger Log = Logger.getLogger(PersonalInfoController.class);
			
	
	@RequestMapping("/resetPassword.do")
	public String resetPassword(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String[] userInfo = WebCookie.getUser(request);
		if (userInfo.length != 0) {
			request.setAttribute("userId", userInfo[0]);			
			return "reset.jsp";
		} else {
			throw new Exception("获取用户失败!");
		}
	}
	
	
	/**
	 * 更新后台用户密码
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/resetCustomerPwd.do")
	public JsonResult<String> resetBackUserPwd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			String email = null;
			if (!(request.getParameter("email") == null || "".equals(request.getParameter("email")))) {
				email = request.getParameter("email");
			} else {
				throw new Exception("Failed to get email");
			}
			UserRelationEmail userRelationEmail = userRelationEmailService.queryUseridByEmail(email);

			String oldPwd = "";
			if (!(request.getParameter("oldPwd") == null || "".equals(request.getParameter("oldPwd")))) {
				oldPwd = request.getParameter("oldPwd");
			} else {
				throw new Exception("Failed to get the original password");
			}
			
			String password = "";
			if (!(request.getParameter("password") == null || "".equals(request.getParameter("password")))) {
				password = request.getParameter("password");
			} else {
				throw new Exception("Failed to get new password");
			}

			if(!(oldPwd.equals(userRelationEmail.getPwd()))){
				throw new Exception("The original password was entered incorrectly");
			}

			userRelationEmail.setPwd(password);
			userRelationEmailService.updateUserRelationEmail(userRelationEmail);
			return new JsonResult<String>(0,"success");
		} catch (Exception e) {			
			e.printStackTrace();
			Log.error("===============PersonalInfoController   resetBackUserPwd==============="+e.getMessage());
			return new JsonResult<String>(1,e.getMessage());	
		}
	}

}
