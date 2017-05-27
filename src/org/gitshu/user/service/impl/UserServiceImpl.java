package org.gitshu.user.service.impl;

import org.gitshu.user.dao.UserDAO;
import org.gitshu.user.entity.UserEntity;
import org.gitshu.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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
    public UserServiceImpl(@Qualifier("rawUserDAO") UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    /**
     * @param userEntity 用户实体
     */
    @Override
    public void createUser(UserEntity userEntity) {
        userDAO.createUser(userEntity);
    }

    /**
     * @return 用户列表
     */
    @Override
    public List<UserEntity> listUser() {
        return userDAO.listUser();
    }
}
