package com.cbt.dao;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cbt.entity.QualityIssuesPic;

public interface QualityIssuesPicDao extends Serializable {

	/**
	 * 根据消息中心id查询图片信息
	 * @param messageCenterId
	 * @return
	 */
	List<QualityIssuesPic> queryByOrderMessageId(Integer orderMessageId);
	
	
	
    /**
     * 批量插入对象
     * @param list
     */
     void insert(List<QualityIssuesPic> list);
}
