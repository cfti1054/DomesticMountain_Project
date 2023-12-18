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

.article-album-sub {
    margin-top: 50px;
}

.article-album-sub ul, dl {
    list-style: none;
}

.article-album-sub ul, 
.article-album-sub li, 
.article-album-sub dt, 
.article-album-sub dd, 
.article-album-sub dl {
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
    aspect-ratio: 200 / 200;
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
						<li class=""><a
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
						<li class=""><a href="#">&gt; 유용한 정보</a></li>
					</ul>

					<h3>
						<a>Walk &amp; Climbing</a>
					</h3>
					<ul>
						<li class="eq1"><a href="${pageContext.request.contextPath}/appearance/list">&gt; 회원들의 모습</a></li>
					</ul>

					<h3>
						<a>Look &amp; Style</a>
					</h3>
					<ul>
						<li class=""><a href="${pageContext.request.contextPath}/ootd/list">&gt; 스트릿 스냅 (OOTD)</a></li>
					</ul>

				</div>
			</div>
		</div>

		<div class="contentWrap">
			<div class="amain">
				<h1 class="amain-main">
					<a>회원들의 모습<span>| Members' Appearance</span></a> <span><a
						href="${pageContext.request.contextPath}/">home</a> &gt; community
						&gt; 회원들의 모습</span>
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

				<div class="section">
					<div class="article-album-sub">
						<ul>



							<li><a href="#" class="album-img"> <img width="200"
									height="200" src="${pageContext.request.contextPath}/resources/images/hiking.png" alt="">
							</a>

								<dl>
									<dt>
										<a href="#" class="tit"> <span class="inner"> <span
												class="ellipsis">데일리룩</span>
										</span>
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





							<li><a href="#"> <img width="200" height="200"
									src="${pageContext.request.contextPath}/resources/images/bg-image.png" alt="">
							</a>

								<dl>
									<dt>
										<a href="#"> <span class="inner">오늘의 데일리룩</span>
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


							<li><a href="#"> <img width="200" height="200"
									src="${pageContext.request.contextPath}/resources/images/climbing.png" alt="">
							</a>

								<dl>
									<dt>
										<a href="#"> <span class="inner">오늘의 데일리룩</span>
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


							<li><a href="#"> <img width="200" height="200"
									src="${pageContext.request.contextPath}/resources/images/hiking.png" alt="">
							</a>

								<dl>
									<dt>
										<a href="#"> <span class="inner">오늘의 데일리룩</span>
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



							<li><a href="#"> <img width="200" height="200"
									src="${pageContext.request.contextPath}/resources/images/hiking.png" alt="">
							</a>

								<dl>
									<dt>
										<a href="#"> <span class="inner">오늘의 데일리룩</span>
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