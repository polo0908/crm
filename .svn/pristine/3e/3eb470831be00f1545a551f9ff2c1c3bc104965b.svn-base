package com.cbt.enums;

public enum OrderTypeEnum {
    /**
	 * 客户质量要求
	 */
	QUALITY("0","Request Quality Control"),
	/**
	 * 客户选择工厂
	 */
	FACTORIES_SELECTED("1","Contact Factories Selected By You"),
	/**
	 * 客户工厂审核
	 */
	FACTORY_AUDIT("2","Request Factory Audit"),
	/**
	 * 采购帮助支持
	 */
	SOURCING_ASSISTANCE("3","Request Sourcing Assistance");
	
	private String code;
	public String getCode() {
		return code;
	}

	public String getValue() {
		return value;
	}

	private String value;
	
	OrderTypeEnum(String code, String value){
		this.code = code;
		this.value = value;
	}
	
	public static OrderTypeEnum getEnum(int code) {
		for(OrderTypeEnum sourceEnum:  OrderTypeEnum.values()) {
	    	if(sourceEnum.getCode().equals(code)) return sourceEnum;
	    }
		return null;
	}
}
