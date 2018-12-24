package com.hobbyStudy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.hobbyStudy.common.utils.CourseEnum;
import com.hobbyStudy.common.utils.page.TailPage;
import com.hobbyStudy.entity.Course;
import com.hobbyStudy.service.CourseService;

/**
 * @Description: 精彩社区
 * @author shenjin academy
 * @date 2018年12月20日
 * @version V1.0
 */
@Controller
public class CommunityController {

	@Autowired
	private CourseService courseService;

	// 查询精选课程
	@RequestMapping("/communityCourse")
	public ModelAndView communityCourse(HttpServletRequest request, String sort, TailPage<Course> page) {
		ModelAndView mv = new ModelAndView("forward:community.jsp");
		// 按照pagehepler实现分页的
		/*
		 * if (sort.equals("select")) { List<Course> selectionCourseList =
		 * courseService.
		 * querySelectionCourse();
		 * mv.addObject("selectionCourseList", selectionCourseList);
		 * System.out.println("精选kecheng:" + sort); } else if
		 * (sort.equals("hot")) { // 最热课程 List<Course> selectionCourseList =
		 * courseService.queryHottestCourse();
		 * mv.addObject("selectionCourseList", selectionCourseList);
		 * System.out.println("最热课程:" + sort); } if (sort.equals("last")) { //
		 * 最新课程 List<Course> selectionCourseList =
		 * courseService.queryLastestCourse();
		 * mv.addObject("selectionCourseList", selectionCourseList);
		 * System.out.println("最新课程:" + sort); }
		 */
		// 判断课程数据上面类型 (select-- 精选、hot -- 最热、last--最新)
		System.out.println("sort:" + sort);
		if ("select".equals(sort)) {// 精选
			page.descSortField("weight");
		} else if ("hot".equals(sort)) { // 最热
			page.descSortField("studyCount");
		} else { // 最新
			sort = "last";
			page.descSortField("createTime");
		}
		mv.addObject("sort", sort);
		// 分页参数
		Course course = new Course();
		course.setOnsale(CourseEnum.ONSALE.value());
		page.setPageSize(12);
		page = this.courseService.queryCoursePage(course, page);
		mv.addObject("page", page);
		return mv;
	}
}
