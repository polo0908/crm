package com.cbt.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.cbt.dao.FactoryMessageDao;
import com.cbt.dao.MessageCenterDao;
import com.cbt.dao.OrderMessageDao;
import com.cbt.dao.QualityIssuesPicDao;
import com.cbt.entity.OrderMessage;
import com.cbt.service.OrderMessageService;
import com.cbt.util.DateFormat;
import com.cbt.util.WebCookie;

@Service
public class OrderMessageServiceImpl implements OrderMessageService {

	
	 private static final int READ_STATUS = 1;
	 private static final int FACTORY_MESSAGE = 2;
	 
	@Resource
	private OrderMessageDao orderMessageDao;
	@Resource
	private MessageCenterDao messageCenterDao;
	@Resource
	private FactoryMessageDao factoryMessageDao;
	@Resource
	private QualityIssuesPicDao qualityIssuesPicDao;
	
	@Transactional
	@Override
	public void updateOrderMessage(Integer messageCenterId) throws Exception{
				
		List<OrderMessage> orderMessages = orderMessageDao.queryByMessageCenterIdAndType(messageCenterId,FACTORY_MESSAGE);
		if(orderMessages.size() != 0){
			for (OrderMessage orderMessage : orderMessages) {
				orderMessage.setReadStatus(READ_STATUS);
				orderMessage.setMessageReadTime(DateFormat.format());
			}
			orderMessageDao.updateReadStatus(orderMessages);
		}

	}

	@Override
	public List<OrderMessage> queryByMessageCenterId(Integer messageCenterId) {
		return orderMessageDao.queryByMessageCenterId(messageCenterId);
	}

	@Transactional
	@Override
	public OrderMessage insert(HttpServletRequest request,OrderMessage orderMessage)throws Exception {
		orderMessageDao.insert(orderMessage);
		String userid = WebCookie.getUserid(request);
		orderMessage.setUserid(userid);
		return orderMessage;
	}

	@Override
	public OrderMessage queryById(Integer id) {
		return orderMessageDao.queryById(id);
	}

}
