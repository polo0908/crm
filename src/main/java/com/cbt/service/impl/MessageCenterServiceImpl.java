package com.cbt.service.impl;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cbt.dao.MessageCenterDao;
import com.cbt.dao.OrderMessageDao;
import com.cbt.dao.QualityIssuesPicDao;
import com.cbt.entity.MessageCenter;
import com.cbt.entity.OrderMessage;
import com.cbt.entity.QualityIssuesPic;
import com.cbt.service.MessageCenterService;
import com.cbt.util.OperationFileUtil1;
import com.cbt.util.UploadAndDownloadPathUtil;

@Service
public class MessageCenterServiceImpl implements MessageCenterService {

	private static final int UNREAD_STATUS = 0;
	private static final int CUSTOMER = 1;
	private static final int MESSAGE_PUSH_TYPE = 1;
	private static final int MESSAGE_QUALITY_TYPE = 2;
	private static final int MESSAGE_OTHER_TYPE = 3;
	private static final int MESSAGE_QUOTATION_TYPE = 4;
	
	@Resource
	private MessageCenterDao messageCenterDao;
	@Resource
	private QualityIssuesPicDao qualityIssuesPicDao;
	@Resource
	private OrderMessageDao orderMessageDao;
	
	@Transactional
	@Override
	public void insert(MessageCenter messageCenter,OrderMessage orderMessage)throws Exception{
		if(messageCenter == null || "".equals(messageCenter)){
			throw new RuntimeException("no message");
		}
		MessageCenter message = messageCenterDao.queryByOrderIdAndType(messageCenter.getOrderId(),messageCenter.getMessageType());
		if(message == null || "".equals(message)){
			messageCenterDao.insert(messageCenter);
			orderMessage.setCustomerOrFactory(CUSTOMER);
			orderMessage.setMessageCenterId(messageCenter.getId());
			orderMessageDao.insert(orderMessage);
		}else{
			orderMessage.setCustomerOrFactory(CUSTOMER);
			orderMessage.setMessageCenterId(message.getId());
			orderMessageDao.insert(orderMessage);
		}

        
	}

	@Override
	public List<MessageCenter> queryMessageByUserId(String userid) {
		return messageCenterDao.queryMessageByUserId(userid);
	}

	@Override
	public int total(String userid) {
		StringUtils.isBlank(userid);
		int amount = messageCenterDao.total(userid, MESSAGE_PUSH_TYPE) + 
				messageCenterDao.total(userid, MESSAGE_QUALITY_TYPE) + 
				messageCenterDao.total(userid, MESSAGE_OTHER_TYPE)  +
				messageCenterDao.total(userid, MESSAGE_QUOTATION_TYPE);
		return amount;
	}

	
	/**
	 * 插入消息的同时插入图片
	 */
	@Transactional
	@Override
	public void insert(MessageCenter messageCenter,String picNames,OrderMessage orderMessage)throws Exception {
		if(messageCenter == null || "".equals(messageCenter)){
			throw new RuntimeException("no message");
		}
		//一个订单只有一个消息类型，都在order_message列表内
		MessageCenter message = messageCenterDao.queryByOrderIdAndType(messageCenter.getOrderId(),messageCenter.getMessageType());
		if(message == null || "".equals(message)){
			messageCenterDao.insert(messageCenter);
			orderMessage.setCustomerOrFactory(CUSTOMER);
			orderMessage.setMessageCenterId(messageCenter.getId());
			orderMessageDao.insert(orderMessage);
		}else{
			orderMessage.setCustomerOrFactory(CUSTOMER);
			orderMessage.setMessageCenterId(message.getId());
			orderMessageDao.insert(orderMessage);
		}
		 List<QualityIssuesPic> pictures = new ArrayList<QualityIssuesPic>();
		 if(!(picNames == null || "".equals(picNames))){
	        
			String[] split = picNames.split(",");
			for (int i = 0; i < split.length; i++) {
		    QualityIssuesPic q = new QualityIssuesPic(); 
			String changePhotoName = split[i];
			String changePhotoNameCompress = OperationFileUtil1.changeFilenameZip(changePhotoName);
	        q.setPicturePath( UploadAndDownloadPathUtil.getStaticQualityPath() + messageCenter.getOrderId() + "/"+changePhotoName);
            q.setOrderMessageId(orderMessage.getId());
            q.setPicturePathCompress(UploadAndDownloadPathUtil.getStaticQualityPath() + messageCenter.getOrderId() + "/"+changePhotoNameCompress);
	        pictures.add(q);
			}       
			        
		   qualityIssuesPicDao.insert(pictures);  
		 }
		 
	}

	@Override
	public int totalByMessageType(Integer messageCenterId, Integer messageType) {
		return messageCenterDao.totalByMessageType(messageCenterId, messageType);
	}

	
	@Transactional
	@Override
	public OrderMessage insertQuotaionMessage(MessageCenter messageCenter,OrderMessage orderMessage) throws Exception {

		MessageCenter messageCenter2 = messageCenterDao.queryByQuotationId(messageCenter.getQuotationInfoId());
		if(messageCenter2 == null || "".equals(messageCenter2)){
			messageCenterDao.insert(messageCenter);
			orderMessage.setMessageCenterId(messageCenter.getId());
		    orderMessageDao.insert(orderMessage);
		}else{
			orderMessage.setMessageCenterId(messageCenter2.getId());
			orderMessageDao.insert(orderMessage);
		}
		OrderMessage orderMessage2 = orderMessageDao.queryById(orderMessage.getId());
		String email = orderMessage2.getLoginEmail();	
        email = email.replaceAll("(\\w?)(\\w+)(\\w)(@\\w+\\.[a-z]+(\\.[a-z]+)?)", "$1****$3$4");
        orderMessage2.setLoginEmail(email);		
		
		return orderMessage2;
	}

	@Override
	public MessageCenter queryByQuotationId(Integer quotationInfoId) {
		return messageCenterDao.queryByQuotationId(quotationInfoId);
	}

	@Override
	public int totalQuotationMessageById(Integer messageCenterId,Integer messageType) {
		return messageCenterDao.totalQuotationMessageById(messageCenterId, messageType);
	}

	@Override
	public List<OrderMessage> queryByQuotationInfoId(Integer quotationId) {
		return orderMessageDao.queryByQuotationId(quotationId);
	}

	@Override
	public List<MessageCenter> queryByOrderId(String orderId) {
		return messageCenterDao.queryByOrderId(orderId);
	}

	@Override
	public int totalUnReadMessageByOrderId(String orderId) {
		return messageCenterDao.totalUnReadMessageByOrderId(orderId);
	}

	@Override
	public int totalMessageByOrderId(String orderId) {
		return messageCenterDao.totalMessageByOrderId(orderId);
	}


	
	
	
	
}
