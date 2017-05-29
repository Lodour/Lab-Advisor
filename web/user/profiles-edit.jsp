<%--
  Created by IntelliJ IDEA.
  User: Pealing
  Date: 2017/5/28
  Time: 22:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>修改个人信息</title>
</head>
<body>
<jsp:include page="/components/banner.jsp"/>
<jsp:include page="/components/menu_left.jsp"/>
<div style="position: absolute;left: 35%;top: 15%;width: 53%;">
    <h1>个人信息</h1>
    <h3>
        <small>———————————————————————————————————————————</small>
    </h3>
    <form action="<s:url namespace="/user" action=""/>" method="post">
        <div class="form-group">
            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
            <label>Username</label>
            <input name="" type="email" class="form-control" id="perinfo_username" placeholder="">
        </div>
        <div class="form-group">
            <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
            <label>Realname</label>
            <label class="form-control" id="perinfo_realname" placeholder="Realname">cpx</label>
        </div>
        <div class="form-group">
            <span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
            <label>Gender:</label>
            <div class="radio">
                <label>
                    <input type="radio" name="optionsRadios" id="optionsRadios1" value="man">男
                </label>
                <label style="margin-left: 10px;">
                    <input type="radio" name="optionsRadios" id="optionsRadios2" value="woman">女
                </label>
                <label style="margin-left: 10px;">
                    <input type="radio" name="optionsRadios" id="optionsRadios3" value="sicrity">保密
                </label>
            </div>
        </div>
        <div class="form-group">
            <span class="glyphicon glyphicon-phone-alt" aria-hidden="true"></span>
            <label>Phone:</label>
            <input name="mobile" type="text" class="form-control" id="signup_phonr" placeholder="">
        </div>
        <div class="form-group">
            <span class="glyphicon glyphicon-briefcase" aria-hidden="true"></span>
            <label>E-mail:</label>
            <input name="email" type="email" class="form-control" id="exampleInputEmail1" placeholder="">
        </div>
        <div class="form-group">
            <span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
            <label>Introduction</label>
            <textarea name="info" class="form-control" rows="3"></textarea>
        </div>
        <button type="submit" class="btn btn-info">Update</button>
    </form>
</div>
</body>
</html>
