package com.hobbyStudy.service.impl;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobbyStudy.common.utils.CourseEnum;
import com.hobbyStudy.common.utils.page.TailPage;
import com.hobbyStudy.dao.CourseMapper;
import com.hobbyStudy.entity.Course;
import com.hobbyStudy.entity.CourseQuery;
import com.hobbyStudy.service.CourseService;

/**
 * @Description: 课程
 * @author shenjin
 * @date 2018年11月22日
 * @version V1.0
 */
@Service
public class CourseServiceImpl implements CourseService {

	@Autowired
	private CourseMapper courseMapper;

	private void prepareCoursePicture(Course course) {
		if (null != course && StringUtils.isNotEmpty(course.getPicture())) {
			// course.setPicture(QiniuStorage.getUrl(course.getPicture())); //
			// 七牛云存储
		}
	}

	@Override
	public List<Course> getList(CourseQuery courseQuery) {
		if (null == courseQuery.getOnsale()) {// 是否上架
			courseQuery.setOnsale(CourseEnum.ONSALE.value());
		}
		List<Course> list = courseMapper.getList(courseQuery);
		for (Course c : list) {
			if (StringUtils.isNotEmpty(c.getPicture())) {// 七牛图片处理
				// c.setPicture(QiniuStorage.getUrl(c.getPicture())); // 图片设置
			}
		}
		return list;
	}

	// 查询课程分页
	@Override
	public TailPage<Course> queryCoursePage(Course course, TailPage<Course> page) {
		Integer itemsTotalCount = courseMapper.getTotalItemsCount(course);
		List<Course> items = courseMapper.queryPage(course, page);

		if (CollectionUtils.isNotEmpty(items)) {
			for (Course item : items) {
				prepareCoursePicture(item);
			}
		}
		page.setItemsTotalCount(itemsTotalCount);
		page.setItems(items);
		return page;
	}

	/**
	 * 通过id得到课程详情页
	 */
	@Override
	public Course getCourseById(Long id) {

		Course course = courseMapper.getCourseById(id);
		prepareCoursePicture(course);
		return course;
	}

	// 根据领学者username查询所属所有课程
	@Override
	public List<Course> queryPersonCourse(String userid) {
		return courseMapper.queryPersonCourse(userid);
	}

	// 查询分类课程
	@Override
	public List<Course> queryClassifyCourse(String title) {
		return courseMapper.queryClassifyCourse(title);
	}

	// 查询单个课程详情页
	@Override
	public Course querySingleCourseDetalis(Integer id) {
		return courseMapper.querySingleCourseDetalis(id);
	}

	//  精选课程
	@Override
	public List<Course> querySelectionCourse() {
		return courseMapper.querySelectionCourse();
	}

	//  最热课程
	@Override
	public List<Course> queryHottestCourse() {
		return courseMapper.queryHottestCourse();
	}

	// 最新课程
	@Override
	public List<Course> queryLastestCourse() {
		return courseMapper.queryLastestCourse();
	}

	/**
	 *  查询推荐页的子菜单分类下所有课程
	 */
	@Override
	public List<Course> queryNavCategoryCourse(String subClassifyName) {
		return courseMapper.queryNavCategoryCourse(subClassifyName);
	}
	@Override
	public int addCourse(Course c) {
		return courseMapper.addCourse(c);
	}

	@Override
	public List<Course> queryUserOwnCourse(String userid) {
		return courseMapper.queryUserOwnCourse(userid);
	}

	@Override
	public List<Course> queryCourseName(String name,String type) {
		return courseMapper.queryCourseName(name,type);
	}

	@Override
	public List<Course> queryTotalCourse(String type) {
		return courseMapper.queryTotalCourse(type);
	}

	@Override
	public List<Course> queryIndexCourse(String name) {
		return courseMapper.queryIndexCourse(name);
	}

}
