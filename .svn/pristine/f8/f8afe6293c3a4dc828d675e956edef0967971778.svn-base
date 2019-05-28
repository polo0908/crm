package com.cbt.service;

import java.util.List;

import com.cbt.entity.ShippingInfo;
import com.cbt.entity.User;
import com.cbt.entity.UserRelationEmail;
import com.cbt.exception.NameOrPasswordException;

public interface UserService {

	/**
	 * 批量插入用户
	 */	
	public void insertUser(List<Object> list,List<Object> list1)throws Exception; 
	
	
	   /**
	    * 登录方法
	    * userid  用户id
	    * password 密码
	    * 登录成功时候返回用户的信息
	    * NameOrPasswordException
	    *   用户名或密码错误
	    *   用户名或密码为空
	    */
	public UserRelationEmail login(String loginEmail,String pwd) throws NameOrPasswordException;
	
	/**
	 * 根据客户名查询
	 * @param userid
	 * @return
	 */	  
	public User queryByUserId(String userid);
	
	/**
	 * 根据登录邮箱查询
	 * @param loginEmail
	 * @return
	 */	  
	public User queryByLoginMail(String loginEmail);
	
	
	
	/**
	 * 插入用户
	 * @param user
	 */
	public void insert(User user,ShippingInfo shippingInfo)throws Exception;
	
	/**
	 * 插入关联用户（同一公司）
	 * @param user
	 */
	public void insert(String userid,User user1)throws Exception;
	
	/**
	 * 查询id最大值
	 * @return
	 */
	public Integer queryMaxId();
	
	
	/**
	 * 更新客户信息
	 * @param user
	 */
	void updateCustomerInfo(User user);
	
}
