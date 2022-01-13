<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${empty sessionScope.id }">
	<script>location.href='home?formpath=login'</script>
</c:if>
<div class="container">
	<div class="col-lg-3"></div>
	<div class="col-lg-6">
		<div class="jumbotron" id="login_jumbo">
			<h2 style="text-align: center">게시글 삭제</h2>
			<hr>
			<form action="${proc }" method="post">
				<input type="hidden" name="no" value="${no }"/>
				<input type="hidden" name="checks" value="${checks[0] }"/>
				<input type="hidden" name="checks" value="${checks[1] }"/>
				<input type="hidden" name="checks" value="${checks[2] }"/>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호" name="pw" maxlength="15">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호 확인" name="pwOk" maxlength="15">
				</div>
				<div class="text-center">
					<input type="submit" class="btn btn-primary" value="확인">
					<input type=button value='취소' class="btn btn-primary"  onclick="location.href='${root}boardProc'" />
				</div>
			</form>
		</div>
	</div>
	<div class="col-lg-3"></div>
</div>

