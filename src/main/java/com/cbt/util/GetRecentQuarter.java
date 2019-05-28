package com.cbt.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;


public class GetRecentQuarter {

    public static void main(String[] args) throws ParseException {
//        Calendar c = Calendar.getInstance();
        
//        int m = c.get(Calendar.MONTH) + 1;            //月份
//        int s = (int)Math.ceil( (m - 1)  / 3) + 1;     //季度
//        System.out.println(s);
//        int em = (s - 1) * 3;                        //上一个季度最后一个月
        
//        Calendar sc = Calendar.getInstance();
//        sc.setTimeInMillis(c.getTimeInMillis());
//        sc.set(Calendar.MONTH, em);
//        sc.set(Calendar.DAY_OF_MONTH, 1);
//        sc.set(Calendar.HOUR_OF_DAY, 0);
//        sc.set(Calendar.MINUTE, 0);
//        sc.set(Calendar.SECOND, 0);
//        sc.set(Calendar.MILLISECOND, 0);
//        sc.add(Calendar.MILLISECOND, -1);
//        out(sc);//结束时间
//        
//
//        Calendar ec = Calendar.getInstance();
//        ec.setTimeInMillis(c.getTimeInMillis());
//        ec.set(Calendar.MONTH, em - 1);    //month 基于0,一月的值是0
//        ec.set(Calendar.DAY_OF_MONTH, 1);
//        ec.set(Calendar.HOUR_OF_DAY, 0);
//        ec.set(Calendar.MINUTE, 0);
//        ec.set(Calendar.SECOND, 0);
//        ec.set(Calendar.MILLISECOND, 0);
//        ec.add(Calendar.MONTH, -11);     //向前12个月，但是-11
//        out(ec);//开始时间       
       
    	 String quarter1 = getCurrentQuarter(getFirstQuarterStartTime());
    	 String quarter2 = getCurrentQuarter(getSecondQuarterStartTime());
    	 String quarter3 = getCurrentQuarter(getThirdQuarterStartTime());
    	 String quarter4 = getCurrentQuarter(getFourthQuarterStartTime());
         System.out.println(getSecondQuarterStartTime());
         System.out.println(getFourthQuarterStartTime());
         System.out.println(quarter3);
         System.out.println(quarter4);
    }
    
    protected static String out(Calendar c){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String str = sdf.format(c.getTime());
        return str;
    }
    
    
    
