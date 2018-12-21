package com.hobbyStudy.entity;

import org.apache.commons.lang.StringUtils;

import com.hobbyStudy.common.utils.BeanUtil;
/**
 * 
* @Description: 课程查询实体类 
* @author shenjin 
* @date 2018年11月24日  
* @version V1.0
 */
public class CourseQuery extends Course{
	
	private String sortField;     // java bean中的属性
	
	private String sortDirection = "DESC";    
	
	private Integer start=0;//limit开始
	
	private Integer count;//数量
	
	private Integer end;//limit结束
	
	
	public String getSortField() {
		return sortField;
	}

	/**
	 * 按照sortField升序
	 * @param sortField：指java bean中的属性
	 */
	public void ascSortField(String sortField) {
		if(StringUtils.isNotEmpty(sortField)){
			this.sortField = BeanUtil.fieldToColumn(sortField);
			this.sortDirection = " ASC ";
		}
	}
	
	/**
	 * 按照sortField降序
	 * @param sortField ：指java bean中的属性
	 */
	public void descSortField(String sortField) {
		if(StringUtils.isNotEmpty(sortField)){
			this.sortField = BeanUtil.fieldToColumn(sortField);
			this.sortDirection = " DESC ";
		}
	}
	
	public String getSortDirection() {
		return sortDirection;
	}
	
	public Integer getStart() {
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}
	
	public void setCount(Integer count) {
		this.count = count;
	}

	public Integer getEnd() {
		if(null != this.count){
			if(null == this.start){
				this.start = 0;
			}
			this.end = this.start + this.count;
		}
		return end;
	}
	
}
