package com.hobbyStudy.dao;

import com.hobbyStudy.entity.ProveMaterials;

/**
 *@ TODO:审核资料
 *@author shenjin
 */
public interface ProveMaterialsMapper {
	//  保存审核材料
	int addItem(ProveMaterials proveMaterials);
}
