<%--
  Created by IntelliJ IDEA.
  User: Pealing
  Date: 2017/5/28
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.gitshu.entity.ProjectEntity" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:action name="userEntitySet" namespace="/user"/>
<s:action name="projectListJoined" namespace="/project"/>
<jsp:useBean id="userEntity" scope="request" type="org.gitshu.entity.UserEntity"/>
<s:include value="/components/banner.jsp"/>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>GitSHU 个人信息</title>
</head>
<body>
<div>
    <div id="ueserinfo" style="position: absolute;left: 10%;top: 20%;width: 20%;">
        <div style="width: 100%;">
            <img src="${pageContext.request.contextPath}/static/image/<%=userEntity.getId() % 5%>.png"
                 style="width: 200px;height: 200px;"/>
        </div>
        <div>
            <h3 id=profile_username>${userEntity.realName}</h3>
            <h6><span
                    class="label label-<%=new String[]{"danger", "warning", "primary", "info"}[userEntity.getUserType()]%>"><%=new String[]{"管理员", "教师", "学生", "访客"}[userEntity.getUserType()]%></span>
            </h6>
            <div>
                <span class="glyphicon glyphicon-phone"></span> ${userEntity.mobile}<br>
                <span class="glyphicon glyphicon-envelope" style="margin-top: 3%;"></span> ${userEntity.email}
            </div>
        </div>
    </div>
</div>
<div id="profile_list" style="position: absolute;right: 10%;top: 20%; width: 55%;">
    <h2>${userEntity.username}参与开发的项目</h2>
    <%
        List<ProjectEntity> projects = (List<ProjectEntity>) request.getAttribute("projects");
        if (projects == null || projects.size() == 0)
            out.println("<h3>您当前还没有项目！</h3>");
        else {
            for (int i = 0; i < projects.size() - 1; i += 2) {
    %>
    <div class="row" style="margin-top: 3%;">
        <div class="col-md-5 list-group-item" style=" margin-left: 3%;">
            <div style="margin:3% auto;">
                <a href="${pageContext.request.contextPath}/workflow/workflowView.jsp?projectId=<%=projects.get(i).getId()%>"
                   style="margin-top: 10%;">
                    <%=projects.get(i).getTitle()%>
                </a>
                <p style="color: #777;font-size: 80%;">
                    <%=projects.get(i).getInfo()%>
                </p>
                <p style="color: #333;font-size: 80%;">
                    <%=new Date(projects.get(i).getCreateTime().getTime())%>
                </p>
            </div>
        </div>
        <div class="col-md-5 list-group-item" style="margin-left: 3%;">
            <div style="margin:3% auto;">
                <a href="${pageContext.request.contextPath}/workflow/workflowView.jsp?projectId=<%=projects.get(i + 1).getId()%>"
                   style="margin-top:10%;">
                    <%=projects.get(i + 1).getTitle()%>
                </a>
                <p style="color: #777;font-size: 80%;">
                    <%=projects.get(i + 1).getInfo()%>
                </p>
                <p style="color: #333;font-size: 80%;">
                    <%=new Date(projects.get(i + 1).getCreateTime().getTime())%>
                </p>
            </div>
        </div>
    </div>
    <%
        }
        if (projects.size() % 2 != 0) {
    %>
    <div class="row" style="margin-top: 3%;">
        <div class="col-md-5 list-group-item" style="margin-left: 3%;">
            <div style="margin:3% auto;">
                <a href="${pageContext.request.contextPath}/workflow/workflowView.jsp?projectId="<%=projects.get(projects.size() - 1).getId()%>
                   style="margin-top:10%;">
                    <%=projects.get(projects.size() - 1).getTitle()%>
                </a>
                <p style="color: #777; font-size:80%;">
                    <%=projects.get(projects.size() - 1).getInfo()%>
                </p>
                <p style="color: #333; font-size:80%;">
                    <%=new Date(projects.get(projects.size() - 1).getCreateTime().getTime())%>
                </p>
            </div>
        </div>
    </div>
    <%
            }
        }
    %>


</div>
</body>
</html>
