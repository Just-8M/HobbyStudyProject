package com.hobbyStudy.dao;

import java.util.List;

import com.hobbyStudy.common.utils.page.TailPage;
import com.hobbyStudy.entity.CourseComment;

/**  
* @Description: CourseCommonMapper  
* @author shenjin 
* @date 2018年12月5日  
* @version V1.0  
*/
public interface CourseCommonMapper {

	
	/**  
	* @Title: getTotalItemsCount  
	* @Description: (获取总数量)  
	* @param     
	* @return Integer  
	* @throws  
	*/  
	Integer getTotalCommentCount(CourseComment courseComment);

	
	/**  
	* @Title: queryPage  
	* @Description: (分页获取)  
	* @param     
	* @return List<CourseComment>  
	* @throws  
	*/  
	List<CourseComment> queryPageCount(CourseComment courseComment, TailPage<CourseComment> page);

	//  添加评论
	Integer addCourseComment(CourseComment courseComment);
	
}
