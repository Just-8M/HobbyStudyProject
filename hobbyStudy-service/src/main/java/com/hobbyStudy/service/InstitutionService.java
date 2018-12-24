package com.hobbyStudy.service;

import java.util.List;

import com.hobbyStudy.entity.Institution;

/**  
* @Description: TODO  
* @author shenjin 
* @date 2018年12月22日  
* @version V1.0  
*/
public interface InstitutionService {
	
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
	* @Description: (查询机构课程相关信息详情)  
	* @param     
	* @return List<Institution>  
	* @throws  
	*/  
	Institution queryInstitutionDetail(Integer id);

}
