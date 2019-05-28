package com.cbt.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.cbt.entity.ClientOrder;




public interface ClientOrderDao {
    /**
     * 根据发票查询
     * @param invoiceId
     * @return
     */
	ClientOrder queryByInvoiceId(String invoiceId);
	/**
	 * 单个orderId查询
	 * @param orderId
	 * @return
	 */
	ClientOrder queryByOrderId(String orderId);
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	ClientOrder queryById(Integer id);
    /**
     * 根据userid,工厂id查询用户订单
     * @param userId
     * @param start
     * @param end
     * @return
     */
    List<ClientOrder> queryListByUserId(@Param("userid")String userId,@Param("orderStatus")Integer orderStatus,@Param("factoryId")String factoryId);
   
    
    /**
     * 根据工厂id查询用户订单
     * @param userId
     * @param start
     * @param end
     * @return
     */
    List<ClientOrder> queryByFactoryId(@Param("userid")String userId,@Param("factoryId")String factoryId,@Param("orderStatus")Integer orderStatus);

    /**
     * 根据userid,工厂id查询用户订单，分页处理
     * @param userId
     * @param start
     * @param end
     * @return
     */
    List<ClientOrder> queryListByPage(@Param("userid")String userId,@Param("orderStatus")Integer orderStatus,@Param("factoryId")String factoryId,
    		@Param("start")Integer start,@Param("pageSize")Integer pageSize);
    /**
     * 查询用户处理中订单数
     * @param userId
     * @return
     */
    int total(@Param("userid")String userId,@Param("orderStatus")Integer orderStatus);
    
    
    /**
     * 根据工厂id查询用户订单数
     * @param userId
     * @param start
     * @param end
     * @return
     */
    int totalFactoryOrder(@Param("userid")String userId,@Param("factoryId")String factoryId);
    /**
     * 查询最近一年订单数
     * @param userId
     * @return
     */
    int total1(@Param("userid")String userId,@Param("factoryId")String factoryId);
    
    /**
     * 查询客户对应工厂结束的订单数
     * @param userId
     * @return
     */
    int totalFinished(@Param("userid")String userId,@Param("orderStatus")Integer orderStatus,@Param("factoryId")String factoryId);
    
    
    /**
     * 查询客户所有订单中延期的订单数
     * @param userId
     * @return
     */
    int totalDelay(@Param("userid")String userId);
    
    /**
     * 根据orderIds查询订单
     * @param orderIds
     * @return
     */
    List<ClientOrder> queryListByOrderIds(String... orderIds);
    /**
     * 插入对象
     * @param ArrayList
     */
    void insertClientOrder(ClientOrder clientOrder); 
    /**
     * 批量插入对象
     * @param ArrayList
     */
    void insertClientOrders(List<Object> list); 
    
	 /**
	  * 更新clientOrder po、invoice、qc、shipping数据
	  * @param clientOrder
	  */
    void updateClientOrder(ClientOrder clientOrder);
    
    /**
     * 查询最近下单时间
     * @param userId
     * @param factoryId
     * @return
     */
    String queryLastOrder(@Param("userid")String userId,@Param("factoryId")String factoryId);
    
    
    /**
     * 查询用户最近完成订单的工厂
     * @param userId
     * @return
     */
    String queryLastFinishedFactoryId(@Param("userid")String userId);
    
    
    /**
     * 根据订单号查询项目名
     * @param orderId
     * @return
     */
    String queryProjectName(String orderId);
    
    /**
     * 查询当前季度金额
     * @param userId
     * @return
     */
    Map<Object,Object> currentQuarter(@Param("userid")String userId);
    /**
     * 查询当前时间前一个季度
     * @param userId
     * @return
     */
    Map<Object,Object> currentQuarter1(@Param("userid")String userId);
    /**
     * 查询当前时间前两个季度
     * @param userId
     * @return
     */
    Map<Object,Object> currentQuarter2(@Param("userid")String userId);
    /**
     * 查询当前时间前三个季度
     * @param userId
     * @return
     */
    Map<Object,Object> currentQuarter3(@Param("userid")String userId);
    /**
     * 查询当前时间前四个季度
     * @param userId
     * @return
     */
    Map<Object,Object> currentQuarter4(@Param("userid")String userId);
    
    
    
    /**
     * 查询10个数据用于测试
     * @return
     */
    List<ClientOrder> queryCurrentTest();


}
