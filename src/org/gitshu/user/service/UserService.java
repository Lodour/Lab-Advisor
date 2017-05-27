package org.gitshu.user.service;

import org.gitshu.user.entity.UserEntity;

import java.util.List;

/**
 * Created by Lodour on 17/5/27 01:23.
 * <p>
 * 用户业务对象
 * <p>
 * 封装用户相关的业务逻辑接口
 */
public interface UserService {
    /**
     * 创建用户
     *
     * @param userEntity 用户实体
     */
    void createUser(UserEntity userEntity);

    /**
     * 获取用户列表
     *
     * @return 用户列表
     */
    List<UserEntity> listUser();
}
