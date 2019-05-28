package com.cbt.service;

import java.io.Serializable;
import java.util.List;

import com.cbt.entity.ClientOrderShippingDoc;

public interface ClientOrderShippingDocService extends Serializable {

	
	
	/**
	 * 根据订单号查询
	 * @author polo
	 * 2017年8月3日
	 */
	public List<ClientOrderShippingDoc> queryByClientOrderId(String orderId);
	
	
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	public ClientOrderShippingDoc queryById(Integer id);
	
	/**
	 * 批量插入shipping报告
	 * @param list
	 */
	public void insertBatch(List<ClientOrderShippingDoc> list);
	
	
	
	/**
	 * 更新new
	 * @param ClientOrderShippingDoc
	 */
	public void update(ClientOrderShippingDoc cientOrderShippingDoc);
	

}
