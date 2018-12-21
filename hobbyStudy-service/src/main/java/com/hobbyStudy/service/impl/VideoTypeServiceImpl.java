
package com.hobbyStudy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyStudy.dao.VideoTypeMapper;
import com.hobbyStudy.entity.VideoType;
import com.hobbyStudy.service.VideoTypeService;



@Service
public class VideoTypeServiceImpl implements VideoTypeService {
	/**
	 * @Autowired 注释，它可以对类成员变量、方法及构造函数进行标注，完成自动装配的工作。 
	 * 通过 @Autowired的使用来消除 set ，get方法。在使用@Autowired之前，我们对一个bean配置起属性时，是这用用的
	 *   <property name="属性名" value=" 属性值"/> 通过这种方式来，配置比较繁琐，而且代码比较多。
	 *   在Spring 2.5 引入了 @Autowired 注释
	 */
	@Autowired
	private VideoTypeMapper videoTypeMapper;
	
	public List<VideoType> getVideoType(VideoType VideoType) {
		return videoTypeMapper.getVideoType(VideoType);
	}
}
