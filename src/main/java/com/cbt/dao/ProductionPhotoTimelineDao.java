package com.cbt.dao;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cbt.entity.ProductionPhotoTimeline;

public interface ProductionPhotoTimelineDao extends Serializable {
   
    /**
     * 根据订单号查询后 上传时间分组
     * @author polo
     * 2017年6月6日
     *
     */
    List<ProductionPhotoTimeline> queryByOrderIdGroupByDate(@Param("orderId")String orderId);
    
    
    /**
     * 根据时间查询图片
     * @author polo
     * 2017年6月6日
     *
     */
    List<ProductionPhotoTimeline> queryByUploadDate(@Param("orderId")String orderId,@Param("uploadDate")String uploadDate);
    
    
    /**
     * 根据时间查询文档
     * @author polo
     * 2017年12月7日
     *
     */
    List<ProductionPhotoTimeline> queryDocumentByUploadDate(@Param("orderId")String orderId,@Param("uploadDate")String uploadDate);
	

	/**
	 * 根据订单号查询最近的周报图片
	 * @param orderId
	 * @return
	 */
    ProductionPhotoTimeline queryByOrderId(@Param("orderId")String orderId);
    
    
    /**
     * 根据id查询图片路径
     * @param id
     * @return
     */
    String queryPhotoById(Integer id);
    
    
    /**
     * 根据id查询
     * @Title queryByOrderAndStatus 
     * @Description TODO
     * @param id
     * @return
     * @return ProductionPhotoTimeline
     */
    ProductionPhotoTimeline queryById(Integer id);
    
}
