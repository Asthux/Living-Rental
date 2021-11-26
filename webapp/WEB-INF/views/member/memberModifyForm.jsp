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
<center>
	
	<form action="memberModifyProc" method="post">
		<table>
			<tr>
				<td align='left' height=60>이름</td>
				<td><input type=text name='name' id="name" style="width:250; height:35; border: 1px solid #D5D5D5;" value='${modifyAll.name }' disabled="disabled"  /></td>
			</tr>
			<tr>
				<td align='left' height=60>생년월일</td>
				<td><input type=text name='birth' id="birth" style="width:250; height:35; border: 1px solid #D5D5D5;"  value='${modifyAll.birth }'   /></td>
			</tr>
			<tr>
				<td align='left' height=60>성별</td>
				<td colspan="3">	
				<c:if test="${modifyAll.gender == 'm' }">
						<input type=radio name='gender' value='m' checked="checked" />남자
						<input type=radio name='gender' value='w' disabled="disabled" />여자 
				</c:if> 
				<c:if test="${modifyAll.gender == 'w' }">
						<input type=radio name='gender' value='m' disabled="disabled" />남자
						<input type=radio name='gender' value='w' checked="checked" />여자 
				</c:if></td>
			</tr>
			<tr>
				<td align='left' height=60>아이디</td>
				<td><input type=text name='id' id="id" style="width:250;  height:35; border: 1px solid #D5D5D5;" value='${sessionScope.modifyId }' disabled="disabled" /></td>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td align='left' height=60 ><lable>*</lable>비밀번호</td>
				<td><input type=text name='pw' style="width:250;  height:35; border: 1px solid #D5D5D5;" /></td>
			</tr>
			<tr>
				<td align='left' height=60><lable>*</lable>비밀번호 확인</td>
				<td><input type=text name='pwOk' style="width:250;  height:35; border: 1px solid #D5D5D5;" /></td>
			</tr>
			<tr>
				<td align='left' height=60>연락처</td>
				<td><input type=text name='phone' style="width:250;  height:35; border: 1px solid #D5D5D5;" value='${modifyAll.phone }' disabled="disabled" ></td>
			</tr>
			<tr>
				<td align='left' height=60>이메일</td>
				<td><input type=text name='email' id="email" style="width:250;  height:35; border: 1px solid #D5D5D5;" value="${modifyAll.email }"/></td>
				<td colspan="2"></td>
			</tr>
			
			<tr>
				<td align='left' height=60 rowspan="3">주소</td>
				<td><input type=text name='zipcode' id="zipcode" value="${modifyAll.zipcode }" readonly="readonly" style="width: 100px;" /></td>
				<td><input type="button" value="주소 검색"	onclick="daumPost()" style="width:90; height:35; background-color:black; color:white;"></td>
			</tr>
			<tr>
			<td colspan="3"><input type=text name='addr1' id="addr1" value="${modifyAll.addr1 }" readonly="readonly" style="width: 475px;" /></td>
			</tr>
			<tr>
			<td colspan="3"><input type=text name='addr2' id="addr2" value="${modifyAll.addr2 }" style="width: 475px;" /></td>
			</tr>
			
			<tr>
				<td align='center' height=60 colspan="2">
				<input type=submit value='수정' style="width: 250px; height: 50px; background-color:black; color:white;" /> 
				<input type=button value='취소' style="width: 250px; height: 50px; background-color:gray; color:white;" onclick="location.href='${root}'"/>
				</td>
			</tr>
		</table>
	</form>
</center>
