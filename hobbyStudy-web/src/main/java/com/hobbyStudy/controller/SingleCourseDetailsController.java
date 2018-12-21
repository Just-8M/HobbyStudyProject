package com.hobbyStudy.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hobbyStudy.business.IClassifyBuiness;
import com.hobbyStudy.entity.Course;
import com.hobbyStudy.service.CourseService;
import com.hobbyStudy.vo.CourseClassifyVO;

/**
 * @Description: TODO
 * @author shenjin
 * @date 2018年12月19日
 * @version V1.0
 */
@Controller
public class SingleCourseDetailsController {

	@Autowired
	private CourseService courseService;

	@Autowired
	private IClassifyBuiness classifyBuiness;

	/**
	 * 
	 * @Title: SingleCourseDetails @Description: (查询单个课程详情页) @param @return
	 * ModelAndView @throws
	 */
	@RequestMapping(value = "/SingleCourseDetails")
	public ModelAndView SingleCourseDetails(Integer id) {
		ModelAndView mv = new ModelAndView("forward:/video.jsp");
		System.out.println(id);
		Course SingleCourseDetalis = courseService.querySingleCourseDetalis(id);
		mv.addObject("SingleCourseDetalis", SingleCourseDetalis);
		// 调用Recommend中recommendIndex方法
		// 课程分类(一级分类）
		List<CourseClassifyVO> classifys = classifyBuiness.getAllClassify();
		List<Course> classifyCourseList = new ArrayList<>();
		for (CourseClassifyVO cvo : classifys) {
			System.out.println(cvo.getTitle());
			List<Course> classifyCourse = courseService.queryClassifyCourse(cvo.getTitle());
			classifyCourseList.addAll(classifyCourse);
		}
		mv.addObject("classifyCourseList", classifyCourseList);
		return mv;
	}
}
