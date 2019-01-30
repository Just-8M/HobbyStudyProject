package com.hobbyStudy.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hobbyStudy.business.IClassifyBuiness;
import com.hobbyStudy.common.utils.CourseEnum;
import com.hobbyStudy.common.utils.page.TailPage;
import com.hobbyStudy.common.utils.upload.JsonResult;
import com.hobbyStudy.common.utils.upload.UploadUtil;
import com.hobbyStudy.entity.Course;
import com.hobbyStudy.entity.CourseClassify;
import com.hobbyStudy.entity.User;
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
@RequestMapping("/CourseListCntroller")
public class CourseListCntroller {

	@Autowired
	private IClassifyBuiness classifyBuiness;
	@Autowired
	private CourseClassifyService courseClassifyService;

	@Autowired
	private CourseService courseService;

	/**
	 * 
	 * @Title: list
	 * @Description: (这里用一句话描述这个方法的作用)
	 * @param code
	 *            :对应的是那个分类的code
	 * @param sort:排序
	 * @param page:分页
	 * @return ModelAndView
	 * @throws @RequestMapping("/Courselist")和@RequestMapping(value=
	 *             "/Courselist")效果是一样的
	 */
	@RequestMapping(value = "/Courselist")
	public ModelAndView Courselist(String code, String sort, TailPage<Course> page) {
		ModelAndView mv = new ModelAndView("forward:/category.jsp");
		String curCode = "-1"; // -1代表页面方向的全部
		String curSubCode = "-2"; // -2代表的是分类的全部

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

		if (null == courseClassify) {// 没有此分类，加载所有二级分类
			List<CourseClassify> subClassifys = new ArrayList<CourseClassify>();

			for (CourseClassifyVO vo : classifyMap.values()) {
				subClassifys.addAll(vo.getSubClassifyList());
			}
			mv.addObject("subClassifys", subClassifys);
		} else {
			// endsWith 测试此字符串是否以指定的后缀结束。
			// 如果参数表示的字符序列是此对象表示的字符序列的后缀，则返回 true；否则返回 false。
			if (!"0".endsWith(courseClassify.getParentCode())) {// 如果此分类是非0，
																// 当前是二级分类
				curSubCode = courseClassify.getCode();
				curCode = courseClassify.getParentCode();
				// 加载所有的二级分类，此分类平级的二级分类
				mv.addObject("subClassifys", classifyMap.get(courseClassify.getParentCode()).getSubClassifyList());
			} else {// 是0，当前是一级分类
				curCode = courseClassify.getCode();
				mv.addObject("subClassifys", classifyMap.get(courseClassify.getCode()).getSubClassifyList());// 此分类下的二级分类
			}
		}
		mv.addObject("curCode", curCode);
		mv.addObject("curSubCode", curSubCode);
		System.out.println(" curCode:" + curCode + "   " + " curSubCode:" + curSubCode);
		// ========================= 分页 ======================

		Course course = new Course();
		if (!"-1".equals(curCode)) {
			course.setClassify(curCode);
		}

		if (!"-2".equals(curSubCode)) {
			course.setSubClassify(curSubCode);
		}
		// 排序参数
		if ("pop".equals(sort)) {// 最热
			page.descSortField("studyCount");
		} else {
			sort = "last";
			page.descSortField("id");
		}
		mv.addObject("sort", sort);
		// 分页参数
		course.setOnsale(CourseEnum.ONSALE.value());
		page.setPageSize(4);
		page = this.courseService.queryCoursePage(course, page);
		mv.addObject("page", page);
		return mv;
	}

	@RequestMapping("addCourse")
	@ResponseBody
	public JsonResult<String> addCourse(@RequestParam(value = "courseCover", required = false) MultipartFile picture1,
			@RequestParam(value = "courseDetailCover", required = false) MultipartFile picture2,
			HttpServletRequest request, HttpSession session, User user, @Param("name") String name,
			@Param("brief") String brief, @Param("timespanStart") String timespanStart,
			@Param("timespanEnd") String timespanEnd, @Param("time") String time,
			@Param("courseSchedule") String courseSchedule, @Param("price") String price) throws IOException {
		// pictureURL是数据库里picture_url的值，这里用到一个封装的工具类UploadUtil
		BigDecimal coursePrice=new BigDecimal(price);    // 把String类型转换成BigDecimal
		System.out.println("123" + "timespanStart:" + timespanStart  + "coursePrice:" + coursePrice + "picture1：" + picture1
				+"picture2:::" + picture2);
		String pictureURL1 = UploadUtil.imageUpload(picture1, request);
		String pictureURL2 = UploadUtil.imageUpload(picture2, request);
		System.out.println("pictureURL1:" + pictureURL1 + "   pictureURL2:" + pictureURL2);
		//获取上传时的文件名
		 String pictureName1 = FilenameUtils.getName(picture1.getOriginalFilename());
		 System.out.println("pictureName1:" + pictureName1);
	     User session_user = (User) session.getAttribute("USER_IN_SESSION");   //  得到登录用户
	     if (session_user != null) {
	    	 Course c = new Course();
	    	 c.setName(name);
	    	 c.setBrief(brief);
	    	 c.setTimespanStart(timespanStart);
	    	 c.setTimespanEnd(timespanEnd);
	    	 c.setTime(time);
	    	 c.setCourseSchedule(courseSchedule);
	    	 c.setPrice(coursePrice);
	    	 c.setPicture(pictureURL1);
	    	 c.setUserid(session_user.getUserid());
	    	// 1、 把图片插入到材料表中
	        	int addResult = courseService.addCourse(c);
	        if (addResult > 0 && pictureURL1 != "") {
	 	        return new JsonResult<>(200, "上传成功!", null);
	 	    }
	     }
		return new JsonResult<>(300, "上传失败", null);
	}
}
