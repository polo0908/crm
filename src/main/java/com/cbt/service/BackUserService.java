package com.cbt.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cbt.entity.BackUser;

public interface BackUserService {


	/**
	 * 单个查询crm后台的用户信息
	 * 
	 * @param id
	 * @return
	 */
	public BackUser queryBackUserById(Integer id);
	
	/**
	 * 单个查询crm后台的用户信息
	 * 
	 * @param id
	 * @return
	 */
	public BackUser queryBackUserByName(String userName);
	
	/**
	 * 单个查询crm后台的用户信息
	 * 
	 * @param 
	 * @return
	 */
	public BackUser queryBackUserByUserId(String userId);

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
