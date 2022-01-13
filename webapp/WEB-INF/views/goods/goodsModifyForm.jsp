<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/"/>

<center id="login_jumbo">
	<div style="text-align: center">
		<div>
			<h2>상품 수정 화면</h2>	
		</div>
		<div>
			<form action="${root}goodsModifyProc" method="post" enctype="multipart/form-data">
				<input type="hidden" name="gdsNum" value="${goods.gdsNum }">
				<div>
					제품명<input type="text" name="gdsName" style="width: 300px;" value="${goods.gdsName }">
				</div>
				<div>
					카테고리
					<select name="cateName">
						<option value="none" selected="selected">카테고리 선택</option>
						<option value="tv">TV</option>
						<option value="fridge">냉장고</option>
						<option value="bidet">비데</option>
					</select>
				</div>
				<div>
					<input type="text" name="gdsPrice" placeholder="가격" value="${goods.gdsPrice }">
				</div>
				<div>
					<label>상품 썸네일</label>
					<input type="file" name="gdsThumb" accept="image/*" value="${goods.gdsThumb }">
				</div>
				<div>
					
				</div>
				<div>
					<label>설명 이미지</label>
					<input type="file" name="gdsImg" accept="image/*" value="${goods.gdsImg }">
				</div>
				<div>
					<input type="submit" value="수정" style="width: 120px;">
					<input type="button" value="취소" style="width: 120px;" onclick="history.back()">
				</div>
			</form>
		</div>
		
	</div>
</center>