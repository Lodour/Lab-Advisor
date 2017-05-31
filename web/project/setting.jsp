<%@ page import="org.gitshu.entity.ProjectEntity" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Pealing
  Date: 2017/5/28
  Time: 22:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="jap" uri="/struts-tags" %>
<s:action name="userEntitySet" namespace="/user"/>
<s:action name="projectListCreated" namespace="/project"/>
<s:action name="detail" namespace="/project"/>
<%
    List<ProjectEntity> projects = (List<ProjectEntity>) request.getAttribute("projects");
    ProjectEntity project = (ProjectEntity) request.getAttribute("project");
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>

    <title>GitSHU 修改个人信息</title>
</head>
<body>
<jap:include value="/components/banner.jsp"/>
<jap:include value="/components/project_menu_left.jsp"/>
<div style="position: absolute;left: 35%;top: 15%;width: 53%;">
    <h1>项目管理</h1>
    <h3>
        <small>———————————————————————————————————————————</small>
    </h3>
    <% if (request.getParameter("id") == null) { %>
    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading">我创建的项目列表</div>
        <!-- Table -->
        <table class="table">
            <tr>
                <th>ID</th>
                <th>项目名</th>
                <th>项目简介</th>
                <th>创建时间</th>
                <th>操作</th>
            </tr>
            <script>
                function edit(id) {
                    window.location.href = '/project/setting.jsp?id=' + id;
                }
            </script>
            <% for (ProjectEntity p : projects) { %>
            <tr>
                <td><%=p.getId()%>
                </td>
                <td><%=p.getTitle()%>
                </td>
                <td><%=p.getInfo()%>
                </td>
                <td><%=p.getCreateTime()%>
                </td>
                <td>
                    <div class="btn-group" role="group" aria-label="...">
                        <button type="button" class="btn btn-success" onclick="edit(<%=p.getId()%>)">修改</button>
                        <button type="button" class="btn btn-danger">删除</button>
                    </div>
                </td>
            </tr>
            <% } %>
        </table>
    </div>
    <% } else { %>
    <form action="<s:url namespace="/project" action="projectUpdate"/>" method="post">
        <input type="hidden" name="id" value="<%=project == null ? 0 : project.getId()%>"/>
        <div class="form-group">
            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
            <label>项目名</label><br>
            <label class="form-control"
                   id="proj_titlee"><%=project == null ? ' ' : project.getTitle()%>
            </label>
        </div>
        <div class="form-group">
            <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
            <label>创建者</label>
            <label class="form-control"
                   id="proj_admin"><%=project == null ? ' ' : project.getUserByCreateBy().getUsername()%>
            </label>
        </div>
        <div class="form-group">
            <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
            <label>项目标题</label>
            <input type="text" class="form-control" id="proj_title" name="title"
                   placeholder="<%=project == null ? ' ' : project.getTitle()%>">
            </input>
        </div>
        <div class="form-group">
            <span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
            <label>项目介绍</label>
            <textarea name="info" class="form-control" rows="3" placeholder="<%=project.getInfo()%>"></textarea>
        </div>
        <button type="submit" class="btn btn-info">Update</button>
    </form>
    <% } %>
</div>
</body>
</html>
