package com.hobbyStudy.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hobbyStudy.business.IClassifyBuiness;
import com.hobbyStudy.common.utils.CourseEnum;
import com.hobbyStudy.common.utils.page.TailPage;
import com.hobbyStudy.entity.Course;
import com.hobbyStudy.entity.CourseClassify;
import com.hobbyStudy.service.CourseClassifyService;
import com.hobbyStudy.service.CourseService;
import com.hobbyStudy.vo.CourseClassifyVO;
/**
 * @Description: 课程分类列表
 * @author shenjin
 * @date 2018年11月25日
 * @version V1.0
 */

@Controller
//@RequestMapping("/CourseListCntroller")
public class CourseListCntroller {

	@Autowired
	private IClassifyBuiness classifyBuiness;
	@Autowired
	private CourseClassifyService courseClassifyService;
	
	@Autowired
	private CourseService  courseService;
	/**
	 * 
	* @Title: list  
	* @Description: (这里用一句话描述这个方法的作用)  
	* @param     code  :对应的是那个分类的code
	* @param    sort:排序
	* @param    page:分页
	* @return ModelAndView  
	* @throws
	* @RequestMapping("/Courselist")和@RequestMapping(value="/Courselist")效果是一样的
	 */
	@RequestMapping(value = "/Courselist")
	public ModelAndView Courselist(String code, String sort, TailPage<Course> page) {
		ModelAndView mv = new ModelAndView("forward:/category.jsp");
		String curCode = "-1";     // -1代表页面方向的全部
		String curSubCode = "-2";  //  -2代表的是分类的全部

		// 加载所有课程分类
		Map<String, CourseClassifyVO> classifyMap = classifyBuiness.getAllClassifyMap();	
		
		// 全部需要展示，加载所有一级分类
		List<CourseClassifyVO> classifysList = new ArrayList<CourseClassifyVO>();
		for (CourseClassifyVO vo : classifyMap.values()) {
			classifysList.add(vo);
		}
		// 循环出一级分类
		mv.addObject("classifys", classifysList);
		System.out.println("code:" + code);
		// 当前分类
		CourseClassify courseClassify = courseClassifyService.getCode(code);
		
		if(null == courseClassify){//没有此分类，加载所有二级分类
			List<CourseClassify> subClassifys = new ArrayList<CourseClassify>();
			
			for(CourseClassifyVO vo : classifyMap.values()){
				subClassifys.addAll(vo.getSubClassifyList());
			}
			mv.addObject("subClassifys", subClassifys);
		}else{
			//   endsWith  测试此字符串是否以指定的后缀结束。 
			//如果参数表示的字符序列是此对象表示的字符序列的后缀，则返回 true；否则返回 false。
			if(!"0".endsWith(courseClassify.getParentCode())){// 如果此分类是非0，  当前是二级分类
				curSubCode = courseClassify.getCode();
				curCode = courseClassify.getParentCode();
				//   加载所有的二级分类，此分类平级的二级分类
				mv.addObject("subClassifys", classifyMap.get(courseClassify.getParentCode()).getSubClassifyList());
			}else{//是0，当前是一级分类
				curCode = courseClassify.getCode();
				mv.addObject("subClassifys", classifyMap.get(courseClassify.getCode()).getSubClassifyList());//此分类下的二级分类
			}
		}
		mv.addObject("curCode", curCode);
		mv.addObject("curSubCode", curSubCode);
		System.out.println(" curCode:" + curCode + "   "  +" curSubCode:" +curSubCode);
		//  ========================= 分页 ======================
		
		Course course = new Course();
		if(!"-1".equals(curCode)){
			course.setClassify(curCode);
		}
		
		if(!"-2".equals(curSubCode)){
			course.setSubClassify(curSubCode);
		}
		//排序参数
		if("pop".equals(sort)){//最热
			page.descSortField("studyCount");
		}else{
			sort = "last";
			page.descSortField("id");
		}
		mv.addObject("sort", sort);
		//分页参数
		course.setOnsale(CourseEnum.ONSALE.value());
		page.setPageSize(4);
		page = this.courseService.queryCoursePage(course, page);
		mv.addObject("page", page);
		return mv;
	}
}
