package org.gitshu.user.dao.impl;

import org.gitshu.user.dao.UserDAO;
import org.gitshu.user.entity.UserEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Lodour on 17/5/27 01:39.
 * <p>
 * 用户数据访问对象的一种实现 - User Data Access Object Implementation
 * <p>
 * 这种实现方式是官方文档提倡的
 * http://docs.spring.io/spring/docs/4.3.x/spring-framework-reference/html/orm.html#orm-hibernate-straight
 */
@Repository
@Transactional
public class UserDAOImpl implements UserDAO {

    private final SessionFactory sessionFactory;

    @Autowired
    public UserDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session getSession() {
        return this.sessionFactory.getCurrentSession();
    }

    /**
     * 创建用户
     *
     * @param userEntity 用户实体
     */
    @Override
    public void create(UserEntity userEntity) {
        getSession().save(userEntity);
    }

    /**
     * 删除指定ID的用户
     *
     * @param id 待删除用户的ID
     */
    @Override
    public void delete(int id) {
        getSession().createQuery("delete from UserEntity where id = :id").setParameter("id", id).executeUpdate();
    }

    /**
     * 更新用户
     *
     * @param userEntity 待更新的用户
     */
    @Override
    public void update(UserEntity userEntity) {
        getSession().update(userEntity);
    }

    /**
     * 根据ID获取用户
     *
     * @param id 用户ID
     * @return 用户实体
     */
    @Override
    public UserEntity getById(int id) {
        return (UserEntity) getSession()
                .createQuery("from UserEntity where id = :id")
                .setParameter("id", id)
                .getSingleResult();
    }

    /**
     * 根据用户名获取用户
     *
     * @param username 用户名
     * @return 用户实体
     */
    @Override
    public UserEntity getByUsername(String username) {
        return (UserEntity) getSession()
                .createQuery("from UserEntity u where u.username = :username")
                .setParameter("username", username)
                .getSingleResult();
    }

    /**
     * 根据用户名和密码获取用户
     *
     * @param username 用户名
     * @param password 密码
     * @return 用户实体
     */
    @Override
    public UserEntity getByUsernameAndPassword(String username, String password) {
        return (UserEntity) getSession()
                .createQuery("from UserEntity u where u.username = :username and u.password = :password")
                .setParameter("username", username)
                .setParameter("password", password)
                .getSingleResult();
    }

    /**
     * 获取用户列表
     *
     * @return 用户列表
     */
    @Override
    public List<UserEntity> getAllUsers() {
        return (List<UserEntity>) getSession().createQuery("from UserEntity ").list();
    }
}
