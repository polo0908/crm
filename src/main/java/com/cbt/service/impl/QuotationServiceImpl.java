package com.cbt.service.impl;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cbt.dao.QuotationDao;
import com.cbt.dao.QuotationProductionDao;
import com.cbt.entity.QuotationBean;
import com.cbt.service.QuotationService;
/**
 * 报价单service层
 * @author polo
 * @time 2017.6.9
 */
@Service
public class QuotationServiceImpl implements QuotationService {

	@Resource
	private QuotationDao quotationDao;
	@Resource
	private QuotationProductionDao quotationProductionDao;
	
	

	
	
	@Override
	public void updateQuotation(QuotationBean quotationBean) {
		quotationDao.updateQuotation(quotationBean);
		
	}
	@Override
	public QuotationBean queryById(Integer id) {
		return quotationDao.queryById(id);
	}
	@Override
	public List<QuotationBean> queryByUserid(String user, String beginDate,
			String endDate, Integer page, String userId) {
		return quotationDao.queryByUserid(user, beginDate, endDate, page, userId);
	}
	@Override
	public int total(String user, String beginDate, String endDate,
			String userId) {
		return quotationDao.total(user, beginDate, endDate, userId);
	}




	
	
	

}
