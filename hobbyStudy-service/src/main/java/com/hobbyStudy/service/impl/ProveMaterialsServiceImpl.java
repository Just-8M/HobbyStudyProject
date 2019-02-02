package com.hobbyStudy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyStudy.dao.ProveMaterialsMapper;
import com.hobbyStudy.entity.ProveMaterials;
import com.hobbyStudy.service.ProveMaterialsService;

/**
 *@ TODO: 审核资料
 *@author shenjin
 */
@Service
public class ProveMaterialsServiceImpl implements ProveMaterialsService{
	@Autowired
	private ProveMaterialsMapper ProveMaterialsMapper;
	
	@Override
	public int addItem(ProveMaterials proveMaterials) {
		return ProveMaterialsMapper.addItem(proveMaterials);
	}
	
	@Override
	public List<ProveMaterials> selectProveMaterials(String type) {
		return ProveMaterialsMapper.selectProveMaterials(type);
	}

}
