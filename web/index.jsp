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

<h2>Add User</h2>
<s:form action="createUserAction" method="POST" namespace="/">
    <s:textfield name="model.username" label="用户名"/>
    <s:password name="model.password" label="密码"/>
    <s:textfield name="model.realName" label="真实姓名"/>
    <s:submit value="注册"/>
</s:form>

<h2>All Users</h2>
<s:if test="userEntityList.size() > 0">
    <table border="1px" cellpadding="8px">
        <tr>
            <td>ID</td>
            <td>username</td>
            <td>realName</td>
            <td>password</td>
        </tr>
        <s:iterator value="userEntityList" status="userStatus">
            <tr>
                <td><s:property value="id"/></td>
                <td><s:property value="username"/></td>
                <td><s:property value="password"/></td>
                <td><s:property value="realName"/></td>
            </tr>
        </s:iterator>
    </table>
</s:if>

</body>
</html>
