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
.output-type {
	display: flex;
	justify-content: end;
	margin: 0 30px;
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

.sort_form .sort-color {
	color: hsl(212, 75%, 56%);
}
/*=============== notice ===============*/
.notice-container {
	margin: 0 30px;
}

.page-navigation {
	text-align: center;
	clear: both;
}
/*=============== notice(show1) ===============*/
.article-movie-sub {
	margin-top: 16px;
	padding-left: 0;
}

.article-movie-sub li {
	display: block;
	padding: 16px 0;
	display: flex;
	box-sizing: border-box;
	border-bottom: 1px solid #eeeeef;
}

.article-movie-sub ul, .article-movie-sub li, .article-movie-sub ol,
	.article-movie-sub dl {
	list-style: none;
	font-size: 13px;
}

.article-movie-sub .con {
	display: table-cell;
	position: relative;
	color: #222;
}

.article-movie-sub .tit_area {
	display: table;
}

.article-movie-sub .tit_area .tit {
	display: table-cell;
}

.article-movie-sub a {
	color: inherit;
	text-decoration: none;
}

.article-movie-sub .tit_area .tit .inner {
	display: table;
	table-layout: fixed;
}

.article-movie-sub .tit_area .tit strong {
	display: block;
	height: 22px;
	font-size: 16px;
	line-height: 22px;
	display: block;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: normal;
	word-break: break-all;
	word-wrap: break-word;
	word-break: break-word;
}

.article-movie-sub .txt {
	display: block;
	max-height: 44px;
	margin-top: 6px;
	font-size: 14px;
	line-height: 22px;
	display: block;
	overflow: hidden;
	text-overflow: ellipsis;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	word-break: break-all;
	word-wrap: break-word;
	word-break: break-word;
	color: #666;
}

.article-movie-sub .con_bottom {
	bottom: 0;
	left: 0;
	width: 100%;
	padding-top: 35px;
}

.article-movie-sub .user_info {
	overflow: hidden;
}

.article-movie-sub .user_info .pers_nick_area {
	float: left;
}

.article-movie-sub .user_info .pers_nick_area>table {
	width: auto;
}

.article-movie-sub tbody {
	vertical-align: middle;
	border-color: inherit;
}

.article-movie-sub tr {
	display: table-row;
	vertical-align: inherit;
	border-color: inherit;
}

.article-movie-sub .user_info .pers_nick_area .p-nick {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.article-movie-sub .user_info .date_num {
	float: left;
	color: #999;
}

.article-movie-sub .user_info .date_num:before {
	content: '';
	display: inline-block;
	width: 2px;
	height: 2px;
	margin: 0 5px 4px 7px;
	border-radius: 2px;
	background-color: #999;
}

.article-movie-sub .user_info .date, .article-movie-sub .user_info .num
	{
	margin-right: 16px;
}

.article-movie-sub .like_area {
	display: inline-block;
	padding: 0 0 0 7px;
	vertical-align: top;
}

.article-movie-sub .like_area .comment_area {
	display: inline-block;
	margin-right: 5px;
	vertical-align: top;
}

.article-movie-sub .movie-img {
	display: table-cell;
	position: relative;
	width: 300px;
	height: 120px;
	padding-left: 35px;
	vertical-align: top;
}

.article-movie-sub .movie-img a {
	display: block;
	position: relative;
	height: 120px;
	width: 120px;
}

.article-movie-sub .movie-img a:before {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	border: 1px solid rgba(0, 0, 0, 0.05);
	content: '';
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	aspect-ratio: 120/120;
}

.article-movie-sub img {
	vertical-align: top;
	border: 0;
	aspect-ratio: 120/120;
}

.article-movie-sub .movie-img .num {
	position: absolute;
	bottom: 10px;
	right: 5px;
	height: 20px;
	padding: 0 7px;
	box-sizing: border-box;
	border-radius: 20px;
	background-color: #000;
	background-color: rgba(0, 0, 0, 0.6);
	font-size: 12px;
	color: #fff;
	text-align: center;
	line-height: 20px;
	font-family: arial, sans-serif;
}

.article-movie-sub .blind {
	overflow: hidden;
	position: absolute;
	clip: rect(0, 0, 0, 0);
	width: 1px;
	height: 1px;
	margin: -1px;
}

.article-movie-sub .movie-img .num:after {
	content: '+';
	margin-left: 2px;
	font-size: 12px;
	color: #fff;
	text-align: center;
	line-height: 20px;
	font-family: arial, sans-serif;
}

.article-movie-sub li:after {
	content: '';
	display: block;
	clear: both;
}
/*=============== notice(show2) ===============*/
.article-album-sub {
	margin-top: 50px;
}

.article-album-sub ul, dl {
	list-style: none;
}

.article-album-sub ul, .article-album-sub li, .article-album-sub dt,
	.article-album-sub dd, .article-album-sub dl {
	margin: 0;
	padding: 0;
	font-size: 13px;
}

.article-album-sub li {
	overflow: hidden;
	float: left;
	position: relative;
	width: 200px;
	height: 300px;
	margin-left: 32px;
}

.article-album-sub .album-img {
	display: block;
	width: 200px;
	height: 200px;
}

.article-album-sub a {
	color: inherit;
	text-decoration: none;
}

.article-album-sub img {
	vertical-align: top;
	border: 0;
	aspect-ratio: 200/200;
}

.article-album-sub dl {
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

.article-album-sub dt {
	display: table;
	padding-top: 8px;
}

.article-album-sub .tit {
	color: #222;
}

.article-album-sub dt a {
	display: table-cell;
	font-size: 13px;
	font-weight: bold;
	vertical-align: top;
}

.article-album-sub .tit .inner {
	display: table;
	table-layout: fixed;
}

.article-album-sub .tit .ellipsis {
	display: block;
	display: -webkit-box;
	overflow: hidden;
	text-overflow: ellipsis;
	-webkit-line-clamp: 1;
	-webkit-box-orient: vertical;
	max-height: 18px;
	white-space: normal;
	word-break: break-all;
	word-wrap: break-word;
	word-break: break-word;
}

.article-album-sub .p-nick {
	position: relative;
	padding-top: 7px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.article-album-sub dd .pers_nick_area span {
	color: #666;
}

.article-album-sub .date_num {
	color: #999;
}

.article-album-sub .num {
	padding-left: 5px;
}

.m-tcol-p .num {
	color: #ff2f3b;
}
/*=============== notice(show3) ===============*/
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

/* ================= 하단 버튼 ================= */
.article-album-sub .row {
	width: auto;
	display: flex;
	justify-content: end;
}

.btn-light {
	background-color: #ada7e4;
}

.board-list-footer .col .btn-light, .board-list-footer .row .col-auto .btn-light,
	.board-list-footer .row i {
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
					<h1 class="submenu-main">Community</h1>
					<h3>
						<a>Community</a>
					</h3>
					<ul>
						<li class=""><a
							href="${pageContext.request.contextPath}/recommend/list">&gt;
								추천 코스</a></li>
						<li class="eq1"><a
							href="${pageContext.request.contextPath}/made/list">&gt; 유저가
								만든 코스</a></li>
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
					<a>유저가 만든 코스<span>| Course created by the User</span></a> <span><a
						href="${pageContext.request.contextPath}/">home</a> &gt; community
						&gt; 유저가 만든 코스</span>
				</h1>
			</div>

			<div class="show1">
				<div class="output-type">

					<div class="sort_form">
						<a href="#" onclick="" class="sort_card "><span class="blind"><i
								class="fa-solid fa-server fa-2x sort-color show-1"></i></span></a> <a
							href="#" onclick="" class="sort_album "><span class="blind"><i
								class="fa-solid fa-border-all fa-2x show-2"></i></span></a> <a href="#"
							onclick="" class="sort_list "><span class="blind"><i
								class="fa-solid fa-list-ul fa-2x show-3"></i></span></a>
					</div>
				</div>



				<div class="notice-container">
					<ul class="article-movie-sub">
						<li>
							<div class="card_area">
								<div class="con">
									<div class="con_top">
										<div class="tit_area">
											<a href="#" class="tit"> <span class="inner"> <strong>제목입니당</strong>
											</span>
											</a>
										</div>
										<a href="#" class="txt">세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부
											설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분
											입니다~~~세부설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분
											입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~ </a>
									</div>

									<div class="con_bottom">
										<div class="user_info">
											<div class="pers_nick_area">
												<table role="presentation">
													<tbody>
														<tr>
															<td class="p-nick"><a class="m-tcol-c" onclick="">관리자</a>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
											<div class="date_num">
												<span class="date">2021.12.31</span> <span class="num">조회수
													2,509</span> <span class="comment_ico">댓글</span> <em class="num">7</em>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="movie-img">
								<a href="#"> <img
									src="${pageContext.request.contextPath}/resources/images/hiking.png"
									width="200" height="120" alt="썸네일 이미지"> <span class="num">7<span
										class="blind">개의 추가 이미지가 있습니다</span></span>
								</a>
							</div>
						</li>


					</ul>
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
										<option value="writer">작성자</option>
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

									<button type="button" class="btn btn-light"
										onclick="searchList()">글올리기</button>
								</div>
							</form>
						</div>
					</div>
					
					
				</div>
			</div>



			<div class="show2">
				<div class="output-type">

					<div class="sort_form">

						<a href="#" onclick="" class="sort_card "><span class="blind"><i
								class="fa-solid fa-server fa-2x show-1"></i></span></a> <a href="#"
							onclick="" class="sort_album "><span class="blind"><i
								class="fa-solid fa-border-all fa-2x sort-color show-2"></i></span></a> <a
							href="#" onclick="" class="sort_list "><span class="blind"><i
								class="fa-solid fa-list-ul fa-2x show-3"></i></span></a>
					</div>
				</div>


				<div class="notice-container">

					<div class="section">
						<div class="article-album-sub">
							<ul>
								<li><a href="#" class="album-img"> <img width="200"
										height="200"
										src="${pageContext.request.contextPath}/resources/images/hiking.png"
										alt="">
								</a>

									<dl>
										<dt>
											<a href="#" class="tit"> <span class="inner"> <span
													class="ellipsis">데일리룩</span>
											</span>
											</a> <a href="#" class="m-tcol-p"> <span class="num">[7]</span>
											</a>
										</dt>

										<dd class="p-nick">
											<div class="pers_nick_area">
												<span>작성자</span>
											</div>
										</dd>

										<dd class="date_num">
											<span class="date">2023-11-11</span> <span class="num">조회:
												8</span>
										</dd>
									</dl></li>
							</ul>
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
												<option value="writer">작성자</option>
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

											<button type="button" class="btn btn-light"
												onclick="searchList()">글올리기</button>
										</div>
									</form>
								</div>
							</div>


						</div>
					</div>
				</div>
			</div>


			<div class="show3">
				<div class="output-type">

					<div class="sort_form">
						<a href="#" onclick="" class="sort_card "><span class="blind"><i
								class="fa-solid fa-server fa-2x show-1"></i></span></a> <a href="#"
							onclick="" class="sort_album "><span class="blind"><i
								class="fa-solid fa-border-all fa-2x show-2"></i></span></a> <a href="#"
							onclick="" class="sort_list "><span class="blind"><i
								class="fa-solid fa-list-ul fa-2x sort-color show-3"></i></span></a>
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
										<option value="writer">작성자</option>
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

									<button type="button" class="btn btn-light"
										onclick="searchList()">글올리기</button>
								</div>
							</form>
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
	
	
	$(document).ready(function() {
		$('.show1').show(); //페이지를 로드할 때 표시할 요소
		$('.show2').hide(); //페이지를 로드할 때 숨길 요소
		$('.show3').hide(); //페이지를 로드할 때 숨길 요소
		
		$('.show-1').click(function(){
			$ ('.show2').hide(); //클릭 시 두 번째 요소 숨김
			$ ('.show3').hide(); //클릭 시 세 번째 요소 숨김
			$ ('.show1').show(); //클릭 시 첫 번째 요소 표시
			return false;
		});
		
		$('.show-2').click(function(){
			$ ('.show3').hide(); //클릭 시 세 번째 요소 숨김
			$ ('.show1').hide(); //클릭 시 첫 번째 요소 숨김
			$ ('.show2').show(); //클릭 시 두 번째 요소 표시
			return false;
			});
		
		$('.show-3').click(function(){
			$ ('.show1').hide(); //클릭 시 첫 번째 요소 숨김
			$ ('.show2').hide(); //클릭 시 두 번째 요소 숨김
			$ ('.show3').show(); //클릭 시 세 번째 요소 표시
			return false;
			});
	});
</script>