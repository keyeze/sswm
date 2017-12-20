package com.chan.dao;

import com.chan.model.Users;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by keyez on 2017/4/20.
 */
@Repository
public interface UserSelectDao {

    @Select("select * from Users where username = #{username}")
    @ResultMap(value = "BaseResultMap")
    public Users findUserByUsername(@Param("username") String username);

    public List<Users> queryUsers(Map<String, Object> params);

    Integer totalUsers(Map<String, Object> params);

}
