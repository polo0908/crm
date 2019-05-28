package com.cbt.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.cbt.entity.ClientDrawings;





public interface ClientDrawingsDao {
    
	//List<ClientDrawings> queryByDrawingsName(String drawingsName,String userId);
	/**
	 * 根据id查询图纸
	 * @param id
	 * @return
	 */
	ClientDrawings queryById(Integer id);
    /**
     * 根据userid查询图纸信息并且分页处理
     * @param userId
     * @param start
     * @param end
     * @return
     */
    
    List<ClientDrawings> queryListByUserId(@Param("userid")String userId,@Param("start")Integer start,@Param("pageSize")Integer pageSize);
    
    /**
     * 根据订单号查询图纸信息并且分页处理
     * @param orderId
     * @return
     */
    List<ClientDrawings> queryByOrderId(@Param("orderId")String orderId,@Param("start")Integer start,@Param("pageSize")Integer pageSize);
    
    /**
     * 根据订单号查询图纸信息
     * @param orderId
     * @return
     */
    List<ClientDrawings> queryListByOrderId(String orderId);
    /**
     * 更新图纸信息
     * @param map
     */
    void updateClientDrawings(ClientDrawings clientDrawing);   
    /**
     * 计算总图纸数量
     * @param userId
     * @return
     */
    int total(String userId);
    /**
     * 根据订单号查询图纸数量
     * @param userId
     * @return
     */
    int totalByOrderId(String orderId);
    /**
     * 根据ids,批量查询图纸信息
     * @param ids
     * @return
     */
    List<ClientDrawings> queryListByIds(Integer[] ids);
    /**
     * 批量插入对象
     * @param ArrayList
     */
    void insertClientDrawings(List<Object> list);
    
    
}
