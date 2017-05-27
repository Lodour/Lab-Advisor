package org.gitshu.user.dao;

import org.gitshu.user.entity.UserEntity;

import java.util.List;

/**
 * Created by Lodour on 17/5/27 01:35.
 * <p>
 * 用户数据访问对象 - User Data Access Object
 * <p>
 * 封装用户数据的访问接口
 */
public interface UserDAO {
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
