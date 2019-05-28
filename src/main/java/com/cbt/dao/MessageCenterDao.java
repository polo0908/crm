package com.cbt.dao;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cbt.entity.MessageCenter;

public interface MessageCenterDao extends Serializable {

	
	/**
	 * 插入消息
	 * @param messageCenter
	 */
	void insert(MessageCenter messageCenter);
	
	
	/**
	 * 查询客户的消息
	 * @param userid
	 * @return
	 */
	List<MessageCenter> queryMessageByUserId(@Param("userid")String userid);
	
    
	/**
	 * 查询消息数
	 * @param userid
	 * @param readStatus
	 * @return
	 */
	int total(@Param("userid")String userid,@Param("messageType")Integer messageType);
	
	
	
	/**
	 * 根据订单号和消息类型查询
	 * @author polo
	 * 2017年5月16日
	 *
	 */
	MessageCenter queryByOrderIdAndType(@Param("orderId")String orderId,@Param("messageType")Integer messageType);
	
	/**
	 * 根据订单号查询
	 * @author polo
	 * 2017年5月16日
	 *
	 */
	List<MessageCenter> queryByOrderId(@Param("orderId")String orderId);
	
	
	/**
	 * 根据订单号查询未读消息
	 * @param orderId
	 * @return
	 */
	int totalUnReadMessageByOrderId(@Param("orderId")String orderId);
	/**
	 * 根据订单号查询所有消息数
	 * @param orderId
	 * @return
	 */
	int totalMessageByOrderId(@Param("orderId")String orderId);
	
	/**
	 * 根据ID查询
	 * @author polo
	 * 2017年5月17日
	 *
	 */
	MessageCenter queryById(Integer id);
	
	
	/**
	 * 查询每个类型消息未读数
	 * @author polo
	 * 2017年5月19日
	 *
	 */
	int totalByMessageType(@Param("messageCenterId")Integer messageCenterId,@Param("messageType")Integer messageType);
	
	
	/**
	 * 查询每个类型消息未读数
	 * @author polo
	 * 2017年6月16日
	 *
	 */
	int totalQuotationMessageById(@Param("messageCenterId")Integer messageCenterId,@Param("messageType")Integer messageType);
	
	
	
	/**
	 * 根据报价单id查询
	 * @author polo
	 * 2017年6月15日
	 *
	 */
	MessageCenter queryByQuotationId(@Param("quotationInfoId")Integer quotationInfoId);
	
	
}