    /**
     * 获取下一季度开始时间
     * @return
     * @throws ParseException 
     */
    public static String getNextQuarterStartTime(String str) throws ParseException{
    	 SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
         Date date =sdf.parse(str);
         Calendar c = Calendar.getInstance();
         c.setTime(date);  
         c.add(Calendar.MONTH, +1);
         String out = out(c);
         out = getCurrentQuarterEndTime(out);
         return out;
    }
    
    
    /**
     * 获取当前时间前四个季度（第四个季度的开始时间）
     * @return
     */
    public static String getFourthQuarterStartTime(){
         Calendar c = Calendar.getInstance();
        
        int m = c.get(Calendar.MONTH) + 1;            //月份
        int s = (int)Math.ceil( (m - 1)  / 3) + 1;     //季度
        int em = (s - 1) * 3;                        //上一个季度最后一个月
        
          Calendar ec = Calendar.getInstance();
	      ec.setTimeInMillis(c.getTimeInMillis());
	      ec.set(Calendar.MONTH, em - 1);    //month 基于0,一月的值是0
	      ec.set(Calendar.DAY_OF_MONTH, 1);
	      ec.set(Calendar.HOUR_OF_DAY, 0);
	      ec.set(Calendar.MINUTE, 0);
	      ec.set(Calendar.SECOND, 0);
	      ec.set(Calendar.MILLISECOND, 0);
	      ec.add(Calendar.MONTH, -11);     //向前12个月，但是-11
	      String out = out(ec);//开始时间
        return out;
    }
    /**
     * 获取当前时间前四个季度（第一个季度的开始时间）
     * @return
     */
    public static String getFirstQuarterStartTime(){
    	Calendar c = Calendar.getInstance();
    	
    	int m = c.get(Calendar.MONTH) + 1;            //月份
    	int s = (int)Math.ceil( (m - 1)  / 3) + 1;     //季度
    	int em = (s - 1) * 3;                        //上一个季度最后一个月
    	
    	Calendar ec = Calendar.getInstance();
    	ec.setTimeInMillis(c.getTimeInMillis());
    	ec.set(Calendar.MONTH, em - 1);    //month 基于0,一月的值是0
    	ec.set(Calendar.DAY_OF_MONTH, 1);
    	ec.set(Calendar.HOUR_OF_DAY, 0);
    	ec.set(Calendar.MINUTE, 0);
    	ec.set(Calendar.SECOND, 0);
    	ec.set(Calendar.MILLISECOND, 0);
    	ec.add(Calendar.MONTH, -2);     //向前3个月，但是-2
    	String out = out(ec);//开始时间
    	return out;
    }
    /**
     * 获取当前时间前四个季度（第三个季度的开始时间）
     * @return
     */
    public static String getThirdQuarterStartTime(){
    	Calendar c = Calendar.getInstance();
    	
    	int m = c.get(Calendar.MONTH) + 1;            //月份
    	int s = (int)Math.ceil( (m - 1)  / 3) + 1;     //季度
    	int em = (s - 1) * 3;                        //上一个季度最后一个月
    	
    	Calendar ec = Calendar.getInstance();
    	ec.setTimeInMillis(c.getTimeInMillis());
    	ec.set(Calendar.MONTH, em - 1);    //month 基于0,一月的值是0
    	ec.set(Calendar.DAY_OF_MONTH, 1);
    	ec.set(Calendar.HOUR_OF_DAY, 0);
    	ec.set(Calendar.MINUTE, 0);
    	ec.set(Calendar.SECOND, 0);
    	ec.set(Calendar.MILLISECOND, 0);
    	ec.add(Calendar.MONTH, -8);     //向前9个月，但是-8
    	String out = out(ec);//开始时间
    	return out;
    }
    /**
     * 获取当前时间前四个季度（第二个季度的开始时间）
     * @return
     */
    public static String getSecondQuarterStartTime(){
    	Calendar c = Calendar.getInstance();
    	
    	int m = c.get(Calendar.MONTH) + 1;            //月份
    	int s = (int)Math.ceil( (m - 1)  / 3) + 1;     //季度
    	int em = (s - 1) * 3;                        //上一个季度最后一个月
    	
    	Calendar ec = Calendar.getInstance();
    	ec.setTimeInMillis(c.getTimeInMillis());
    	ec.set(Calendar.MONTH, em - 1);    //month 基于0,一月的值是0
    	ec.set(Calendar.DAY_OF_MONTH, 1);
    	ec.set(Calendar.HOUR_OF_DAY, 0);
    	ec.set(Calendar.MINUTE, 0);
    	ec.set(Calendar.SECOND, 0);
    	ec.set(Calendar.MILLISECOND, 0);
    	ec.add(Calendar.MONTH, -5);     //向前6个月，但是-5
    	String out = out(ec);//开始时间
    	return out;
    }

    
    
    
    /** 
     * 当前季度的开始时间，即2012-01-1 00:00:00 
     * 
     * @return 
     * @throws ParseException 
     */ 
    public static String getCurrentQuarterStartTime(String str) throws ParseException { 
//        Calendar c = Calendar.getInstance(); 
        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
        Date date =sdf.parse(str);
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        int currentMonth = c.get(Calendar.MONTH) + 1; 
        
        
        String result = null; 
        try { 
            if (currentMonth >= 1 && currentMonth <= 3) 
                c.set(Calendar.MONTH, 0); 
            else if (currentMonth >= 4 && currentMonth <= 6) 
                c.set(Calendar.MONTH, 3); 
            else if (currentMonth >= 7 && currentMonth <= 9) 
                c.set(Calendar.MONTH, 4); 
            else if (currentMonth >= 10 && currentMonth <= 12) 
                c.set(Calendar.MONTH, 9); 
            c.set(Calendar.DATE, 1); 
//            now = longSdf.parse(shortSdf.format(c.getTime()) + " 00:00:00"); 
            
           Date today = c.getTime();  
 	       SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");  
 	       result = format.format(today);  
            
        } catch (Exception e) { 
            e.printStackTrace(); 
        } 
        return result; 
    } 

    /** 
     * 当前季度的结束时间，即2012-03-31 23:59:59 
     * 
     * @return 
     * @throws ParseException 
     */ 
    public  static String getCurrentQuarterEndTime(String str) throws ParseException { 
//        Calendar c = Calendar.getInstance(); 
        
        
        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
        Date date =sdf.parse(str);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int currentMonth = calendar.get(Calendar.MONTH) + 1; 
        
        Date now = null; 
        String result = null;
        try { 
            if (currentMonth >= 1 && currentMonth <= 3) { 
            	calendar.set(Calendar.MONTH, 2); 
            	calendar.set(Calendar.DATE, 31); 
            } else if (currentMonth >= 4 && currentMonth <= 6) { 
            	calendar.set(Calendar.MONTH, 5); 
            	calendar.set(Calendar.DATE, 30); 
            } else if (currentMonth >= 7 && currentMonth <= 9) { 
            	calendar.set(Calendar.MONTH,8); 
            	calendar.set(Calendar.DATE, 30); 
            } else if (currentMonth >= 10 && currentMonth <= 12) { 
            	calendar.set(Calendar.MONTH, 11); 
            	calendar.set(Calendar.DATE, 31); 
            } 
            now = calendar.getTime();  
  	       SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");  
  	       result = format.format(now);  
        } catch (Exception e) { 
            e.printStackTrace(); 
        } 
        return result; 
    } 
    
    
    
    /**
     * 获取当前时间属于哪年哪个季度
     * @param str
     * @return
     * @throws ParseException
     */
    public  static String getCurrentQuarter(String str) throws ParseException {
    	
    	SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
        Date date =sdf.parse(str);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int m = calendar.get(Calendar.MONTH) + 1;            //月份
        int s = (int)Math.ceil( (m - 1)  / 3) + 1;           //季度
        int year = calendar.get(Calendar.YEAR);      
        return year+"Q"+s;
    }

    

    
    
    
}