package com.cbt.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cbt.entity.InvoiceInfo;


public interface InvoiceInfoDao {
	  

     
     /**
      * 根据发票编号查询发票详情
      * @param InvoiceId
      * @return
      */
     InvoiceInfo queryByInvoiceId(@Param("invoiceId")String InvoiceId,@Param("factoryId")String factoryId);
     
     
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
     void deleteInvoiceById(Integer id);
    

}
