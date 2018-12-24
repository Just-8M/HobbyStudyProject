package com.hobbyStudy.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hobbyStudy.entity.Institution;
import com.hobbyStudy.service.InstitutionService;
/**
 * 
* @Description: 线下学院  
* @author shenjin 
* @date 2018年12月21日  
* @version V1.0
 */
@Controller
public class AcademyController {
	
	@Autowired
	private InstitutionService institutionService;
	
	// 查询机构课程
	@ResponseBody
	@RequestMapping(value = "/areaSelectCourse", method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
	public List<Institution> areaSelectInstitution(@RequestParam("district") String district,HttpServletRequest request){
		System.out.println(district);
		List<Institution> institutionCourseList = institutionService.queryInstitutionCourse(district);
		for (Institution institution : institutionCourseList) {
			System.out.println(institution.getId() +"    ");
		}
		request.setAttribute("institutionCourseList",institutionCourseList);
		return institutionCourseList;
	}
	
	// 查询机构课程相关信息详情
		@RequestMapping(value = "/queryInstitutionDetail", method = RequestMethod.GET)
		public ModelAndView queryInstitutionDetail(@RequestParam("id") Integer id){
			ModelAndView mv = new ModelAndView("forward:offline_subject.jsp");
			  SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
			  
			System.out.println("ID:" + id);
			Institution institutionDetail = institutionService.queryInstitutionDetail(id);
			mv.addObject("institution", institutionDetail);
			return mv;
			
		}
}
