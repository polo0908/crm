package com.cbt.controller;


import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cbt.entity.RfqInfo;
import com.cbt.entity.User;
import com.cbt.entity.UserRelationEmail;
import com.cbt.service.ClientOrderService;
import com.cbt.service.RfqInfoService;
import com.cbt.service.UserRelationEmailService;
import com.cbt.service.UserService;
import com.cbt.util.Client;
import com.cbt.util.SerializeUtil;

/**
 * 提供给其他系统的数据同步接口
 * @author polo
 * 2017年6月22日
 */
@Controller
@RequestMapping("/port")
public class SendDataPort {
	

	  private static final Logger LOG = Logger.getLogger(SendDataPort.class);	
	  private int count = 0;  //报错后运行一次
	  
	  @Resource
	  private ClientOrderService clientOrderService;
	  @Resource
	  private RfqInfoService rfqInfoService;
	  @Resource
	  private UserService userService;
	  @Resource
	  private UserRelationEmailService userRelationEmailService;


	  
	  
	  /**
	   * 发送报价单消息到后台报价系统
	   * @author polo
	   * 2017年5月27日
	   *
	   */
	  @ResponseBody
	  @RequestMapping("/sendClientMessage.do")	 
	  public String sendClientMessage(HttpServletRequest request,HttpServletResponse response){
		    
				String projectId = request.getParameter("projectId");
				String messageDetails = request.getParameter("messageDetails");		
				Integer id = null;
				if(!(StringUtils.isBlank(request.getParameter("id")))){
					id = Integer.parseInt(request.getParameter("id"));
				}
				String attachmentPath = request.getParameter("attachmentPath");
				String userId = request.getParameter("userId");
				
				String fileName = null;
				if(!(attachmentPath == null || "".equals(attachmentPath))){
				      File tempFile =new File(attachmentPath.trim());  		      
				      String name = tempFile.getName();
				      String[] split = name.split("&");
				      if(split.length != 0){
				    	  fileName = split[0]+"."+FilenameUtils.getExtension(attachmentPath); 
				      }
				}				
				
//				String downloadUrl = "http://192.168.1.54:8080/supplier/fileDownload_quotation_attachment.do?id="+id;
				
				    PrintWriter out1 = null;
			        BufferedReader in1 = null;
			        String result2 = "";
			        try {    			        	
						projectId = URLEncoder.encode(projectId, "utf-8"); 
						messageDetails = URLEncoder.encode(messageDetails, "utf-8");						
						
			            URL realUrl1 = new URL("http://112.64.174.34:43887/New-Quotation/helpServlet?action=addcomment1&className=CommentListServlet");
			            // 打开和URL之间的连接
			            URLConnection conn1 = realUrl1.openConnection();
			            // 设置通用的请求属性
			           // conn1.setRequestProperty("accept", "*/*");
					    conn1.setRequestProperty("connection", "Keep-Alive");
			            conn1.setRequestProperty("user-agent",
			                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
			            // 发送POST请求必须设置如下两行
			            conn1.setDoOutput(true);
			            conn1.setDoInput(true);
			            // 获取URLConnection对象对应的输出流
			            out1 = new PrintWriter(conn1.getOutputStream());
			            // 发送请求参数
			            out1.print("&&messageDetails="+messageDetails+"&&projectId="+projectId+"&&fileId="+id+"&&eid"+userId+"&&fileName="+fileName);
			            // flush输出流的缓冲
			            out1.flush();
			            // 定义BufferedReader输入流来读取URL的响应
			            in1 = new BufferedReader(
			                    new InputStreamReader(conn1.getInputStream()));
			            String line;
			            while ((line = in1.readLine()) != null) {
			                result2 += line;
			            }
			          
			            LOG.info("《《《《发送消息成功》》》》"+result2);   
			            return "YES";
			        } catch (Exception e) {
			            System.out.println("发送 POST 请求出现异常！"+e);
			            e.printStackTrace();
			            LOG.info("《《《《发送消息失败》》》》"+e.getMessage());
			                count = count+1;
			                if(count < 2){
							sendClientMessage(request,response);
			                }
			            return "NO";
			        }
			        		        
			        //使用finally块来关闭输出流、输入流
			        finally{
			            try{
			                if(out1!=null){
			                    out1.close();
			                }
			                if(in1!=null){
			                    in1.close();
			                }
			            }
			            catch(IOException ex){
			                ex.printStackTrace();
			            }
								
			        }
	  }
	  
	  
	  
	  
	  
	  
	  /**
	   * 同步新图纸询盘到NBMail（传输到NBMail的接口）
	   * @param request
	   * @param response
	   */
	  @ResponseBody
	  @RequestMapping("/rfqSYNC.do")	  
	  public void rfqSYNC(HttpServletRequest request,HttpServletResponse response){

	    try {	  
	    	 String result = request.getParameter("result");
	    	 if(!(StringUtils.isBlank(request.getParameter("id")))){
	    		 Integer id = Integer.parseInt(request.getParameter("id"));
	    		 RfqInfo rfqInfo = rfqInfoService.queryById(id);
	    		 if(!(rfqInfo.getDrawingName() == null || "".equals(rfqInfo.getDrawingName()))){  			 
	    			 result = result + "&&drawingName="+rfqInfo.getDrawingName()+"&&id="+id;
	    		 }
	    	 }
	         if(!(StringUtils.isBlank(result))){
	        	 String message = Client.sendMessage("http://112.64.174.34:43887/NBEmail/helpServlet?action=newrequirementsofoldcustomers&className=ExternalInterfaceServlet", result);
	       
	         
	        	 LOG.info("发送新图纸询盘："+message);
	         }
	    	 	         
	        } catch (Exception e) {
	            System.out.println("发送 POST 请求出现异常！"+e);
	            e.printStackTrace();
	        }

	  }
	  
	  
	  
	  
	  
	     /**
	      * 获取新图纸邮件和下载附件数据
	      * @param map
	      * @return
	     * @throws UnsupportedEncodingException 
	      * @throws Exception
	      */
	     @ResponseBody
		 @RequestMapping(value ="/receiveNewRFQEmail.do",method = RequestMethod.POST)	  
		 public JsonResult<Map<Object,Object>> receiveNewRFQEmail(HttpServletRequest request,HttpServletResponse response){ 	  
	         	    	 
	    	 try {
				String projectId = request.getParameter("projectId");	  
				 Map<Object, Object> map = new HashMap<Object, Object>();
				 if(!(StringUtils.isBlank(projectId))){
				    String message = Client.sendMessage("http://112.64.174.34:43887/New-Quotation/helpServlet?action=originalContent&className=QuotationNewQuotesServlet", "&&projectId="+projectId);
				   
				    if("NO".equals(message) || "".equals(message) || message == null){
				    	
				    }else{
				    	Map<Object, Object> jsonToMap = SerializeUtil.JsonToMap(message);	
				        String content = URLDecoder.decode(jsonToMap.get("content").toString(),"utf-8");
				        map.put("content", content);
				        map.put("attachmentName", URLDecoder.decode(jsonToMap.get("attachmentName").toString(),"utf-8"));
				    }

				 }	    	 
				 return new JsonResult<Map<Object,Object>>(map);
			} catch (Exception e) {
				e.printStackTrace();
				LOG.error("===============receiveNewRFQEmail====获取报价原始邮件失败==="+e.getMessage());
				return new JsonResult<Map<Object,Object>>(1,"获取失败");
			}
	    	 
	     }
	  
	  
	  
	  
	     /**
		   * 发送注册成功邮件
		   * @param request
		   * @param response
		   */
		  @ResponseBody
		  @RequestMapping("/sendInfoToCustomer.do")	  
		  public void sendInfoToCustomer(HttpServletRequest request,HttpServletResponse response){

		    try {	  
		    	 String loginEmail = request.getParameter("loginEmail");
		    	 String title = "";
		    	 String content = "";
		    	 String result = "";
		    	 if(StringUtils.isNotBlank(loginEmail)){                     
		    		UserRelationEmail userRelationEmail = userRelationEmailService.queryUseridByEmail(loginEmail);
		    		title = "Welcome to register importX";
		    	    content = "Dear Sir/Madam,<br>"+
		    		          "You have successfully registered, please remember your account password!<br>"+
		    	    		  "Your account:"+userRelationEmail.getEmail()+"<br>"+
		    		          "Your Password:"+userRelationEmail.getPwd()+"<br>"+
		    	              "Best regards<br>"+ 
		    		          "ImportX<br>";
                    String email = userRelationEmail.getEmail();
                    content = URLEncoder.encode(content, "UTF-8");
                    result = "&&email="+email+"&&title="+title+"&&content="+content;
                   
		    	 }
		         if(!(StringUtils.isBlank(result))){
		        	 Client.sendMessage("http://112.64.174.34:43887/NBEmail/helpServlet?action=SendEmail1&className=ExternalInterfaceServlet", result);
		         }
		    	 
		        } catch (Exception e) {
		            System.out.println("发送 POST 请求出现异常！"+e);
		            e.printStackTrace();
		        }

		  }
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
}
