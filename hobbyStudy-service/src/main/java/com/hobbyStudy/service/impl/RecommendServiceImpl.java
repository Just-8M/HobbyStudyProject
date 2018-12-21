package com.hobbyStudy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyStudy.dao.RecommendMapper;
import com.hobbyStudy.entity.RecommendPhotoSlide;
import com.hobbyStudy.service.RecommendService;

/**  
* @Description: Recommond 
* @author shenjin 
* @date 2018年12月15日  
* @version V1.0  
*/
@Service
public class RecommendServiceImpl implements RecommendService{
	
	@Autowired
	private RecommendMapper recommendMapper;
	/**
	 * 查询推荐页导航图片
	 */
	@Override
	public List<RecommendPhotoSlide> queryNavigationPhoto(Integer count) {
		return recommendMapper.queryNavigationPhoto(count);
	}

}
