package com.cbt.enums;
/**
 * 订单状态
 * @author Administrator
 *
 */
public enum OrderStatusEnum {
	 /**
	 * 未付款
	 */
	NO_PAY(0,"未付款"),
	/**
	 * 已付款待确认
	 */
	PAY_NO_CONFIRM(1,"已付款待确认"),
	/**
	 * 已确认进行中
	 */
	CONFIRM(2,"已确认进行中"),
	/**
	 * 已完成
	 */
	COMPLETED(3,"已完成"),
	/**
	 * 已付款待确认
	 */
	FINISHED(4,"已完结");
	private int code;
	public int getCode() {
		return code;
	}

	public String getValue() {
		return value;
	}

	private String value;
	
	OrderStatusEnum(int code, String value){
		this.code = code;
		this.value = value;
	}
	
	public static OrderStatusEnum getEnum(int code) {
		for(OrderStatusEnum sourceEnum:  OrderStatusEnum.values()) {
	    	if(sourceEnum.getCode() == code) return sourceEnum;
	    }
		return null;
	}
}
