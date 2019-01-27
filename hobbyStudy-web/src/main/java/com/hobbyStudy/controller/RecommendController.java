package com.hobbyStudy.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hobbyStudy.business.IClassifyBuiness;
import com.hobbyStudy.entity.Course;
import com.hobbyStudy.entity.RecommendPhotoSlide;
import com.hobbyStudy.service.CourseService;
import com.hobbyStudy.service.RecommendService;
import com.hobbyStudy.vo.CourseClassifyVO;

/**
 * @Description: 推荐看点板块功能
 * @author shenjin
 * @date 2018年12月15日
 * @version V1.0
 */
@Controller
public class RecommendController {

	@Autowired
	private RecommendService RecommendService;
	
	@Autowired
	private IClassifyBuiness classifyBuiness;
	
	@Autowired
	private CourseService courseService;

	/**
	 * 
	 * @Title: RecommendIndex 
	 * @Description: (查询推荐页导航图片) 
	 * @param @return
	 * List<RecommendPhotoSlide> @throws
	 */
	@RequestMapping(value = "/recommendIndex") // 映射路径
	public ModelAndView recommendIndex() {
		ModelAndView mv = new ModelAndView("forward:/recommend.jsp");
		List<RecommendPhotoSlide> recommendPhotoSlide = RecommendService.queryNavigationPhoto(4);
		/*for (RecommendPhotoSlide c : recommendPhotoSlide) {
			System.out.println(c.getPicture());
		}*/
		mv.addObject("recommendPhotoSlide", recommendPhotoSlide);

		// 课程分类(一级分类)
		List<CourseClassifyVO> classifys = classifyBuiness.getAllClassify();
		List<Course> classifyCourseList = new ArrayList<>();
		
		for (CourseClassifyVO cvo : classifys) {
			System.out.println(cvo.getTitle());
			List<Course> classifyCourse = courseService.queryClassifyCourse(cvo.getTitle());
			classifyCourseList.addAll(classifyCourse);
		}
		mv.addObject("classifyCourseList", classifyCourseList);
		mv.addObject("classifys", classifys);
		//课程分类的左边和右边导航
		return mv;
	}
	/**
	 * 
	 * @Title: recommend_navCategory 
	 * @Description: (查询推荐页的子菜单分类下所有课程) 
	 * @param @return
	 * List<RecommendPhotoSlide> @throws
	 */
	@RequestMapping(value = "/recommend_navCategory") // 映射路径
	public ModelAndView recommend_navCategory(String name,HttpServletRequest request) {
		//  轮番图
		ModelAndView mv = new ModelAndView("forward:/recommend_navCategory.jsp");
		List<RecommendPhotoSlide> recommendPhotoSlide = RecommendService.queryNavigationPhoto(4);
		mv.addObject("recommendPhotoSlide", recommendPhotoSlide);
		//  导航分类进行查询
		try {
			String subClassifyName = new String(request.getParameter("name").getBytes("ISO-8859-1"), "UTF-8");
			mv.addObject("subClassifyName", subClassifyName);
			List<Course> NavCategoryCourse = courseService.queryNavCategoryCourse(subClassifyName);
			/*for (Course course : NavCategoryCourse) {
				System.out.println("course:" + course.getName());
			}*/
			mv.addObject("NavCategoryCourse", NavCategoryCourse);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return mv;
	}
}
