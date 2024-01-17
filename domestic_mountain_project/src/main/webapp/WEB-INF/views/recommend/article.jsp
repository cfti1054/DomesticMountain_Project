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
}

.notice-container {
	margin: 3rem;
}

.table-article img {
	max-width: 650px;
}

.mb-0 {
	--bs-table-bg: unset;
}

.board-list-header {
	padding-top: 7px;
	padding-bottom: 7px;
}

.board-list {
	width: 100%;
}

.board-list>thead {
	color: #787878;
}

.board-list>thead tr:first-child {
	border-top: 2px solid #454545;
}

.board-list tr>th, .board-list tr>td {
	text-align: center;
}

.board-list .left {
	text-align: left;
	padding-left: 5px;
}

.board-list-footer {
	padding-top: 7px;
	padding-bottom: 7px;
}

/* 글 쓰기 폼 */
.write-form tr>td {
	vertical-align: middle;
}

.write-form p {
	line-height: 200%;
}

.write-form tr:first-child {
	border-top: 2px solid #454545;
}

.write-form tr>td:first-child {
	text-align: center;
}

.write-form tr>td:nth-child(2) {
	padding-left: 10px;
}

.write-form textarea {
	height: 170px;
	resize: none;
}

.board-article thead>tr:first-child {
	border-top: 2px solid #454545;
}

/* 댓글 */
.reply {
	clear: both;
	padding: 20px 0 10px;
}

.reply .bold {
	font-weight: 600;
}

.reply .form-header {
	padding-bottom: 7px;
}

.reply-form  tr>td {
	padding: 2px 0 2px;
}

.reply-form textarea {
	width: 100%;
	height: 75px;
	resize: none;
}

.reply-form button {
	padding: 8px 25px;
}

.reply .reply-info {
	padding-top: 25px;
	padding-bottom: 7px;
}

.reply-info .reply-count {
	color: #3EA9CD;
	font-weight: 600;
}

.reply-writer .icon {
	font-size: 1.6rem;
	color: #999;
}

.reply-writer .name {
	font-size: 12px;
	font-weight: 600;
}

.reply-writer .date {
	font-size: 10px;
}

.reply .reply-dropdown {
	cursor: pointer;
}

.reply .reply-dropdown:hover {
	color: #0d6efd;
	font-weight: 500;
}

.reply .reply-menu {
	display: none;
	position: absolute;
	width: 80px;
	min-height: 65px;
	background: #fff;
	border: 1px solid #d5d5d5;
	border-radius: 3px;
	z-index: 9999;
}

.reply .reply-menu-item {
	text-align: center;
	cursor: pointer;
	padding: 7px;
}

.reply .reply-menu-item:nth-child(2n+1) {
	border-bottom: 1px solid #d5d5d5;
}

.reply .reply-menu-item:hover {
	color: #0d6efd;
	font-weight: 500;
}

.reply-answer {
	display: none;
}

.reply-answer textarea {
	width: 98%;
	height: 75px;
	resize: none;
}

.features-1 {
	height: 2000px; /* 수정 시 auto로 바꾸고 해야함 */
}

</style>



<section class="features-1">
	<div class="body-container">

		<div class="aside-box">
			<div class="aside" id="scroll">
				<div class="aside-wi">
					<h1 class="submenu-main">Community</h1>
					<h3>
						<a>Community</a>
					</h3>
					<ul>
						<li class="eq1"><a
							href="${pageContext.request.contextPath}/recommend/list">&gt;
								추천 코스</a></li>
						<li class=""><a
							href="${pageContext.request.contextPath}/createcourse/list">&gt;
								유저가 만든 코스</a></li>
						<li class=""><a href="#">&nbsp;</a></li>
						<li class=""><a
							href="${pageContext.request.contextPath}/together/list">&gt;
								동행 산행 신청</a></li>
					</ul>

					<h3>
						<a>Share Tips</a>
					</h3>
					<ul>
						<li class=""><a
							href="${pageContext.request.contextPath}/share/list">&gt; 유용한
								정보</a></li>
					</ul>

					<h3>
						<a>Walk &amp; Climbing</a>
					</h3>
					<ul>
						<li class=""><a
							href="${pageContext.request.contextPath}/appearance/list">&gt;
								회원들의 모습</a></li>
					</ul>

					<h3>
						<a>Look &amp; Style</a>
					</h3>
					<ul>
						<li class=""><a
							href="${pageContext.request.contextPath}/ootd/list">&gt; 스트릿
								스냅 (OOTD)</a></li>
					</ul>

				</div>
			</div>
		</div>




		<div class="contentWrap">
			<div class="amain">
				<h1 class="amain-main">
					<a>추천 코스<span>| Recommended course</span></a> <span><a
						href="${pageContext.request.contextPath}/">home</a> &gt; community
						&gt; 추천코스</span>
				</h1>
			</div>


			<div class="notice-container">

				<table class="table mt-5 mb-0 board-article">
					<thead>
						<tr>
							<td colspan="2" align="center">${dto.post_title}</td>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td width="50%">이름 : ${dto.user_name}</td>
							<td align="right">${dto.post_reg_date} | 조회
								${dto.post_hit_count}</td>
						</tr>

						<tr>
							<td colspan="2" valign="top" height="200"
								style="border-bottom: none;">${dto.post_content}</td>
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
						<tr>
							<td colspan="2">이전글 : <c:if test="${not empty prevDto}">
									<a
										href="${pageContext.request.contextPath}/recommend/article?${query}&num=${prevDto.post_num}">${prevDto.post_title}</a>
								</c:if>
							</td>
						</tr>
						<tr>
							<td colspan="2">다음글 : <c:if test="${not empty nextDto}">
									<a
										href="${pageContext.request.contextPath}/recommend/article?${query}&num=${nextDto.post_num}">${nextDto.post_title}</a>
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
								onclick="location.href='${pageContext.request.contextPath}/recommend/list?${query}';">리스트</button>
						</td>
					</tr>
				</table>
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