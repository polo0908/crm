package com.cbt.service;

import java.io.Serializable;

import com.cbt.entity.BackUser;
import com.cbt.entity.FactoryInfo;

public interface FactoryInfoService extends Serializable {
           
	
	/**
	 * 查询id最大值
	 * @return
	 */
	public Integer queryMaxId();
	
	
	/**
	 * 单个factoryId查询
	 * @param orderId
	 * @return
	 */
	public FactoryInfo queryByFactoryId(String factoryId);
	
	/**
	 * 单个factoryName查询
	 * @param orderId
	 * @return
	 */
	public FactoryInfo queryByFactoryName(String factoryName);
	
	
	 /**
	  * 插入工厂数据 
	  * @param factoryInfo
	  */
	public void insert(FactoryInfo factoryInfo,BackUser backUser)throws Exception;
	
	
	 /**
	  * 根据email进行查询
	  * @param email
	  * @return
	  */
    public FactoryInfo queryByEmail(String email);
    
    
	 
	 /**
	  * 根据最大的id查询工厂号
	  * @param id
	  * @return
	  */
	 public String queryByMaxId(Integer id);
}
