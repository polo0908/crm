package com.cbt.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cbt.entity.BackUser;

public interface BackUserDao {


	/**
	 * 单个查询crm后台的用户信息
	 * 
	 * @param id
	 * @return
	 */
	public BackUser queryBackUserById(@Param("id") Integer id);
	/**
	 * 单个查询crm后台的用户信息
	 * 
	 * @param 
	 * @return
	 */
	public BackUser queryBackUserByName(@Param("userName") String userName);
	/**
	 * 单个查询crm后台的用户信息
	 * 
	 * @param 
	 * @return
	 */
	public BackUser queryBackUserByUserId(@Param("userId") String userId);
	
	

	/**
	 * 插入crm后台用户信息
	 * 
	 * @param backUser
	 */
	public void insertBackUser(BackUser backUser);

	/**
	 * 修改crm后台用户信息
	 * 
	 * @param backUser
	 */
	public void updateBackUser(BackUser backUser);


}
