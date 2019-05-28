package com.cbt.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cbt.entity.AmountUnit;
import com.cbt.entity.QuotationBean;
import com.cbt.entity.QuotationProcessInfo;
import com.cbt.entity.QuotationProductionBean;
import com.cbt.entity.QuotationProductionPriceBean;
import com.cbt.entity.QuotationRemarkTemplate;

public interface QuotationProductionDao {
	
	/**
	 * 批量插入报价产品信息
	 * @author polo
	 * 2017年5月24日
	 *
	 */
	void insertQuotationProductionBatch(List<QuotationProductionBean> list);
	
	/**
	 * 批量插入报价产品价格
	 * @author polo
	 * 2017年5月24日
	 *
	 */
	void insertQuotationPriceBatch(List<QuotationProductionPriceBean> list);
	
	
	/**
	 * 插入报价产品
	 * @author polo
	 * 2017年5月25日
	 *
	 */
	void insertQuotationProduction(QuotationProductionBean quotationProductionBean);
	
	
	
	/**
	 * 根据报价单id删除产品
	 * @author polo
	 * 2017年5月26日
	 *
	 */
	void deletePriceByQuotationId(Integer quotationInfoId);
	
	
	
	/**
	 * 根据产品id删除价格表
	 * @author polo
	 * 2017年5月26日
	 *
	 */
	void deletePriceByProductionId(Integer ProductionId);
	
	
	/**
	 * 根据报价单id查询
	 * @author polo
	 * 2017年5月26日
	 *
	 */
	List<QuotationProductionBean> queryByQuotationInfoId(Integer quotationInfoId);
	
	
	/**
	 * 根据价格表Id查询数据
	 * @param priceId
	 * @return
	 */
	QuotationProductionPriceBean queryByPriceId(Integer priceId);
	
	/**
	 * 根据产品表id查询
	 * @author polo
	 * 2017年5月26日
	 *
	 */
	List<QuotationProductionPriceBean> queryByProductionId(Integer ProductionId);
	
	
	
	/**
	 * 根据产品查询工艺
	 * @param ProductionId
	 * @return
	 */
	List<QuotationProcessInfo> queryProcessByProductionId(Integer priceId);
	
	
	/**
	 * 根据id查询产品
	 * @param id
	 * @return
	 */
	QuotationProductionBean queryProductionById(Integer id);
}
