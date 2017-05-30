package org.gitshu.workflow.action;

import org.gitshu.entity.WorkflowEntity;
import org.gitshu.utils.action.ActionVariableSupport;
import org.gitshu.workflow.service.WorkflowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.List;

/**
 * Created by Lodour on 17/5/30 00:43.
 * 查看项目的工作流
 */
@Controller
public class WorkflowView extends ActionVariableSupport {
    private final WorkflowService workflowService;

    @Autowired
    public WorkflowView(WorkflowService workflowService) {
        this.workflowService = workflowService;
    }

    public String execute() {
        int projectId = Integer.parseInt(httpServletRequest.getParameter("projectId"));
        List<WorkflowEntity> workflowEntityList = workflowService.getByProjectId(projectId);
        httpServletRequest.setAttribute("nodes", workflowEntityList);
        return SUCCESS;
    }
}
