package com.hobbyStudy.common.utils.page;

import java.util.List;
/**
 * 
* @Description:分页接口  
* @author shenjin 
* @date 2018年11月25日  
* @version V1.0
 */
public interface Page<E> extends Iterable<E> {
	
	int getFirstPageNum();    //   起始页号
	int getLastPageNum();  //   终止页号
    int getPageNum();   //  当前页号
    int getPageSize();    //  分页大小
    List<E> getItems();   //  分页数据
	int getItemsTotalCount();  //  获取总记录数
	int getPageTotalCount();   //  获取总记录数
    boolean isFirstPage();     // 是第一页
	boolean isLastPage();     //  是最后一页
    boolean isEmpty();      //  是否为空内容
}


