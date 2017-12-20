package com.chan.service;

import com.chan.model.Users;

import java.util.Map;

/**
 * Created by keyez on 2017/2/17.
 */
public interface IUserService {
    public Map<String, Object> doTest();

    public Users login(Map<String, Object> params) throws Exception;

    public void register(Users newUser) throws Exception;

    Users updatePinInfo(Users user);

    Map<String, Object> queryUsers(Map<String, Object> params);
}
