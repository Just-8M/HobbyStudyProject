package com.hobbyStudy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hobbyStudy.entity.Course;
import com.hobbyStudy.entity.User;
import com.hobbyStudy.service.CourseService;

/**
 * @Description: 个人主页
 * @author shenjin
 * @date 2018年12月14日
 * @version V1.0
 */
@Controller
//@RequestMapping(value = "PersonalHomepageController")
public class PersonalHomepageController {
	
	@Autowired
	private CourseService CourseService;
	// 查询领学者课程
	@ResponseBody
	@RequestMapping(value = "/personalCourse", method = RequestMethod.POST) // 映射路径
	public List<Course> personalCourse(String userid, HttpServletRequest request) {
		System.out.println("userid:" + userid);
		 List<Course> personCourse = CourseService.queryPersonCourse(userid);
		 for (Course c : personCourse) {
			System.out.println(c.getName());
		}
		 request.setAttribute("personCourse", personCourse);
		 return personCourse;
	}
}
