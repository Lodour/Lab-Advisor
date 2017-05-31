package org.gitshu.project.action;

import org.gitshu.project.service.ProjectMemberService;
import org.gitshu.utils.action.ActionVariableSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * Created by Lodour on 17/5/29 23:32.
 * 向某个项目添加成员
 */
@Controller
public class ProjectMemberUpdate extends ActionVariableSupport {
    private final ProjectMemberService projectMemberService;

    @Autowired
    public ProjectMemberUpdate(ProjectMemberService projectMemberService) {
        this.projectMemberService = projectMemberService;
    }

    public String execute() {
        int projectId = Integer.valueOf(httpServletRequest.getParameter("id"));
        String op = httpServletRequest.getParameter("op");
        String usernames = httpServletRequest.getParameter("username");
        System.out.println(projectId + usernames);
        if ("add".equals(op))
            projectMemberService.addMembers(projectId, usernames.split(","));
        if ("del".equals(op))
            projectMemberService.removeMembers(projectId, usernames.split(","));
        return SUCCESS;
    }
}
