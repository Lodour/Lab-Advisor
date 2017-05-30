<%@ page import="org.gitshu.entity.UserEntity" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="org.gitshu.entity.ProjectUserEntity" %>
<%@ page import="org.gitshu.entity.ProjectEntity" %>
<%--
  Created by IntelliJ IDEA.
  User: xyfra
  Date: 2017/5/30
  Time: 18:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:action name="detail" namespace="/project"/>
<!--jsp:useBean id="project" scope="page" class="org.gitshu.entity.ProjectEntity" -->
<html>
<head>
    <title>Detail</title>
</head>
<body>
    <%
        project = (ProjectEntity)request.getAttribute("project");
        out.println("<h1>" + project.getTitle() + "</h1>");
        out.println("<h3>" + project.getCreateTime()+ "</h3>");
        out.println("<h3>创建者："+ project.getUserByCreateBy().getUsername() + "</h3>");
        out.println("<label>" + project.getInfo() + "</label>");
        Iterator<ProjectUserEntity> it = project.getProjectUsersById().iterator();
        out.println("<label>参与的人员有：</label>");
        out.println("<label>");
        while(it.hasNext()){
            out.println(it.next().getUserByUser().getUsername() + " &nbsp;");
        }
        out.println("</label>");
    %>




</body>
</html>
