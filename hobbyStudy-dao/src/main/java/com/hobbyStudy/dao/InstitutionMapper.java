package com.hobbyStudy.dao;

import java.util.List;

import com.hobbyStudy.entity.Institution;

/**  
* @Description: 学院机构
* @author shenjin 
* @date 2018年12月22日  
* @version V1.0  
*/
public interface InstitutionMapper {

	
	/**  
	* @Title: queryInstitutionCourse  
	* @Description: (查询机构课程)  
	* @param     
	* @return List<Institution>  
	* @throws  
	*/  
	List<Institution> queryInstitutionCourse(String district);

	
	/**  
	* @Title: queryInstitutionDetail  
	* @Description: (查询机构相关课程信息详情)  
	* @param     
	* @return List<Institution>  
	* @throws  
	*/  
	 Institution queryInstitutionDetail(Integer id);

}
