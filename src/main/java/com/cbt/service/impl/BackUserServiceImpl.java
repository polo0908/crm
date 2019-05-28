package com.cbt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cbt.dao.BackUserDao;
import com.cbt.entity.BackUser;
import com.cbt.service.BackUserService;

@Service
public class BackUserServiceImpl implements BackUserService {

	@Resource
	private BackUserDao backUserDao;


	@Override
	public BackUser queryBackUserById(Integer id) {
		return backUserDao.queryBackUserById(id);
	}

	@Transactional
	@Override
	public void insertBackUser(BackUser backUser) {
		backUserDao.insertBackUser(backUser);
	}
	
	@Transactional
	@Override
	public void updateBackUser(BackUser backUser) {
		backUserDao.updateBackUser(backUser);
	}

	@Override
	public BackUser queryBackUserByName(String userName) {
		BackUser user = backUserDao.queryBackUserByName(userName);
		return user;
	}

	@Override
	public BackUser queryBackUserByUserId(String userId) {
		BackUser user = backUserDao.queryBackUserByUserId(userId);
		return user;
	}

}
