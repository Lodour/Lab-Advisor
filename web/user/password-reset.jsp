<%--
  Created by IntelliJ IDEA.
  User: Pealing
  Date: 2017/5/28
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Insert title here</title>
</head>
<body>
<jsp:include page="/components/banner.jsp"/>
<jsp:include page="/components/menu_left.jsp"/>
<div style="position: absolute;left: 35%;top: 15%;width: 53%;">
    <h1>修改密码</h1>
    <h3>
        <small>———————————————————————————————————————————</small>
    </h3>
    <form id="changepwd_form">
        <div class="form-group">
            <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
            <label>Old password</label>
            <label type="password" class="form-control validate[required]" id="old_pwd" placeholder=""></label>
        </div>
        <div class="form-group">
            <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
            <label>New password</label>
            <label type="password" class="form-control validate[required]" id="new_pwd" placeholder=""></label>
        </div>
        <div class="form-group">
            <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
            <label>Confirm new password</label>
            <label type="password" class="form-control validate[required,equals[new_pwd]]" id="conf_new_pwd"
                   placeholder=""></label>
        </div>
        <button type="submit" class="btn btn-info">Update password</button>
    </form>
</div>

</body>
</html>
