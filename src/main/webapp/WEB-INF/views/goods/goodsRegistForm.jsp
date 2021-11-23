<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<c:url var="root" value="/" />    

<body>
	<div style="text-align: center">
		<div>
			<h2>제품 등록 화면</h2>
		</div>
		<div>
			<form action="${root}registProc" method="post" enctype="multipart/form-data">
				<div>
					제품명<input type="text" name="gdsName" style="width: 300px;">
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
					<input type="text" name="gdsPrice" placeholder="가격">
				</div>
				<div>
					<label>제품 썸네일</label>
					<input type="file" name="gdsThumb" accept="image/*">
				</div>
				<div>
					
				</div>
				<div>
					<input type="file" name="gdsImg" accept="image/*">
				</div>
				<div>
					<input type="submit" value="제품 등록" style="width: 120px;">
					<input type="button" value="취소" style="width: 120px;" onclick="history.back()">
				</div>
			</form>
		</div>
		
	</div>
</body>

