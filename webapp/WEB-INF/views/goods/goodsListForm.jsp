<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url var="root" value="/" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$("document").ready(function (){
		$("div.gdsClick").css("cursor", "pointer").click(function(){
			let no = $(this).attr("id");
			$("#gdsNum").val(no);
			$("#f").attr("action", "${root}goodsViewProc");
			$("#f").submit();
		});
	});
</script>
<center id="login_jumbo">
	<div>
		<article class="container">
			<div>
				<h2>상품 목록</h2>
			</div>
			<br>
			<form id="f" method="get">
			<input type="hidden" id="gdsNum" name="gdsNum">
				<table class="container">
					<thead>
						<tr>
							<nav class="container">
								<div>
									<c:if test="${sessionScope.id eq 'admin'}">
										<hr>
										<div class="btn-group btn-group-justified" role="group">
											<div class="btn-group" role="group">
												<button type="button" class="btn btn-default" onclick="location.href='${root}home?formpath=goodsRegist'">상품 등록</button>
											</div>
											<div class="btn-group" role="group">
												<button type="button" class="btn btn-default">상품 수정</button>
											</div>
											<div class="btn-group" role="group">
												<button type="button" class="btn btn-default">상품 삭제</button>
											</div>
										</div>
										<hr>
									</c:if>
								</div>
							</nav>
						</tr>
					</thead>
						<tr>
							<c:forEach var="list" items="${goodsList}">
							<td style="text-align: center;">
								<div id="${list.gdsNum }" class="gdsClick"><img src="${pageContext.request.contextPath}/resources/upload/${list.gdsThumb}" style="width: 200px; height: 200px;"></div>
								<br>
								<div id="${list.gdsNum }" class="gdsClick">${list.gdsName }</div>
							</td>
							</c:forEach>
						</tr>
				</table>
			</form>	
		</article>	
	</div>
</center>
</html>