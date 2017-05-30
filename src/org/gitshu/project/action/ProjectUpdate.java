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
        int proId = Integer.valueOf(httpServletRequest.getParameter("id"));
        ProjectEntity projectEntity = projectService.getById(proId);
        String title = (String)httpServletRequest.getParameter("title");
        String info = (String)httpServletRequest.getParameter("info");
        if(title.equals(projectEntity.getTitle()) == false){
            projectEntity.setTitle(title);
        }
        if(info.equals(projectEntity.getInfo()) == false){
            projectEntity.setInfo(info);
        }
        throw new UnsupportedOperationException();
    }
}
