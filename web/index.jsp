<%--
  Created by IntelliJ IDEA.
  User: Lodour
  Date: 17/5/27
  Time: 00:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="org.gitshu.entity.ProjectEntity" %>
<%@ page import="java.util.List" %>
<%@ page import="static com.sun.xml.internal.fastinfoset.alphabet.BuiltInRestrictedAlphabets.table" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:include value="/components/banner.jsp"/>

<s:action name="projectListAll" namespace="/project"/>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Git SHU</title>
</head>

<body>
<br><br><br><br>

<div style="position: absolute; left:10%; width: 80%;">
    <h3>实验室项目展示</h3>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>#</th>
            <th>项目名</th>
            <th>项目简介</th>
            <th>创建者</th>
            <th>创建时间</th>
        </tr>
        </thead>
        <tbody>
        <% for (ProjectEntity project : (List<ProjectEntity>) request.getAttribute("projects")) { %>
        <tr>
            <td><%=project.getId()%>
            </td>
            <td><%=project.getTitle()%>
            </td>
            <td><%=project.getInfo()%>
            </td>
            <td><%=project.getUserByCreateBy().getUsername()%>
            </td>
            <td><%=project.getCreateTime()%>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
