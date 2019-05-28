package com.cbt.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.cbt.entity.OrderQuery;
import com.cbt.entity.ReOrder;
import com.cbt.entity.ReOrderDrawings;


public interface ReOrderDrawingsDao {
    /**
     * 批量插入对象
     * @param ArrayList
     */
   void insertReOrders(ArrayList<Map<Object, Object>> arrayList);    
   /**
    * 批量插入对象
    * @param ArrayList
    */
   void insertReOrderDrawings(List<ReOrderDrawings> list);    

   
	/**
	 * 根据reOrderId查询订单关联表(reorder_drawing)
	 * @author polo
	 *
	 */
	List<ReOrderDrawings> queryReOrderDrawings(Integer reOrderId);
	
	/**
	 * 根据id查询图纸
	 * @param id
	 * @return
	 */
	ReOrderDrawings queryById(Integer id);
}
