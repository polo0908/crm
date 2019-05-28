//package com.cbt.aop;
//
//import org.apache.log4j.Logger;
//import org.aspectj.lang.ProceedingJoinPoint;
//import org.aspectj.lang.annotation.Around;
//import org.aspectj.lang.annotation.Aspect;
//import org.springframework.stereotype.Component;
//
//import com.cbt.controller.JsonResult;
//
//
///**
// * 
// * 利用Spring AOP统一处理控制器异常
// *
// */
//@Component
//@Aspect  //控制器异常处理切面
//public class ControllerExceptionAspect {
//	     
//	        public static Logger logger = Logger.getLogger(ControllerExceptionAspect.class);
//	
//	         @Around("bean(clientOrderController)"+"bean(clientDrawingsController)"
//	        		 +"bean(fileUploadController)"+"bean(invoiceInfoController)"+"bean(receiveShippingInfoPort)"+"bean(reOrderController)"
//	        		 +"bean(reOrderDrawingsController)"+"bean(rfqInfoController)"+"bean(shippingInfoController)"
//	        		 )
//              public Object process(ProceedingJoinPoint joinPoint){
//            	  try {
//            		  System.out.println("开始调用控制器");
//            		  //调用实际的控制器
//					 Object obj = joinPoint.proceed();
//					 System.out.println("正常结束");
//					 return obj;
//				} catch (Throwable e) {
//					 System.out.println("出现异常");
//					logger.error(e.getMessage());
//					//目标方法执行出现问题
//					e.printStackTrace();	
//				return new JsonResult(JsonResult.ERROR,e.getMessage());
//				}
//            	  
//              }
//
//}
