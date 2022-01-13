<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$("document").ready(function (){
		$("div.title").css("cursor", "pointer").click(function(){
			let no = $(this).attr("id");
			location.href='viewProc?writeNo=' + no;
/* 			$("#writeNo").val(no);
			$("#f").attr("action", "${root}viewProc");
			$("#f").submit(); */
		});


		$("#allSelect").click(function() {
			console.log(this.checked); // true or false
			$(".chkbox").prop('checked', this.checked);
			console.log($(".chkbox").length); // 선택된 개수 
		});
		
		$(".chkbox").click(function() {
			console.log($(".chkbox:checked").length); // 누적된 체크 수 
			if($(".chkbox:checked").length==3) // 출력된 게시글의 max(3개)
				$("#allSelect").prop('checked', true); // 전체선택 체크박스 체크 입력
			else
				$("#allSelect").prop('checked', false);
		});

	});
</script>
<center>
	<div class="container" id="board_container">
		<form id="f" method="get" >
			<input type="hidden" id="writeNo" name="writeNo"/>
			<input type=hidden name="proc" value="deletes" />
			<input type=hidden name="formpath" value="delete" />

			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
				<tr>
					<c:choose>
						<c:when test="${sessionScope.id eq 'admin' }">
							<th style="text-align: center">선택</th>
						</c:when>
						<c:otherwise>
							<th style="text-align: center">번호</th>
						</c:otherwise>
					</c:choose>
					<th style="text-align: center">제목</th>
					<th style="text-align: center">아이디</th>
					<th style="text-align: center">작성일</th>
					<th style="text-align: center">조회</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="list" items="${boardList }">
					<tr>
						<td style>
							<c:choose>
								<c:when test="${sessionScope.id eq 'admin' }">
									<input class="chkbox" name="checks" value="${list.no }" type="checkbox" />
								</c:when>
								<c:otherwise>
									${list.no }
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<div id="${list.no }" class="title">${list.title }  </div>
						</td>
						<td>${list.id }</td>
						<td>${list.writeDate }</td>
						<td>${list.hit } </td>
					</tr>
				</c:forEach>
				</tbody>
				<tr>
					<c:choose>
						<c:when test="${sessionScope.id eq 'admin' }">
							<td colspan=1><input type="checkbox" id="allSelect"/>전체선택</td>
							<td colspan=4 align="right">
								<button class="btn btn-primary" formaction="${root }" >삭제</button>
							</td>
						</c:when>
						<c:otherwise>
							<td colspan=5 align="right">
								<input type="button" class="btn btn-primary" value='글쓰기' onclick="location.href='${root }home?formpath=write'" />
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</table>
		</form>

		<div>
			<form action="${root }boardProc" method="post">
				<div class="col-md-5"></div>
				<div class="col-md-2">
					${page }
				</div>
				<div class="col-md-2">
					<select class="form-control" name="select">
						<option selected value="">선택</option>
						<option value="title">제목</option>
						<option value="id">작성자</option>
					</select>
				</div>
				<div class="col-md-3">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search for..." name="search">
						<span class="input-group-btn">
                    <button class="btn btn-default" type="submit">Search</button>
                </span>
					</div>
				</div>
			</form>
		</div>
	</div>
</center>