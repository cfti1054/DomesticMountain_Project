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

.ft_org17 {
	color: #f47900;
	font-size: 20px;
	font-weight: 700;
	margin-top: 50px;
}

.ft_gray15 {
	font-size: 15px;
	font-weight: 400;
	line-height: 24px;
	padding-top: 20px;
}

.bx_intext1 {
	padding-top: 20px;
	padding-bottom: 20px;
	font-size: 15px;
	line-height: 27px;
}

.bx_inner {
	background: #fbfbfb;
	width: 100%;
	border: 1px solid #efefef;
	padding: 20px;
}

.bx_inner .list_style li {
	padding: 10px;
	font-weight: 500;
}

.bx_inner .list_style li a {
	color: #444;
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
						<li class=""><a
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
						<li class="eq1"><a
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
					<a>댓글 운영정책<span>| Comment operation Policy</span></a>
					<span><a href="${pageContext.request.contextPath}/">home</a> &gt; services &gt; comment</span>
				</h1>


				<p class="bx_intext1">@@@(이하 “회사”)에서는 다음과 같이 댓글 서비스를 관리 및 운영하고
					있습니다. 댓글 서비스 이용 중에 이용약관 및 운영정책을 위반할 경우, 사전통지 없이 서비스 이용이 제한될 수 있습니다.
					댓글 운영정책은 이용약관에 기반하고 있으며 기타 사항은 고객센터 문의를 이용해 주시길 바랍니다.</p>

				<div class="bx_wrap">
					<h3 class="ft_org17">1. 서비스 이용 제한 사유</h3>
					<div class="bx_inner">
						<ul class="list_style">
							<li>1. 회사 또는 제3자의 명예를 훼손하는 경우</li>
							<li>2. 회사 또는 제3자의 저작권 등 기타 권리를 침해하는 경우</li>
							<li>3. 외설 또는 폭력적인 메시지, 기타 관계법령 및 공서양속에 반하는 경우</li>
							<li>4. 제3자에게 피해가 발생하였거나 피해가 예상되는 경우</li>
							<li>5. 댓글 도배 등 부정한 용도로 서비스를 이용하는 경우</li>
							<li>6. 범죄행위를 목적으로 하거나 범죄행위를 교사한다고 판단되는 경우</li>
							<li>7. 기타 관계 법령을 위배한다고 판단되는 경우</li>
						</ul>
					</div>
				</div>

				<div class="bx_wrap">
					<h3 class="ft_org17">2. 회원 댓글 기능</h3>
					<p class="ft_gray15">
						<strong>가. 댓글 신고</strong>
					</p>
					<div class="bx_inner">
						<ul class="list_style">
							<li>- 회원은 다른 회원의 댓글을 신고할 수 있습니다. 신고된 댓글은 신고한 회원에 한해서 숨김 처리되며
								이는 복구할 수 없습니다.</li>
							<li>- 신고된 댓글은 이용약관 및 운영정책에 따라 처리됩니다.</li>
						</ul>
					</div>
					<p class="ft_gray15">
						<strong>나. 댓글 삭제</strong>
					</p>
					<div class="bx_inner">
						<ul class="list_style">
							<li>- 회원은 본인이 작성한 댓글을 삭제할 수 있습니다.</li>
							<li>- 삭제된 댓글의 답글은 작성자 또는 회사가 별도로 삭제하기 전까지 삭제되지 않습니다.</li>
						</ul>
					</div>
				</div>

				<div class="bx_wrap">
					<h3 class="ft_org17">3. 서비스 이용 제한</h3>
					<div class="bx_inner">
						<ul class="list_style">
							<li>- 회사는 비방 및 욕설, 광고 등 댓글에 부적합한 단어의 이용을 금지하고 있습니다.</li>
							<li>- 서비스 이용 제한은 누적 위반 횟수를 우선하여 처리하나 사안의 심각성에 따라 처리 기준이 달라질
								수 있습니다.</li>
							<li>- 회사는 회원의 IP 및 ID를 일시 또는 영구적으로 차단하여 서비스 이용을 제한할 수 있습니다.</li>
							<li>- 회사는 회원의 댓글을 삭제하여 게재된 댓글의 이용을 제한할 수 있습니다.</li>
							<li>- 회원은 ‘나의 댓글 관리’에서 누적 위반 횟수를 확인할 수 있습니다.</li>
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