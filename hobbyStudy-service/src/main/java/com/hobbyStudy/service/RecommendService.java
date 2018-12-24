package com.hobbyStudy.service;

import java.util.List;

import com.hobbyStudy.entity.Course;
import com.hobbyStudy.entity.RecommendPhotoSlide;

/**  
* @Description: TODO  
* @author shenjin 
* @date 2018年12月15日  
* @version V1.0  
*/
public interface RecommendService {

	
	/**  
	* @Title: queryNavigationPhoto  
	* @Description: (查询推荐页导航图片)  
	* @param     
	* @return List<RecommendPhotoSlide>  
	* @throws  
	*/  
	public List<RecommendPhotoSlide> queryNavigationPhoto(Integer count);

	
	
}
