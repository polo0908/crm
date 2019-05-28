package com.cbt.dao;

import java.io.Serializable;
import java.util.List;

import com.cbt.entity.ClientOrderQcReport;
import com.cbt.entity.ClientOrderShippingDoc;

public interface ClientOrderShippingDocDao extends Serializable {
  
	/**
	 * 根据订单号查询
	 * @author polo
	 * 2017年8月3日
	 */
	List<ClientOrderShippingDoc> queryByClientOrderId(String orderId);
	
	
	
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	ClientOrderShippingDoc queryById(Integer id);
	
	
	/**
	 * 批量插入shipping报告
	 * @param list
	 */
	void insertBatch(List<ClientOrderShippingDoc> list);
	
	
	
	
	/**
	 * 根据id删除
	 * @param id
	 */
	void deleteById(Integer id);
	
	
	/**
	 * 更新new
	 * @param ClientOrderShippingDoc
	 */
	void update(ClientOrderShippingDoc cientOrderShippingDoc); 
}
