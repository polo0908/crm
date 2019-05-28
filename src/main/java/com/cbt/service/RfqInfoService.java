package com.cbt.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cbt.entity.ClientOrder;
import com.cbt.entity.ReOrder;
import com.cbt.entity.RfqInfo;

public interface RfqInfoService {
    /**
     * 保存新图纸信息
     * @param rfqInfo
     */
	 public void insertRfqInfo(RfqInfo rfqInfo);
	 
	 
    /**
     * 根据userId、factoryId查询客户新询盘订单
     * @param userId
     * @return
     */
     public List<RfqInfo> queryByUserId(String userId,String factoryId);
     
     
 	/**
 	 * 查询订单总数
 	 * @return
 	 */
 	public int totalAmount(String userId,String factoryId);
 	
	/**
	 * 根据id查询新图纸信息
	 * @param id
	 * @return
	 */
	public RfqInfo queryById(Integer id);
}
