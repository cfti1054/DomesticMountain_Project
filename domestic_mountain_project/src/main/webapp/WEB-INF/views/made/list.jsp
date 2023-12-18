<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
/*=============== body (area) ===============*/
.features-1 {
	height: 2000px; /* 수정 시 auto로 바꾸고 해야함 */
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

.eq1 {
	font-weight: 900;
}

.aside-box .aside ul .eq1 a {
	color: hsl(212, 75%, 56%);
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

/*=============== 검색창 / form ===============*/
.search-f {
	display: flex;
	justify-content: space-between;
	margin: 0 30px;
}

.search-body {
	height: 40px;
	width: 300px;
	border: 1px solid #a69fd6;
	background: #ffffff;
}

.search-body input {
	font-size: 16px;
	height: 100%;
	width: 240px;
	padding: 10px;
	border: Opx;
	outline: none;
	float: left;
}

.search-body button {
	width: 50px;
	height: 100%;
	border: 0px;
	background: #a69fd6;
	outline: none;
	float: right;
	color: #ffffff;
	background: #gray;
}

.sort_form {
	display: flex;
	align-items: center;
}

.sort_form a {
	size: 10px;
	margin-left: 10px;
	color: #a69fd6;
}

.sort_form a:hover {
	color: hsl(212, 75%, 56%);
}
/*=============== notice ===============*/
.notice-container {
	margin: 0 30px;
}
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
					<h1 class="submenu-main">Community</h1>
					<h3>
						<a>Community</a>
					</h3>
					<ul>
						<li class=""><a
							href="${pageContext.request.contextPath}/recommend/list">&gt;
								추천 코스</a></li>
						<li class="eq1"><a
							href="${pageContext.request.contextPath}/made/list">&gt;
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
						<li class=""><a href="#">&gt; 유용한 정보</a></li>
					</ul>

					<h3>
						<a>Walk &amp; Climbing</a>
					</h3>
					<ul>
						<li class=""><a href="#">&gt; 회원들의 모습</a></li>
					</ul>

					<h3>
						<a>Look &amp; Style</a>
					</h3>
					<ul>
						<li class=""><a href="#">&gt; 스트릿 스냅 (OOTD)</a></li>
					</ul>

				</div>
			</div>
		</div>

		<div class="contentWrap">
			<div class="amain">
				<h1 class="amain-main">
					<a>유저가 만든 코스<span>| Course created by the User</span></a> <span><a
						href="${pageContext.request.contextPath}/">home</a> &gt; community
						&gt; 유저가 만든 코스</span>
				</h1>
			</div>

			<div class="search-f">
				<div class="search-body">
					<input type="text" placeholder="검색어 입력">
					<button>검색</button>
				</div>

				<div class="sort_form">
					<a href="#" onclick="" class="sort_card "><span class="blind"><i
							class="fa-solid fa-server fa-2x"></i></span></a> <a href="#" onclick=""
						class="sort_album "><span class="blind"><i
							class="fa-solid fa-border-all fa-2x"></i></span></a> <a href="#" onclick=""
						class="sort_list "><span class="blind"><i
							class="fa-solid fa-list-ul fa-2x"></i></span></a>
				</div>
			</div>



			<div class="notice-container">
				<div class="notice-body">
					<div class="body-main">
						<div class="row board-list-header">
							<div class="col-auto me-auto">10개(1/2 페이지)</div>
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


								<tr>
									<td>234</td>
									<td class="left"><a href="#" class="text-reset">내용입니다.</a>
										<span class="badge text-bg-info">New</span></td>
									<td>관리자</td>
									<td>2023-11-11</td>
									<td>11</td>
								</tr>
							</tbody>
						</table>

						<div class="page-navigation">1 2 3</div>

						<div class="row board-list-footer">
							<div class="col">
								<button type="button" class="btn btn-light" onclick="#"
									title="새로고침">
									<i class="bi bi-arrow-counterclockwise"></i>
								</button>
							</div>
							<div class="col text-center">&nbsp;</div>

							<div class="col-6 text-end">
								<form class="row text-end-row" name="searchForm" action="#"
									method="post">
									<div class="col-auto p-1">
										<select name="schType" class="form-select">
											<!-- 예시 : <option value="all" ${schType=="all"?"selected":""}>제목+내용</option> -->
											<option value="all">제목+내용</option>
											<option value="reg_date">등록일</option>
											<option value="subject">제목</option>
											<option value="content">내용</option>
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