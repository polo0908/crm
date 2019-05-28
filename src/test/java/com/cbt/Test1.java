package com.cbt;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.cbt.dao.ClientDrawingsDao;
import com.cbt.dao.ClientOrderDao;
import com.cbt.dao.ReOrderDao;
import com.cbt.dao.ReOrderDrawingsDao;
import com.cbt.dao.ShippingInfoDao;
import com.cbt.dao.UserDao;
import com.cbt.entity.ClientDrawings;
import com.cbt.entity.ClientOrder;
import com.cbt.entity.ReOrder;
import com.cbt.entity.ReOrderDrawings;
import com.cbt.entity.ShippingInfo;
import com.cbt.entity.User;
import com.cbt.service.ClientDrawingsService;
import com.cbt.util.Md5Util;



public class Test1 {

	@Test
	
	public void queryClientOrder(){
		
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		System.out.println(ac);
		
		ClientOrderDao clientOrderdao = ac.getBean(ClientOrderDao.class);
		
		ClientOrder clientOrder  = clientOrderdao.queryByInvoiceId("SHS12001A");
		
        System.out.println(clientOrder);
	}
	@Test
	
	public void queryClient(){
		
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("spring-mybatis.xml");

		
		ClientOrderDao clientOrderdao = ac.getBean(ClientOrderDao.class);
		
		ClientOrder clientOrder  = clientOrderdao.queryById(1);
		
		System.out.println(clientOrder);
	}
	@Test
	
	public void queryShippingInfo(){
		
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		
		
		ShippingInfoDao s = ac.getBean(ShippingInfoDao.class);
		
		ShippingInfo shippingInfo  = s.queryByUserId("10000");
		
		System.out.println(shippingInfo);
	}
	@Test
	
	public void queryClientByOrderId(){
		
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		
		
		ClientOrderDao clientOrderdao = ac.getBean(ClientOrderDao.class);
		String[] str = {"O201610110001","O201610110002"};
		List<ClientOrder> clientOrder  = clientOrderdao.queryListByOrderIds(str);
		
		System.out.println(clientOrder);
	}

	@Test
	public void total(){
		
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		
		ClientOrderDao clientOrderdao = ac.getBean(ClientOrderDao.class);
		
		int total = clientOrderdao.total("10000",0);
		
		System.out.println(total);
	}
	@Test
	
	public void updateById(){
		
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("spring-mybatis.xml");

		
		ReOrderDao reOrderdao = ac.getBean(ReOrderDao.class);
		
		ReOrder reorder = reOrderdao.queryById(28);

		System.out.println(reorder);
	}
	@Test
	
	public void queryById(){
		
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		
		
		ClientDrawingsDao clientDrawingsDao = ac.getBean(ClientDrawingsDao.class);
		
		List<ClientDrawings> draw = clientDrawingsDao.queryListByOrderId("O201610110001");	
		//ClientDrawings d = clientDrawingsDao.queryById(1);
		
		
        System.out.println(draw);
	}
	@Test
	
	public void queryByIds(){
		
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("spring-mybatis.xml","spring-service.xml");
		
		
		ClientDrawingsService clientDrawingsService = ac.getBean(ClientDrawingsService.class);
		Integer[] ids = {2,3,4};
		List<ClientDrawings> draw = clientDrawingsService.queryListByIds(ids);
		//ClientDrawings d = clientDrawingsDao.queryById(1);
		
		
		System.out.println(draw);
	}
	
	@Test
      public void queryByKey(){
		
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		
		
		ClientDrawingsDao clientDrawingsDao = ac.getBean(ClientDrawingsDao.class);
	

	}	
	@Test
	public void queryUser(){
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		UserDao userDao = ac.getBean(UserDao.class);
		User user = userDao.queryByUserId("10000");
		System.out.println(user);
	}
	@Test
	public void insertUser(){
		String loginURL = "http://192.168.1.202:8080/crm/login.jsp";
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		UserDao userDao = ac.getBean(UserDao.class);
		List<Object> list = new ArrayList<Object>();
		User u = new User();
		  u.setEmail("");
		  u.setTel("136");
		  u.setUserid("10036");
		  //密码为随机数通过Md5加密
		  Random random =new Random();
		  String r = random.toString();
		  r = Md5Util.encoder(r);
		  u.setPwd(r);
		  u.setUserName("ada");
		  
		  long time = System.currentTimeMillis();
	  	  Date date = new Date(time);    	
	  	  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	  	  String updateTime = sdf.format(date);
		  u.setUpdateTime(updateTime);
		  String token = loginURL + "?" + "userId=" + u.getUserid() + "&" + "pwd=" + u.getPwd();
		  u.setToken(token);
		  list.add(u);
		  userDao.insertUser(list);
		  
	}
	
