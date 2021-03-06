<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${empty sessionScope.id }">
	<script>
		location.href = 'home?formpath=login'
	</script>
</c:if>
<style>
table{border-collapse: collapse;}
tr {border: 1px solid #D5D5D5;}
</style>
<div class="container">
	<div class="col-lg-3"></div>
	<div class="col-lg-6">
		<div class="jumbotron" id="login_jumbo">
			<h2 style="text-align: center">회원 정보 수정</h2>
			<hr>
			<form action="modifyCheckProc" method="post">
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호" name="pw" maxlength="15">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호 확인" name="pwOk" maxlength="15">
				</div>
				<div class="text-center">
					<input type="submit" class="btn btn-primary" value="확인">
					<input type=button value='취소' class="btn btn-primary"  onclick="location.href='${root}home?formpath=goodsListProc'" />
				</div>
			</form>
		</div>
	</div>
	<div class="col-lg-3"></div>
</div>
</center>
