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
<center>
	<div>
		<nav style="width: 300px; float:left;">
			<div>
				<c:if test="${sessionScope.id eq 'admin'}">
					<div>
						<input type="button" value="상품 등록" onclick="location.href='${root}home?formpath=goodsRegist'">
					</div>
					<div>
						<input type="button" value="상품 수정">
					</div>
					<div>
						<input type="button" value="상품 삭제">
					</div>
				</c:if>
			</div>
		</nav>
		<article style="width: 1000px; height: 800px; margin-left: 300px;">
			<form id="f" method="get">
			<input type="hidden" id="gdsNum" name="gdsNum">
				<table>
					<thead>
						<tr>
							<th>상품 목록</th>		
						</tr>
					</thead>
					<c:forEach var="list" items="${goodsList}">
						<tr>
							<td style="text-align: center;">
								<div id="${list.gdsNum }" class="gdsClick"><img src="${pageContext.request.contextPath}/resources/upload/${list.gdsThumb}" style="width: 200px; height: 200px;"></div>
								<div id="${list.gdsNum }" class="gdsClick">${list.gdsName }</div>
							</td>
						</tr>
					</c:forEach>
				</table>
			</form>	
		</article>	
	</div>
</center>
</html>