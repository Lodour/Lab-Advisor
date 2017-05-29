package org.gitshu.workflow.action;

import org.gitshu.utils.action.ActionVariableSupport;
import org.gitshu.workflow.service.WorkflowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * Created by Lodour on 17/5/30 00:43.
 * 创建新结点
 */
@Controller
public class WorkflowCreate extends ActionVariableSupport {
    private final WorkflowService workflowService;

    @Autowired
    public WorkflowCreate(WorkflowService workflowService) {
        this.workflowService = workflowService;
    }

    public String execute() {
        throw new UnsupportedOperationException();
    }
}