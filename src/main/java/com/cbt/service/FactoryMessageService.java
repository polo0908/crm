package com.cbt.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.cbt.entity.FactoryMessage;

public interface FactoryMessageService extends Serializable {

	
	
	/**
	 * 插入工厂回复
	 * @author polo
	 * 2017年5月17日
	 *
	 */
	public List<FactoryMessage> insert(FactoryMessage factoryMessage)throws Exception;
	
	
	/**
	 * 批量更新工厂消息读取状态
	 * @author polo
	 * 2017年5月17日
	 *
	 */
	public Map<String,Object> updateFactoryMessage(Integer messageCenterId)throws Exception;
}
