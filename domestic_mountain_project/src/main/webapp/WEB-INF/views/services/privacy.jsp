<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>

/*=============== body (area) ===============*/
.features-1 {
	height: 4000px; /* 수정 시 auto로 바꾸고 해야함 */
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

.eq1 {
	font-weight: 900;
}

.aside-box .aside ul .eq1 a {
	color: hsl(212, 75%, 56%);
}

.bx-intext1 {
	margin-top: 30px;
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
						<li class="eq1"><a
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
					<a>개인정보처리방침<span>| Privacy Policy</span></a>
					<span><a href="${pageContext.request.contextPath}/">home</a> &gt; services &gt; privacy</span>
				</h1>

				<div class="bx-intext1">
					@@@의 통합사이트 운영사인 @@@과 관계사인 @@@, @@@(이하 운영사 및 관계사를 통칭
					“당사”라고 함)는 고객의 개인정보를 매우 중요시하고, 고객께서 당사의 서비스를 이용과 동시에 당사에 제공한 개인정보가
					보호받을 수 있도록 최선을 다하고 있습니다. <br> <br> 당사는 개인정보처리방침을 통하여 고객께서
					제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치가 취해지고 있는지
					알려드립니다. <br> <br> 당사는 개인정보처리방침을 홈페이지 첫 화면에 공개함으로써 이용자가
					언제나 용이하게 확인할 수 있도록 조치하고 있습니다. <br> <br> 당사는 개인정보보호 관련 주요
					법률인 “개인정보보호법”, “정보통신망 이용촉진 및 정보보호 등에 관한 법률”(이하 “정통망법”이라 함) 및 기타 관련
					법규를 준수하고 있습니다. 이에 대해 관련 법률에 의거하여 “개인정보처리방침”을 정하여 사내에 비치하고,
					홈페이지(www.@@@@@@.co.kr) 첫 화면 게시를 통하여 당사가 고객의 개인정보보호를 위하여 어떤 조치를 취하고 있는지를
					공개하여 이용자가 언제나 용이하게 열람하고 확인할 수 있도록 하고 있습니다. <br> <br> 또한
					당사가 개인정보처리방침을 변경할 경우에는 변경일자를 포함한 제반 내용을 공지사항(알림) 등을 통해 홈페이지에 공지하여
					접속한 이용자가 쉽게 확인할 수 있도록 하고 있으며, 사내에 변경된 내용을 게시하고 비치하여 방문 고객들이 언제나 쉽게
					변경된 내용을 확인할 수 있도록 적절한 조치를 취하고 있습니다. <br> <br> 당사의
					개인정보처리방침은 다음과 같은 내용을 담고 있습니다. <br> <br>
				</div>

				<div class="bx_inner">
					<ul class="list_style">
						<li><a href="#p_info1">1. 개인정보 수집•이용 등에 대한 동의</a></li>
						<li><a href="#p_info2">2. 서비스 제공을 위한 정보제공에 대한 동의</a></li>
						<li><a href="#p_info3">3. 개인정보의 제3자 제공</a></li>
						<li><a href="#p_info4">4. 개인정보의 보유 및 이용기간</a></li>
						<li><a href="#p_info5">5. 미이용자의 개인정보 파기 등에 관한 조치</a></li>
						<li><a href="#p_info6">6. 개인정보의 파기 및 절차방법</a></li>
						<li><a href="#p_info7">7. 이용자 및 법정 대리인의 권리와 그 행사방법</a></li>
						<li><a href="#p_info8">8. 만 14세 미만 아동의 개인정보 처리에 관한 사항</a></li>
						<li><a href="#p_info9">9. 개인정보의 안전성 확보조치에 관한 사항</a></li>
						<li><a href="#p_info10">10. 개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항</a></li>
						<li><a href="#p_info11">11. 개인정보보호 책임자와 관리자</a></li>
						<li><a href="#p_info12">12. 개인정보의 열람청구를 접수•처리하는 부서</a></li>
						<li><a href="#p_info13">13. 정책 변경에 따른 공지의무</a></li>
					</ul>
				</div>


				<h3 id="p_info1" class="ft_org17">1. 개인정보 수집•이용 등에 대한 동의</h3>
				<p class="ft_gray15">당사의 ‘개인정보처리방침’에 따른 고객의 개인정보 수집, 이용, 취급 위탁 및
					제3자 제공 등에 대한 고객동의는 ‘가입신청서’ 등에 첨부된 ‘개인정보의 수집, 이용 동의서’에 기재된 세부 내용을
					숙지하시고 동의서에 서명하시거나 회원관리팀의 전화 상담 경우에는 상담원의 안내에 따라 당사의
					홈페이지(https://www.@@@@@@.co.kr)에 게시된 ‘개인정보처리방침’을 숙지하신 후 전화상으로 본인이 동의 의사를
					표명하는 방법, 우편 또는 모사전송을 통해 이용자가 동의내용에 서명, 날인 후 제출하는 방법 등 관련 법령이 정하는
					동의방법 중 하나를 선택하실 수 있습니다.
				</p>

				<h3 id="p_info2" class="ft_org17">2. 서비스 제공을 위한 정보 제공에 대한 동의</h3>
				<p class="ft_gray15">
					<strong>가. 개인정보 수집항목 및 이용목적</strong><br> <br> 이용자는 회원 가입을
					하지 않아도 정보 검색, 뉴스 보기 등 대부분의 매경미디어그룹 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가
					@@@신문, @@@TEST, @@@TEST, 증권 실시간 주가 정보, PDF 보기 등 개인화 혹은 유료 회원 서비스를
					이용하기 위해 회원가입을 할 경우 매경미디어그룹은 회원 가입 의사의 확인, 연령 확인, 법정대리인 동의 진행, 이용자 및
					법정대리인의 본인확인, 이용자 식별 및 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다. 필수 항목에 해당하는
					정보를 입력하시지 않는 경우 회원가입이 불가능하나, 선택 항목에 해당하는 정보를 입력하지 않으셔도 회원가입 및 서비스
					이용에는 제한이 없습니다.<br> <br> 
					1) @@@ 통합회원으로 가입하시면 @@@, @@@, @@@의 회원이 되며 하나의 아이디로 이용할 수 있습니다.<br> <br> 
					2) 당사는 회원가입, 회원 서비스 이용, 회원 상담 등 원활한 서비스 제공을 위해 아래와 같이 최소한의 개인정보를 필수 항목으로
					수집하고 있습니다.<br>
				</p>
				
				<h3 id="p_info3" class="ft_org17">3. 개인정보의 제3자 제공</h3>
				<p class="ft_gray15">
					작성 예시
				</p>
				
				<h3 id="p_info4" class="ft_org17">4. 개인정보의 보유 및 이용기간</h3>
				<p class="ft_gray15">
					작성 예시
				</p>
				
				<h3 id="p_info5" class="ft_org17">5. 미이용자의 개인정보 파기 등에 관한 조치</h3>
				<p class="ft_gray15">
					작성 예시
				</p>
				
				<h3 id="p_info6" class="ft_org17">6. 개인정보의 파기 및 절차방법</h3>
				<p class="ft_gray15">
					작성 예시
				</p>
				
				<h3 id="p_info7" class="ft_org17">7. 이용자 및 법정 대리인의 권리와 그 행사방법</h3>
				<p class="ft_gray15">
					작성 예시
				</p>
				
				<h3 id="p_info8" class="ft_org17">8. 만 14세 미만 아동의 개인정보 처리에 관한 사항</h3>
				<p class="ft_gray15">
					작성 예시
				</p>
				
				<h3 id="p_info9" class="ft_org17">9. 개인정보의 안전성 확보조치에 관한 사항</h3>
				<p class="ft_gray15">
					작성 예시
				</p>
				
				<h3 id="p_info10" class="ft_org17">10. 개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항</h3>
				<p class="ft_gray15">
					작성 예시
				</p>
				
				<h3 id="p_info11" class="ft_org17">11. 개인정보보호 책임자와 관리자</h3>
				<p class="ft_gray15">
					작성 예시
				</p>
				
				<h3 id="p_info12" class="ft_org17">12. 개인정보의 열람청구를 접수•처리하는 부서</h3>
				<p class="ft_gray15">
					작성 예시
				</p>
				
				<h3 id="p_info13" class="ft_org17">13. 정책 변경에 따른 공지의무</h3>
				<p class="ft_gray15">
					작성 예시
				</p>
				
				



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