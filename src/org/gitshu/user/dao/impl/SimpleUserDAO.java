package org.gitshu.user.dao.impl;

import org.gitshu.user.dao.UserDAO;
import org.gitshu.user.entity.UserEntity;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Lodour on 17/5/27 11:20.
 * 测试另一种DAO实现方式
 * <p>
 * 虽然HibernateDaoSupport很方便
 * 但是有些地方[1]说不建议使用
 * 因为这会让项目对Spring框架的耦合度过高
 * <p>
 * [1] https://stackoverflow.com/questions/5104765/why-is-hibernatedaosupport-not-recommended
 */
@Deprecated
@Repository
@Transactional
public class SimpleUserDAO extends HibernateDaoSupport implements UserDAO {

    @Autowired
    public void setSessionFactoryOverride(SessionFactory sessionFactory) {
        super.setSessionFactory(sessionFactory);
    }

    /**
     * @param userEntity 用户实体
     */
    @Override
    public void createUser(UserEntity userEntity) {
        getHibernateTemplate().save(userEntity);
    }

    /**
     * @return 用户列表
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<UserEntity> listUser() {
        return (List<UserEntity>) getHibernateTemplate().find("from UserEntity ");
    }
}
