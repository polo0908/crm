package com.cbt.util;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import org.apache.commons.lang.StringUtils;

/**
 * 获取当前时间
 * 
 * @since 2013-12-03
 */
public class DateFormat {

	/**
	 * 
	 * @param source
	 * @return
	 */
	public static String format()
	{
		long time = System.currentTimeMillis();
	  	Date date = new Date(time);    	
	  	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	  	String currentTime = sdf.format(date);
		return currentTime;
	}
	
	public static Date getDate() throws ParseException
	{
		long time = System.currentTimeMillis();
		Date date = new Date(time);    	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currentTime = sdf.format(date);
		
		return sdf.parse(currentTime);
	}

	
	public static Date formatDate1(Date date) throws ParseException
	{ 	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String str = sdf.format(date);
		return sdf.parse(str);
	}
	
	
	public static Date formatToDate(String str) throws ParseException
	{ 	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.parse(str);
	}
	
	public static String DateToStr(Date date) throws ParseException
	{ 	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(date);
	}

	public static String formatDate2(String date) throws ParseException
	{
//		long time = System.currentTimeMillis();
//		Date date = new Date(time);    	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date time = sdf.parse(date); 
		String currentTime = sdf.format(time);
		
		
		return currentTime;
	}
	
	
	
	
	public static String currentDate() throws ParseException
	{
	    long time = System.currentTimeMillis();
	    Date date = new Date(time);    	
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    String currentTime = sdf.format(date);		
		return currentTime;
	}
	
	public static String currentDateEn() throws ParseException
	{
	    long time = System.currentTimeMillis();
	    Date date = new Date(time);    	
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    String currentTime = sdf.format(date);	
   	    String[] split = currentTime.split("-");
   	    return split[1]+"/"+split[2]+"/"+split[0];
	}
	
	
	public static String weekLaterDate() throws ParseException
	{
		   Calendar calendar = Calendar.getInstance();  
	       calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) + 7);  
	       Date today = calendar.getTime();  
	       SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");  
	       String result = format.format(today);  
	       return result;
	}
	
	//时间格式化成美国日期显示
//	public static String formatDateToEn(String date) throws ParseException
//	{ 	
//		     if(StringUtils.isNotBlank(date)){
//		    	 String str = formatDate1(date);
//		    	 String[] split = str.split("-");
//		    	 return split[1]+"/"+split[2]+"/"+split[0];
//		     }else{
//		         return ""; 
//		     }		
//	}
	
}

