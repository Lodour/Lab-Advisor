package org.gitshu.project.action;

import org.gitshu.entity.ProjectEntity;
import org.gitshu.entity.ProjectUserEntity;
import org.gitshu.project.service.ProjectMemberService;
import org.gitshu.project.service.ProjectService;
import org.gitshu.utils.action.ActionVariableSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.Iterator;
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
    public ProjectListJoined(ProjectMemberService projectMemberService,ProjectService projectService) {
        this.projectMemberService = projectMemberService;
        this.projectService = projectService;
    }

    public String execute() {
        String username = (String) httpServletRequest.getParameter("username");
        //List<ProjectEntity> projectEntityList = projectMemberService.getJoinedProjects(username);
        List<ProjectEntity> projectEntityList = new ArrayList<>();
        List<ProjectEntity> projectEntities = projectService.getAllProjectEntities();
        for(ProjectEntity projectEntity : projectEntities){
            System.out.println(projectEntity.getTitle() + " : " + projectEntity.getUserByCreateBy().getUsername() + " -- " + username);
            //System.out.println(projectEntity.getUserByCreateBy().getUsername().getBytes("utf-8") + "  --  " + username.getBytes("utf-8"));
            if(username.equals(projectEntity.getUserByCreateBy().getUsername()) == true){
                projectEntityList.add(projectEntity);
                continue;
            }
            Iterator<ProjectUserEntity> it = projectEntity.getProjectUsersById().iterator();
            while(it.hasNext()){
                String usr = it.next().getUserByUser().getUsername();
                if(usr.equals(username)){
                    projectEntityList.add(projectEntity);
                    break;
                }
            }
        }
        httpServletRequest.setAttribute("projects", projectEntityList);
        return SUCCESS;
    }
}
