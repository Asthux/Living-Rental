<%--
  Created by IntelliJ IDEA.
  User: asthu
  Date: 2021/11/09
  Time: 6:00 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container">
    <div class="col-lg-3"></div>
    <div class="col-lg-6">
        <div class="jumbotron" id="login_jumbo">
            <h2 style="text-align: center">Living Rental 로그인</h2>
            <hr>
            <form action="loginProc" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="아이디" name="id" maxlength="15">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="비밀번호" name="pw" maxlength="15">
                </div>
                <input type="submit" class="btn btn-primary form-control" value="로그인">
            </form>
            <hr>
            <label>회원 가입은 <a href="http://localhost:8085/living_rental/home?formpath=member">여기</a>에서 할 수 있습니다.</label>
        </div>
    </div>
    <div class="col-lg-3"></div>
</div>
