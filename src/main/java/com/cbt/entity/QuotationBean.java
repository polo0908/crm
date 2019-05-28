package com.cbt.entity;

import java.io.Serializable;
import java.util.List;

/**
 * 报价单详情实体类;
 * @author tb
 * @time 2017.3.28
 */
public class QuotationBean implements Serializable {

	private static final long serialVersionUID = 8383044145226512113L;

	private Integer id;
	
	private String userId;   //客户Id
	
	private String factoryId;//工厂id
	
	private String quotationId;//报价单id
	
	private String projectId;    //项目号
	
	private String quotationSubject;//报价主题
	
	private String customerName;//客户名
	
	private String currency;//货币
	
	private String incoTerm;//运输选择
	
	private String quotationDate;//报价日期
	
	private Integer quotationValidity;//报价有效期
	
	private String quoter;//报价人
	
	private String quoterEmail;//报价人邮箱
	
	private String quoterTel;//报价人电话
	
	private String remark;//备注信息
	
	private String createTime;//创建时间
	
	private String updateTime;//更新时间
	
	private String remarkImg; //图片备注
	
	private String quotationPath;  //报价单下载路径
	
	private String imgNames;       //图片名
    
	private Integer readStatus;     //是否读取  0：未读 1：已读
	
	private Integer rfqId;          //新图纸询盘表ID
	
	private String saleName;        //报价销售
	
	private Integer quotationStatus;  //报价状态  0：未操作 1：报价中 2：已发送	
	
	private List<QuotationProductionBean> quotationProductionBeanList;
	
	private String factoryName;         //工厂名
	     
	private String quotationPriceRange;  //价格区间
	
	private Integer weightStatus;         //不显示0 、显示重量1
	
	private Integer processStatus;        //不显示0、显示工艺1
	
	
	
    
	public Integer getWeightStatus() {
		return weightStatus;
	}

	public void setWeightStatus(Integer weightStatus) {
		this.weightStatus = weightStatus;
	}

	public Integer getProcessStatus() {
		return processStatus;
	}

	public void setProcessStatus(Integer processStatus) {
		this.processStatus = processStatus;
	}

	public String getQuotationPriceRange() {
		return quotationPriceRange;
	}

	public void setQuotationPriceRange(String quotationPriceRange) {
		this.quotationPriceRange = quotationPriceRange;
	}

	public Integer getQuotationStatus() {
		return quotationStatus;
	}

	public void setQuotationStatus(Integer quotationStatus) {
		this.quotationStatus = quotationStatus;
	}

	public Integer getRfqId() {
		return rfqId;
	}

	public void setRfqId(Integer rfqId) {
		this.rfqId = rfqId;
	}

	public String getSaleName() {
		return saleName;
	}

	public void setSaleName(String saleName) {
		this.saleName = saleName;
	}

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public String getFactoryName() {
		return factoryName;
	}

	public void setFactoryName(String factoryName) {
		this.factoryName = factoryName;
	}

	public Integer getReadStatus() {
		return readStatus;
	}

	public void setReadStatus(Integer readStatus) {
		this.readStatus = readStatus;
	}

	public String getImgNames() {
		return imgNames;
	}

	public void setImgNames(String imgNames) {
		this.imgNames = imgNames;
	}

	public String getQuotationPath() {
		return quotationPath;
	}

	public void setQuotationPath(String quotationPath) {
		this.quotationPath = quotationPath;
	}



	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFactoryId() {
		return factoryId;
	}

	public void setFactoryId(String factoryId) {
		this.factoryId = factoryId;
	}

	public String getQuotationId() {
		return quotationId;
	}

	public void setQuotationId(String quotationId) {
		this.quotationId = quotationId;
	}

	public String getQuotationSubject() {
		return quotationSubject;
	}

	public void setQuotationSubject(String quotationSubject) {
		this.quotationSubject = quotationSubject;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public String getIncoTerm() {
		return incoTerm;
	}

	public void setIncoTerm(String incoTerm) {
		this.incoTerm = incoTerm;
	}

	public String getQuotationDate() {
		return quotationDate;
	}

	public void setQuotationDate(String quotationDate) {
		this.quotationDate = quotationDate;
	}

	public Integer getQuotationValidity() {
		return quotationValidity;
	}

	public void setQuotationValidity(Integer quotationValidity) {
		this.quotationValidity = quotationValidity;
	}

	public String getQuoter() {
		return quoter;
	}

	public void setQuoter(String quoter) {
		this.quoter = quoter;
	}

	public String getQuoterEmail() {
		return quoterEmail;
	}

	public void setQuoterEmail(String quoterEmail) {
		this.quoterEmail = quoterEmail;
	}

	public String getQuoterTel() {
		return quoterTel;
	}

	public void setQuoterTel(String quoterTel) {
		this.quoterTel = quoterTel;
	}




	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getRemarkImg() {
		return remarkImg;
	}

	public void setRemarkImg(String remarkImg) {
		this.remarkImg = remarkImg;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public List<QuotationProductionBean> getQuotationProductionBeanList() {
		return quotationProductionBeanList;
	}

	public void setQuotationProductionBeanList(
			List<QuotationProductionBean> quotationProductionBeanList) {
		this.quotationProductionBeanList = quotationProductionBeanList;
	}

	@Override
	public String toString() {
		return "QuotationBean [id=" + id + ", userId=" + userId
				+ ", factoryId=" + factoryId + ", quotationId=" + quotationId
				+ ", projectId=" + projectId + ", quotationSubject="
				+ quotationSubject + ", customerName=" + customerName
				+ ", currency=" + currency + ", incoTerm=" + incoTerm
				+ ", quotationDate=" + quotationDate + ", quotationValidity="
				+ quotationValidity + ", quoter=" + quoter + ", quoterEmail="
				+ quoterEmail + ", quoterTel=" + quoterTel + ", remark="
				+ remark + ", createTime=" + createTime + ", updateTime="
				+ updateTime + ", remarkImg=" + remarkImg + ", quotationPath="
				+ quotationPath + ", imgNames=" + imgNames + ", readStatus="
				+ readStatus + ", rfqId=" + rfqId + ", saleName=" + saleName
				+ ", quotationStatus=" + quotationStatus
				+ ", quotationProductionBeanList="
				+ quotationProductionBeanList + ", factoryName=" + factoryName
				+ ", quotationPriceRange=" + quotationPriceRange
				+ ", weightStatus=" + weightStatus + ", processStatus="
				+ processStatus + "]";
	}
	
	
}
