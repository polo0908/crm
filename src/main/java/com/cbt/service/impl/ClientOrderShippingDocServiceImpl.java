package com.cbt.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.cbt.dao.ClientOrderShippingDocDao;
import com.cbt.entity.ClientOrderShippingDoc;
import com.cbt.service.ClientOrderShippingDocService;
import com.cbt.util.OperationFileUtil1;


@Service
public class ClientOrderShippingDocServiceImpl implements ClientOrderShippingDocService {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Resource
	private ClientOrderShippingDocDao clientOrderShippingDocDao;
	
	@Override
	public List<ClientOrderShippingDoc> queryByClientOrderId(String orderId) {
		return clientOrderShippingDocDao.queryByClientOrderId(orderId);
	}

	@Override
	public void insertBatch(List<ClientOrderShippingDoc> list) {
		clientOrderShippingDocDao.insertBatch(list);

	}

	@Override
	public ClientOrderShippingDoc queryById(Integer id) {
		return clientOrderShippingDocDao.queryById(id);
	}

	@Override
	public void update(ClientOrderShippingDoc cientOrderShippingDoc) {
		clientOrderShippingDocDao.update(cientOrderShippingDoc);
		
	}

}
