<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/" />
<article id="login_jumbo">
	<div class="container">
		<form action="${root }modifyProc" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
			<input type="hidden" name="no" value="${board.no }"/>
			<table class="table table-striped">
				<thead>
				<tr>
					<th>글 수정</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td><input type="text" class="form-control" placeholder="글 제목" name="subject" maxlength="100" value="${board.title }"></td>
				</tr>
				<tr>
					<td><textarea type="text" class="form-control" placeholder="글 내용" name="content" maxlength="500" style="height: 300px">${board.content }</textarea></td>
				</tr>
				<tr>
					<td>
						<input class="form-control" type="file" id="formFile" name="uploadFileName">
					</td>
				</tr>
				</tbody>
			</table>
			<div class="pull-right">
				<input type="submit" class="btn btn-primary" value="수정">
				<input type=button value='취소' class="btn btn-primary" onclick="location.href='${root}boardProc'" />
			</div>
			<br>
			<br>
			<br>
		</form>
	</div>
</article>
