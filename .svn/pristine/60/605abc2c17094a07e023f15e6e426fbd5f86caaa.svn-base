package com.cbt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cbt.dao.RfqInfoDao;
import com.cbt.entity.RfqInfo;
import com.cbt.service.RfqInfoService;

@Service
public class RfqInfoServiceImpl implements RfqInfoService {

	@Resource
	private RfqInfoDao rfqInfoDao;
	
	@Transactional
	@Override
	public void insertRfqInfo(RfqInfo rfqInfo) {
		rfqInfoDao.insertRfqInfo(rfqInfo);
       
	}
	@Override
	public List<RfqInfo> queryByUserId(String userId,String factoryId) {
		return rfqInfoDao.queryByUserIdAndFactoryId(userId, factoryId);
	}
	@Override
	public int totalAmount(String userId,String factoryId) {
		return rfqInfoDao.totalAmount(userId,factoryId);
	}
	@Override
	public RfqInfo queryById(Integer id) {
		return rfqInfoDao.queryById(id);
	}

}
