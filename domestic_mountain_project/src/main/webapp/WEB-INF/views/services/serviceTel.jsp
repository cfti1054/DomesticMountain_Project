<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
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

.amain-main>span {
	font-size: 18px;
	color: gray;
	margin: 10px 0 0 20px;
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

.tb_p_info {
	width: 100%;
	margin-top: 15px;
	border-top: 1px solid #888;
}

table {
	width: 100%;
	border-spacing: 0;
	border-collapse: collapse;
}

tbody {
	display: table-row-group;
	vertical-align: middle;
	border-color: inherit;
}

tr {
	display: table-row;
	vertical-align: inherit;
	border-color: inherit;
}

.tb_p_info tbody tr th {
	font-size: 13px;
	color: #444;
	font-weight: bold;
	text-align: center;
	vertical-align: middle;
	padding: 10px;
	border-right: 1px solid #e0e0e0;
	border-bottom: 1px solid #e0e0e0;
	background: #eee;
}

.tb_p_info tbody tr td {
	font-size: 13px;
	color: #444;
	vertical-align: middle;
	letter-spacing: -.5px;
	line-height: 20px;
	padding: 5px 10px;
	border-right: 1px solid #e0e0e0;
	border-bottom: 1px solid #e0e0e0;
}

caption {
	display: block;
	position: absolute;
	left: -9999px;
}
.tb_p_info.tb_vertical.tb_vert_bold tbody tr td a {
    transition: 0.2s;
}

.tb_p_info.tb_vertical.tb_vert_bold tbody tr.info_topnum td {
    font-weight: bold;
    border-right: 0;
    text-align: center;
    background: #eee;
}

.tb_p_info.tb_vertical.tb_vert_bold tbody tr td:last-child {
    text-align: center;
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
							href="${pageContext.request.contextPath}/services/qna">&gt;
								Qna</a></li>
						<li class=""><a
							href="${pageContext.request.contextPath}/services/faq">&gt;
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
						<li class="eq1"><a
							href="${pageContext.request.contextPath}/services/serviceTel">&gt;
								서비스 전화번호안내</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="contentWrap">
			<div class="amain">
				<h1 class="amain-main">
					서비스 전화번호안내<span>| Service phone number Information</span>
				</h1>

				<h3 class="ft_org17">1. 신문 관련 문의</h3>
				<table summary="서비스 제공을 위한 정보 제공에 대한 동의"
					class="tb_p_info tb_vertical">
					<caption>서비스 제공을 위한 정보 제공에 대한 동의</caption>
					<colgroup>
						<col width="30%">
						<col width="70%">
					</colgroup>
					<tbody>
						<tr>
							<th>신문 내용 관련 문의</th>
							<td>02-####-####</td>
						</tr>
						<tr>
							<th>신문 구독 및 e신문 문의</th>
							<td>02-####-####</td>
						</tr>
					</tbody>
				</table>
				<br> <br>
				<h3 class="ft_org17">2. 인터넷 서비스 문의</h3>
				<table summary="서비스 제공을 위한 정보 제공에 대한 동의"
					class="tb_p_info tb_vertical tb_vert_bold">
					<caption>서비스 제공을 위한 정보 제공에 대한 동의</caption>
					<colgroup>
						<col width="30%">
						<col width="">
						<col width="15%">
					</colgroup>
					<tbody>
						<tr class="info_topnum">
							<td colspan="2"></td>
							<td>국번 (02)####</td>
						</tr>
						<tr>
							<th rowspan="4">서비스 일반</th>
							<td>회원정보 수정 관련</td>
							<td><a href="#"> <span>바로가기</span><i
									class="ic"></i>
							</a></td>
						</tr>
						<tr>
							<td>회원제 관련</td>
							<td>2148</td>
						</tr>
						<tr>
							<td>인터넷 기사 내용 및 수정 관련</td>
							<td>5761</td>
						</tr>
						<tr class="tb_lastinfo">
							<td>이메일 수신(거부) 관련</td>
							<td>5##4</td>
						</tr>
						<tr>
							<th rowspan="3">마케팅</th>
							<td>광고</td>
							<td>5##4</td>
						</tr>
						<tr>
							<td>저작권 (<a
								href="#"
								target="_new"><span style="color: #FE9727">콘텐츠 구매신청서</span></a>)
							</td>
							<td>5##7</td>
						</tr>
						<tr class="tb_lastinfo">
							<td>제휴문의</td>
							<td>5##3</td>
						</tr>
						<tr>
							<th rowspan="3">부동산</th>
							<td>컨텐츠 / 서비스</td>
							<td>5##8</td>
						</tr>
						<tr>
							<td>중개업소회원</td>
							<td>5##8</td>
						</tr>
						<tr class="tb_lastinfo">
							<td>건설분양 홍보 및 제휴</td>
							<td>5##8</td>
						</tr>
						<tr>
							<th rowspan="5">콘텐츠</th>
							<td>금융 / 생애설계</td>
							<td>5##3</td>
						</tr>
						<tr>
							<td>스타투데이 / 포토</td>
							<td>2##1</td>
						</tr>
						<tr>
							<td>헬스</td>
							<td>5##3</td>
						</tr>
						<tr>
							<td>여행 / 골프 / 북 / 자동차</td>
							<td>5##5</td>
						</tr>
						<tr class="tb_lastinfo">
							<td>독서클럽 / 북다이제스트</td>
							<td>2##1</td>
						</tr>
						<tr>
							<th rowspan="3">교육</th>
							<td>교육과정 신청 / 대관 / 고용보험</td>
							<td>5##9</td>
						</tr>
						<tr>
							<td>교육과정 개발 / 위탁 / 제휴</td>
							<td>2##9</td>
						</tr>
						<tr class="tb_lastinfo">
							<td>해외 MBA / ABA 교육</td>
							<td>5##3</td>
						</tr>
					</tbody>
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