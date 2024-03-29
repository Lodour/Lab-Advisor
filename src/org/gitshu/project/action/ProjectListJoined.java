package org.gitshu.project.action;

import org.gitshu.entity.ProjectEntity;
import org.gitshu.project.service.ProjectMemberService;
import org.gitshu.project.service.ProjectService;
import org.gitshu.utils.action.ActionVariableSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.List;

/**
 * Created by Lodour on 17/5/29 23:32.
 * 我参与的项目列表
 */
@Controller
public class ProjectListJoined extends ActionVariableSupport {
    private final ProjectMemberService projectMemberService;
    private final ProjectService projectService;

    @Autowired
    public ProjectListJoined(ProjectMemberService projectMemberService, ProjectService projectService) {
        this.projectMemberService = projectMemberService;
        this.projectService = projectService;
    }


    public String execute() {
        String username = httpServletRequest.getParameter("username");
        if (username == null || "".equals(username)) {
            username = (String) httpSession.get("username");
        }
        List<ProjectEntity> projectEntities = (List<ProjectEntity>) projectService.getCreatedProjects(username);
        httpServletRequest.setAttribute("projects", projectEntities);
        return SUCCESS;
    }
}
