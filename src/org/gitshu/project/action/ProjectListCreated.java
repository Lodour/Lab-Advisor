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
public class ProjectListCreated extends ActionVariableSupport {
    private final ProjectMemberService projectMemberService;
    private final ProjectService projectService;

    @Autowired
    public ProjectListCreated(ProjectMemberService projectMemberService, ProjectService projectService) {
        this.projectMemberService = projectMemberService;
        this.projectService = projectService;
    }


    public String execute() {
        String username = (String) httpSession.get("username");
        List<ProjectEntity> result = projectMemberService.getJoinedProjects(username);
        for (ProjectEntity projectEntity : projectService.getCreatedProjects(username)) {
            if (!result.contains(projectEntity))
                result.add(projectEntity);
        }
        httpServletRequest.setAttribute("projects", result);
        return SUCCESS;
    }
}
