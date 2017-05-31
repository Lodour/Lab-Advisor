package org.gitshu.repository.action;

import org.gitshu.entity.ProjectEntity;
import org.gitshu.project.service.ProjectService;
import org.gitshu.repository.service.RepoService;
import org.gitshu.utils.action.ActionVariableSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.io.File;

/**
 * Created by Lodour on 17/5/30 10:23.
 * 查看文件
 */
@Controller
public class View extends ActionVariableSupport {
    private final RepoService repoService;
    private final ProjectService projectService;
    @Autowired
    public View(RepoService repoService, ProjectService projectService) {
        this.repoService = repoService;
        this.projectService = projectService;
    }

    public String execute() {
        int projectId = Integer.parseInt(httpServletRequest.getParameter("pid"));
        String path = httpServletRequest.getParameter("pth");
        File[] files = repoService.getFiles(projectId, path);
        httpServletRequest.setAttribute("files", files);

        ProjectEntity projectEntity = projectService.getById(projectId);
        httpServletRequest.setAttribute("project", projectEntity);
        return SUCCESS;
    }
}
