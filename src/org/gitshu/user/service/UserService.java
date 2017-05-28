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
     * @param username 用户名
     * @param password 密码
     * @param userType 用户类型
     * @param realName 真实姓名
     * @param gender   性别
     */
    void create(String username, String password, int userType, String realName, int gender);

    /**
     * 登录用户
     *
     * @param username 用户名
     * @param password 密码
     * @return 若登录成功则返回用户ID，否则返回-1
     */
    int login(String username, String password);

    /**
     * 检测用户名是否已存在
     *
     * @param username 用户名
     * @return 是否存在
     */
    boolean chkUsername(String username);

    /**
     * 获取所有用户数据
     *
     * @return 所有的用户实体
     */
    List<UserEntity> getAllUserEntities();
}
