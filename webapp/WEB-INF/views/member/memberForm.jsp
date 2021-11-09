<%--
  Created by IntelliJ IDEA.
  User: asthu
  Date: 2021/11/09
  Time: 6:00 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container" id="common_header">
    <h1><a href="register.jsp">Register</a></h1>
    <hr>
</div>
<div class="container">
    <div class="col-lg-3"></div>
    <div class="col-lg-6">
        <div class="jumbotron" id="register_jumbo">
            <h2 style="text-align: center">Living Rental 회원가입</h2>
            <hr>
            <form action="registerService.jsp" method="post">
                <label>아이디</label>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="아이디" name="id" maxlength="15">
                </div>
                <label>비밀번호</label>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="비밀번호" name="pw" maxlength="15">
                </div>
                <label>비밀번호 확인</label>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="비밀번호 확인" name="pwConfirm" maxlength="15">
                </div>
                <label>이름</label>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="이름" name="name" maxlength="20">
                </div>
                <label>이메일</label>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="이메일" name="email" maxlength="50">
                </div>
                <label>전화번호</label>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="전화번호" name="mobile" maxlength="15">
                </div>
                <label></label>
                <input type="submit" class="btn btn-primary form-control" value="회원가입">
            </form>
            <hr>
            <label>계정이 이미 있는 경우에는 <a href="login.jsp">로그인</a>해주세요</label>
        </div>
    </div>
    <div class="col-lg-3"></div>
</div>