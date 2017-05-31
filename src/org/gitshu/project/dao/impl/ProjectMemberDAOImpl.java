package org.gitshu.project.dao.impl;

import org.gitshu.entity.ProjectEntity;
import org.gitshu.entity.ProjectUserEntity;
import org.gitshu.entity.UserEntity;
import org.gitshu.project.dao.ProjectMemberDAO;
import org.gitshu.utils.dao.DAOSupport;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.List;

/**
 * Created by Lodour on 17/5/29 22:19.
 * ProjectMemberDAO的实现
 */
@Repository
@Transactional
public class ProjectMemberDAOImpl extends DAOSupport implements ProjectMemberDAO {
    private Session session;

    @Autowired
    protected ProjectMemberDAOImpl(SessionFactory sessionFactory) {
        super(sessionFactory);
    }

    protected Session getSession() {
        return this.sessionFactory.getCurrentSession();
    }

    /**
     * 添加项目成员
     *
     * @param projectEntity 项目实体
     * @param userEntity    用户实体
     */
    @Override
    public void add(ProjectEntity projectEntity, UserEntity userEntity) {
        try {
            getSession()
                    .createQuery("from ProjectUserEntity u where u.projectByProject = :p and u.userByUser = :u")
                    .setParameter("p", projectEntity)
                    .setParameter("u", userEntity)
                    .getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
            ProjectUserEntity projectUserEntity = new ProjectUserEntity();
            projectUserEntity.setProjectByProject(projectEntity);
            projectUserEntity.setUserByUser(userEntity);
            projectUserEntity.setCreateTime(new Timestamp(System.currentTimeMillis()));
            getSession().save(projectUserEntity);
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<UserEntity> getMembers(int id) {
        return getSession()
                .createQuery("select userByUser from ProjectUserEntity u where u.projectByProject.id = :id")
                .setParameter("id", id)
                .getResultList();
    }

    @Override
    public void remove(int projectId, String username) {
        getSession().createQuery("delete from ProjectUserEntity u where u.id = :id and u.userByUser.username = :name")
                .setParameter("id", projectId)
                .setParameter("name", username)
                .executeUpdate();
    }
}
