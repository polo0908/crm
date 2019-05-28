package com.cbt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cbt.dao.QuotationProductionDao;
import com.cbt.entity.QuotationProcessInfo;
import com.cbt.entity.QuotationProductionBean;
import com.cbt.entity.QuotationProductionPriceBean;
import com.cbt.service.QuotationProductionService;

@SuppressWarnings("serial")
@Service
public class QuotationProductionServiceImpl implements QuotationProductionService {
   
	@Resource
	private QuotationProductionDao quotationProductionDao;
	
	@Override
	public List<QuotationProductionBean> queryByQuotationInfoId(
			Integer quotationInfoId) {
		return quotationProductionDao.queryByQuotationInfoId(quotationInfoId);
	}

	@Override
	public List<QuotationProductionPriceBean> queryByProductionId(
			Integer ProductionId) {
		return quotationProductionDao.queryByProductionId(ProductionId);
	}

	@Override
	public List<QuotationProcessInfo> queryProcessByProductionId(Integer priceId) {
		return quotationProductionDao.queryProcessByProductionId(priceId);
	}

	@Override
	public QuotationProductionPriceBean queryByPriceId(Integer priceId) {
		return quotationProductionDao.queryByPriceId(priceId);
	}

	@Override
	public QuotationProductionBean queryProductionById(Integer id) {
		return quotationProductionDao.queryProductionById(id);
	}

}
