package com.cbt.dao;

import java.io.Serializable;

import com.cbt.entity.FactoryInfo;

public interface FactoryInfoDao extends Serializable {

	/**
	 * 查询id最大值
	 * @return
	 */
	Integer queryMaxId();
	/**
	 * 单个factoryId查询
	 * @param orderId
	 * @return
	 */
	FactoryInfo queryByFactoryId(String factoryId);
	
	/**
	 * 单个factoryName查询
	 * @param orderId
	 * @return
	 */
	FactoryInfo queryByFactoryName(String factoryName);
	
	
	 /**
	  * 插入工厂数据 
	  * @param factoryInfo
	  */
	 void insert(FactoryInfo factoryInfo);
	 
	 /**
	  * 根据email进行查询
	  * @param email
	  * @return
	  */
	 FactoryInfo queryByEmail(String email);
	 
	 
	 /**
	  * 根据最大的id查询工厂号
	  * @param id
	  * @return
	  */
	 String queryByMaxId(Integer id);
}
