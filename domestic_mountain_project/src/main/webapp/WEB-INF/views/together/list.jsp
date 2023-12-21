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

.page-navigation {
	text-align: center;
	clear: both;
}
/*=============== 디자인 ===============*/

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

.article-movie-sub ul, 
.article-movie-sub li, 
.article-movie-sub ol, 
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
.article-movie-sub .user_info .pers_nick_area > table {
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
.article-movie-sub .user_info .date,
.article-movie-sub .user_info .num {
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
.article-movie-sub .card_area {
	display: table;
    position: relative;
    width: 100%;
    table-layout: fixed;
}

.article-movie-sub .movie-img {
    display: table-cell;
    position: relative;
    width: 120px;
    height: 120px;
    padding-left: 35px;
    vertical-align: top;
}
.article-movie-sub .movie-img a {
	display: block;
    position: relative;
    height: 100%;
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
    bottom: 7px;
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
    clip: rect(0 0 0 0);
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
						<li class="eq1"><a
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
					<a>동행 산행 신청<span>| An application for a hike Together</span></a> <span><a
						href="${pageContext.request.contextPath}/">home</a> &gt; community
						&gt; 동행 산행 신청</span>
				</h1>
			</div>


			<div class="search-f">
				<div class="search-body">
					<input type="text" placeholder="검색어 입력">
					<button>검색</button>
				</div>

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
									<a href="#" class="txt">세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분
										입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분
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
											<span class="date">2021.12.31</span> <span class="num">조회수 2,509</span> 
											<span class="comment_ico">댓글</span> 
											<em class="num">7</em>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="movie-img">
							<a href="#"> <img src="${pageContext.request.contextPath}/resources/images/hiking.png" width="200"
								height="120" alt="썸네일 이미지"> <span class="num">7<span
									class="blind">개의 추가 이미지가 있습니다</span></span>
							</a>
						</div>
					</li>
					
					
					<li>
						<div class="card_area">
							<div class="con">
								<div class="con_top">
									<div class="tit_area">
										<a href="#" class="tit"> <span class="inner"> <strong>제목입니당</strong>
										</span>
										</a>
									</div>
									<a href="#" class="txt">세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분
										입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분
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
											<span class="date">2021.12.31</span> <span class="num">조회수 2,509</span> 
											<span class="comment_ico">댓글</span> 
											<em class="num">7</em>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="movie-img">
							<a href="#"> <img src="${pageContext.request.contextPath}/resources/images/hiking.png" width="200"
								height="120" alt="썸네일 이미지"> <span class="num">7<span
									class="blind">개의 추가 이미지가 있습니다</span></span>
							</a>
						</div>
					</li>
					
					<li>
						<div class="card_area">
							<div class="con">
								<div class="con_top">
									<div class="tit_area">
										<a href="#" class="tit"> <span class="inner"> <strong>제목입니당</strong>
										</span>
										</a>
									</div>
									<a href="#" class="txt">세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분
										입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분
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
											<span class="date">2021.12.31</span> <span class="num">조회수 2,509</span> 
											<span class="comment_ico">댓글</span> 
											<em class="num">7</em>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="movie-img">
							<a href="#"> <img src="${pageContext.request.contextPath}/resources/images/hiking.png" width="200"
								height="120" alt="썸네일 이미지"> <span class="num">7<span
									class="blind">개의 추가 이미지가 있습니다</span></span>
							</a>
						</div>
					</li>
					
					<li>
						<div class="card_area">
							<div class="con">
								<div class="con_top">
									<div class="tit_area">
										<a href="#" class="tit"> <span class="inner"> <strong>제목입니당</strong>
										</span>
										</a>
									</div>
									<a href="#" class="txt">세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분
										입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분 입니다~~~세부 설명부분
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
											<span class="date">2021.12.31</span> <span class="num">조회수 2,509</span> 
											<span class="comment_ico">댓글</span> 
											<em class="num">7</em>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="movie-img">
							<a href="#"> <img src="${pageContext.request.contextPath}/resources/images/hiking.png" width="200"
								height="120" alt="썸네일 이미지"> <span class="num">7<span
									class="blind">개의 추가 이미지가 있습니다</span></span>
							</a>
						</div>
					</li>
				</ul>
				<div class="page-navigation">1 2 3</div>
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