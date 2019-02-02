package com.hobbyStudy.service;

import java.util.List;

import com.hobbyStudy.entity.ProveMaterials;

/**
 *@ TODO: 审核资料
 *@author shenjin
 */
public interface ProveMaterialsService {

	/**
	 * @ToDo:保存审核材料
	 * @param proveMaterials
	 * @Return :int
	 */
	int addItem(ProveMaterials proveMaterials);

	/**
	 * @ToDo:查询所有所有需要被审核资料
	 * @param type
	 * @Return :List<ProveMaterials>
	 */
	List<ProveMaterials> selectProveMaterials(String type);
	
}
