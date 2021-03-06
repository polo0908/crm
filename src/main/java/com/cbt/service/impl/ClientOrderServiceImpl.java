package com.cbt.service.impl;

import java.util.ArrayList;
import java.util.List;







import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cbt.dao.ClientOrderDao;
import com.cbt.entity.ClientOrder;
import com.cbt.service.ClientOrderService;
@Service

public class ClientOrderServiceImpl implements ClientOrderService {

	@Resource
	private ClientOrderDao clientOrderDao;
	
	@Override
	public ClientOrder queryByInvoiceId(String invoiceId) {
		
		ClientOrder clientOrder = clientOrderDao.queryByInvoiceId(invoiceId);
		
		return clientOrder;
	}

	@Override
	public ClientOrder queryByOrderId(String orderId) {
		
		ClientOrder clientOrder = clientOrderDao.queryByOrderId(orderId);
		return clientOrder;
	}

	@Override
	public List<ClientOrder> queryByUserId(String userId,Integer orderStatus,String factoryId) {
        
		
		List<ClientOrder> clientOrders = clientOrderDao.queryListByUserId(userId,orderStatus,factoryId);
		
		return clientOrders;
	}

	@Override
	public int total(String userId,Integer orderStatus) {
		int total = clientOrderDao.total(userId,orderStatus);
		return total;
	}

	@Override
	public ClientOrder queryById(Integer id) {
		ClientOrder clientOrder = clientOrderDao.queryById(id);
		return clientOrder;
	}

	@Override
	public List<ClientOrder> queryListByOrderIds(String... orderIds) {
		List<ClientOrder> clientOrders = clientOrderDao.queryListByOrderIds(orderIds);
		return clientOrders;
	}

	
	@Transactional
	@Override
	public void insertClientOrder(ClientOrder clientOrder) {
		clientOrderDao.insertClientOrder(clientOrder);
		
	}

	
	@Transactional
	@Override
	public void insertClientOrders(List<Object> list) {
		clientOrderDao.insertClientOrders(list);
		
	}

	
	@Transactional
	@Override
	public void updateClientOrder(ClientOrder clientOrder) {
		clientOrderDao.updateClientOrder(clientOrder);
		
	}

	@Override
	public List<ClientOrder> queryListByPage(String userId,
			Integer orderStatus, String factoryId, Integer start,
			Integer pageSize) {
		return clientOrderDao.queryListByPage(userId, orderStatus, factoryId, start, pageSize);
	}

	@Override
	public int totalFinished(String userId, Integer orderStatus,String factoryId) {
		return clientOrderDao.totalFinished(userId, orderStatus, factoryId);
	}

	@Override
	public int total1(String userId,String factoryId) {
		return clientOrderDao.total1(userId,factoryId);
	}

	@Override
	public String queryLastOrder(String userId, String factoryId) {
		return clientOrderDao.queryLastOrder(userId, factoryId);
	}

	@Override
	public List<ClientOrder> queryByFactoryId(String userId, String factoryId,Integer orderStatus) {
		return clientOrderDao.queryByFactoryId(userId, factoryId,orderStatus);
	}

	@Override
	public String queryLastFinishedFactoryId(String userId) {
		return clientOrderDao.queryLastFinishedFactoryId(userId);
	}

	@Override
	public int totalDelay(String userId) {		
		return clientOrderDao.totalDelay(userId);		
	}

	@Override
	public int totalFactoryOrder(String userId, String factoryId) {
		return clientOrderDao.totalFactoryOrder(userId, factoryId);
	}

	@Override
	public String queryProjectName(String orderId) {
		return clientOrderDao.queryProjectName(orderId);
	}

	@Override
	public Map<Object, Object> currentQuarter(String userId) {
		return clientOrderDao.currentQuarter(userId);
	}

	@Override
	public Map<Object, Object> currentQuarter1(String userId) {
		return clientOrderDao.currentQuarter1(userId);
	}

	@Override
	public Map<Object, Object> currentQuarter2(String userId) {
		return clientOrderDao.currentQuarter2(userId);
	}

	@Override
	public Map<Object, Object> currentQuarter3(String userId) {
		return clientOrderDao.currentQuarter3(userId);
	}

	@Override
	public Map<Object, Object> currentQuarter4(String userId) {
		return clientOrderDao.currentQuarter4(userId);
	}

	@Override
	public List<ClientOrder> queryCurrentTest() {	
		return clientOrderDao.queryCurrentTest();
	}




}
