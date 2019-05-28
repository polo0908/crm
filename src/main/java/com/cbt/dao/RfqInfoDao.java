package com.cbt.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cbt.entity.ReOrder;
import com.cbt.entity.RfqInfo;

public interface RfqInfoDao {
    /**
     * 保存新图纸信息
     * @param rfqInfo
     */
	 void insertRfqInfo(RfqInfo rfqInfo);
	 
	 
    /**
     * 根据userId、factoryId查询新图纸询盘
     * @param userId
     * @return
     */
     List<RfqInfo> queryByUserIdAndFactoryId(@Param("userid")String userId,@Param("factoryId")String factoryId);
     
     
 	/**
 	 * 查询订单总数
 	 * @return
 	 */
 	int totalAmount(String userId,String factoryId);
 	
	/**
	 * 根据id查询新图纸信息
	 * @param id
	 * @return
	 */
	RfqInfo queryById(Integer id);
	 
}
