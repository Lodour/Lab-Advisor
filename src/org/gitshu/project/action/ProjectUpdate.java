package org.gitshu.project.action;

import org.gitshu.entity.ProjectEntity;
import org.gitshu.project.service.ProjectService;
import org.gitshu.utils.action.ActionVariableSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * Created by Lodour on 17/5/29 23:32.
 * 更新某一个项目
 */
@Controller
public class ProjectUpdate extends ActionVariableSupport {
    private final ProjectService projectService;

    @Autowired
    public ProjectUpdate(ProjectService projectService) {
        this.projectService = projectService;
    }

    public String execute() {
        int projectId = Integer.valueOf(httpServletRequest.getParameter("id"));
        ProjectEntity projectEntity = projectService.getById(projectId);
        String title = httpServletRequest.getParameter("title");
        String info = httpServletRequest.getParameter("info");
        if (!"".equals(title)) projectEntity.setTitle(title);
        if (!"".equals(info)) projectEntity.setInfo(info);
        projectService.update(projectEntity);
        return SUCCESS;
    }
}
