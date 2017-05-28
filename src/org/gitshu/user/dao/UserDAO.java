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
    void create(UserEntity userEntity);

    /**
     * 删除指定ID的用户
     *
     * @param id 待删除用户的ID
     */
    void delete(int id);

    /**
     * 更新用户
     *
     * @param userEntity 待更新的用户
     */
    void update(UserEntity userEntity);

    /**
     * 根据ID获取用户
     *
     * @param id 用户ID
     * @return 用户实体
     */
    UserEntity getById(int id);

    /**
     * 根据用户名获取用户
     *
     * @param username 用户名
     * @return 用户实体
     */
    UserEntity getByUsername(String username);

    /**
     * 根据用户名和密码获取用户
     *
     * @param username 用户名
     * @param password 密码
     * @return 用户实体
     */
    UserEntity getByUsernameAndPassword(String username, String password);


    /**
     * 获取用户列表
     *
     * @return 用户列表
     */
    List<UserEntity> getAllUsers();
}
