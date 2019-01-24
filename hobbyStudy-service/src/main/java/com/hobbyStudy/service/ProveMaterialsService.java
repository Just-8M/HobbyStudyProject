package com.hobbyStudy.service;

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
	
}
