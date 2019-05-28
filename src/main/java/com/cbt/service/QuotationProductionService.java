package com.cbt.service;

import java.io.Serializable;
import java.util.List;

import com.cbt.entity.QuotationProcessInfo;
import com.cbt.entity.QuotationProductionBean;
import com.cbt.entity.QuotationProductionPriceBean;

public interface QuotationProductionService extends Serializable {

	
	
	/**
	 * 根据报价单id查询
	 * @author polo
	 * 2017年5月26日
	 *
	 */
	public List<QuotationProductionBean> queryByQuotationInfoId(Integer quotationInfoId);
	
	
	
	/**
	 * 根据产品表id查询
	 * @author polo
	 * 2017年5月26日
	 *
	 */
	public List<QuotationProductionPriceBean> queryByProductionId(Integer ProductionId);
	
	
	/**
	 * 根据产品查询工艺
	 * @param ProductionId
	 * @return
	 */
	public List<QuotationProcessInfo> queryProcessByProductionId(Integer priceId);
	
	/**
	 * 根据价格表Id查询数据
	 * @param priceId
	 * @return
	 */
	public QuotationProductionPriceBean queryByPriceId(Integer priceId);
	
	
	/**
	 * 根据id查询产品
	 * @param id
	 * @return
	 */
	public QuotationProductionBean queryProductionById(Integer id);
}
