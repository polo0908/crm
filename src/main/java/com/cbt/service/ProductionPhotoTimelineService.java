package com.cbt.service;

import java.io.Serializable;
import java.util.List;






import org.apache.ibatis.annotations.Param;

import com.cbt.entity.ProductionPhotoTimeline;

public interface ProductionPhotoTimelineService extends Serializable {

	
	
	   
    /**
     * 根据订单号查询后 上传时间分组
     * @author polo
     * 2017年6月6日
     *
     */
   public List<ProductionPhotoTimeline> queryByOrderIdGroupByDate(String orderId);
    
    
    /**
     * 根据时间查询图片
     * @author polo
     * 2017年6月6日
     *
     */
   public List<ProductionPhotoTimeline> queryByUploadDate(String orderId,String uploadDate);
   
   
   
   /**
    * 根据时间查询文档
    * @author polo
    * 2017年12月7日
    *
    */
   public List<ProductionPhotoTimeline> queryDocumentByUploadDate(String orderId,String uploadDate);
   
   

	
	/**
	 * 根据订单号查询最近的周报图片
	 * @param orderId
	 * @return
	 */
   public ProductionPhotoTimeline queryByOrderId(@Param("orderId")String orderId);
   
   
   
   /**
    * 根据id查询图片路径
    * @param id
    * @return
    */
   public String queryPhotoById(Integer id);
   
   
   /**
    * 根据id查询
    * @Title queryByOrderAndStatus 
    * @Description TODO
    * @param id
    * @return
    * @return ProductionPhotoTimeline
    */
   public ProductionPhotoTimeline queryById(Integer id);
   
}
