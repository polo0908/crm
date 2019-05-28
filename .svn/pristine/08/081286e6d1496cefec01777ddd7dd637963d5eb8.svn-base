package com.cbt.dao;

import java.io.Serializable;
import java.util.List;
import com.cbt.entity.ClientOrderQcReport;

public interface ClientOrderQcReportDao extends Serializable {
  
	/**
	 * 根据订单号查询
	 * @author polo
	 * 2017年8月3日
	 */
	List<ClientOrderQcReport> queryByClientOrderId(String orderId);
	
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	ClientOrderQcReport queryById(Integer id);
	
	
	/**
	 * 批量插入qc报告
	 * @param list
	 */
	void insertBatch(List<ClientOrderQcReport> list);
	
	
	
	
	/**
	 * 根据id删除
	 * @param id
	 */
	void deleteById(Integer id);
	
	/**
	 * 更新new
	 * @param clientOrderQcReport
	 */
	void update(ClientOrderQcReport clientOrderQcReport); 
	
}
