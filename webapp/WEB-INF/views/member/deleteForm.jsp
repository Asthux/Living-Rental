<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${empty sessionScope.id }">
	<script>
		location.href = 'home?formpath=login'
	</script>
</c:if>

<center>
	<form action="deleteAndCheckProc" method="post">
		<table>
			<tr>
				<td>비밀번호</td>
				<td><input type=password name='pw' style="width:250; height:35; border: 1px solid #D5D5D5;"/></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type=password name='pwOk' style="width:250; height:35; border: 1px solid #D5D5D5;"/></td>
			</tr>
			<tr>
				<td colspan=2 align='center'>
				<c:choose>
				<c:when test="${sessionScope.id eq 'admin' }">
				<input type=submit value='삭제' style="width: 180px; height:45px; background-color:black; color:white;" /> 
				</c:when>
				<c:otherwise>
				<input type=submit value='탈퇴' style="width: 180px; height:45px; background-color:black; color:white;" />
				</c:otherwise>
				</c:choose> 
				<input type=button value='취소' style="width: 180px; height:45px; background-color:gray; color:white;" onclick="location.href='${root}'" /></td>
			</tr>
		</table>
	</form>
</center>

