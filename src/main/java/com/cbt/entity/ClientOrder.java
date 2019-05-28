package com.cbt.entity;

import java.io.Serializable;
import java.text.ParseException;
import java.util.Date;

import com.cbt.util.DateFormat;

/**
* @ClassName: ClientOrder 
* @Description: 客户历史订单
 */
public class ClientOrder implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String userid;
	private String orderId;//订单号
	private Double amount; //发票金额
	private Integer orderStatus; //订单状态
	private Date createTime; //创建时间
	private Date outputTime; //出库时间
	private String poPath;//PO下载路径
	private String qcReportPath;//QC_Report下载路径
	private String shippingDocPath; //shipping_Doc下载路径
	private Integer orderSource;  //订单来源(0:历史订单 1:reOrder订单 2:新图纸询盘)
	private String invoiceIds;  //发票编号集合
	private String poNumber;     //客户PO号
	private Date deliveryTime;  //交期时间
	private String factoryId;     //工厂id
	private String arrivalDate;   //到达日期  
//	private String BLAvailableDate; //海运提单时间
//	private String ISFDate;         //申报时间
	private double actualAmount;    //实际到账金额
	private String orderRequest;    //实际到账金额
	private String salesName;        //销售名
	private String projectName;        //项目名
	private Date paymentReceived;    //付款时间
	
	//虚拟字段
	private String drawingNames;
	private Double sumAmount;       //客户单个工厂总金额
	private Double sumTotalPaid;    //客户工厂实际付款   

	 
	
	
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public Date getPaymentReceived() {
		return paymentReceived;
	}
	public void setPaymentReceived(Date paymentReceived) {
		this.paymentReceived = paymentReceived;
	}
	public String getSalesName() {
		return salesName;
	}
	public void setSalesName(String salesName) {
		this.salesName = salesName;
	}
	public String getOrderRequest() {
		return orderRequest;
	}
	public void setOrderRequest(String orderRequest) {
		this.orderRequest = orderRequest;
	}
	public Double getSumAmount() {
		return sumAmount;
	}
	public void setSumAmount(Double sumAmount) {
		this.sumAmount = sumAmount;
	}
	public Double getSumTotalPaid() {
		return sumTotalPaid;
	}
	public void setSumTotalPaid(Double sumTotalPaid) {
		this.sumTotalPaid = sumTotalPaid;
	}
	public double getActualAmount() {
		return actualAmount;
	}
	public void setActualAmount(double actualAmount) {
		this.actualAmount = actualAmount;
	}
	
	public String getDrawingNames() {
		return drawingNames;
	}
	public void setDrawingNames(String drawingNames) {
		this.drawingNames = drawingNames;
	}
	public String getArrivalDate() {
		return arrivalDate;
	}
	public void setArrivalDate(String arrivalDate) {
		this.arrivalDate = arrivalDate;
	}
	public String getFactoryId() {
		return factoryId;
	}
	public void setFactoryId(String factoryId) {
		this.factoryId = factoryId;
	}
	public Date getDeliveryTime() {
		return deliveryTime;
	}
	public void setDeliveryTime(Date deliveryTime) {
		try {
			this.deliveryTime = DateFormat.formatDate1(deliveryTime);
		} catch (ParseException e) {
			e.printStackTrace();
			this.deliveryTime = deliveryTime;
		}
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	public String getPoNumber() {
		return poNumber;
	}
	public void setPoNumber(String poNumber) {
		this.poNumber = poNumber;
	}

	public String getInvoiceIds() {
		return invoiceIds;
	}
	public void setInvoiceIds(String invoiceIds) {
		this.invoiceIds = invoiceIds;
	}
	public Integer getOrderSource() {
		return orderSource;
	}
	public void setOrderSource(Integer orderSource) {
		this.orderSource = orderSource;
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
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public Double getAmount() {
		return amount;
	}
	public int getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}
	public Date getCreateTime() {
			return createTime;
	}
	public void setCreateTime(Date createTime) {		
		
			try {
				this.createTime = DateFormat.formatDate1(createTime);
			} catch (ParseException e) {
				e.printStackTrace();
				this.createTime = createTime;
			}
			
	}
	public Date getOutputTime() {		
			return outputTime;
	}
	public void setOutputTime(Date outputTime) {
				
		try {
			this.outputTime = DateFormat.formatDate1(outputTime);
		} catch (ParseException e) {
			e.printStackTrace();
			this.outputTime = outputTime;
		}
	}
	public String getPoPath() {
		return poPath;
	}
	public void setPoPath(String poPath) {
		this.poPath = poPath;
	}

	public String getQcReportPath() {
		return qcReportPath;
	}
	public void setQcReportPath(String qcReportPath) {
		this.qcReportPath = qcReportPath;
	}
	public String getShippingDocPath() {
		return shippingDocPath;
	}
	public void setShippingDocPath(String shippingDocPath) {
		this.shippingDocPath = shippingDocPath;
	}
	@Override
	public String toString() {
		return "ClientOrder [id=" + id + ", userid=" + userid + ", orderId="
				+ orderId + ", amount=" + amount + ", orderStatus="
				+ orderStatus + ", createTime=" + createTime + ", outputTime="
				+ outputTime + ", poPath=" + poPath + ", qcReportPath="
				+ qcReportPath + ", shippingDocPath=" + shippingDocPath
				+ ", orderSource=" + orderSource + ", invoiceIds=" + invoiceIds
				+ ", poNumber=" + poNumber + ", deliveryTime=" + deliveryTime
				+ ", factoryId=" + factoryId + ", arrivalDate=" + arrivalDate
				+ ", actualAmount=" + actualAmount + ", orderRequest="
				+ orderRequest + ", salesName=" + salesName + ", projectName="
				+ projectName + ", paymentReceived=" + paymentReceived
				+ ", drawingNames=" + drawingNames + ", sumAmount=" + sumAmount
				+ ", sumTotalPaid=" + sumTotalPaid + "]";
	}
	

	
	
}
