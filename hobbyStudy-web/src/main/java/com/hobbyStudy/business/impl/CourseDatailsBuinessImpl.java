package com.hobbyStudy.business.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyStudy.business.ICourseDatailsBuiness;
import com.hobbyStudy.common.utils.CourseEnum;
import com.hobbyStudy.entity.CourseSections;
import com.hobbyStudy.service.CourseSectionService;
import com.hobbyStudy.vo.CourseSectionsVO;

/**  
* @Description:课程章节
* @author shenjin 
* @date 2018年12月4日  
* @version V1.0  
*/
@Service
public class CourseDatailsBuinessImpl implements ICourseDatailsBuiness{
	
	@Autowired
	private CourseSectionService courseSectionService;
	
	@Override
	public List<CourseSectionsVO> getCourseSections(Long courseId) {
		List<CourseSectionsVO> list = new ArrayList<CourseSectionsVO>();
		CourseSections  courseSections = new CourseSections();
		courseSections.setCourseId(courseId);
		courseSections.setOnsale(CourseEnum.ONSALE.value());//上架
		Map<Long,CourseSectionsVO> tmpMap = new LinkedHashMap<Long,CourseSectionsVO>();
		Iterator<CourseSections> it = courseSectionService.getAll(courseSections).iterator();
		
		while(it.hasNext()){
			CourseSections item = it.next();
			if(Long.valueOf(0).equals(item.getParentId())){//章
				CourseSectionsVO vo = new CourseSectionsVO();
				BeanUtils.copyProperties(item, vo);
				tmpMap.put(vo.getId(), vo);
			}else{
				tmpMap.get(item.getParentId()).getCourseSections().add(item);//小节添加到大章中
			}
		}
		for(CourseSectionsVO vo : tmpMap.values()){
			list.add(vo);
		}
		return list;
	}
}






