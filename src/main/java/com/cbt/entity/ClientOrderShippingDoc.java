package com.cbt.entity;

import java.io.Serializable;
import java.util.Date;

public class ClientOrderShippingDoc implements Serializable {

	
	/**
	 * @author polo
	 * 2017年8月3日
	 * 
	 */
	private static final long serialVersionUID = 1L;
	  private Integer id;    
	  private String orderId;               //订单号
	  private String shippingDocPath;       //shipping报告下载路径
	  private String uploadDate;            //更新时间
	  private String oldOrNewShipping;      //shipping doc是否点击下载
	  private String shippingStartDate;     //运输开始时间
	  private String shippingArrivalDate;   //运输到达时间
	  private Date   BLAvailableDate;       //海运提单时间
	  private Date   ISFDate;                 //申报时间
	  private String BLCopyPath;            //BL复制件上传路径
	  private Date BLCopyUploadDate;        //BL复制件更新时间
	  private String oldOrNewBLCopy;        //BL复制件是否点击下载
	  
	  private String formAPath;             //form A 文件路径
	  private Date formAUploadDate;      //form A 更新时间
	  private String oldOrNewFormA;        //form A 是否点击下载
	  
	  private String packingListPath;       
	  private Date packingListUploadDate;     
	  private String oldOrNewPackingList;       
	  
      private String invoicePath;
	  private Date invoiceUploadDate;     
	  private String oldOrNewInvoice;       
	  
      private String BLPath;
	  private Date BLUploadDate;      
	  private String oldOrNewBL;       
	  
      private String packagingPath;
	  private Date packagingUploadDate;      
	  private String oldOrNewPackaging;      
	  
	  
      private String otherPath;
	  private Date otherUploadDate;      
	  private String oldOrNewOther;        

