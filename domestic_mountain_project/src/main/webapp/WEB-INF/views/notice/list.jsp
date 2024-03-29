<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>

/*=============== body (area) ===============*/
.features-1 {
	height: 2000px; /* 삭제 해야함 */
}

.body-container {
	padding-top: 120px;
	max-width: 1400px;
	display: flex;
	margin: auto;
}

.aside {
	box-shadow: 2px 2px 2px 2px #e2e2e2;
}

.aside-box {
	width: 270px;
	float: left;
	margin-right: 100px;
}

#scroll {
	width: 270px;
	/*position: relative;*/
	position: absolute;
	background-color: #f5f6ff;
	border-radius: 0.8em;
	top: 120px;
}

.aside .aside-wi, .amain {
	margin: 30px;
}

.aside .submenu-main, .amain-main {
	padding: 0 0 10px 10px;
	border-bottom: 2px solid #3a3a3a;
	font-size: xx-large;
	color: #6557be;
}

.aside h3 {
	font-size: 18px;
	color: #000;
	padding: 10px 0 0 10px;
	font-weight: 700;
}

.aside ul li {
	padding-bottom: 5px;
}

.aside ul li a {
	color: black;
}

.aside ul li a:hover {
	color: gray;
}

.contentWrap {
	width: 1100px;
	float: right;
}

.contentWrap .amain h1 {
	display: flex;
	justify-content: space-between;
}

.amain-main a>span {
	font-size: 18px;
	color: gray;
	margin: 10px 0 0 20px;
}

.amain-main span {
	font-size: 14px;
	color: gray;
	margin: 15px 0 0 20px;
}

.eq1 {
	font-weight: 900;
}

.aside-box .aside ul .eq1 a {
	color: hsl(212, 75%, 56%);
}

/*=============== notice ===============*/
.board-list-header {
	padding-top: 30px;
	padding-bottom: 7px;
	width: 100%;
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
	width: 100%;
}
.page-navigation {
	 text-align: center;
}

.btn-light {
	background-color: #ada7e4;
}

.btn-light:hover {
	background-color: #c6bfff;
}
.text-end .text-end-row {
	width: 100%;
	justify-content: end;
}

.board-list-footer .row i,
.board-list-footer .col i{
	color: white;
}
</style>

<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}
</script>

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
							href="${pageContext.request.contextPath}/faq/main">&gt;
								Faq</a></li>
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



				<div class="notice-container">
					<div class="notice-body">
						<div class="body-main">
							<div class="row board-list-header">
								<div class="col-auto me-auto">
									${dataCount}개(${page}/${total_page} 페이지)
								</div>
								<div class="col-auto">&nbsp;</div>
							</div>

							<table class="table table-hover board-list">
								<thead class="table-light">
									<tr>
										<th width="60">번호</th>
										<th>제목</th>
										<th width="100">작성자</th>
										<th width="100">작성일</th>
										<th width="70">조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="dto" items="${list}" varStatus="status">
										<tr>
											<td>${dataCount - (page-1) * size - status.index}</td>
											<td class="left">
												<c:if test="${dto.gap < 12}">
		             		  	 					<span class="badge text-bg-info">New</span>
		           		 						</c:if>
												 <a href="${articleUrl}&notice_num=${dto.notice_num}" class="text-reset">${dto.notice_title}</a>
											</td>
											<td>관리자</td>
											<td>${dto.notice_reg_date}</td>
											<td>${dto.notice_hit_count}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<div class="page-navigation">
								${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
							</div>

							<div class="row board-list-footer">
								<div class="col">
									<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/notice/list';"
										title="새로고침">
										<i class="bi bi-arrow-counterclockwise"></i>
									</button>
								</div>
								<div class="col text-center">&nbsp;</div>
								
								<div class="col-6 text-end">
									<form class="row text-end-row" name="searchForm" action="${pageContext.request.contextPath}/notice/list" method="post">
										<div class="col-auto p-1">
											<select name="schType" class="form-select">
												<option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
												<option value="notice_reg_date" ${schType=="reg_date"?"selected":""}>등록일</option> 
												<option value="notice_title" ${schType=="subject"?"selected":""}>제목</option>    
												<option value="notice_content" ${schType=="content"?"selected":""}>내용</option>    
											</select>
										</div>
										<div class="col-auto p-1">
											<input type="text" name="kwd" value="${kwd}"
												class="form-control">
										</div>
										<div class="col-auto p-1">
											<button type="button" class="btn btn-light"
												onclick="searchList()">
												<i class="bi bi-search"></i>
											</button>
										</div>
									</form>
								</div>
								<div class="col text-end">
									&nbsp;
								</div>
							</div>
						</div>
					</div>
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