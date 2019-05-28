package com.cbt.enums;

/**
 * 工厂质量枚举
 * @author Administrator
 *
 */
public enum QualityEnum {

	/**
	 * 客户需求(基本检查)
	 */
	BASIC_CHECK(0,"Check Appearance & Basic Function & Count"),
	
	/**
	 * 客户需求(部件检查)
	 */
	PART_CHECK(1,"Check Part-Level Dimensions"),
	/**
	 * 客户需求(零件复杂度)正常
	 */
	 NORMAL_PARTS(0,"Normal Parts"),
	/**
	 * 客户需求(零件复杂度)复杂
	 */
	 COMPLEX_PARTS(1,"Complex Parts"),
	/**
	 * 客户需求(化学成分检查)
	 */
	 CHEMICAL_COMPOSITION_CHECK(0," Chemical Composition Check"),
	/**
	 * 客户需求(盐雾试验)
	 */
	 SALT_SPRAY_TEST(1,"Salt Spray Test"),
	/**
	 * 客户需求(紫外线稳定性试验)
	 */
	 UV_STABILITY_TEST(2,"UV Stability Test"),
	 /**
	 * 客户需求(紫外线稳定性试验)
	 */
	 X_RAY_CHECK(3,"X_RAY_CHECK");
	
	private int code;
	public int getCode() {
		return code;
	}

	public String getValue() {
		return value;
	}

	private String value;
	
	QualityEnum(int code, String value){
		this.code = code;
		this.value = value;
	}
	
	public static QualityEnum getEnum(int code) {
		for(QualityEnum sourceEnum:  QualityEnum.values()) {
	    	if(sourceEnum.getCode() == code) return sourceEnum;
	    }
		return null;
	}
}
