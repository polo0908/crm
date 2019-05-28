package com.cbt.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cbt.entity.QuotationBean;


public interface QuotationService {
    
	/**
	 * 根据客户Id查询所有报价单
	 * @author polo
	 * 2017年6月9日
	 *
	 */
    public List<QuotationBean> queryByUserid(String user, String beginDate,String endDate,Integer page,String userId);

    /**
     * 更新报价单
     * @author polo
     * 2017年6月9日
     *
     */
    public void updateQuotation(QuotationBean quotationBean);
	
	
	/**
	 * 根据id查询报价单
	 * @author polo
	 * 2017年6月9日
	 *
	 */
    public QuotationBean queryById(Integer id);
	
	/**
	 * 查询报价单总数
	 * @param userid
	 * @return
	 */
	public int total(String user,String beginDate,String endDate,String userId);
}
