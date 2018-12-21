package com.hobbyStudy.service;

import com.hobbyStudy.common.utils.page.TailPage;

/**  
* @Description: TODO  
* @author shenjin 
* @date 2018年12月5日  
* @version V1.0  
*/
public interface CourseCommentService {

	
	/**  
	* @Title: queryPage  
	* @Description: (分页)  
	* @param     
	* @return TailPage<com.hobbyStudy.entity.CourseComment>  
	* @throws  
	*/  
	TailPage<com.hobbyStudy.entity.CourseComment> queryPage(com.hobbyStudy.entity.CourseComment courseComment,
                                                            TailPage<com.hobbyStudy.entity.CourseComment> page);

}
