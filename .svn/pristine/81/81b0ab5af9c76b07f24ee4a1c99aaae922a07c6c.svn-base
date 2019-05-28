package com.cbt.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.cbt.entity.ClientDrawings;
import com.cbt.entity.ClientOrder;
import com.cbt.entity.UpdateDrawing;

public interface ClientDrawingsService {
	/**
	 * 根据图纸名查询图纸信息
	 * @param drawingName
	 * @return
	 */
//	public List<ClientDrawings> queryByDrawingName(String drawingsName,String userId);
	/**
	 * 根据id查询图纸信息
	 * @param orderId
	 * @return
	 */
	public ClientDrawings queryById(Integer id);
    /**
     * 根据用户id查询客户图纸信息列表
     * @param userId
     * @return
     */	
	public List<ClientDrawings> queryByUserId(String userId,Integer start,Integer pageSize);
    /**
     * 根据订单号查询图纸信息并且分页处理
     * @param orderId
     * @return
     */
    public List<ClientDrawings> queryByOrderId(String orderId,Integer start,Integer pageSize);
	
    /**
     * 根据订单编号查询客户图纸信息列表
     * @param orderId
     * @return
     */	
	public List<ClientDrawings> queryListByOrderId(String orderId);
	
	/**
	 * 更新图纸信息
	 * @param clientDrawings
	 */
	public void updateClientDrawings(ClientDrawings clientDrawing,UpdateDrawing updateDrawing)throws Exception;

	/**
	 * 统计图纸数量
	 * @param userId
	 * @return
	 */
	public int total(String userId) ;
	
    /**
     * 根据订单号查询图纸数量
     * @param userId
     * @return
     */
    public int totalByOrderId(String orderId);
	
	/**
	 * 根据ids批量查询
	 * @param ids
	 * @return
	 */
	public List<ClientDrawings> queryListByIds(Integer[] ids);
	
    /**
     * 批量插入对象
     * @param ArrayList
     */
	public void insertClientDrawings(List<Object> list); 
	
}
