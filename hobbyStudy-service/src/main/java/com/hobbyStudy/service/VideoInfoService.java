
package com.hobbyStudy.service;

import java.util.List;

import com.hobbyStudy.entity.VideoInfo;


public interface VideoInfoService {

	public List<VideoInfo> getVideoAll(VideoInfo videoInfo);  //  查询所有

	public int addVideoInfo(VideoInfo videoInfo);             //  添加视频
	
	public VideoInfo getVideoInfo(int id);                    //  查看视频
}
