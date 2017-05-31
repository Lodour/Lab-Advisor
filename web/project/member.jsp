<%@ page import="org.gitshu.entity.ProjectEntity" %>
<%@ page import="org.gitshu.entity.UserEntity" %>
<%@ page import="java.util.List" %>
<%--
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
<s:action name="projectMembers" namespace="/project"/>
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
<%
    String op = request.getParameter("op");
%>
<div style="position: absolute;left: 35%;top: 15%;width: 53%;">
    <h1>项目成员管理 - <%=op == null ? "选择项目" : op.equals("add") ? "添加" : "删除"%>
    </h1>
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
                function edit(id, op) {
                    window.location.href = '/project/member.jsp?id=' + id + '&op=' + op;
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
                        <button type="button" class="btn btn-success" onclick="edit(<%=p.getId()%>, 'add')">添加</button>
                        <button type="button" class="btn btn-danger" onclick="edit(<%=p.getId()%>, 'del')">删除</button>
                    </div>
                </td>
            </tr>
            <% } %>
        </table>
    </div>
    <% } else { %>
    <form action="<s:url namespace="/project" action="memberUpdate"/>" method="post">
        <input type="hidden" name="op" value="<%=op%>"/>
        <input type="hidden" name="id" value="<%=project.getId()%>"/>
        <div class="form-group">
            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
            <label>项目ID</label><br>
            <label class="form-control"
                   id="proj_id"><%=project == null ? ' ' : project.getId()%>
            </label>
        </div>
        <div class="form-group">
            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
            <label>项目名</label><br>
            <label class="form-control"
                   id="proj_titlee"><%=project == null ? ' ' : project.getTitle()%>
            </label>
        </div>
        <div class="form-group">
            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
            <label>当前成员</label><br>
            <table class="table table-condensed table-bordered">
                <tr>
                    <th>ID</th>
                    <th>用户名</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>用户类型</th>
                </tr>
                <%
                    List<UserEntity> userEntities = (List<UserEntity>) session.getAttribute("members");
                    if (userEntities != null) {
                        for (UserEntity u : userEntities) {
                %>
                <tr>
                    <td><%=u.getId()%>
                    </td>
                    <td><%=u.getUsername()%>
                    </td>
                    <td><%=u.getRealName()%>
                    </td>
                    <td><%=new String[]{"女", "男", "保密"}[u.getGender()]%>
                    </td>
                    <td><%=new String[]{"管理员", "教师", "学生", "访客"}[u.getUserType()]%>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
            </table>
        </div>
        <div class="form-group">
            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
            <label>用户名 (多个用户名请用英文逗号隔开)</label><br>
            <input name="username" type="text" placeholder="请输入用户名..." class="form-control"/>
        </div>

        <button type="submit" class="btn btn-info">Update</button>
    </form>
    <% } %>
</div>
</body>
</html>
