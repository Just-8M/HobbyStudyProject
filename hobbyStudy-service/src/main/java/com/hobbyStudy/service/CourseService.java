package com.hobbyStudy.service;

import java.util.List;

import com.hobbyStudy.common.utils.page.TailPage;
import com.hobbyStudy.entity.Course;
import com.hobbyStudy.entity.CourseQuery;

/**  
* @Description: TODO  
* @author shenjin 
* @date 2018年11月22日  
* @version V1.0  
*/
public interface CourseService {
	/**
	 * 
	* @Title: getList  
	* @Description: (得到查询列表)  
	* @param     
	* @return List<Course>  
	* @throws
	 */
	public List<Course> getList(CourseQuery courseQuery);
	/**
	 * 
	* @Title: queryCoursePage  
	* @Description: (分页获取)  
	* @param     
	* @return TailPage<Course>  
	* @throws
	 */
	public TailPage<Course> queryCoursePage(Course course, TailPage<Course> page);
	/**
	 * 
	* @Title: getById  
	* @Description: (根据id获取)  
	* @param     
	* @return Course  
	* @throws
	 */
	public Course getCourseById(Long courseId);
	
	/**  
	* @Title: queryPersonCourse  
	* @Description: (根据领学者username查询所属所有课程)  
	* @param     
	* @return List<Course>  
	* @throws  
	*/  
	public List<Course> queryPersonCourse(String userid);
	
	/**  
	* @Title: queryClassifyCourse  
	* @Description: (查询分类课程)  
	* @param     
	* @return List<Course>  
	* @throws  
	*/  
	public List<Course> queryClassifyCourse(String title);
	
	/**  
	* @Title: querySingleCourseDetils  
	* @Description: (查询单个课程详情页)  
	* @param     
	* @return Course  
	* @throws  
	*/  
	public Course querySingleCourseDetalis(Integer id);
	/**
	 * 
	* @Title: querySelectionCourse  
	* @Description: (查询精选课程)  
	* @param     
	* @return List<Course>  
	* @throws
	 */
	public List<Course> querySelectionCourse();
	
	/**  
	* @Title: queryHottestCourse  
	* @Description: (最热课程)  
	* @param     
	* @return List<Course>  
	* @throws  
	*/  
	public List<Course> queryHottestCourse();
	
	/**  
	* @Title: queryLastestCourse  
	* @Description: (最新课程列表)  
	* @param     
	* @return List<Course>  
	* @throws  
	*/  
	public List<Course> queryLastestCourse();

	/**  
	* @Title: queryNavCategoryCourse  
	* @Description: (查询推荐页的子菜单分类下所有课程)  
	* @param     
	* @return List<Course>  
	* @throws  
	*/  
	public List<Course> queryNavCategoryCourse(String subClassifyName);
	/**
	 * @ToDo:领学者增加课程
	 * @param c
	 * @return
	 * @Return :int
	 */
	public int addCourse(Course c);
	/**
	 * @ToDo:插叙用户所有课程
	 * @param userid
	 * @return
	 * @Return :List<Course>
	 */
	public List<Course> queryUserOwnCourse(String userid);
	/**
	 * @ToDo:课程列表中的搜索
	 * @param name
	 * @return
	 * @Return :List<Course>
	 */
	public List<Course> queryCourseName(String name);
	
}