	@Test
	public void insert(){
		
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		
		ReOrderDrawingsDao reOrderDrawingsDao = ac.getBean(ReOrderDrawingsDao.class);
		
    	ArrayList<Map<Object, Object>> list = new ArrayList<Map<Object,Object>>();  
    	 
    	Map<Object,Object> map= new HashMap<Object,Object>();   	
		map.put("userId", "1000");
		map.put("oldOrderId", 10);
		map.put("projectName", "aaaa");
		map.put("drawingsPath", "sdfdsf");
		map.put("drawingsName", "11111111");
		map.put("drawingState", "YES");
		long time = System.currentTimeMillis();
    	Date date = new Date(time); 
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	String t = sdf.format(date);
//    	System.out.println(t);
//		Timestamp ts = new Timestamp(time);
//		System.out.println(ts);
//		ts = Timestamp.valueOf(t);
		
		map.put("requiredTime", t);
		map.put("comments", "");
		Random random = new Random();
		int r = random.nextInt(1000);
		map.put("quantity", r);
		map.put("unitPrice", 3.5);
		map.put("moldPrice", 5.9);
//    	List<ReOrderDrawings> list = new ArrayList<ReOrderDrawings>();
//    	ReOrderDrawings reOrderDrawings = new ReOrderDrawings();
//    	reOrderDrawings.setComments("1");
//    	
//		list.add(map);
		Map<Object,Object> map1= new HashMap<Object,Object>(); 
		map1.put("reOrderId", 20);
		map1.put("userId", "1000");
		map1.put("oldOrderId", 10);
		map1.put("projectName", "4234");
		map1.put("drawingsPath", "sdfdsf");
		map1.put("drawingsName", "11111111");		
		map1.put("requiredTime", t);
		map1.put("comments", "");
		map1.put("quantity", r);
		map1.put("unitPrice", 3.5);
		map1.put("moldPrice", 5.9);
		map1.put("drawingState", "YES");
		list.add(map1);
		
		reOrderDrawingsDao.insertReOrders(list);
		System.out.println(list);
	}	
	
	@Test
	public void insert1() throws ParseException{
		
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		
		ReOrderDao reOrderDao = ac.getBean(ReOrderDao.class);
		
		ReOrder reOrder = new ReOrder();
		long time = System.currentTimeMillis();
    	String t = "2011-07-09";
//    	java.text.SimpleDateFormat   formatter   =  new   SimpleDateFormat( "yyyy-MM-dd ");
//    	Date   date   =   formatter.parse(t);
//    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//    	String xx = sdf.format(t);
		System.out.println(t);
		reOrder.setRequiredTime(t);
		reOrder.setComments("23432");
		reOrder.setUserid("12342");
		reOrder.setTotalAmount(36.3);
		reOrder.setReOrderState(1);
		reOrder.setCreateTime(t);
		
		reOrderDao.insertReOrder(reOrder);
	}
	@Test
	public void testDrawings(){
		
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		
		
		ClientDrawingsDao clientDrawingsDao = ac.getBean(ClientDrawingsDao.class);
		ReOrderDao reOrderDao = ac.getBean(ReOrderDao.class);
		ReOrderDrawingsDao reOrderDrawingsDao = ac.getBean(ReOrderDrawingsDao.class);
		ReOrder reOrder = new ReOrder();
        ArrayList<Map<Object, Object>> list = new ArrayList<Map<Object,Object>>();
        Map<Object,Object> map= new HashMap<Object,Object>(); 
		Integer[] ids = {2,3,4};
		List<ClientDrawings> draw = clientDrawingsDao.queryListByIds(ids);
		System.out.println(draw);
		for(int i=0;i<ids.length;i++){
			for(ClientDrawings c:draw){
	            
	      map.put("userId", c.getUserid());
	      map.put("projectName", c.getProjectName());
	      map.put("drawingPath", c.getDrawingsPath());
	      list.add(map); 
	      reOrderDrawingsDao.insertReOrders(list);
			}
		}
		    
	}
	@Test
       public void queryfjksdId(){
    	   ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("spring-mybatis.xml");
    	   ReOrderDao reOrderDao = ac.getBean(ReOrderDao.class);
		   System.out.println(ac);
	}
	
