<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function deleteCheck(){
	if(confirm("정말 삭제하시겠습니까?")==true){
		location.replace('goodsDeleteProc?gdsNum=${goods.gdsNum}');
	}
	else{
		false;
	}
}

function modify(){
	$("#f").attr("action", "home?formpath=goodsModify");
	$("#f").submit();
}

function basket(){
	$("#f").attr("action", "basketProc");
	$("#f").submit();
}

</script>
<!-- action="home?formpath=goodsModify" -->
<center id="login_jumbo">
<form id="f" name="f" method="post" enctype="multipart/form-data">
	<input type="hidden" name="gdsNum" value="${goods.gdsNum }" />
	<input type="hidden" name="gdsName" value="${goods.gdsName}" />
	<input type="hidden" name="gdsPrice" value="${goods.gdsPrice }"/>
	<input type="hidden" name="gdsThumb" value="${goods.gdsThumb }"/>
	<input type="hidden" name="gdsImg" value="${goods.gdsImg }"/>
<c:if test="${sessionScope.id eq 'admin'}" >
	<div>
		<input type="button" value="수정" onclick="modify()">
		<input type="button" value="삭제" onclick="deleteCheck()">
	</div>
</c:if>
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
		<td><input type="button" value="장바구니 담기" onclick="basket()"></td>
		<%-- "location.href='basketProc?gdsNum=${goods.gdsNum}'" --%>
	</tr>
	<tr style="width: 650px;">
		<td colspan="2">
			<img src="${pageContext.request.contextPath}/resources/upload/${goods.gdsImg}"/>
		</td>
	</tr>
</table>
<!-- 굿즈 번호만 보내기 -->
</form>
</center>