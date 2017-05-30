package org.gitshu.project.action;

import org.gitshu.entity.ProjectEntity;
import org.gitshu.project.service.ProjectMemberService;
import org.gitshu.utils.action.ActionVariableSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * Created by Lodour on 17/5/29 23:32.
 * 从某个项目删除成员
 */
@Controller
public class ProjectMemberDelete extends ActionVariableSupport {
    private final ProjectMemberService projectMemberService;
    private String usergroup;
    @Autowired
    public ProjectMemberDelete(ProjectMemberService projectMemberService) {
        this.projectMemberService = projectMemberService;
    }

    public String getUsergroup() {
        return usergroup;
    }

    public void setUsergroup(String usergroup) {
        this.usergroup = usergroup;
    }

    public String execute() {
        int proId = Integer.valueOf(httpServletRequest.getParameter("id"));
        String [] group = this.getUsergroup().split(", ");
        projectMemberService.addMembers(proId,group);
        return SUCCESS;
    }
}
