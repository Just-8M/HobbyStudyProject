package com.hobbyStudy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hobbyStudy.business.IClassifyBuiness;
import com.hobbyStudy.common.utils.CourseEnum;
import com.hobbyStudy.entity.Course;
import com.hobbyStudy.entity.CourseClassify;
import com.hobbyStudy.entity.CoursePhotoSlide;
import com.hobbyStudy.entity.CourseQuery;
import com.hobbyStudy.entity.User;
import com.hobbyStudy.service.CoursePhotoSlideService;
import com.hobbyStudy.service.CourseService;
import com.hobbyStudy.service.UserService;
import com.hobbyStudy.vo.CourseClassifyVO;
/**
 * @Description: 首页动态效果展示
 * @author shenjin
 * @date 2018年11月15日
 * @version V1.0
 */
@Controller
// @RequestMapping("/CoursePhotoSlideController")
public class CourseNavigationController {

	@Autowired
	private CoursePhotoSlideService coursePhotoSlideService;
	@Autowired
	private IClassifyBuiness classifyBuiness;
	@Autowired
	private CourseService courseService;
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "getIndexPage")
	public ModelAndView getIndexPage() {
		ModelAndView mv = new ModelAndView("forward:/index.jsp");
		// 加载轮播
		List<CoursePhotoSlide> coursePhotoSlideList = coursePhotoSlideService.queryPhotoSilde(3);
		mv.addObject("CoursePhotoSlideList", coursePhotoSlideList);

		// 课程分类(一级分类）
		List<CourseClassifyVO> classifys = classifyBuiness.getAllClassify();
		for (CourseClassifyVO cvo : classifys) {
			System.out.println(cvo.getName() + "  " + cvo.getSort());

			for (CourseClassify c : cvo.getSubClassifyList()) {
				System.out.println("Name:" + c.getName() +" Code:"  + c.getCode() + "Title:" + c.getTitle());
			}
		}
		mv.addObject("classifys", classifys);
		// mv.addObject("CourseClassify", CourseClassify);

		// 获取4门精选课程，根据权重（weight）进行排序
		CourseQuery courseQuery = new CourseQuery();
		courseQuery.setCount(4);// 4门
		courseQuery.setFree(CourseEnum.FREE_NOT.value());// 收费课，收费课程还是免费课程
		courseQuery.descSortField("weight"); // 按照weight降序排列

		List<Course> CourseList = this.courseService.getList(courseQuery);
		for (Course c : CourseList) {
			System.out.println("精选课程         " + c.getName());
		}
		System.out.println("CourseList==" + CourseList);
		mv.addObject("CourseList", CourseList);

		// 获取4门热门课推荐，根据权重（weight）进行排序
		courseQuery.setFree(CourseEnum.FREE.value());// 免费
		List<Course> freeCourse = this.courseService.getList(courseQuery);
		for (Course course : freeCourse) {
			System.out.println("最热课程:" + course.getName());
		}
		mv.addObject("freeCourse", freeCourse);

		// 获取4门最新课程，学习数量studyCount进行排序
		courseQuery.setCount(4);
		courseQuery.setFree(null);// 不分实战和免费类别
		courseQuery.descSortField("studyCount");// 按照studyCount降序排列
     	List<Course> UpdateCourseList = this.courseService.getList(courseQuery);
		System.out.println("UpdateCourseList:" + UpdateCourseList);
		for (Course course1 : UpdateCourseList) {
			System.out.println("最新课程:" + course1.getName());
		}
		mv.addObject("UpdateCourseList", UpdateCourseList);
		// 首页推荐讲师
		List<User> recommendTeacher = userService.getRecommendTeacher();
		for (User user : recommendTeacher) {
			System.out.println("User:  "   + user.getTitle() + ",,," + user.getId() );
		}
		mv.addObject("recommendTeacher", recommendTeacher);
		return mv;
	}

}
