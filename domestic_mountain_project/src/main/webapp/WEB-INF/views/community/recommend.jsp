<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v6.4.2/css/all.css">


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
	box-shadow: 3px 3px 3px 3px gray;
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
	border-radius: 3.8em;
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
							href="${pageContext.request.contextPath}/community/recommend">&gt;
								추천 코스</a></li>
						<li class=""><a
							href="${pageContext.request.contextPath}/community/made">&gt;
								유저가 만든 코스</a></li>
						<li class=""><a href="#"></a></li>
						<li class=""><a
							href="${pageContext.request.contextPath}/community/together">&gt;
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
					<a>추천 코스<span>| Recommended course</span></a> <span><a
						href="${pageContext.request.contextPath}/">home</a> &gt; community
						&gt; 추천코스</span>
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