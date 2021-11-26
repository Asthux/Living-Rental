<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/"/>

<center>
<table style="width: 650px; ">
	<thead>
	<tr>
		<th style="width: 330px; height:20px;" align="center">제 목</th>
		<th style="width: 80px; height:20px;" align="center">작성자</th>
		<th style="width: 120px; height:20px;" align="center">작성일</th>
		<th style="width: 80px; height:20px;" align="center">조회수</th>
	</tr>
	</thead>
	<tr>
		<td style="width: 330px; height:20px;" align="center"><hr/></td>
		<td style="width: 80px; height:20px;" align="center"><hr/></td>
		<td style="width: 120px; height:20px;" align="center"><hr/></td>
		<td style="width: 80px; height:20px;" align="center"><hr/></td>
	</tr>
	<c:forEach var="list" items="${boardList }">
		<tr>
			<td style="width: 330px; height:40px;" align="center">
				<div id="${list.no }" class="title"> ${list.title } </div>
			</td>
			<td style="width: 80px; height:40px;" align="center">${list.id }</td>
			<td style="width: 120px; height:40px;" align="center">${list.writeDate }</td>
			<td style="width: 80px; height:40px;" align="center">${list.hit } </td>
		</tr>
	</c:forEach>
	<tr><td colspan=5><hr/></td></tr>
</table>
</center>