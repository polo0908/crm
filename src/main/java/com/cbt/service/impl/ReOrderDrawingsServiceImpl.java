package com.cbt.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cbt.dao.ReOrderDrawingsDao;
import com.cbt.entity.ReOrderDrawings;
import com.cbt.service.ReOrderDrawingsService;

@Service
public class ReOrderDrawingsServiceImpl implements ReOrderDrawingsService {
    @Resource
    private ReOrderDrawingsDao reOrderDrawingsDao;
	@Override
	public void insertReOrders(ArrayList<Map<Object, Object>> reOrderDrawings) {
		
		reOrderDrawingsDao.insertReOrders(reOrderDrawings);
          
	}
	@Override
	public List<ReOrderDrawings> queryReOrderDrawings(Integer reOrderId) {

		return reOrderDrawingsDao.queryReOrderDrawings(reOrderId);
	}
	@Override
	public ReOrderDrawings queryById(Integer id) {
		// TODO Auto-generated method stub
		return reOrderDrawingsDao.queryById(id);
	}

}
