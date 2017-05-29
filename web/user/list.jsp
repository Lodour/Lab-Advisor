<%--
  Created by IntelliJ IDEA.
  User: Lodour
  Date: 17/5/27
  Time: 00:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<s:if test="userEntityList.size() > 0">
    <table border="1px" cellpadding="8px">
        <tr>
            <td>ID</td>
            <td>username</td>
            <td>realName</td>
            <td>password</td>
            <td>createTime</td>
            <td>lastLogin</td>
        </tr>
        <s:iterator value="userEntityList">
            <tr>
                <td><s:property value="id"/></td>
                <td><s:property value="username"/></td>
                <td><s:property value="password"/></td>
                <td><s:property value="realName"/></td>
                <td><s:property value="createTime"/></td>
                <td><s:property value="lastLogin"/></td>
            </tr>
        </s:iterator>
    </table>
</s:if>
