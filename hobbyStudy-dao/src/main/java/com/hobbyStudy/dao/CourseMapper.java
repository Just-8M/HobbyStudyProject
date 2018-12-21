package com.hobbyStudy.dao;

import java.util.List;

import com.hobbyStudy.common.utils.page.TailPage;
import com.hobbyStudy.entity.Course;
import com.hobbyStudy.entity.CourseQuery;

/**  
* @Description: 课程功能
* @author shenjin 
* @date 2018年11月22日  
* @version V1.0  
*/
public interface CourseMapper {
	/**
	*根据条件获取所有，
	*courseQuery：查询条件；
	**/
	public List<Course> getList(CourseQuery courseQuery);
	
	/**
	*获取总数量
	**/
	public Integer getTotalItemsCount(Course course);
	
	/**
	*分页获取
	**/
	public List<Course> queryPage(Course queryEntity , TailPage<Course> page);
	/**  
	* @Title: getCourseById  
	* @Description: (获取课程详情页)  
	* @param     
	* @return Course  
	* @throws  
	*/  
	public Course getCourseById(Long id);

	
	/**  
	* @Title: queryPersonCourse  
	* @Description: (根据领学者username查询所属所有课程)  
	* @param     
	* @return List<Course>  
	* @throws  
	*/  
	public List<Course> queryPersonCourse(String username);

	
	/**  
	* @Title: queryClassifyCourse  
	* @Description: (查询分类课程)  
	* @param     
	* @return List<Course>  
	* @throws  
	*/  
	public List<Course> queryClassifyCourse(String title);

	
	/**  
	* @Title: querySingleCourseDetalis  
	* @Description: (查询单个课程详情页)  
	* @param     
	* @return Course  
	* @throws  
	*/  
	public Course querySingleCourseDetalis(Integer id);
	
}
