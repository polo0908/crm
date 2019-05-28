package com.cbt.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.cbt.entity.User;
import com.cbt.service.NbMailCountryService;
import com.cbt.service.ShippingInfoService;
import com.cbt.service.UserService;
import com.cbt.util.DateFormat;
import com.cbt.util.JsonUtil;
import com.cbt.util.SerializeUtil;


/**
 * 动态获取数据，并存入数据库
 * @author polo
 *
 */
@Controller
@RequestMapping("/port")
public class ReceiveShippingInfoPort {
 
	  @Resource
	  private ShippingInfoService shippingInfoService;
	  @Resource
	  private UserService userService;
	  @Resource
	  private NbMailCountryService nbMailCountryService;
	  
        @ResponseBody
	    @RequestMapping(value ="/receiveShippingInfo.do",method = RequestMethod.POST)	  
	   public String queryAllClientOrder(@RequestParam Map<String,String> map)throws Exception{
	 
		  
        try {
	//		  String jsonStr = "[{"address":"","address1":"","address2":"","cid":244,"city":"","country":"1","email1":"matthias.schulz@smegroup.eu","email2":"","email3":"","email4":"","email5":"","fax":"","firstJob":"Head of Strategic Purchasing","firstName":"Matthias Schulz","gsFullName":"SME GmbH","info":"","mostRecognize":"Earthing plate, stainless steel","otherName1":"","otherName2":"","postCode":"","recognize":"","siteUrl":"","state":"","tel":"","tel1":"","tel2":"","tel3":""}]";
			  //将json数据反序列化为map格式
			  String jsonStr = map.get("Customer");
			  List<Object> list = (List<Object>)JsonUtil.jsonToObject(jsonStr, Object.class);
		       //创建存放对象的list集合
			  List<Object> list1 = new ArrayList<Object>();
			  List<Object> list2 = new ArrayList<Object>();
			  
			  for (Object c : list) {
				 String str = null;
				 str = c.toString();
		         //循环list先将底层map转换为json字符串，再反序列化为map
				 Map<Object, Object> cl = SerializeUtil.JsonToMap(str);
//	             ShippingInfo s = new ShippingInfo();
	             User user = new User();
	             
	             if(!(cl.get("eid") == null || "".equals(cl.get("eid")))){
//					  ShippingInfo shippingInfo = shippingInfoService.queryByUserId(cl.get("eid").toString());
//					  if(!(shippingInfo == null || "".equals(shippingInfo))){
//						 continue; 
//					  }
					  User u = userService.queryByUserId(cl.get("eid").toString());
					  if(!(u == null || "".equals(u))){
							 continue; 
					   }
//					  s.setUserid(cl.get("eid").toString());
					  user.setUserid(cl.get("eid").toString());
				  }
				 if(!(cl.get("cid") == null || "".equals(cl.get("cid")))){
//					  Integer i = (Integer)cl.get("cid");
//					   s.setCid(i);				  
				  }				
				  if(!(cl.get("firstName") == null || "".equals(cl.get("firstName")))){
//					  s.setUserName((String) cl.get("firstName"));
					  user.setUserName((String) cl.get("firstName"));
				  }
				  if(!(cl.get("firstJob") == null || "".equals(cl.get("firstJob")))){
//					  s.setJob((String) cl.get("firstJob"));				  
				  }
				  if(!(cl.get("gsFullName") == null || "".equals(cl.get("gsFullName")))){
//					  s.setCompanyName((String) cl.get("gsFullName"));	
					  user.setCompanyName((String) cl.get("gsFullName"));
				  }
//				  if(!(cl.get("otherName1") == null || "".equals(cl.get("otherName1")))){
//					  s.setOtherName1((String) cl.get("otherName1"));				  
//				  }
//				  if(!(cl.get("otherName2") == null || "".equals(cl.get("otherName2")))){
//					  s.setOtherName2((String) cl.get("otherName2"));				  
//				  }
				  if(!(cl.get("email1") == null || "".equals(cl.get("email1")))){
//					  s.setRegisterEmail((String) cl.get("email1"));
					  user.setEmail((String) cl.get("email1"));
					  user.setLoginEmail((String) cl.get("email1"));
				  }
				  if(!(cl.get("email2") == null || "".equals(cl.get("email2")))){
//					  s.setContactEmail((String) cl.get("email2"));	
					  user.setEmail1((String) cl.get("email2"));
				  }
//				  if(!(cl.get("address") == null || "".equals(cl.get("address")))){
//					  s.setDetailedAddress((String) cl.get("address"));				  
//				  }
//				  if(!(cl.get("address1") == null || "".equals(cl.get("address1")))){
//					  s.setAddress1((String) cl.get("address1"));				  
//				  }
//				  if(!(cl.get("address2") == null || "".equals(cl.get("address2")))){
//					  s.setAddress2((String) cl.get("address2"));				  
//				  }
//				  if(!(cl.get("country") == null || "".equals(cl.get("country")))){
//					  Integer id = Integer.parseInt((String)cl.get("country"));
//					  NbMailCountry country = nbMailCountryService.queryById(id);				  
//					  s.setCountry(country.getCountry());				  
//				  }
//				  if(!(cl.get("state") == null || "".equals(cl.get("state")))){
//					  s.setState((String) cl.get("state"));				  
//				  }
//				  if(!(cl.get("city") == null || "".equals(cl.get("city")))){
//					  s.setCity((String) cl.get("city"));				  
//				  }
//				  if(!(cl.get("postCode") == null || "".equals(cl.get("postCode")))){
//					  s.setPostcode((String) cl.get("postCode"));				  
//				  }
				  if(!(cl.get("tel") == null || "".equals(cl.get("tel")))){
//					  s.setTelephone1((String) cl.get("tel"));	
					  user.setTel((String) cl.get("tel"));
				  }
//				  if(!(cl.get("tel1") == null || "".equals(cl.get("tel1")))){
//					  s.setTelephone2((String) cl.get("tel1"));				  
//				  }
//				  if(!(cl.get("tel2") == null || "".equals(cl.get("tel2")))){
//					  s.setMobilePhone1((String) cl.get("tel2"));				  
//				  }
//				  if(!(cl.get("tel3") == null || "".equals(cl.get("tel3")))){
//					  s.setMobilePhone2((String) cl.get("tel3"));				  
//				  }
//				  if(!(cl.get("fax") == null || "".equals(cl.get("fax")))){
//					  s.setFax((String) cl.get("fax"));				  
//				  }
//				  if(!(cl.get("siteUrl") == null || "".equals(cl.get("siteUrl")))){
//					  s.setSiteUrl((String) cl.get("siteUrl"));				  
//				  }
				  
				  user.setCreateTime(DateFormat.format());
				  
//				  list1.add(s); 
				  
				//密码为随机数通过Md5加密
				  user.setPwd("123456");				  
				  user.setUpdateTime(DateFormat.format());	
			      user.setToken("");
				  list2.add(user);
			  }
	       
			  userService.insertUser(list2,list1);
			  System.out.println("=============更新成功=============");
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e.getMessage());
		}
		  
		  return "SUCCESS";
	  }
      

      
      
	  
}
