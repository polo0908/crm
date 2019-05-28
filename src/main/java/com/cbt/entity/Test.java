package com.cbt.entity;

import java.io.Serializable;

public class Test implements Serializable {
      
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;    
	private String createTime;    //创建时间
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	@Override
	public String toString() {
		return "Test [id=" + id + ", createTime=" + createTime + "]";
	}
	
	
	
}
