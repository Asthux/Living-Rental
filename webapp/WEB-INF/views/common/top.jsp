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
            <li><a href="${root}boardProc">고객센터</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <c:choose>
                <c:when test="${empty sessionScope.id }">
                    <li><a href="${root}home?formpath=login ">로그인</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="${root}logout ">로그아웃</a></li>
                    <li><a href="${root}memberListProc">회원목록</a></li>
                    <li><a href="${root}home?formpath=basketListProc">장바구니</a></li>
                </c:otherwise>
            </c:choose>
            <li><a href="${root}home?formpath=member">회원가입</a></li>
        </ul>
    </div>
</div>
<div class="jumbotron" id="homeContainer">
    <div class="text-center">
        <a href="${root}"><img src="${pageContext.request.contextPath}/resources/images/clearfix.png"></a>
    </div>
</div>
<div class="navbar navbar-default" id="navbar-bottom">
    <div class="container" id="nav-navmenu">
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="#">티비</a></li>
                <li><a href="#">냉장고</a></li>
                <li><a href="#">세탁기</a></li>
                <li><a href="#">공기청정기</a></li>
                <li><a href="#">에어컨</a></li>
                <li><a href="#">의류청정기</a></li>
                <li><a href="#">안마의자</a></li>
                <li><a href="#">청소기</a></li>
            </ul>
        </div>
    </div>
</div>
</div>





