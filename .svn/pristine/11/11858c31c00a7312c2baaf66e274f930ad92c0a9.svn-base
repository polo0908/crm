package com.cbt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cbt.dao.InvoiceInfoDao;
import com.cbt.entity.InvoiceInfo;
import com.cbt.service.InvoiceInfoService;

@Service
  
public class InvoiceInfoServiceImpl implements InvoiceInfoService {
   
	@Resource
	  private InvoiceInfoDao invoiceInfoDao;

	
	@Override
	public InvoiceInfo queryByInvoiceId(String invoiceId,String factoryId) {
		InvoiceInfo invoiceInfo = invoiceInfoDao.queryByInvoiceId(invoiceId,factoryId);
		return invoiceInfo;
	}

	@Override
	public List<InvoiceInfo> queryInvoiceByOrderId(String orderId) {
		return invoiceInfoDao.queryInvoiceByOrderId(orderId);
	}

	
	@Transactional
	@Override
	public void deleteInvoiceById(Integer id) {
		invoiceInfoDao.deleteInvoiceById(id);	
	}	
	
}
