package com.cbt.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.cbt.entity.AmountUnit;
import com.cbt.entity.ClientOrder;
import com.cbt.entity.FactoryInfo;
import com.cbt.entity.InvoiceInfo;
import com.cbt.service.AmountUnitService;
import com.cbt.service.ClientOrderService;
import com.cbt.service.FactoryInfoService;
import com.cbt.service.InvoiceInfoService;
import com.cbt.util.Base64Encode;

@Controller

public class InvoiceInfoController {
	@Resource
	private InvoiceInfoService invoiceInfoService;
	@Resource
	private AmountUnitService amountUnitService;
    @Resource
    private FactoryInfoService factoryInfoService;
    @Resource
    private ClientOrderService clientOrderService;
    
    public static final Logger Log = Logger.getLogger(InvoiceInfoController.class);

	@RequestMapping("/queryInvoiceByOrderId.do")
	public String queryInvoiceByOrderId(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			String orderId = request.getParameter("orderId");
			if(orderId == null || "".equals(orderId)){
				throw new RuntimeException("please select an order!");
			}
			orderId = Base64Encode.getFromBase64(orderId);
			String projectName = clientOrderService.queryProjectName(orderId);
			List<InvoiceInfo> invoiceInfos = invoiceInfoService.queryInvoiceByOrderId(orderId);	
			ClientOrder clientOrder = clientOrderService.queryByOrderId(orderId);
			if(clientOrder == null || "".equals(clientOrder)){
				throw new RuntimeException("订单获取失败");
			}
			String factoryId = clientOrder.getFactoryId();
			FactoryInfo factoryInfo = factoryInfoService.queryByFactoryId(factoryId);
			
			Double total = 0.00;		
			List<AmountUnit> list = new ArrayList<AmountUnit>();
			for (InvoiceInfo invoiceInfo : invoiceInfos) {
				
				AmountUnit amountUnit = amountUnitService.queryById(invoiceInfo.getAmountUnit());
				Double exchangeRate = amountUnit.getExchangeRate();
				
				Double productPrice = invoiceInfo.getProductPrice();
				if(productPrice == null || "".equals(productPrice)){
				   productPrice = 0.00;
				   invoiceInfo.setProductPrice(productPrice);
				}

				Double otherPrice = invoiceInfo.getOtherPrice();
				if(otherPrice == null || "".equals(otherPrice)){
					otherPrice = 0.00;
					invoiceInfo.setOtherPrice(otherPrice);
					}
				Double shippingFee = invoiceInfo.getShippingFee();
				if(shippingFee == null || "".equals(shippingFee)){
					shippingFee = 0.00;
					invoiceInfo.setShippingFee(shippingFee);
					}
				Double moldPrice = invoiceInfo.getMoldPrice();
				if(moldPrice == null || "".equals(moldPrice)){
					moldPrice = 0.00;
					invoiceInfo.setMoldPrice(moldPrice);
					}
				Double sum = invoiceInfo.getAmount() / exchangeRate;
				sum = new BigDecimal(sum).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();				
				total +=  sum;
				list.add(amountUnit);
			}
			Double f1 = new BigDecimal(total).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
      
			request.setAttribute("amountUnit", list);
			request.setAttribute("invoiceInfos", invoiceInfos);
			request.setAttribute("orderId", orderId);
			request.setAttribute("total", f1);
			request.setAttribute("currency", "USD");
			request.setAttribute("factoryInfo", factoryInfo);
			request.setAttribute("projectName", projectName);
		} catch (Exception e) {
			e.printStackTrace();
			Log.error("===============InvoiceInfoController   queryInvoiceByOrderId==============="+e.getMessage());
			throw new Exception(e.getMessage());
		}
		
		return "bigInvoice.jsp";
	}
	
	

	

}
