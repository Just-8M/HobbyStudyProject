
package com.hobbyStudy.service;

import java.util.List;

import com.hobbyStudy.entity.VideoType;


/**
 * 视频类型查询
 * @author LENOVO
 *
 */
public interface VideoTypeService {
	/**
	 * 查询所有视频类型
	 * @param record
	 * @return
	 */
	public List<VideoType> getVideoType(VideoType VideoType);
	
}
