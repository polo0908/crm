package com.cbt.dao;

import java.util.List;

import com.cbt.entity.ReOrder;



public interface ReOrderDao {
    /**
     * 根据userId查询再订购订单
     * @param userId
     * @return
     */
	List<ReOrder> queryByUserId(String userId);
	/**
	 * 根据id查询订单
	 * @param id
	 * @return
	 */
	ReOrder queryById(Integer id);	   
    
    /**
     * 插入reOrder对象
     * @param reOrder
     */
    void insertReOrder(ReOrder reOrder);
    
	/**
	 * 查询订单总数
	 * @return
	 */
	int totalAmount(String userId);
	
	

}
