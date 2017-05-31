package org.gitshu.project.action;

import com.opensymphony.xwork2.ModelDriven;
import org.gitshu.entity.ProjectEntity;
import org.gitshu.project.service.ProjectMemberService;
import org.gitshu.project.service.ProjectService;
import org.gitshu.utils.action.ActionVariableSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * Created by Lodour on 17/5/29 23:32.
 * 创建一个新项目
 */
@Controller
public class ProjectCreate extends ActionVariableSupport implements ModelDriven<ProjectEntity> {
    private final ProjectService projectService;
    private final ProjectMemberService projectMemberService;
    private ProjectEntity projectEntity;

    @Autowired
    public ProjectCreate(ProjectService projectService, ProjectMemberService projectMemberService) {
        this.projectService = projectService;
        this.projectMemberService = projectMemberService;
        projectEntity = new ProjectEntity();
    }

    @Override
    public ProjectEntity getModel() {
        return projectEntity;
    }

    public String execute() {
        String username = (String) httpSession.get("username");
        projectService.create(username, projectEntity);
//        System.out.println(projectEntity.getId());
//        projectMemberService.addMember(projectEntity.getId(), username);
        return SUCCESS;
    }
}
