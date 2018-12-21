package com.hobbyStudy.entity;

public class VideoInfo {
	private Integer id;

	private String videoName; // 视频名称

	private String videoUrl; // 图片名称

	private String videoHtml; // 视频html执行元素

	private Integer videoTypeId;

	private Integer videoDel; // 关联typeID

	private String typeName; // 是否显示 0显示 1隐藏

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getVideoName() {
		return videoName;
	}

	public void setVideoName(String videoName) {
		this.videoName = videoName == null ? null : videoName.trim();
	}

	public String getVideoUrl() {
		return videoUrl;
	}

	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl == null ? null : videoUrl.trim();
	}

	public String getVideoHtml() {
		return videoHtml;
	}

	public void setVideoHtml(String videoHtml) {
		this.videoHtml = videoHtml == null ? null : videoHtml.trim();
	}

	public Integer getVideoTypeId() {
		return videoTypeId;
	}

	public void setVideoTypeId(Integer videoTypeId) {
		this.videoTypeId = videoTypeId;
	}

	public Integer getVideoDel() {
		return videoDel;
	}

	public void setVideoDel(Integer videoDel) {
		if (videoDel == null) {
			videoDel = 0;
		}
		this.videoDel = videoDel;
	}

	public String getTypeName() {

		return typeName;
	}

	public void setTypeName(String typeName) {

		this.typeName = typeName;
	}

	@Override
	public String toString() {
		return "VideoInfo [id=" + id + ", videoName=" + videoName + ", videoUrl=" + videoUrl + ", videoHtml="
				+ videoHtml + ", videoTypeId=" + videoTypeId + ", videoDel=" + videoDel + ", typeName=" + typeName
				+ "]";
	}

}