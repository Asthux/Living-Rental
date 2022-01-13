<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${empty sessionScope.id }">
	<script>
		location.href = 'home?formpath=login'
	</script>
</c:if>
<div class="container">
	<div class="col-lg-3"></div>
	<div class="col-lg-6">
		<div class="jumbotron" id="login_jumbo">
			<h2 style="text-align: center">Living Rental 탈퇴</h2>
			<hr>
			<form action="deleteAndCheckProc" method="post">
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호" name="pw" maxlength="15">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호 확인" name="pwOk" maxlength="15">
				</div>
				<div class="text-center">
					<c:choose>
						<c:when test="${sessionScope.id eq 'admin' }">
							<input type="submit" class="btn btn-primary" value="삭제">
						</c:when>
						<c:otherwise>
							<input type="submit" class="btn btn-primary" value="탈퇴">
						</c:otherwise>
					</c:choose>
					<input type=button value='취소' class="btn btn-primary"  onclick="location.href='${root}home?formpath=goodsListProc'" />
				</div>
			</form>
		</div>
	</div>
	<div class="col-lg-3"></div>
</div>


