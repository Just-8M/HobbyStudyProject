
package com.hobbyStudy.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyStudy.dao.VideoInfoMapper;
import com.hobbyStudy.entity.VideoInfo;
import com.hobbyStudy.service.VideoInfoService;


@Service
public class VideoInfoServiceImpl implements VideoInfoService {
	@Autowired
	private VideoInfoMapper videoInfoMapper;

	public List<VideoInfo> getVideoAll(VideoInfo videoInfo) {
		return videoInfoMapper.getVideoAll(videoInfo);

	}
	//  添加视频
	public int addVideoInfo(VideoInfo videoInfo) {
		return videoInfoMapper.insertVideo(videoInfo);

	}
	//  播放视频
	public VideoInfo getVideoInfo(int id) {
		return videoInfoMapper.selectByPrimaryKey(id);
	}

}
