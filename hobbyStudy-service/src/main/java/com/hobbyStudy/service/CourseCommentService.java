package com.hobbyStudy.service;

import java.util.List;

import com.hobbyStudy.common.utils.page.TailPage;
import com.hobbyStudy.entity.CourseComment;

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

	/**
	 * @ToDo:添加课程评论
	 * @param content
	 * @Return :List<CourseComment>
	 */
	Integer addCourseComment(CourseComment courseComment);

}
