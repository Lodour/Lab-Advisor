package org.gitshu.user.service.impl;

import org.gitshu.user.dao.UserDAO;
import org.gitshu.user.entity.UserEntity;
import org.gitshu.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
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
    public UserServiceImpl(@Qualifier("userDAOImpl") UserDAO userDAO) {
        this.userDAO = userDAO;
    }


    /**
     * 创建用户
     *
     * @param userEntity 待创建的用户
     */
    @Override
    public void create(UserEntity userEntity) {
        userEntity.setCreateTime(new Timestamp(System.currentTimeMillis()));
        userDAO.create(userEntity);
    }

    /**
     * 获取所有用户
     *
     * @return 用户列表
     */
    @Override
    public List<UserEntity> getAllUsers() {
        return userDAO.getAllUsers();
    }
}
