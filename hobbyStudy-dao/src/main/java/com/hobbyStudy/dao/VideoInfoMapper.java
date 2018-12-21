package com.hobbyStudy.dao;

import java.util.List;

import com.hobbyStudy.entity.VideoInfo;

public interface VideoInfoMapper {
	int deleteByPrimaryKey(Integer id);

	int insertVideo(VideoInfo videoInfo);   //  添加视频

	int insertSelective(VideoInfo record);

	VideoInfo selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(VideoInfo record);

	int updateByPrimaryKey(VideoInfo record);

	List<VideoInfo> getVideoAll(VideoInfo record);  //  查询视频
}