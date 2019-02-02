package com.hobbyStudy.dao;

import java.util.List;

import com.hobbyStudy.entity.ProveMaterials;

/**
 *@ TODO:审核资料
 *@author shenjin
 */
public interface ProveMaterialsMapper {
	//  保存审核材料
	int addItem(ProveMaterials proveMaterials);

	//  实名认证审核图片资料组证明
	List<ProveMaterials> selectProveMaterials(String type);
}
