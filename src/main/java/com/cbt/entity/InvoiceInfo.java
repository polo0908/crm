package com.cbt.entity;

import java.io.Serializable;
import java.text.ParseException;
import java.util.Date;

import com.cbt.util.DateFormat;

/**
* @ClassName: ClientOrder 
* @Description: 客户历史订单
 */
public class InvoiceInfo implements Serializable{
 
   /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	  private String userid;    //客户id
	  private String salesId;   //销售id
	  private String orderId;   //订单编号
      private String invoiceId; //发票编号
	  private Integer amountUnit; //金额单元(关联amount_unit id)
      private Double productPrice; //产品价格
      private Integer transactionType; //交易类型
      private Date createTime;  //发票创建时间
	  private Date updateTime;  //信息更新时间
	  private String invoicePath;//Invoice下载路径
	  private Double moldPrice;    //模板价格
      private Double shippingFee;   //邮费
	  private Double otherPrice;  //其他金额
	  private String comment;     //备注说明  
	  private Double amount;      //发票金额
	  
	  
	  private String factoryId;   //工厂id
	  
	  //虚拟字段
	  private double sumAmountActual;  //实际付款总金额
	  private double amountActual;     //最近付款金额
	  private Date paymentTime;   //最近付款时间
	  
	  
	public double getSumAmountActual() {
		return sumAmountActual;
	}
	public void setSumAmountActual(double sumAmountActual) {
		this.sumAmountActual = sumAmountActual;
	}
	public double getAmountActual() {
		return amountActual;
	}
	public void setAmountActual(double amountActual) {
		this.amountActual = amountActual;
	}
	public Date getPaymentTime() {
		return paymentTime;
	}
	public void setPaymentTime(Date paymentTime) {
		this.paymentTime = paymentTime;
	}
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	public String getFactoryId() {
		return factoryId;
	}
	public void setFactoryId(String factoryId) {
		this.factoryId = factoryId;
	}
	public Double getMoldPrice() {
		return moldPrice;
	}
	public void setMoldPrice(Double moldPrice) {
		if(moldPrice == null || "".equals(moldPrice)){
			this.moldPrice = 0.0;
		}else{
			this.moldPrice = moldPrice;
		}
		
	}
	public Double getShippingFee() {
		return shippingFee;
	}
	public void setShippingFee(Double shippingFee) {
		if(shippingFee == null || "".equals(shippingFee)){
			this.shippingFee = 0.0;
		}else{
			this.shippingFee = shippingFee;
		}
		
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		try {
			this.createTime = DateFormat.formatDate1(createTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			this.createTime = createTime;
		}
		
	}
	public String getInvoicePath() {
		return invoicePath;
	}
	public void setInvoicePath(String invoicePath) {
		this.invoicePath = invoicePath;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getSalesId() {
		return salesId;
	}
	public void setSalesId(String salesId) {
		this.salesId = salesId;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getInvoiceId() {
		return invoiceId;
	}
	public void setInvoiceId(String invoiceId) {
		this.invoiceId = invoiceId;
	}

	public Integer getAmountUnit() {
		return amountUnit;
	}
	public void setAmountUnit(Integer amountUnit) {
		this.amountUnit = amountUnit;
	}

	
	public Double getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(Double productPrice) {
		if(productPrice == null || "".equals(productPrice)){
			this.productPrice = 0.0;
		}else{
			this.productPrice = productPrice;
		}
		
	}
	public Double getOtherPrice() {
		return otherPrice;
	}
	public void setOtherPrice(Double otherPrice) {
		if(otherPrice == null || "".equals(otherPrice)){
			this.otherPrice = 0.0;
		}else{
			this.otherPrice = otherPrice;
		}
		
	}
	public Integer getTransactionType() {
		return transactionType;
	}
	public void setTransactionType(Integer transactionType) {
		this.transactionType = transactionType;
	}

	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		try {
			this.updateTime = DateFormat.formatDate1(updateTime);
		} catch (ParseException e) {
			e.printStackTrace();
			this.updateTime = updateTime;
		}
		
	}
	@Override
	public String toString() {
		return "InvoiceInfo [id=" + id + ", userid=" + userid + ", salesId="
				+ salesId + ", orderId=" + orderId + ", invoiceId=" + invoiceId
				+ ", amountUnit=" + amountUnit + ", productPrice="
				+ productPrice + ", transactionType=" + transactionType
				+ ", createTime=" + createTime + ", updateTime=" + updateTime
				+ ", invoicePath=" + invoicePath + ", moldPrice=" + moldPrice
				+ ", shippingFee=" + shippingFee + ", otherPrice=" + otherPrice
				+ ", comment=" + comment + ", amount=" + amount
				+ ", factoryId=" + factoryId + ", sumAmountActual="
				+ sumAmountActual + ", amountActual=" + amountActual
				+ ", paymentTime=" + paymentTime + "]";
	}

	

	
	  

	
	

	
	
	
}