	  private String destinationPort;         //目的港
	  
	  
	  
	  
	public String getDestinationPort() {
		return destinationPort;
	}
	public void setDestinationPort(String destinationPort) {
		this.destinationPort = destinationPort;
	}
	public Date getBLCopyUploadDate() {
		return BLCopyUploadDate;
	}
	public void setBLCopyUploadDate(Date bLCopyUploadDate) {
		BLCopyUploadDate = bLCopyUploadDate;
	}
	public String getOldOrNewBLCopy() {
		return oldOrNewBLCopy;
	}
	public void setOldOrNewBLCopy(String oldOrNewBLCopy) {
		this.oldOrNewBLCopy = oldOrNewBLCopy;
	}
	public Date getFormAUploadDate() {
		return formAUploadDate;
	}
	public void setFormAUploadDate(Date formAUploadDate) {
		this.formAUploadDate = formAUploadDate;
	}
	public String getOldOrNewFormA() {
		return oldOrNewFormA;
	}
	public void setOldOrNewFormA(String oldOrNewFormA) {
		this.oldOrNewFormA = oldOrNewFormA;
	}
	public Date getPackingListUploadDate() {
		return packingListUploadDate;
	}
	public void setPackingListUploadDate(Date packingListUploadDate) {
		this.packingListUploadDate = packingListUploadDate;
	}
	public String getOldOrNewPackingList() {
		return oldOrNewPackingList;
	}
	public void setOldOrNewPackingList(String oldOrNewPackingList) {
		this.oldOrNewPackingList = oldOrNewPackingList;
	}
	public Date getInvoiceUploadDate() {
		return invoiceUploadDate;
	}
	public void setInvoiceUploadDate(Date invoiceUploadDate) {
		this.invoiceUploadDate = invoiceUploadDate;
	}
	public String getOldOrNewInvoice() {
		return oldOrNewInvoice;
	}
	public void setOldOrNewInvoice(String oldOrNewInvoice) {
		this.oldOrNewInvoice = oldOrNewInvoice;
	}
	public Date getBLUploadDate() {
		return BLUploadDate;
	}
	public void setBLUploadDate(Date bLUploadDate) {
		BLUploadDate = bLUploadDate;
	}
	public String getOldOrNewBL() {
		return oldOrNewBL;
	}
	public void setOldOrNewBL(String oldOrNewBL) {
		this.oldOrNewBL = oldOrNewBL;
	}
	public Date getPackagingUploadDate() {
		return packagingUploadDate;
	}
	public void setPackagingUploadDate(Date packagingUploadDate) {
		this.packagingUploadDate = packagingUploadDate;
	}
	public String getOldOrNewPackaging() {
		return oldOrNewPackaging;
	}
	public void setOldOrNewPackaging(String oldOrNewPackaging) {
		this.oldOrNewPackaging = oldOrNewPackaging;
	}
	public Date getOtherUploadDate() {
		return otherUploadDate;
	}
	public void setOtherUploadDate(Date otherUploadDate) {
		this.otherUploadDate = otherUploadDate;
	}
	public String getOldOrNewOther() {
		return oldOrNewOther;
	}
	public void setOldOrNewOther(String oldOrNewOther) {
		this.oldOrNewOther = oldOrNewOther;
	}
	public void setInvoicePath(String invoicePath) {
		this.invoicePath = invoicePath;
	}
	public String getBLCopyPath() {
		return BLCopyPath;
	}
	public void setBLCopyPath(String bLCopyPath) {
		BLCopyPath = bLCopyPath;
	}
	public String getFormAPath() {
		return formAPath;
	}
	public void setFormAPath(String formAPath) {
		this.formAPath = formAPath;
	}
	public String getPackingListPath() {
		return packingListPath;
	}
	public void setPackingListPath(String packingListPath) {
		this.packingListPath = packingListPath;
	}
	public String getInvoicePath() {
		return invoicePath;
	}
	public void setInvoice_path(String invoicePath) {
		this.invoicePath = invoicePath;
	}
	public String getBLPath() {
		return BLPath;
	}
	public void setBLPath(String bLPath) {
		BLPath = bLPath;
	}
	public String getPackagingPath() {
		return packagingPath;
	}
	public void setPackagingPath(String packagingPath) {
		this.packagingPath = packagingPath;
	}
	public String getOtherPath() {
		return otherPath;
	}
	public void setOtherPath(String otherPath) {
		this.otherPath = otherPath;
	}
	public String getShippingStartDate() {
		return shippingStartDate;
	}
	public void setShippingStartDate(String shippingStartDate) {
		this.shippingStartDate = shippingStartDate;
	}
	public String getShippingArrivalDate() {
		return shippingArrivalDate;
	}
	public void setShippingArrivalDate(String shippingArrivalDate) {
		this.shippingArrivalDate = shippingArrivalDate;
	}
	public Date getBLAvailableDate() {
		return BLAvailableDate;
	}
	public void setBLAvailableDate(Date bLAvailableDate) {
		BLAvailableDate = bLAvailableDate;
	}
	public Date getISFDate() {
		return ISFDate;
	}
	public void setISFDate(Date iSFDate) {
		ISFDate = iSFDate;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getShippingDocPath() {
		return shippingDocPath;
	}
	public void setShippingDocPath(String shippingDocPath) {
		this.shippingDocPath = shippingDocPath;
	}


	public String getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}
	public String getOldOrNewShipping() {
		return oldOrNewShipping;
	}
	public void setOldOrNewShipping(String oldOrNewShipping) {
		this.oldOrNewShipping = oldOrNewShipping;
	}
	@Override
	public String toString() {
		return "ClientOrderShippingDoc [id=" + id + ", orderId=" + orderId
				+ ", shippingDocPath=" + shippingDocPath + ", uploadDate="
				+ uploadDate + ", oldOrNewShipping=" + oldOrNewShipping
				+ ", shippingStartDate=" + shippingStartDate
				+ ", shippingArrivalDate=" + shippingArrivalDate
				+ ", BLAvailableDate=" + BLAvailableDate + ", ISFDate="
				+ ISFDate + ", BLCopyPath=" + BLCopyPath
				+ ", BLCopyUploadDate=" + BLCopyUploadDate
				+ ", oldOrNewBLCopy=" + oldOrNewBLCopy + ", formAPath="
				+ formAPath + ", formAUploadDate=" + formAUploadDate
				+ ", oldOrNewFormA=" + oldOrNewFormA + ", packingListPath="
				+ packingListPath + ", packingListUploadDate="
				+ packingListUploadDate + ", oldOrNewPackingList="
				+ oldOrNewPackingList + ", invoicePath=" + invoicePath
				+ ", invoiceUploadDate=" + invoiceUploadDate
				+ ", oldOrNewInvoice=" + oldOrNewInvoice + ", BLPath=" + BLPath
				+ ", BLUploadDate=" + BLUploadDate + ", oldOrNewBL="
				+ oldOrNewBL + ", packagingPath=" + packagingPath
				+ ", packagingUploadDate=" + packagingUploadDate
				+ ", oldOrNewPackaging=" + oldOrNewPackaging + ", otherPath="
				+ otherPath + ", otherUploadDate=" + otherUploadDate
				+ ", oldOrNewOther=" + oldOrNewOther + ", destinationPort="
				+ destinationPort + "]";
	}
	  
	  
	  
}
