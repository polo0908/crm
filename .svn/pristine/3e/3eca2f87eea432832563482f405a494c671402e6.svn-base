package com.cbt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cbt.dao.ShippingInfoDao;
import com.cbt.dao.UserDao;
import com.cbt.dao.UserRelationEmailDao;
import com.cbt.entity.ShippingInfo;
import com.cbt.entity.User;
import com.cbt.entity.UserRelationEmail;
import com.cbt.exception.NameOrPasswordException;
import com.cbt.service.UserService;
import com.cbt.util.DateFormat;
@Service

public class UserServiceImpl implements UserService {
   
	@Resource
	private UserDao userDao;
	@Resource
	private ShippingInfoDao shippingInfoDao;
	@Resource
	private UserRelationEmailDao userRelationEmailDao;
	
	@Transactional
	@Override	
	public void insertUser(List<Object> list,List<Object> list1)throws Exception{
		if(list.size() != 0){
			userDao.insertUser(list);  	
		}
        if(list1.size() != 0){
    		shippingInfoDao.insertShippingInfo(list1);	
        }
	}
   
	public UserRelationEmail login(String loginEmail, String pwd) throws NameOrPasswordException {
		//入口参数检查
		if(loginEmail==null || loginEmail.trim().isEmpty()){
			throw new NameOrPasswordException("Email can not be empty");
		}
		if(pwd==null || pwd.trim().isEmpty()){
			throw new NameOrPasswordException("password can not be empty");
		}
		//从业务层查询用户信息
		User user = userDao.queryByLoginMail(loginEmail);
		UserRelationEmail userRelationEmail = userRelationEmailDao.queryUseridByEmail(loginEmail);
		
		
		if(userRelationEmail==null){
			throw new NameOrPasswordException("Not yet registered,please register first");
		}
		if(userRelationEmail.getPwd().equals(pwd)){
			return userRelationEmail;                    //登录成功
		} else{
			throw new NameOrPasswordException("wrong password");
		}	
		
		
	}

	
	@Override
	public User queryByUserId(String userid) {
		User user = userDao.queryByUserId(userid);
		return user;
	}

	@Override
	public User queryByLoginMail(String loginEmail) {
		
		return userDao.queryByLoginMail(loginEmail);
	}

	@Transactional
	@Override
	public void insert(User user,ShippingInfo shippingInfo)throws Exception{
		UserRelationEmail userRelationEmail = new UserRelationEmail();
		if(user != null && !"".equals(user)){
			userDao.insert(user);
			shippingInfoDao.insertInfo(shippingInfo);
			userRelationEmail.setEmail(user.getLoginEmail());
			userRelationEmail.setUserid(user.getUserid());
			userRelationEmail.setPwd(user.getPwd());
			userRelationEmail.setCreateTime(DateFormat.format());
	        userRelationEmailDao.insert(userRelationEmail);
		}
		
	}

	@Override
	public Integer queryMaxId() {
		return userDao.queryMaxId();
	}

	@Override
	public void updateCustomerInfo(User user) {
		userDao.updateCustomerInfo(user);
		
	}

	@Override
	public void insert(String userid,User user1) throws Exception {
		UserRelationEmail userRelationEmail = new UserRelationEmail();
		if(StringUtils.isNotBlank(userid)){
			User user = userDao.queryByUserId(userid);
			userRelationEmail.setEmail(user1.getLoginEmail());
			userRelationEmail.setUserid(userid);
			userRelationEmail.setPwd(user1.getPwd());
			userRelationEmail.setCreateTime(DateFormat.format());
	        userRelationEmailDao.insert(userRelationEmail);
		}		
	}

	
	
}
