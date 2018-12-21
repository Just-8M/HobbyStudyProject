package com.hobbyStudy.service.impl;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyStudy.dao.CourseClassifyMapper;
import com.hobbyStudy.entity.CourseClassify;
import com.hobbyStudy.service.CourseClassifyService;

/**
 * @Description: TODO
 * @author shenjin
 * @date 2018年11月20日
 * @version V1.0
 */
@Service
public class CourseClassifyServiceImpl implements CourseClassifyService {

	@Autowired
	private CourseClassifyMapper courseClassifyMapper;

	// 获取所有， 调用dao层getAllClassify方法
	@Override
	public List<CourseClassify> getAllClassify() {
		return courseClassifyMapper.getAllClassify();
	}

	@Override
	public CourseClassify getCode(String code){
		//  如果为空的话，返回null
		if (StringUtils.isEmpty(code)){
			return null;
		}
		CourseClassify queryAll= new CourseClassify();
		queryAll.setCode(code);
		List<CourseClassify> list = courseClassifyMapper.queryByCondition(queryAll);
		if (CollectionUtils.isNotEmpty(list)){
			return list.get(0);
		}
		return null;
	}

}
