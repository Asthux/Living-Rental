<%@ page contentType="text/html; charset=UTF-8"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	function ajaxIsExist() {
		var i = document.getElementById('id').value;
		var d = {
			id : i
		}
		$.ajax({
			url : "isExistId",
			type : "POST",
			data : JSON.stringify(d), //문자열을 json타입으로 변환
			contentType : "application/json; charset=utf-8", //보낼 데이터 유형
			dataType : 'json', //return 타입 json으로 지정
			success : function(result) {
				$('#msg').text(result.msg)
			},
			error : function() {
				alert("문제 발생")
			}
		})
	}

	function sendAuth() {
		var e = document.getElementById('email').value;
		if (e == "") {
			$('#msg').text('이메일을 입력하세요.');
			return;
		}
		var s = {
			email : e
		}
		$.ajax({
			url : "sendAuth",
			type : "POST",
			data : JSON.stringify(s),
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			success : function(result) {
				$('#msg').text(result.msg)
			},
			error : function() {
				$('#msg').text('Error')
			}
		})
	}

	function sendAuthConfirm() {
		var i = document.getElementById('inputAuthNum').value;
		if (i == "") {
			$('#msg').text('인증번호를 입력하세요.');
			return;
		}
		var s = {
			inputAuthNum : i
		}
		$.ajax({
			url : "authConfirm",
			type : "POST",
			data : JSON.stringify(s),
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			success : function(result) {
				$('#msg').text(result.msg)
			},
			error : function() {
				$('#msg').text('Error')
			}
		})
	}
	function daumPost() {
		new daum.Postcode({
			onComplete : function(data) {
				var addr = "";
				if (data.userSelectedType === "R") {//도로명 주소일 경우( R )
					addr = data.roadAddress;
				} else {//지번일 경우( J )
					addr = data.jibunAddress;
				}
				document.getElementById("zipcode").value = data.zonecode;
				document.getElementById("addr1").value = addr;
				document.getElementById("addr2").focus();
			}
		}).open();
	}
</script>

<div class="container">
	<div class="col-lg-3"></div>
	<div class="col-lg-6">
		<div class="jumbotron" id="register_jumbo">
			<h2 style="text-align: center">Living Rental 회원가입</h2>
			<hr>
			<div style="text-align: center">
				<h3>
					<span class="label label-info" id="msg">${msg}</span>
				</h3>
			</div>
			<form action="memberProc" method="post">
				<label>아이디</label>
				<div class="form-group">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="아이디" name="id" id="id" maxlength="15">
						<span class="input-group-btn">
							<button type="button" class="btn btn-default" onclick="ajaxIsExist()">중복확인</button>
						</span>
					</div>
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
					<input type="text" class="form-control" placeholder="이름" name="name" maxlength="20">
				</div>
				<label>생년월일</label>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="생년월일" name="birth" maxlength="20">
				</div>
				<label>이메일</label>
				<div class="form-group">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="이메일" name="email" id="email" maxlength="50">
						<span class="input-group-btn">
							<input type="button" class="btn btn-default" onclick="sendAuth()" value="인증번호 전송">
						</span>
					</div>
				</div>
				<label>인증번호</label>
				<div class="form-group">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="인증번호" name="authNum" id="inputAuthNum" maxlength="15">
						<span class="input-group-btn">
							<button type="button" class="btn btn-default" onclick="sendAuthConfirm()">인증번호 확인</button>
						</span>
					</div>
				</div>
				<label>전화번호</label>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="전화번호" name="phone" maxlength="15">
				</div>
				<label>주소</label>
				<div class="form-group">
					<div class="input-group">
						<input type="text" class="form-control" name="zipcode" id="zipcode" maxlength="15" readonly="readonly">
						<span class="input-group-btn">
							<button type="button" class="btn btn-default" onclick="daumPost()">주소 검색</button>
						</span>
					</div>
					<input type="text" class="form-control" name="addr1" id="addr1" maxlength="15" readonly="readonly">
					<input type="text" class="form-control" name="addr2" id="addr2" maxlength="15">
				</div>
				<label></label>
				<div class="form-group" style="text-align: center">
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-primary active">
							<input type="radio" name="gender" autocomplete="off" value="m" checked>남자
						</label>
						<label class="btn btn-primary">
							<input type="radio" name="gender" autocomplete="off" value="w" checked>여자
						</label>
					</div>
				</div>
				<label></label>
				<input type="submit" class="btn btn-primary form-control" value="회원가입">
			</form>
			<hr>
			<label>계정이 이미 있는 경우에는 <a href="http://localhost:8085/living_rental/home?formpath=login">로그인</a>해주세요</label>
		</div>
	</div>
	<div class="col-lg-3"></div>
</div>
