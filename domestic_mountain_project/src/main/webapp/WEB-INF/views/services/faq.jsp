<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>

</head>

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

.faq {
	background-color: transparent;
	border: 1px solid #9fa4a8;
	border-radius: 10px;
	margin: 20px 0;
	padding: 30px;
	position: relative;
	overflow: hidden;
	transition: 0.3s ease;
}

.faq.active {
	background-color: #fff;
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1), 0 3px 6px rgba(0, 0, 0, 0.1);
}

.faq.active::before, .faq.active::after {
	content: '\f075';
	font-family: 'Font Awesome 5 Free';
	color: #2ecc71;
	font-size: 7rem;
	position: absolute;
	opacity: 0.2;
	top: 20px;
	left: 20px;
	z-index: 0;
}

.faq.active::before {
	color: #3498db;
	top: -10px;
	left: -30px;
	transform: rotateY(180deg);
}

.faq-title {
	margin: 0 35px 0 0;
}

.faq-text {
	display: none;
	margin: 30px 0 0;
}

.faq.active .faq-text {
	display: block;
}

.faq-toggle {
	background-color: transparent;
	border: 0;
	border-radius: 50%;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 16px;
	padding: 0;
	position: absolute;
	top: 30px;
	right: 30px;
	height: 30px;
	width: 30px;
}

.faq-toggle:focus {
	outline: 0;
}

.faq-toggle .fa-times {
	display: none;
}

.faq.active .faq-toggle .fa-times {
	color: #fff;
	display: block;
}

.faq.active .faq-toggle .fa-chevron-down {
	display: none;
}

.faq.active .faq-toggle {
	background-color: #9fa4a8;
}

.eq1 {
	  font-weight: 900;
}
.aside-box .aside ul .eq1 a {
	color: hsl(212, 75%, 56%);

}
</style>

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
						<li class=""><a href="${pageContext.request.contextPath}/services/qna">&gt; Qna</a></li>
						<li class="eq1"><a href="${pageContext.request.contextPath}/services/faq">&gt; Faq</a></li>
					</ul>

					<h3>
						<a>서비스 이용 안내</a>
					</h3>
					<ul>
						<li class=""><a href="${pageContext.request.contextPath}/services/privacy">&gt; 개인정보처리방침</a></li>
						<li class=""><a href="${pageContext.request.contextPath}/services/policy">&gt; 이용약관</a></li>
						<li class=""><a href="${pageContext.request.contextPath}/services/comment">&gt; 댓글 운영정책</a></li>
						<li class=""><a href="${pageContext.request.contextPath}/services/serviceTel">&gt; 서비스 전화번호안내</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="contentWrap">
			<div class="amain">
				<h1 class="amain-main">
					<a>Faq<span>| Frequently Asked Questions</span></a>
					<span><a href="${pageContext.request.contextPath}/">home</a> &gt; services &gt; faq</span>
				</h1>





				<form action="#">
					<label for="lang">원하는 항목 선택</label> <select name="select" id="lang">
						<option value="all">all</option>
						<option value="select2">항목2</option>
						<option value="select3">항목3</option>
						<option value="select4">항목4</option>
					</select> 
					<input type="submit" value="submit" />
				</form>

				<!-- 항목 선택에 따라 원하는 질문 출력할 수 있도록 작성해야함 -->

				<div class="faq">
					<h3 class="faq-title">자주 묻는 질문 1</h3>

					<p class="faq-text">대답 1</p>

					<button class="faq-toggle">
						<i class="fas fa-chevron-down"></i> <i class="fas fa-times"></i>
					</button>
				</div>





			</div>
		</div>

	</div>
</section>
<script>
	// 사이드 메뉴 스크롤에 따라다니기
	$(document).ready(function() {
		var currentPosition = parseInt($("#scroll").css("top"));
		$(window).scroll(function() {
			var position = $(window).scrollTop();
			$("#scroll").stop().animate({
				"top" : position + currentPosition + "px"
			}, 500);
		});
	});
	
	// faq 오른쪽 고리 누르면 내용 나옴
	const toggles = document.querySelectorAll(".faq-toggle");

	toggles.forEach((toggle) => {
	  toggle.addEventListener("click", () => {
	    toggle.parentNode.classList.toggle("active");
	  });
	});
</script>