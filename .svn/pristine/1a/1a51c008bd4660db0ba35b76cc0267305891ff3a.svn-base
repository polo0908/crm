package com.cbt.service;

import java.util.List;

import com.cbt.entity.InvoiceInfo;

public interface InvoiceInfoService {
   
     
     /**
      * 根据发票编号查询发票详情
      * @param InvoiceId
      * @return
      */
     public InvoiceInfo queryByInvoiceId(String InvoiceId,String factoryId);
     
     
     /**
      * 根据OrderId查询所有发票的信息
      * @param orderId
      * @return
      */
     List<InvoiceInfo> queryInvoiceByOrderId(String orderId);
     
     
     /**
      * 根据发票的ID删除当前发票信息
      * @param id
      */
     public void deleteInvoiceById(Integer id);

     
}
