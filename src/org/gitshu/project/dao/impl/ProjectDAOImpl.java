package org.gitshu.project.dao.impl;

import org.gitshu.entity.ProjectEntity;
import org.gitshu.project.dao.ProjectDAO;
import org.gitshu.utils.dao.DAOSupport;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;

/**
 * Created by Lodour on 17/5/29 22:18.
 * 项目DAO的实现
 */
@Repository
@Transactional
public class ProjectDAOImpl extends DAOSupport implements ProjectDAO {

    @Autowired
    protected ProjectDAOImpl(SessionFactory sessionFactory) {
        super(sessionFactory);
    }

    /**
     * 创建项目
     *
     * @param projectEntity 项目实体
     */
    @Override
    public void create(ProjectEntity projectEntity) {
        projectEntity.setCreateTime(new Timestamp(System.currentTimeMillis()));
        getSession().save(projectEntity);
    }

    /**
     * 更新项目
     *
     * @param projectEntity 项目实体
     */
    @Override
    public void update(ProjectEntity projectEntity) {
        getSession().update(projectEntity);
    }

    /**
     * 根据ID获取项目实体
     *
     * @param id 项目ID
     * @return 项目实体
     */
    @Override
    public ProjectEntity getById(int id) {
        return (ProjectEntity) getSession()
                .createQuery("from ProjectEntity p where p.userByCreateBy.id = :id")
                .setParameter("id", id)
                .getSingleResult();
    }
}