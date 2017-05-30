<%--
  Created by IntelliJ IDEA.
  User: xyfra
  Date: 2017/5/30
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Project Create</title>
</head>
<body>
<h1>Create a new Repository</h1>
<p>A repository contains all the files for your project, including the revision history.</p>
<form action="<s:url namespace="/project" action="projectCreate"/>" method="post">
    <label>Repository name</label><input name="title"/><br/>
<label>Description(optional)</label><input name="info"/><br/>
    <button type="submit">Submit</button>
</form>


</body>
</html>
