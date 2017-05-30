package org.gitshu.project.action;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.gitshu.entity.ProjectEntity;
import org.gitshu.entity.ProjectUserEntity;
import org.gitshu.entity.UserEntity;
import org.gitshu.project.service.ProjectMemberService;
import org.gitshu.project.service.ProjectService;
import org.gitshu.utils.action.ActionVariableSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by Lodour on 17/5/29 23:32.
 * 所有项目列表
 */
@Controller
public class ProjectListAll extends ActionVariableSupport{
    private final ProjectService projectService;
    // Action所使用的数据实体
    private List<ProjectEntity> projectEntityList = new ArrayList<>();


    @Autowired
    public ProjectListAll(ProjectService projectService) {
        this.projectService = projectService;
    }

    public String execute() {
        /*
        String username = (String)httpServletRequest.getParameter("username");
        List<ProjectEntity> projectEntities = projectService.getAllProjectEntities();
        projectEntityList = new ArrayList<>();
        for(ProjectEntity projectEntity : projectEntities){
            Iterator<ProjectUserEntity> it = projectEntity.getProjectUsersById().iterator();
            while(it.hasNext()){
                String usr = it.next().getUserByUser().getUsername();
                if(usr.equals(username)){
                    projectEntityList.add(projectEntity);
                    break;
                }
            }
        }
        */
        setProjectEntityList(projectService.getAllProjectEntities());
        httpServletRequest.setAttribute("listall",getProjectEntityList());
        return SUCCESS;
    }

    public List<ProjectEntity> getProjectEntityList() {
        return projectEntityList;
    }

    public void setProjectEntityList(List<ProjectEntity> projectEntityList) {
        this.projectEntityList = projectEntityList;
    }
}
