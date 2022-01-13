<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="root" value="/" />
<article id="login_jumbo">
	<form action="" method="post">
		<input type="hidden" name="no" value="${board.no }" />
		<input type="hidden" name="id" value="${board.id }" />
		<input type="hidden" name="title" value="${board.title }"/>
		<input type="hidden" name="content" value="${board.content }"/>
		<input type=hidden name="proc" value="deleteProc" />

		<div class="container">
			<table class="table table-striped">
				<thead>
				<tr>
					<th colspan="3">Q & A</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td style="width: 20%;">글 제목</td>
					<td colspan="2">${board.title }</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td colspan="2">${board.id }</td>
				</tr>
				<tr>
					<td>작성일자</td>
					<td colspan="2">${board.writeDate }</td>
				</tr>
				<tr>
					<td>첨부 파일</td>
					<td colspan="2">
						<c:if test="${board.fileName != '파일 없음' }">
							<a href="${root }download?fileName=${board.fileName }">${board.fileName }</a>
						</c:if>
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="2" style="height: 300px; text-align: left">${board.content }</td>
				</tr>
				</tbody>
			</table>
			<c:if test="${not empty sessionScope.id }">
			<button formaction="${root }home?formpath=modify" class="btn btn-primary">수정</button>
			<button formaction="${root }home?formpath=delete" class="btn btn-primary">삭제</button>
			</c:if>
			<input type=button class="btn btn-primary pull-right" value='목록'
				   onclick="location.href='${root}boardProc'"/></td>
			<div id="disqus_thread"></div>
			<script>
				/**
				 *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
				 *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables    */
				/*
				var disqus_config = function () {
				this.page.url = PAGE_URL;  // Replace PAGE_URL with your page's canonical URL variable
				this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
				};
				*/
				(function() { // DON'T EDIT BELOW THIS LINE
					var d = document, s = d.createElement('script');
					s.src = 'https://living-rental.disqus.com/embed.js';
					s.setAttribute('data-timestamp', +new Date());
					(d.head || d.body).appendChild(s);
				})();
			</script>
			<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
		</div>
	</form>
</article>