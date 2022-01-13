<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/" />

<article id="login_jumbo">
	<div class="container">
		<form action="${root }writeProc" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
			<table class="table table-striped">
				<thead>
				<tr>
					<th>Q & A</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="100"></td>
				</tr>
				<tr>
					<td><textarea type="text" class="form-control" placeholder="글 내용" name="content" maxlength="500" style="height: 300px"></textarea></td>
				</tr>
				<tr>
					<td>
						<input class="form-control" type="file" id="formFile" name="fileName">
					</td>
				</tr>
				</tbody>
			</table>
			<div class="pull-right">
				<input type="submit" class="btn btn-primary" value="확인">
				<input type="button" class="btn btn-primary" onclick="location.href='${root}boardProc'" value="취소">
			</div>
			<br>
			<br>
			<br>
		</form>
	</div>
</article>
