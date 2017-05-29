package org.gitshu.workflow.dao.impl;

import org.gitshu.utils.dao.DAOSupport;
import org.gitshu.workflow.dao.WorkflowDAO;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Lodour on 17/5/30 00:41.
 * 工作流DAO的实现
 */
@Repository
@Transactional
public class WorkflowDAOImpl extends DAOSupport implements WorkflowDAO {

    protected WorkflowDAOImpl(SessionFactory sessionFactory) {
        super(sessionFactory);
    }

}
