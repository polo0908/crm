package com.cbt.service;

import java.io.Serializable;
import java.util.List;

import com.cbt.entity.Milestone;

public interface MilestoneService extends Serializable {
	/**
	 * 单个orderId查询
	 * @param orderId
	 * @return
	 */
	public List<Milestone> queryByOrderId(String orderId);
}
