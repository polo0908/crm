package com.cbt.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.cbt.dao.FactoryMessageDao;
import com.cbt.dao.MessageCenterDao;
import com.cbt.dao.OrderMessageDao;
import com.cbt.dao.QualityIssuesPicDao;
import com.cbt.entity.FactoryMessage;
import com.cbt.entity.MessageCenter;
import com.cbt.entity.OrderMessage;
import com.cbt.entity.QualityIssuesPic;
import com.cbt.service.FactoryMessageService;
import com.cbt.util.DateFormat;

@Service
public class FactoryMessageServiceImpl implements FactoryMessageService {
 
	private static final int READ_STATUS = 1;
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
	public List<FactoryMessage> insert(FactoryMessage factoryMessage)throws Exception{
		
		factoryMessageDao.insert(factoryMessage);
		return factoryMessageDao.queryByOrderMessageId(factoryMessage.getOrderMessageId());
	}
   
	
	/**
	 * 查看消息的同时，批量更新工厂读取状态
	 * 
	 */
	@Transactional
	@Override
	public Map<String,Object> updateFactoryMessage(Integer messageCenterId)throws Exception{
		
		List<List<FactoryMessage>> factoryMessages = new ArrayList<List<FactoryMessage>>();
		List<List<QualityIssuesPic>> qualityIssuesPics = new ArrayList<List<QualityIssuesPic>>();
		
		List<OrderMessage> orderMessages = orderMessageDao.queryByMessageCenterId(messageCenterId);
		for (OrderMessage orderMessage : orderMessages) {
			List<FactoryMessage> factoryMessage = factoryMessageDao.queryByOrderMessageId(orderMessage.getId());
			for (FactoryMessage factoryMessage2 : factoryMessage) {
				factoryMessage2.setReadStatus(READ_STATUS);
				factoryMessage2.setMessageReadTime(DateFormat.format());
			}
			factoryMessageDao.updateReadStatus(factoryMessage);
			List<QualityIssuesPic> qualityIssuesPic = qualityIssuesPicDao.queryByOrderMessageId(orderMessage.getId());

			factoryMessages.add(factoryMessage);
			qualityIssuesPics.add(qualityIssuesPic);
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("orderMessages", orderMessages);
		map.put("factoryMessages", factoryMessages);
		map.put("qualityIssuesPics", qualityIssuesPics);
		return map;
	}
	
	
}
