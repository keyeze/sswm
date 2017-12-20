package com.chan.service.impl;

import com.chan.dao.UserSelectDao;
import com.chan.dao.UsersMapper;
import com.chan.model.Users;
import com.chan.mr.tool.exception.UserErrorException;
import com.chan.service.IUserService;
import com.chan.util.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by keyez on 2017/2/17.
 */
@Service
public class UserService extends BaseService implements IUserService {
    protected UsersMapper baseDao;

    protected UserSelectDao selectDao;

    public UsersMapper getBaseDao() {
        return baseDao;
    }

    @Resource
    public void setBaseDao(UsersMapper baseDao) {
        this.baseDao = baseDao;
    }

    public UserSelectDao getSelectDao() {
        return selectDao;
    }

    @Resource
    public void setSelectDao(UserSelectDao selectDao) {
        this.selectDao = selectDao;
    }


    @Override
    public Map<String, Object> doTest() {
        return null;
    }

    @Override
    @Transactional(rollbackFor = {Exception.class})
    public Users login(Map<String, Object> params) throws Exception {
        String username = (String) params.get("username");
        String password = (String) params.get("password");
        String root = (String) params.get("root");
        Users user = selectDao.findUserByUsername(username);
        if (user == null)
            throw new UserErrorException("账号不存在");
        if (!user.getPassword().equals(password))
            throw new UserErrorException("账号与密码不匹配");
        if (user.getStatus() == 1)
            throw new UserErrorException("用户已经被冻结");
        if (Integer.parseInt(root) > user.getRoot())
            throw new UserErrorException("用户权限不足");
//        user.setIsOnline((byte) 1);
//        dao.updateUserLLD(user);
        user.setLastLoginDate(new Date());
        baseDao.updateByPrimaryKey(user);
        return user;
    }


    @Override
    @Transactional(rollbackFor = {Exception.class})
    public void register(Users newUser) throws Exception {
        Users user = selectDao.findUserByUsername(newUser.getUsername());
        if (user != null)
            throw new UserErrorException("用户已经存在");
        newUser.setCreateDate(new Date());
//        newUser.setLastLoginDate(newUser.getCreateDate());
        baseDao.insertSelective(newUser);
    }

    @Override
    public Users updatePinInfo(Users user) {
        baseDao.updateByPrimaryKeySelective(user);
        return baseDao.selectByPrimaryKey(user.getUserId());
    }

    @Override
    public Map<String, Object> queryUsers(Map<String, Object> params) {
        Map<String, Object> result = new HashMap<>();
        Integer total = this.selectDao.totalUsers(params);
        List<Users> list = this.selectDao.queryUsers(params);
        result.put("total", total);
        result.put("rows", list);
        return result;
    }
}
