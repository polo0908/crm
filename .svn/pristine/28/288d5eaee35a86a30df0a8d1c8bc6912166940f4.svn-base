package com.cbt.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.cbt.entity.ReOrderDrawings;

public interface ReOrderDrawingsService {
	/**
	 * 批量插入数据
	 * @param reOrderDrawings
	 */
	public void insertReOrders(ArrayList<Map<Object,Object>> reOrderDrawings);  
	
	/**
	 * 根据reOrderId查询订单关联表(reorder_drawing)
	 * @author polo
	 *
	 */
	public List<ReOrderDrawings> queryReOrderDrawings(Integer reOrderId);
	
	
	/**
	 * 根据id查询图纸
	 * @param id
	 * @return
	 */
	public ReOrderDrawings queryById(Integer id);
}
