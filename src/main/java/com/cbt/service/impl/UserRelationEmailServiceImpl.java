package com.cbt.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cbt.dao.UserRelationEmailDao;
import com.cbt.entity.UserRelationEmail;
import com.cbt.service.UserRelationEmailService;


@Service
public class UserRelationEmailServiceImpl implements UserRelationEmailService {
     
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Resource
	private UserRelationEmailDao userRelationEmailDao;
	
	@Override
	public UserRelationEmail queryUseridByEmail(String email) {
		return userRelationEmailDao.queryUseridByEmail(email);
	}

	@Override
	public void updateUserRelationEmail(UserRelationEmail userRelationEmail) {
		userRelationEmailDao.updateUserRelationEmail(userRelationEmail);
		
	}

}
