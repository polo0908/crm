package com.cbt.dao;

import java.io.Serializable;
import java.util.List;

import com.cbt.entity.UserRelationEmail;

public interface UserRelationEmailDao extends Serializable {
    
	/**
	 * 根据email查询userid（user_relation_email表）
	 * @param email
	 * @return
	 */
	UserRelationEmail queryUseridByEmail(String email);
	
	
    /**
     * 插入对象
     * @param 
     */
    void insert(UserRelationEmail userRelationEmail);
    
    
    
    
  	/**
  	 * 批量插入关联表
  	 */	
  	void insertBatch(List<Object> list);
  	
  	
	/**
	 * 更新账号密码
	 * @Title updateUserRelationEmail 
	 * @Description
	 * @param userRelationEmail
	 * @return void
	 */
    void updateUserRelationEmail(UserRelationEmail userRelationEmail);
}
