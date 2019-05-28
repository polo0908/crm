package com.cbt.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.cbt.entity.ReOrder;
import com.cbt.service.ReOrderDrawingsService;
import com.cbt.service.ReOrderService;
import com.cbt.service.UserService;
import com.cbt.util.SplitPage;
import com.cbt.util.WebCookie;



@Controller 
public class ReOrderController {
  @Resource
  private ReOrderService reOrderService;
  @Resource
  private UserService userService;
  @Resource
  private ReOrderDrawingsService reOrderDrawingsService;

  /**
   * 获取 reorder表数据，返回前台显示
   * @param request
   * @param response
   * @return
   */
  @RequestMapping("/queryAllReOrder.do")
  public String queryAllReOrder(HttpServletRequest request, HttpServletResponse response){
	   String userId = WebCookie.getUserid(request);
	   if(userId == null || "".equals(userId)){
		 return "login.jsp";		  
	   }
	   String str1 = request.getParameter("page");
	   String str2 = request.getParameter("pageSize");
//	   String status = request.getParameter("orderStatus");
	   int orderStatus = 0;//(status:In Process)
	   int page = 1;
		if(str1 != null) {
			page = Integer.parseInt(str1);
		}
		int pageSize = 10;
		if(str2 != null) {
			pageSize = Integer.parseInt(str2);
		}
		int start = (page-1) * pageSize;	   

		List<ReOrder> list = reOrderService.queryByUserId(userId);
		int total = reOrderService.totalAmount(userId);
		SplitPage.buildPager(request, total, pageSize, page);
		request.setAttribute("reOrder", list);
//		System.out.println(list);
	   return "reOrder_order.jsp";
  }
  
    

	
}
