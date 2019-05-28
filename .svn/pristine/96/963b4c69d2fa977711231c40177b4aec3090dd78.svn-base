package com.cbt.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cbt.dao.ClientDrawingsDao;
import com.cbt.dao.UpdateDrawingDao;
import com.cbt.entity.ClientDrawings;
import com.cbt.entity.UpdateDrawing;
import com.cbt.service.ClientDrawingsService;

@Service
public class ClientDrawingsServiceImpl implements ClientDrawingsService {

	@Resource
	private ClientDrawingsDao clientDrawingsDao;
	@Resource
	private UpdateDrawingDao updateDrawingDao;
//	@Override
//	public List<ClientDrawings> queryByDrawingName(String drawingsName,String userId) {
//		
//	List<ClientDrawings> clientDrawings = clientDrawingsDao.queryByDrawingsName(drawingsName, userId);
//	
//		return clientDrawings;
//	}

	@Override
	public ClientDrawings queryById(Integer id) {
		
		ClientDrawings clientDrawings = clientDrawingsDao.queryById(id);
		return clientDrawings;
	}

	@Override
	public List<ClientDrawings> queryByUserId(String userId,Integer start,Integer pageSize) {
	    List<ClientDrawings> clientDrawings = clientDrawingsDao.queryListByUserId(userId, start, pageSize);
		return clientDrawings;
	}
    
	@Transactional
	@Override
	public void updateClientDrawings(ClientDrawings clientDrawing,UpdateDrawing updateDrawing)throws Exception{
		
		clientDrawingsDao.updateClientDrawings(clientDrawing);		
		updateDrawingDao.insertUpdateDrawing(updateDrawing);

	}

	@Override
	public List<ClientDrawings> queryListByOrderId(String orderId) {
	    List<ClientDrawings> clientDrawings = clientDrawingsDao.queryListByOrderId(orderId);
		return clientDrawings;
	}

	@Override
	public int total(String userId) {
		Integer total = clientDrawingsDao.total(userId);
		return total;
	}

	@Override
	public List<ClientDrawings> queryListByIds(Integer[] ids) {
		List<ClientDrawings> clientDrawings = clientDrawingsDao.queryListByIds(ids);
		return clientDrawings;
	}

	
	@Transactional
	@Override
	public void insertClientDrawings(List<Object> list) {
		clientDrawingsDao.insertClientDrawings(list);
		
	}

	@Override
	public List<ClientDrawings> queryByOrderId(String orderId, Integer start,
			Integer pageSize) {
		return clientDrawingsDao.queryByOrderId(orderId, start, pageSize);
	}

	@Override
	public int totalByOrderId(String orderId) {
		return clientDrawingsDao.totalByOrderId(orderId);
	}

}
