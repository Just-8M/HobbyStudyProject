package com.hobbyStudy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

/**  
* @Description: 精彩社区
* @author shenjin 
* @date 2018年12月20日  
* @version V1.0  
*/
@Controller
public class CommunityController {

	public ModelAndView Community(){
		ModelAndView mv = new ModelAndView("forward:community.jsp");
		
		return mv;
	}
}
