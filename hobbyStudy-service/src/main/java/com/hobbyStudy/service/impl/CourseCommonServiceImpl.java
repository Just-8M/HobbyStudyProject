package com.hobbyStudy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyStudy.common.utils.page.TailPage;
import com.hobbyStudy.dao.CourseCommonMapper;
import com.hobbyStudy.entity.CourseComment;
import com.hobbyStudy.service.CourseCommentService;

/**  
* @Description:课程评论
* @author shenjin 
* @date 2018年12月5日  
* @version V1.0  
*/
@Service
public class CourseCommonServiceImpl implements CourseCommentService {

	@Autowired
	private CourseCommonMapper courseCommonMapper;
	
	@Override
	public TailPage<CourseComment> queryPage(CourseComment courseComment, TailPage<CourseComment> page) {
		//  得到总数
		Integer TotalCount = courseCommonMapper.getTotalCommentCount(courseComment);
		//  查询页数 
		List<CourseComment> itemsPage = courseCommonMapper.queryPageCount(courseComment,page);
		page.setItemsTotalCount(TotalCount);
		page.setItems(itemsPage);
		return page;
	}

	@Override
	public Integer addCourseComment(CourseComment courseComment) {
		return courseCommonMapper.addCourseComment(courseComment);
	}

}
