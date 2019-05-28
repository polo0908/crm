package com.cbt.entity;

import java.io.Serializable;
import java.text.ParseException;
import java.util.Date;

import com.cbt.util.DateFormat;

/**
* @ClassName: ClientDrawings 
* @Description: 客户图纸信息
 */
public class ClientDrawings implements Serializable{
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String userid;//用户id
	private String orderId;//订单编号
	private String projectName;//项目英文名
	private String projectCname; //项目中文名
	private String drawingsName;//图纸名称
	private String drawingsPath;//图纸路径
	private Date updateTime;//上传时间
	private Double moldPrice;//模板价格
	private Double unitPrice;//产品单价
	private Date quoteTime;//报价时间
	private String drawingState;//图纸更新状态
    private String productName; //产品名称
	private Integer quantity; //产品数量
	private String status; //图纸状态(Quoted 询价 Ordered 订单）

	//虚拟字段
	private String drawingNewOrOld; //标记为新图纸
    
	
	
	public String getDrawingNewOrOld() {
		return drawingNewOrOld;
	}
	public void setDrawingNewOrOld(String drawingNewOrOld) {
		this.drawingNewOrOld = drawingNewOrOld;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public String getDrawingState() {
		return drawingState;
	}
	public void setDrawingState(String drawingState) {
		this.drawingState = drawingState;
	}
	public String getProjectCname() {
		return projectCname;
	}
	public void setProjectCname(String projectCname) {
		this.projectCname = projectCname;
	}

	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
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
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
  
	
	public String getDrawingsName() {
		return drawingsName;
	}
	public void setDrawingsName(String drawingsName) {
		this.drawingsName = drawingsName;
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
	public double getMoldPrice() {
		return moldPrice;
	}
	public void setMoldPrice(Double moldPrice) {
		this.moldPrice = moldPrice;
	}
	public double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public Date getQuoteTime() {
		return quoteTime;
	}
	public void setQuoteTime(Date quoteTime) {
			try {
				this.quoteTime = DateFormat.formatDate1(quoteTime);
			} catch (ParseException e) {
				e.printStackTrace();
				this.quoteTime = quoteTime;
			}
	}
	public String getDrawingsPath() {
		return drawingsPath;
	}
	
	public void setDrawingsPath(String drawingsPath) {
		this.drawingsPath = drawingsPath;
	}
	@Override
	public String toString() {
		return "ClientDrawings [id=" + id + ", userid=" + userid + ", orderId="
				+ orderId + ", projectName=" + projectName + ", projectCname="
				+ projectCname + ", drawingsName=" + drawingsName
				+ ", drawingsPath=" + drawingsPath + ", updateTime="
				+ updateTime + ", moldPrice=" + moldPrice + ", unitPrice="
				+ unitPrice + ", quoteTime=" + quoteTime + ", drawingState="
				+ drawingState + ", productName=" + productName + ", quantity="
				+ quantity + ", status=" + status + ", drawingNewOrOld="
				+ drawingNewOrOld + "]";
	}


	

	
	

	
	
	
}
