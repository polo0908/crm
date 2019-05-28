package com.cbt.controller;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.cbt.entity.ClientOrder;
import com.cbt.entity.Test;
import com.cbt.service.ClientOrderService;
import com.cbt.service.TestService;
import com.cbt.util.DateFormat;



@Controller 
public class TestController {
	
  @Resource
  private TestService testService;
  @Resource
  private ClientOrderService clientOrderService;

  
  public static final Logger Log = Logger.getLogger(TestController.class);
  
  @RequestMapping("/test.do")
  public String addTest(HttpServletRequest request, HttpServletResponse response) throws Exception{
	  
	  try {
		  List<ClientOrder> list = clientOrderService.queryCurrentTest();
		  Test test = new Test();
		  test.setCreateTime(DateFormat.format());
		  testService.insert(test);
		  request.setAttribute("clientOrders", list);
	} catch (Exception e) {
		e.printStackTrace();
	}
	  return "test.jsp";
  }

  
}
