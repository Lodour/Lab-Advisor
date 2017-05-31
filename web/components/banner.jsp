<%@ page import="org.gitshu.entity.UserEntity" %><%--
  Created by IntelliJ IDEA.
  User: Pealing
  Date: 2017/5/28
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:action name="userEntitySet" namespace="/user"/>
<%
    String path = request.getContextPath();
    String basePath = String.format("%s://%s:%d%s/", request.getScheme(), request.getServerName(), request.getServerPort(), path);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8" content="text/html">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <script src="<%=path%>/static/js/jquery-1.10.2.min.js"></script>

    <!-- Bootstrap -->
    <link href="<%=path%>/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%=path%>/static/js/bootstrap.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>

<%
    String username = (String) session.getAttribute("username");
    UserEntity user = (UserEntity) request.getAttribute("userEntity");
%>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="/index.jsp">Lab Advisor - 上海大学实验室项目管理系统</a>
        <ul class="nav navbar-nav navbar-right">
            <% if (username == null || "".equals(username)) { %>
            <li><a href="<%=path%>/user/login.jsp">登录</a></li>
            <li><a href="<%=path%>/user/register.jsp">注册</a></li>
            <% } else { %>
            <li><a href="<%=path%>/user/profiles.jsp?username=<%=username%>">返回主页</a></li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false"><span class="glyphicon glyphicon-plus"></span><span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="<%=path%>/user/profiles-edit.jsp">修改个人信息</a></li>
                    <li><a href="<%=path%>/user/password-reset.jsp">修改密码</a></li>
                    <li role="separator" class="divider"></li>
                    <li><a href="<%=path%>/mail/sendMail.jsp">站内信</a></li>
                    <% if (user != null && user.getUserType() <= 1) { %>
                    <li role="separator" class="divider"></li>
                    <li><a href="<%=path%>/project/create.jsp">后台管理</a></li>
                    <% } %>
                </ul>
            </li>
            <li>
                <a href="<s:url namespace="/user" action="logout"/>">注销</a>
            </li>
            <% } %>
        </ul>
    </div>
</nav>
</body>
</html>
