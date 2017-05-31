<%@ page import="org.gitshu.entity.UserEntity" %><%--
  Created by IntelliJ IDEA.
  User: Pealing
  Date: 2017/5/31
  Time: 9:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:action name="userEntitySet" namespace="/user"/>
<%
    String username = (String) session.getAttribute("username");
    UserEntity user = (UserEntity) request.getAttribute("userEntity");
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.min.js"></script>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/npm.js"></script>

    <!--表单验证-->
    <link href="${pageContext.request.contextPath}/static/css/validationEngine.jquery.css" rel="stylesheet"/>
    <script src="${pageContext.request.contextPath}/static/js/jquery.validationEngine-zh_CN.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.validationEngine.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/main_validation.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>GitSHU Menu</title>
</head>
<body>
<div id="Menu" class="list-group" style="position: absolute; left:10%;top: 15%;width: 20%;">
    <div class="panel panel-default">
        <div class="panel-heading">GitSHU</div>
        <div class="list-group" style="margin: 0 auto;">
            <a href="${pageContext.request.contextPath}/project/create.jsp" class="list-group-item">增加项目</a>
            <a href="${pageContext.request.contextPath}/project/setting.jsp" class="list-group-item">项目设置</a>
            <a href="${pageContext.request.contextPath}/project/member.jsp" class="list-group-item">成员设置</a>
            <% if (user.getUserType() == 0) { %>
            <a href="${pageContext.request.contextPath}/project/user.jsp" class="list-group-item">系统用户管理</a>
            <% } %>
        </div>
    </div>
</div>

</body>
</html>
