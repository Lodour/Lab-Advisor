package org.gitshu.user.service.impl;

import org.gitshu.user.dao.UserDAO;
import org.gitshu.user.entity.UserEntity;
import org.gitshu.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Lodour on 17/5/27 01:44.
 * <p>
 * 用户业务对象接口的一种实现
 * <p>
 * 采用UserDAO进行实现
 */
@Service
public class UserServiceImpl implements UserService {


    /**
     * 使用User的DAO实现事务请求
     */
    private final UserDAO userDAO;

    @Autowired
    public UserServiceImpl(UserDAO userDAO) {
        this.userDAO = userDAO;
    }


    /**
     * 创建新用户
     *
     * @param username 用户名
     * @param password 密码
     * @param userType 用户类型
     * @param realName 真实姓名
     * @param gender   性别
     */
    @Override
    public void create(String username, String password, int userType, String realName, int gender) {
        userDAO.create(username, password, userType, realName, gender);
    }

    /**
     * 登录用户
     *
     * @param username 用户名
     * @param password 密码
     * @return 若登录成功则返回用户ID，否则返回-1
     */
    @Override
    public int login(String username, String password) {
        if (!userDAO.checkUsernameAndPassword(username, password)) return -1;
        int id = userDAO.getIdByUsername(username);
        userDAO.updateLoginTime(id);
        return id;
    }

    /**
     * 检测用户名是否已存在
     *
     * @param username 用户名
     * @return 是否存在
     */
    @Override
    public boolean chkUsername(String username) {
        return userDAO.chkUsername(username);
    }

    /**
     * 获取所有用户数据
     *
     * @return 所有的用户实体
     */
    @Override
    public List<UserEntity> getAllUserEntities() {
        return userDAO.getAllUserEntities();
    }
}
