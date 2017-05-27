package org.gitshu.user.dao.impl;

import org.gitshu.user.dao.UserDAO;
import org.gitshu.user.entity.UserEntity;
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
public class RawUserDAO implements UserDAO {

    private final SessionFactory sessionFactory;

    @Autowired
    public RawUserDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    /**
     * @param userEntity 用户实体
     */
    @Override
    public void createUser(UserEntity userEntity) {
        sessionFactory.getCurrentSession().save(userEntity);
    }

    /**
     * @return 用户列表
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<UserEntity> listUser() {
        return sessionFactory.getCurrentSession().createQuery("from UserEntity").list();
    }
}
