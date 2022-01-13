<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${empty sessionScope.id }">
	<script>
		location.href = 'home?formpath=login'
	</script>
</c:if>


<center class="container" id="login_jumbo">
	<div class="panel panel-default">
		<div style="text-align: center" class="panel-heading"> 회원 목록 </div>
		<table class="table" style="border: 1px solid #dddddd">
			<thead>
				<tr>
					<th style="text-align: center">아이디</th>
					<th style="text-align: center">이름</th>
					<th style="text-align: center">이메일</th>
					<th style="text-align: center">구매목록</th>
				</tr>
			</thead>
			<tbody id="output">
				<c:forEach var="db" items="${list }">
					<tr>
						<td  align="center"><a
							href="userInfoProc?id=${db.id }">${db.id }</a></td>
							<td  align="center">${db.name }</td>
						<td  align="center">${db.email }</td>
						<td  align="center">${db.gender }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<br>
	<div>
		<form action="" method="post">
			<div class="col-md-5"></div>
			<div class="col-md-2">
				${page }
			</div>
			<div class="col-md-2">
				<select class="form-control" name="select">
					<option selected value="">선택</option>
					<option value="id">아이디</option>
					<option value="name">이름</option>
					<option value="email">이메일</option>
				</select>
			</div>
			<div class="col-md-3">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Search for..." name="search">
					<span class="input-group-btn">
                    <button class="btn btn-default" type="submit">Search</button>
                </span>
				</div>
				<br>
				<br>
			</div>
		</form>
	</div>
</center>
