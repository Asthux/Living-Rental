<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${empty sessionScope.id }">
	<script>location.href='home?formpath=login'</script>
</c:if>
<c:url var="root" value="/" />
<style>
table{border-collapse: collapse;}
tr {border: 1px solid #D5D5D5;}
lable{color: red;}
</style>
<center>
	<h2>회원 정보</h2>
		<table>
			<tr>
				<td align='left' height=60>이름</td>
				<td align="center">${user.name }</td>
			</tr>
			<tr>
				<td align='left' height=60>생년월일</td>
				<td align="center">${user.birth }</td>
			</tr>
			<tr>
				<td align='left' height=60>성별</td>
			<c:choose>
				<c:when test="${user.gender ==  'm'}">
					<td style="width: 250px; height:40px;" align="center">남</td>
				</c:when>
				<c:when test="${user.gender == 'w'}">
					<td style="width: 250px; height:40px;" align="center">여</td>
				</c:when>
				<c:otherwise>
					<td style="width: 250px; height:40px;" align="center">선택안함</td>
				</c:otherwise>
			</c:choose>
			<tr>
				<td align='left' height=60>아이디</td>
				<td align="center">${user.id }</td>
			</tr>
			
			<tr>
				<td align='left' height=60>연락처</td>
				<td align="center">${user.phone }</td>
			</tr>
			<tr>
				<td align='left' height=60>이메일</td>
				<td align="center">${user.email }</td>
				
			</tr>
			<tr>
				<td align='left' height=60 >주소</td>
				<td style="width: 250px; height:40px;" align="center">${user.addr1} ${user.addr2 }</td>	
			</tr>	
			<tr>
				<td colspan=2 style="height:10px;"></td>
			</tr>
			<tr>		
			<td align='left' height=60>구매목록</td>
			<td></td>
			<tr>
		<td colspan=2 align="center">
			<input type=button style="width: 60px; background-color:black; color:white;" value='수정' onclick="location.href='${root}home?formpath=modifyCheck&modifyId=${user.id }'"/>
			<c:choose>
			<c:when test="${sessionScope.id eq'admin' }">
			<input type=button style="width: 60px; background-color:black; color:white;" value='삭제' onclick="location.href='${root}home?formpath=memberDelete&modifyId=${user.id }'"/>
			</c:when>
			<c:otherwise>
			<input type=button style="width: 60px; background-color:black; color:white;" value='탈퇴' onclick="location.href='${root}home?formpath=memberDelete&modifyId=${user.id }'"/>
			</c:otherwise>
			</c:choose>
			<c:choose>
			<c:when test="${sessionScope.id eq 'admin' }">
				<input type=button style="width: 60px; background-color:black; color:white;" value='목록' onclick="location.href='memberListProc'"/>
			</c:when>
			<c:otherwise>
				<input type=button style="width: 60px; background-color:black; color:white;" value='취소' onclick="location.href='${root}'"/>
				</c:otherwise>
				</c:choose>
		</td>
	</tr>

			
		</table>
	
</center>>