package com.cbt.dao;

import java.io.Serializable;
import java.util.List;

import com.cbt.entity.Milestone;

public interface MilestoneDao extends Serializable {

	
	
	/**
	 * 单个orderId查询
	 * @param orderId
	 * @return
	 */
	List<Milestone> queryByOrderId(String orderId);
}
