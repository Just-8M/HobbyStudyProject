package com.hobbyStudy.dao;

import org.apache.ibatis.annotations.Param;

/**
 * 点赞、关注
 * @author shenjin
 *
 */
public interface UserLikeMapper {

	public Boolean insertUserLikeitem(@Param("u_userid")String u_userid, @Param("type")String type, @Param("createTime")String createTime, @Param("creatUser")String creatUser);

}
