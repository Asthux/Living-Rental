<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${empty sessionScope.id }">
	<script>
		location.href = 'home?formpath=login'
	</script>
</c:if>


<center>
<h1>회원 목록</h1>
	<table style="width: 500px;">
		<thead>
			<tr>
				<th style="width: 100px; height: 20px;" align="center">아이디</th>
				<th style="width: 100px; height: 20px;" align="center">이름</th>
				<th style="width: 200px; height: 20px;" align="center">이메일</th>
				<th style="width: 100px; height: 20px;" align="center">구매목록</th>
			</tr>
		</thead>
		<tr>
			<td colspan=5><hr /></td>

		</tr>
		<tbody id="output">
			<c:forEach var="db" items="${list }">
				<tr>
					<td style="width: 100px; height: 40px;" align="center"><a
						href="userInfoProc?id=${db.id }">${db.id }</a></td>
						<td style="width: 100px; height: 40px;" align="center">${db.name }</td>
					<td style="width: 200px; height: 40px;" align="center">${db.email }</td>
					<td style="width: 100px; height: 40px;" align="center">${db.gender }</td>
				</tr>
			</c:forEach>
		</tbody>
		<tr>
			<td colspan=5><hr /></td>
		</tr>
	</table>
	
	${page }
	
	<form action="" method="post">
		<table>
			<tr>
				<td>
					<select name="select">
						<option value="">전체</option>
						<option value="id">아이디</option>
						<option value="name">이름</option>
						<option value="email">이메일</option>
					</select> 
					<input type=text name='search' /> 
					<input type=submit	name='searchBtn' value='검색' style="width: 80px;" />
				</td>
			</tr>
		</table>
	</form>
</center>
