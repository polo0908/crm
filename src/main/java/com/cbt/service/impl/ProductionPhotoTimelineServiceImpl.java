package com.cbt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cbt.dao.ProductionPhotoTimelineDao;
import com.cbt.entity.ProductionPhotoTimeline;
import com.cbt.service.ProductionPhotoTimelineService;


@Service
public class ProductionPhotoTimelineServiceImpl implements  ProductionPhotoTimelineService{

	private static final long serialVersionUID = 1L;
	@Resource
	private ProductionPhotoTimelineDao productionPhotoTimelineDao;
	

	@Override
	public List<ProductionPhotoTimeline> queryByOrderIdGroupByDate(String orderId) {
		return productionPhotoTimelineDao.queryByOrderIdGroupByDate(orderId);
	}


	@Override
	public List<ProductionPhotoTimeline> queryByUploadDate(String orderId,String uploadDate) {
		return productionPhotoTimelineDao.queryByUploadDate(orderId, uploadDate);
	}


	@Override
	public ProductionPhotoTimeline queryByOrderId(String orderId) {
		return productionPhotoTimelineDao.queryByOrderId(orderId);
	}


	@Override
	public String queryPhotoById(Integer id) {
		return productionPhotoTimelineDao.queryPhotoById(id);
	}


	@Override
	public List<ProductionPhotoTimeline> queryDocumentByUploadDate(
			String orderId, String uploadDate) {
		return productionPhotoTimelineDao.queryDocumentByUploadDate(orderId, uploadDate);
	}


	@Override
	public ProductionPhotoTimeline queryById(Integer id) {
		return productionPhotoTimelineDao.queryById(id);
	}







}
