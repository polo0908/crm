package com.cbt.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cbt.dao.BackUserDao;
import com.cbt.dao.FactoryInfoDao;
import com.cbt.entity.BackUser;
import com.cbt.entity.FactoryInfo;
import com.cbt.service.FactoryInfoService;

@Service
public class FactoryInfoServiceImpl implements FactoryInfoService {

	@Resource
	private FactoryInfoDao factoryInfoDao;
	
	@Resource
	private BackUserDao backUserDao;
	
	public FactoryInfo queryByFactoryId(String factoryId) {
		return factoryInfoDao.queryByFactoryId(factoryId);
	}

	
	@Transactional
	@Override
	public void insert(FactoryInfo factoryInfo,BackUser backUser)throws Exception{
		
		if(!(factoryInfo == null || "".equals(factoryInfo))){
			factoryInfoDao.insert(factoryInfo);
			backUserDao.insertBackUser(backUser);
		}


	}

	@Override
	public Integer queryMaxId() {		
		return factoryInfoDao.queryMaxId();
	}

	@Override
	public FactoryInfo queryByEmail(String email) {
		return factoryInfoDao.queryByEmail(email);
	}

	@Override
	public String queryByMaxId(Integer id) {
		return factoryInfoDao.queryByMaxId(id);
	}

	@Override
	public FactoryInfo queryByFactoryName(String factoryName) {
		return factoryInfoDao.queryByFactoryName(factoryName);
	}

	
	
}
