package org.gitshu.workflow.action;

import org.gitshu.utils.action.ActionVariableSupport;
import org.gitshu.workflow.service.WorkflowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * Created by Lodour on 17/5/30 00:43.
 * 更新指定结点状态
 */
@Controller
public class WorkflowStatusUpdate extends ActionVariableSupport {
    private final WorkflowService workflowService;

    @Autowired
    public WorkflowStatusUpdate(WorkflowService workflowService) {
        this.workflowService = workflowService;
    }

    public String execute() {
        int id = Integer.parseInt(httpServletRequest.getParameter("id"));
        int status = Integer.parseInt(httpServletRequest.getParameter("status"));
        switch (status) {
            case 0:
                workflowService.setUnfinished(id);
                break;
            case 1:
                workflowService.setProcessing(id);
                break;
            case 2:
                workflowService.setFinished(id);
                break;
        }
        return SUCCESS;
    }
}
