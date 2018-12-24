package com.hobbyStudy.entity;

import java.util.Date;

/**  
* @Description: 机构
* @author shenjin 
* @date 2018年12月22日  
* @version V1.0  
*/
public class Institution {
	
	private Integer id; 
	private String courseName;          // 课程名
	private String picture;				// 图片url
	private String courseIntro;			// 课程简介
	private String courseDetail;		// 课程详情
	private String institutionName;		// 机构名称
	private String type;				// 类型（编程）
	private String level;				// 课程等级（初、中、高、就业）
	private Date timespanStart;			// 开课开始时间
	private Date timespanEnd;			// 开课结束时间
	
	private String periods;				// 上课期数（第一期）
	private String peopleNum;			// 人数
	private String teachVideo;			// 教学视频展示
	private String teacherIntro;		// 老师介绍
	private String courseOutline;		// 课程大纲
	private String telePhone;			// 电话
	
	private String province;			// XX省
	private String city;			    // 市
	private String district;			// 区
	
	private String institutionaddress;	// 机构地址
	
	private Date createTime;             // 创建时间
	private String createUser;  		 //创建人(username)
	private Date updateTime;    		 // 更新时间
	private String updateUser;  		 //  最后一位更新人(username)
	private Integer del = 0;  			 //  逻辑删除
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getCourseIntro() {
		return courseIntro;
	}
	public void setCourseIntro(String courseIntro) {
		this.courseIntro = courseIntro;
	}
	public String getCourseDetail() {
		return courseDetail;
	}
	public void setCourseDetail(String courseDetail) {
		this.courseDetail = courseDetail;
	}
	public String getInstitutionName() {
		return institutionName;
	}
	public void setInstitutionName(String institutionName) {
		this.institutionName = institutionName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	
	public Date getTimespanStart() {
		return timespanStart;
	}
	public void setTimespanStart(Date timespanStart) {
		this.timespanStart = timespanStart;
	}
	public Date getTimespanEnd() {
		return timespanEnd;
	}
	public void setTimespanEnd(Date timespanEnd) {
		this.timespanEnd = timespanEnd;
	}
	public String getPeriods() {
		return periods;
	}
	public void setPeriods(String periods) {
		this.periods = periods;
	}
	public String getPeopleNum() {
		return peopleNum;
	}
	public void setPeopleNum(String peopleNum) {
		this.peopleNum = peopleNum;
	}
	public String getTeachVideo() {
		return teachVideo;
	}
	public void setTeachVideo(String teachVideo) {
		this.teachVideo = teachVideo;
	}
	public String getTeacherIntro() {
		return teacherIntro;
	}
	public void setTeacherIntro(String teacherIntro) {
		this.teacherIntro = teacherIntro;
	}
	public String getCourseOutline() {
		return courseOutline;
	}
	public void setCourseOutline(String courseOutline) {
		this.courseOutline = courseOutline;
	}
	public String getTelePhone() {
		return telePhone;
	}
	public void setTelePhone(String telePhone) {
		this.telePhone = telePhone;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getInstitutionaddress() {
		return institutionaddress;
	}
	public void setInstitutionaddress(String institutionaddress) {
		this.institutionaddress = institutionaddress;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public String getUpdateUser() {
		return updateUser;
	}
	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}
	public Integer getDel() {
		return del;
	}
	public void setDel(Integer del) {
		this.del = del;
	}
}
