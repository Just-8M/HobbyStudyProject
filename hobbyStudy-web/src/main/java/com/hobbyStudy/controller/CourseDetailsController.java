package com.hobbyStudy.controller;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hobbyStudy.business.ICourseDatailsBuiness;
import com.hobbyStudy.common.utils.storage.QiniuStorage;
import com.hobbyStudy.entity.Course;
import com.hobbyStudy.entity.CourseQuery;
import com.hobbyStudy.entity.User;
import com.hobbyStudy.service.CourseService;
import com.hobbyStudy.service.UserService;
import com.hobbyStudy.vo.CourseSectionsVO;

/**
 * @Description: 课程详情页
 * @author shenjin
 * @date 2018年12月4日
 * @version V1.0
 */
@Controller
public class CourseDetailsController {

	@Autowired
	private CourseService detailsCourseService;
	@Autowired
	private ICourseDatailsBuiness courseDatailsBuiness;
	@Autowired
	private UserService userService;

	/**
	 * @Title: courseDatails
	 * @Description: (课程详情页功能)
	 * @param
	 * @return ModelAndView
	 * @throws @PathVariable:
	 *             带占位符的 URL 是 Spring3.0 新增的功能 通过 @PathVariable 可以将 URL
	 *             中占位符参数绑定到控制器处理方法的入参中： URL 中的 {xxx}
	 *             占位符可以通过@PathVariable(“xxx“) 绑定到操作方法的入参中。
	 */
	@RequestMapping("/{courseId}")
	public ModelAndView courseDatails(@PathVariable Long courseId) {
		// 获取课程章节
		ModelAndView mv = new ModelAndView("forward:/course.jsp");
		if (null == courseId) {
			return new ModelAndView("common/404");
		}
		// 获取课程
		Course course = detailsCourseService.getCourseById(courseId);
		if (null == course) {
			return new ModelAndView("common/404");
		}
		// 获取课程章节

		List<CourseSectionsVO> chaptSections = this.courseDatailsBuiness.getCourseSections(courseId);
		mv.addObject("course", course);
		mv.addObject("chaptSections", chaptSections);

		// 获取讲师
		User user= userService.getByUsername(course.getUsername());
		//  七牛云存储
		/*if (StringUtils.isNotEmpty(user.getHeader())) {
			user.setHeader(QiniuStorage.getUrl(user.getHeader()));
		}*/
		mv.addObject("user", user);

		// 获取推荐课程
		CourseQuery courseQuery = new CourseQuery();
		courseQuery.descSortField("weight");
		courseQuery.setCount(5);// 5门推荐课程
		courseQuery.setSubClassify(course.getSubClassify());
		List<Course> recomdCourseList = this.detailsCourseService.getList(courseQuery);
		mv.addObject("recomdCourseList", recomdCourseList);
		return mv;
	}
}
