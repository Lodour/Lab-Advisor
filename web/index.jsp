<%--
  Created by IntelliJ IDEA.
  User: Lodour
  Date: 17/5/27
  Time: 00:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>SSH测试</title>
</head>
<body>

<p>当前用户: ${sessionScope.get("username")}</p>

<ul>
    <li><a href="login.jsp">登陆</a></li>
    <li><a href="register.jsp">注册</a></li>
    <li><a href="logoutAction.action">注销</a></li>
</ul>
<s:action name="listUserAction" executeResult="false" namespace="/"/>

${tt[0].getUsername()}
${tt[0].getCreateTime()}

</html>