	@Test
	 public void updateDrawings(){
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		ClientDrawingsDao clientDrawingsDao = ac.getBean(ClientDrawingsDao.class);
		ClientDrawings clientDrawing = clientDrawingsDao.queryById(4);
        clientDrawing.setDrawingsName("dfgdg");
		long time = System.currentTimeMillis();
    	Date date = new Date(time); 
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	String t = sdf.format(date);
    	clientDrawing.setDrawingState("YES");
        clientDrawingsDao.updateClientDrawings(clientDrawing);
	    System.out.println(clientDrawing);
	}
	
	
	@Test
	public void ReceiveDataPort(){
	ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("spring-mybatis.xml");
	ClientOrderDao clientOrderDao = ac.getBean(ClientOrderDao.class);
	ClientDrawingsDao clientDrawingDao = ac.getBean(ClientDrawingsDao.class);
	UserDao userDao = ac.getBean(UserDao.class);
	
	List<Object> list = new ArrayList<Object>();  
	 
	Map<Object,Object> map= new HashMap<Object,Object>();   	
//	Map<Object,Object> map3 = {amount=3541.00, createTime=2015-10-25 09:56:01.33, customerId=34, caseStatus=14, saildate=, orderId=SHS11426};
	ClientOrder clientOrder = new ClientOrder();
	clientOrder.setAmount(200.00);
	long time = System.currentTimeMillis();
	Date date = new Date(time); 
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String t = sdf.format(date);
	clientOrder.setPoPath("");
//	clientOrder.setInvoicePath("");
	clientOrder.setQcReportPath("");
	clientOrder.setShippingDocPath("");
	clientOrder.setOrderId("440");
	clientOrder.setOrderStatus(2);
	clientOrder.setUserid("dsfsd");
	
//	map.put("userid", "1000");
//	map.put("orderId", "O201610110030");
//	map.put("amount", 200.00);
//	map.put("orderStatus",1);
//	long time = System.currentTimeMillis();
//	Date date = new Date(time); 
//	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//	String t = sdf.format(date);
//	map.put("createTime", t);
//	map.put("outputTime", t);
//	map.put("term", "dshfk");
//	map.put("poPath", "21312");
//	map.put("invoicePath", "21312");
//	map.put("qcReportPath", "21312");
//	map.put("shippingDocPath", "21312");
	list.add(clientOrder);
	ClientOrder clientOrder1 = new ClientOrder();
	clientOrder.setAmount(200.00);
	clientOrder1.setPoPath("");
//	clientOrder1.setInvoicePath("");
	clientOrder1.setQcReportPath("");
	clientOrder1.setShippingDocPath("");
	clientOrder1.setOrderId("476");
	clientOrder1.setOrderStatus(2);
	clientOrder1.setUserid("dsfsd");
//	list.add(clientOrder1);
	System.out.println(list);
//	clientOrderDao.insertClientOrder(clientOrder);
	clientOrderDao.insertClientOrders(list);

	List<Object> list3 = new ArrayList<Object>();
	User u = new User();
	u.setEmail("");
   Random random =new Random();
   String r = random.toString();
   r = Md5Util.encoder(r);
   u.setPwd(r);
   u.setTel("");
   u.setUpdateTime(t);
   u.setUserid("10000");
   u.setUserName("asd");
   list3.add(u);
   System.out.println(list3);
   userDao.insertUser(list3);
   
   
   List<Object> list4 = new ArrayList<Object>();
   ClientDrawings c = new ClientDrawings();
   c.setDrawingsName("dfgfdg");
   c.getDrawingsPath();
   c.setMoldPrice(0.5);
   c.setOrderId("43244532");
   c.setProjectCname("分就开始对");
   c.setProjectName("name");
   c.setUnitPrice(4.9);
   c.setUserid("10000");
   list4.add(c);
   System.out.println(list4);
   clientDrawingDao.insertClientDrawings(list4);
  
	}
	
	@Test
	public void test(){
		String date = "2016-10-11 06:45:01.0";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date time;
		try {
			time = sdf.parse(date);
			String currentTime = sdf.format(time);
			System.out.println(currentTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}
	
	
	
//	@Test
//	 public void getCurrentQuarter(){
//		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("spring-mybatis.xml");
//		ClientOrderDao clientOrderDao = ac.getBean(ClientOrderDao.class);
//		Map<Object, Object> currentQuarter = clientOrderDao.currentQuarter();
//		currentQuarter.get("sum_amount");
//		System.out.println(currentQuarter.get("sum_amount"));
//	}
	
	
	
	
}
