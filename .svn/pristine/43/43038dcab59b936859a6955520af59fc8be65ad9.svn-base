package com.cbt.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cbt.dao.ReOrderDao;
import com.cbt.dao.ReOrderDrawingsDao;
import com.cbt.entity.ReOrder;
import com.cbt.service.ReOrderService;

@Service
public class ReOrderServiceImpl implements ReOrderService {

	@Resource
	private ReOrderDao reOrderDao;
	@Resource
	private ReOrderDrawingsDao reOrderDrawingsDao;
	@Override
	public List<ReOrder> queryByUserId(String userId) {
		
		List<ReOrder> ReOrders = reOrderDao.queryByUserId(userId);
		return ReOrders;
	}

	@Override
	public ReOrder queryById(Integer id) {
		ReOrder reOrder = reOrderDao.queryById(id);
		
		return reOrder;
	}

	
	@Transactional
	@Override
	public void insertReOrder(ReOrder reOrder,ArrayList<Map<Object, Object>> list)throws Exception{		
		reOrderDao.insertReOrder(reOrder);		
		for (Map<Object, Object> map : list) {
			map.put("reOrderId", reOrder.getId());
		}
		reOrderDrawingsDao.insertReOrders(list);
		
	}

	@Override
	public int totalAmount(String userId) {
	
		return reOrderDao.totalAmount(userId);
	}

	
	

}
