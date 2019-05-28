package com.cbt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cbt.dao.MilestoneDao;
import com.cbt.entity.Milestone;
import com.cbt.service.MilestoneService;

@Service
public class MilestoneServiceImpl implements MilestoneService {
    
	@Resource
	private MilestoneDao milestoneDao;
	
	
	public List<Milestone> queryByOrderId(String orderId) {
		return milestoneDao.queryByOrderId(orderId);
	}

}
