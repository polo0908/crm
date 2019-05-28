package com.cbt.service;

import java.io.Serializable;

import com.cbt.entity.UserRelationEmail;

public interface UserRelationEmailService extends Serializable {

	
	/**
	 * 根据email查询userid（user_relation_email表）
	 * @param email
	 * @return
	 */
	public UserRelationEmail queryUseridByEmail(String email);
	
	
	/**
	 * 更新账号密码
	 * @Title updateUserRelationEmail 
	 * @Description
	 * @param userRelationEmail
	 * @return void
	 */
	public void updateUserRelationEmail(UserRelationEmail userRelationEmail);
}
