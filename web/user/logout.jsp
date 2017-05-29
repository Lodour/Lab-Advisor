<%--
  Created by IntelliJ IDEA.
  User: Lodour
  Date: 17/5/28
  Time: 19:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>登录</title>
</head>
<body>
<s:form action="loginAction" method="POST" namespace="/user">
    <s:textfield name="model.username" label="用户名"/>
    <s:password name="model.password" label="密码"/>
    <s:submit value="登录"/>
</s:form>
</body>
</html>
