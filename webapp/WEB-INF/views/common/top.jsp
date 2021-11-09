<%--
  Created by IntelliJ IDEA.
  User: asthu
  Date: 2021/11/08
  Time: 4:06 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var="root" value="/" />
<div class="navbar navbar-default">
    <div class="container">
        <ul class="nav navbar-nav navbar-left">
            <li><a href="board">고객센터</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <c:choose>
                <c:when test="${empty sessionScope.id }">
                    <li><a href="${root}home?formpath=login ">로그인</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="${root}logout ">로그아웃</a></li>
                    <li><a href="${root}myPage">마이페이지</a></li>
                </c:otherwise>
            </c:choose>
            <li><a href="${root}home?formpath=member">회원가입</a></li>
            <li><a href="/cart">장바구니</a></li>
        </ul>
    </div>
</div>
<div>
    <a href="${root}"><img src="${pageContext.request.contextPath}/resources/images/brandImg.png"></a>
</div>

</div>





