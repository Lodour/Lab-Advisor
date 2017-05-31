package org.gitshu.project.action;

import org.gitshu.entity.UserEntity;
import org.gitshu.project.service.ProjectMemberService;
import org.gitshu.utils.action.ActionVariableSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.List;

/**
 * Created by Lodour on 17/5/29 23:32.
 * 项目详细信息
 */
@Controller
public class ProjectMembers extends ActionVariableSupport {
    private final ProjectMemberService projectMemberService;
    private int projectId;

    @Autowired
    public ProjectMembers(ProjectMemberService projectMemberService) {
        this.projectMemberService = projectMemberService;
    }

    public String execute() {
        if (projectId == 0) {
            try {
                projectId = Integer.parseInt(httpServletRequest.getParameter("id"));
            } catch (Exception ignore) {
            }
        }
        List<UserEntity> userEntities = projectMemberService.getMembers(projectId);
        httpServletRequest.setAttribute("members", userEntities);
        httpSession.put("members", userEntities);
        return SUCCESS;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }
}
