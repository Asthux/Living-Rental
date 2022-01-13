<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="root" value="/" />
<c:if test="${empty sessionScope.id }">
	<script>
		location.href = 'home?formpath=login'
	</script>
</c:if>


<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function daumPost() {
		new daum.Postcode({
			onComplete : function(data) {
				var addr = "";
				if (data.userSelectedType === "R") {
					addr = data.roadAddress;
				} else {
					addr = data.jibunAddress;
				}
				document.getElementById("zipcode").value = data.zonecode;
				document.getElementById("addr1").value = addr;
				document.getElementById("addr2").focus();
			}
		}).open();
	}
</script>

<style>
table{border-collapse: collapse;}
tr {border: 1px solid #D5D5D5;}
lable{color: red;}
</style>
<div class="container">
	<div class="col-lg-3"></div>
	<div class="col-lg-6">
		<div class="jumbotron" id="register_jumbo">
			<h2 style="text-align: center">Living Rental 회원 정보 수정</h2>
			<hr>
			<div style="text-align: center">
				<h3>
					<span class="label label-info" id="msg">${msg}</span>
				</h3>
			</div>
			<form action="memberModifyProc" method="post">
				<label>아이디</label>
				<div class="form-group">
					<input type="text" class="form-control" value='${sessionScope.modifyId }' readonly="readonly" name="id" id="id" maxlength="15">
				</div>
				<label>비밀번호</label>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호" name="pw" maxlength="15">
				</div>
				<label>비밀번호 확인</label>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호 확인" name="pwConfirm" maxlength="15">
				</div>
				<label>이름</label>
				<div class="form-group">
					<input type="text" class="form-control" value="${modifyAll.name }" name="name" maxlength="20" readonly="readonly">
				</div>
				<label>생년월일</label>
				<div class="form-group">
					<input type="text" class="form-control"  value='${modifyAll.birth }' name="birth" maxlength="20">
				</div>
				<label>이메일</label>
				<div class="form-group">
					<input type="text" class="form-control" value="${modifyAll.email }" name="email" id="email" maxlength="50">
				</div>
				<label>전화번호</label>
				<div class="form-group">
					<input type="text" class="form-control" value='${modifyAll.phone }' name="phone" maxlength="15" readonly="readonly">
				</div>
				<label>주소</label>
				<div class="form-group">
					<div class="input-group">
						<input type="text" class="form-control" name="zipcode" id="zipcode" value="${modifyAll.zipcode }" maxlength="15" readonly="readonly">
						<span class="input-group-btn">
							<button type="button" class="btn btn-default" onclick="daumPost()">주소 검색</button>
						</span>
					</div>
					<input type="text" class="form-control" name="addr1" id="addr1" value="${modifyAll.addr1 }" maxlength="15" readonly="readonly">
					<input type="text" class="form-control" name="addr2" id="addr2" value="${modifyAll.addr2 }" maxlength="15">
				</div>
				<label></label>
				<div class="form-group" style="text-align: center">
					<div class="btn-group" data-toggle="buttons">
						<c:if test="${modifyAll.gender == 'm' }">
							<label class="btn btn-primary active">
								<input type="radio" name="gender" autocomplete="off" value="m" checked>남자
							</label>
							<label class="btn btn-primary disabled">
								<input type="radio" name="gender" autocomplete="off" value="w" disabled>여자
							</label>
						</c:if>
						<c:if test="${modifyAll.gender == 'w' }">
							<label class="btn btn-primary disabled">
								<input type="radio" name="gender" autocomplete="off" value="m" disabled>남자
							</label>
							<label class="btn btn-primary active">
								<input type="radio" name="gender" autocomplete="off" value="w" checked>여자
							</label>
						</c:if>
					</div>
				</div>
				<label></label>
				<input type="submit" class="btn btn-primary form-control" value="수정완료">
			</form>
		</div>
	</div>
	<div class="col-lg-3"></div>
</div>
