package com.cbt.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cbt.dao.TestDao;
import com.cbt.entity.Test;
import com.cbt.service.TestService;


@Service
public class TestServiceImpl implements TestService {

	@Resource
	private TestDao testDao;
	
	@Override
	public void insert(Test test) {
		testDao.insert(test);
	}

}
