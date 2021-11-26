<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

</script>	
<center>
<h1>${msg}</h1>
<table style="width: 650px; border: 1px solid black;">
	<tr>
		<td rowspan="4">
			<img src="${pageContext.request.contextPath}/resources/upload/${goods.gdsThumb}" style="width: 200px; height: 200px;"/>
		</td>
		<td><div>제품 명 : ${goods.gdsName}</div></td>
	</tr>
	<tr>
		<td><div>제품 가격 : ${goods.gdsPrice}</div></td>
	</tr>
	<tr>
		<td>(상담 신청 버튼)</td>
	</tr>
	<tr>
		<td><button id="basketB" onclick="location.href='basketProc?gdsNum=${goods.gdsNum}'">장바구니 담기</button></td>
		<%-- "location.href='basketProc?gdsNum=${goods.gdsNum}'" --%>
	</tr>
	<tr style="width: 650px;">
		<td colspan="2">
			<img src="${pageContext.request.contextPath}/resources/upload/${goods.gdsImg}"/>
		</td>
	</tr>
</table>
<!-- 굿즈 번호만 보내기 -->

</center>