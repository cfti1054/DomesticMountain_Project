<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.features-1 {
	height: auto; /* 수정 시 auto로 바꾸고 해야함 */
}

.body-container {
	padding-top: 120px;
	max-width: 1400px;
	display: flex;
	margin: auto;
	background: none;
}

.body-main {
	max-width: 900px;
	margin: 3rem auto;
}

.mb-0 {
--bs-table-bg: none;
}

</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/boot-board.css"
	type="text/css">




<section class="features-1">
	<div class="body-container">

		<div class="aside-box">
			<div class="aside" id="scroll">
				<div class="aside-wi">
					<h1 class="submenu-main">Services</h1>
					<h3>
						<a>카테고리</a>
					</h3>
					<ul>
						<li class="eq1"><a
							href="${pageContext.request.contextPath}/notice/list">&gt;
								Notice</a></li>
						<li class=""><a
							href="${pageContext.request.contextPath}/faq/main">&gt; Faq</a></li>
					</ul>

					<h3>
						<a>서비스 이용 안내</a>
					</h3>
					<ul>
						<li class=""><a
							href="${pageContext.request.contextPath}/services/privacy">&gt;
								개인정보처리방침</a></li>
						<li class=""><a
							href="${pageContext.request.contextPath}/services/policy">&gt;
								이용약관</a></li>
						<li class=""><a
							href="${pageContext.request.contextPath}/services/comment">&gt;
								댓글 운영정책</a></li>
						<li class=""><a
							href="${pageContext.request.contextPath}/services/serviceTel">&gt;
								서비스 전화번호안내</a></li>
					</ul>
				</div>
			</div>
		</div>


		<div class="contentWrap">
			<div class="amain">
			<h1 class="amain-main">
					<a>Notice<span>| 공지사항 </span></a> <span><a
						href="${pageContext.request.contextPath}/">home</a> &gt; services
						&gt; notice </span>
				</h1>

				<div class="body-main">

					<table class="table mt-5 mb-0 board-article">
						<thead>
							<tr>
								<td colspan="2" align="center" style="font-weight: 900; color: #c4676e;">${dto.notice_title}</td>
							</tr>
						</thead>

						<tbody>
							<tr>
								<td width="50%">이름 : 관리자</td>
								<td align="right">${dto.notice_reg_date}| 조회
									${dto.notice_hit_count}</td>
							</tr>

							<tr>
								<td colspan="2" valign="top" height="200"
									style="border-bottom: none;">${dto.notice_content}</td>
							</tr>
							<!--  
				 	<tr>
						<td colspan="2">
							<c:forEach var="vo" items="${listFile}" varStatus="status">
								<p class="border text-secondary mb-1 p-2">
									<i class="bi bi-folder2-open"></i>
									<a href="${pageContext.request.contextPath}/notice/download?fileNum=${vo.fileNum}">${vo.originalFilename}</a>
									[${vo.fileSize} byte]
								</p>
							</c:forEach>
						</td>
					</tr> 
					-->
							<tr class="prev-next">
								<td colspan="2">&nbsp;<c:if test="${not empty prevDto}">
										<a
											href="${pageContext.request.contextPath}/notice/article?${query}&notice_num=${prevDto.notice_num}"><span class="a-span">이전글 : </span>${prevDto.notice_title}</a>
									</c:if>
								</td>
							</tr>
							<tr class="prev-next">
								<td colspan="2">&nbsp;<c:if test="${not empty nextDto}">
										<a
											href="${pageContext.request.contextPath}/notice/article?${query}&notice_num=${nextDto.notice_num}"><span class="a-span">다음글 : </span>${nextDto.notice_title}</a>
									</c:if>
								</td>
							</tr>
						</tbody>
					</table>

					<table class="table table-borderless">
						<tr>
							<td width="50%">&nbsp;</td>
							<td class="text-end">
								<button type="button" class="btn btn-light"
									onclick="location.href='${pageContext.request.contextPath}/notice/list?${query}';">리스트</button>
							</td>
						</tr>
					</table>

				</div>
			</div>
		</div>
	</div>
</section>


<script>
	$(document).ready(function() {
		var currentPosition = parseInt($("#scroll").css("top"));
		$(window).scroll(function() {
			var position = $(window).scrollTop();
			$("#scroll").stop().animate({
				"top" : position + currentPosition + "px"
			}, 500);
		});
	});
</script>

