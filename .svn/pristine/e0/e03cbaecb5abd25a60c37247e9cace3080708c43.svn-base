package com.cbt.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cbt.entity.AmountUnit;
import com.cbt.entity.QuotationBean;
import com.cbt.entity.QuotationRemarkTemplate;

public interface QuotationDao {


	/**
	 * 根据客户Id查询所有报价单
	 * @author polo
	 * 2017年6月9日
	 *
	 */
    List<QuotationBean> queryByUserid(@Param("user")String user, @Param("begin")String beginDate,
    		@Param("end")String endDate,@Param("page")Integer page,@Param("userId")String userId);


    /**
     * 更新报价单
     * @author polo
     * 2017年6月9日
     *
     */
	void updateQuotation(QuotationBean quotationBean);
	
	
	/**
	 * 根据id查询报价单
	 * @author polo
	 * 2017年6月9日
	 *
	 */
	QuotationBean queryById(Integer id);
		
	/**
	 * 查询报价单总数
	 * @param userid
	 * @return
	 */
	int total(@Param("user")String user, @Param("begin")String beginDate,
    		@Param("end")String endDate,@Param("userId")String userId);
	
	
}
