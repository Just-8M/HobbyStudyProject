package com.hobbyStudy.business.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.hobbyStudy.business.IClassifyBuiness;
import com.hobbyStudy.entity.CourseClassify;
import com.hobbyStudy.service.CourseClassifyService;
import com.hobbyStudy.vo.CourseClassifyVO;

/**  
* @Description: 课程分类业务块
* @author shenjin 
* @date 2018年11月21日  
* @version V1.0  
* @Component ：  代表spring会加载这个@Component
*/
@Service
public class ClassifyBuinessImpl implements IClassifyBuiness{
	
	@Autowired
	private CourseClassifyService courseClassifyService;
	/**
	 * 获取所有，包括一级分类、二级分类
	 */
	@Override
	public List<CourseClassifyVO> getAllClassify() {
		List<CourseClassifyVO> resultList = new ArrayList<CourseClassifyVO>();  //  创建集合
		for(CourseClassifyVO vo : this.getAllClassifyMap().values()){
			resultList.add(vo);
		}
		return resultList;
	}
	
	/**
	 * 获取所有分类，当想要获取所有分类，就要从数据库中加载所有分类。
	 */
	@Override
	public Map<String, CourseClassifyVO> getAllClassifyMap() {
		
		Map<String,CourseClassifyVO> resultMap = new LinkedHashMap<String,CourseClassifyVO>();
		List<CourseClassify> list = courseClassifyService.getAllClassify();   //  查询出所有的分类
		
		Iterator<CourseClassify> it = list.iterator();     //  循环遍历
		
		while(it.hasNext()){
			CourseClassifyVO co = new CourseClassifyVO();
			CourseClassify courseclassify = it.next();   
			if("0".equals(courseclassify.getParentCode())){//一级分类
				// 把CourseClassify拷贝给CourseClassifyVO
				BeanUtils.copyProperties(courseclassify, co);   
				resultMap.put(co.getCode(), co);
			}else{//二级分类
				if(null != resultMap.get(courseclassify.getParentCode())){
					//添加到子分类中
					resultMap.get(courseclassify.getParentCode()).getSubClassifyList().add(courseclassify);
				}
			}
		}
		
		return resultMap;
	}

	
	
	
	
	
	
	

}
