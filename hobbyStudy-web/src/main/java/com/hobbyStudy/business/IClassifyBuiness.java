package com.hobbyStudy.business;

import java.util.List;
import java.util.Map;

import com.hobbyStudy.vo.CourseClassifyVO;

/**  
* @Description: 当业务代码比较多时，采用的是buiness作为service，当业务功能呢个比较简单的时候，就用service  
* @author shenjin 
* @date 2018年11月21日  
* @version V1.0  
*/

public interface IClassifyBuiness {
	
	/**
	 * 获取所有，一级分类、二级分类
	 */
	List<CourseClassifyVO> getAllClassify();

	/**
	 * 获取所有分类，当想要获取所有分类，就要从数据库中加载所有分类。
	 */
	Map<String,CourseClassifyVO> getAllClassifyMap();
	
	
}
