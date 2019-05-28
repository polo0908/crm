package com.cbt.enums;
/**
 * 采购支持枚举(产品类型)
 * @author Administrator
 *
 */
public enum SupportEnum {
	/**
	 * 现有产品
	 */
	EXISTING_PRODUCTS("0","Existing Products"),
	/**
	 * 定制产品
	 */
	CUSTOMIZED_PRODUCTS("1","Customized Products or Parts"),
	/**
	 * 新产品
	 */
	NEW_INVENTION("3","New Invention");
	
	private String code;
	public String getCode() {
		return code;
	}

	public String getValue() {
		return value;
	}

	private String value;
	
	SupportEnum(String code, String value){
		this.code = code;
		this.value = value;
	}
	
	public static SupportEnum getEnum(int code) {
		for(SupportEnum sourceEnum:  SupportEnum.values()) {
	    	if(sourceEnum.getCode().equals(code)) return sourceEnum;
	    }
		return null;
	}
}
