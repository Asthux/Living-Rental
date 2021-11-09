<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: asthu
  Date: 2021/11/08
  Time: 3:54 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 부트스트랩 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">

    <title>Living Rental</title>
</head>
<body>
<div class="wrap">
    <div>
        <%@ include file="common/top.jsp" %>
    </div>
    <div>
        <c:import url="/${formpath }" />
    </div>
    <div>
        <%@ include file="common/footer.jsp" %>
    </div>
</div>
<script src="<c:url value="/resources/js/bootstrap.js" />"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</body>
</html>
