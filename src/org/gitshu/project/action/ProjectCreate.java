package org.gitshu.project.action;

import com.opensymphony.xwork2.ModelDriven;
import org.gitshu.entity.ProjectEntity;
import org.gitshu.entity.ProjectUserEntity;
import org.gitshu.project.service.ProjectMemberService;
import org.gitshu.project.service.ProjectService;
import org.gitshu.utils.action.ActionVariableSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by Lodour on 17/5/29 23:32.
 * 创建一个新项目
 */
@Controller
public class ProjectCreate extends ActionVariableSupport implements ModelDriven <ProjectEntity> {
    private final ProjectService projectService;
    private final ProjectMemberService projectMemberService;
    private ProjectEntity projectEntity = new ProjectEntity();

    @Autowired
    public ProjectCreate(ProjectService projectService,ProjectMemberService projectMemberService) {
        this.projectService = projectService;
        this.projectMemberService = projectMemberService;

    }

    @Override
    public ProjectEntity getModel() {
        return projectEntity;
    }

    public String execute() {
        String username = (String) httpSession.get("username");
        try{
            projectService.create(username,projectEntity);
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
        }catch (Exception e){
            e.printStackTrace();
            return ERROR;
        }
        return SUCCESS;
    }
}
