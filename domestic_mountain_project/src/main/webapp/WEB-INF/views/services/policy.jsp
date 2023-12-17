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
	height: 5500px; /* 수정 시 auto로 바꾸고 해야함 */
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
						<li class=""><a
							href="${pageContext.request.contextPath}/services/privacy">&gt;
								개인정보처리방침</a></li>
						<li class="eq1"><a
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
					<a>이용약관<span>| Terms of Use</span></a>
					<span><a href="${pageContext.request.contextPath}/">home</a> &gt; services &gt; policy</span>
				</h1>

				<h3 class="ft_org17">제1장 총 칙</h3>
				<p class="ft_gray15">
					<strong>- 제1조 (목적)</strong>
					<br> 
					이 약관은 @@@의 통합사이트 운영사인 @@@과
					관계사인 @@@, @@@(이하”당사”라고 함)가 제공하는 인터넷 서비스(이하 서비스라 함)의 이용조건 및 절차에 관한
					사항을 규정함을 목적으로 합니다.
					<br> <br> 
					
					<strong>- 제2조 (용어의 정의)</strong>
					<br> 
					1. 회원 : 서비스를 제공받기 위하여 이 약관을 통하여 회사와 이용계약을 체결한 자<br>
					2. 아이디(ID): 회원 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 회사가 부여하는 문자와 숫자의 조합<br>
					3. 이용계약: 서비스를 제공받기 위하여 이 약관으로 회사와 회원 간에 체결하는 계약<br> 
					4. 비밀번호:
					회원의 비밀 보호를 위해 회원 자신이 설정한 문자와 숫자의 조합<br> 
					5. 이 약관에서 사용하는 용어의 정의는
					전항에서 정한 것을 제외하고는 거래관행 및 관계법령에 따릅니다.<br> <br> 
					
					<strong>- 제3조 (약관의 효력과 변경)</strong>
					<br> 
					1. 이 약관의 내용은 서비스 내에 게시하여 공시함으로써 효력이 발생합니다.<br> 
					2. 회사는 합리적인 사유가 발생한 경우 이 약관을 변경할 수 있으며 지체 없이 이를 공시합니다.<br> 
					단, 회원의 권리의무 등 중요한 규정의 변경은 최소 30일 전에 공시합니다.<br>
					3. 회원은 변경된 약관의 내용에 동의하지 않을 경우 서비스 이용을 중단하고 이용계약을 해지할 수 있습니다. 약관변경의
					효력발생 이후 계속적인 서비스 이용은 회원이 약관변경에 동의한 것으로 간주됩니다.<br> <br> 
					
					<strong>- 제4조 (약관 외 준칙)</strong>
					<br> 
					본 약관에 규정되지 않은 사항에 대해서는 관련 법령 또는 개별 서비스의
					운영정책 및 규칙, 개별 서비스 내 세부 하위서비스의 이용약관, 운영정책 및 규칙 등(이하 총칭하여 ‘세부지침’)의
					규정에 따릅니다. 또한 본 약관과 세부지침의 내용이 충돌할 경우 세부지침에 따릅니다.<br>
				</p>

				<h3 class="ft_org17">제2장 서비스 이용계약</h3>
				<p class="ft_gray15">
					<strong>- 제5조 (서비스의 구분)</strong>
					<br> 
					1. 회사가 회원에게 제공하는 서비스는 유료서비스 및 무료서비스로 구분되고, 각 서비스는 몇 개의 하위 서비스로 구분되어 제공될 수 있습니다.<br>
					2. 유료 서비스를 이용하기 위하여는 추가정보(주소, 결제방법 등)를 입력하고, 전송 확인 버튼을 누르는 등 별도의
					이용의사를 표시하여야 합니다. 기타 하위 서비스 등의 종류와 이용방법 등은 회사가 이 약관 또는 공지, 이용안내에서
					별도로 정하는 바에 따릅니다.<br> <br> 
					
					<strong>- 제6조 (이용계약의 성립)</strong>
					<br> 
					1. 이용계약은 회원의 이용신청에 대하여 회사가 승낙함으로써 성립합니다.<br> 
					2. 이용계약은 아이디 단위로 체결합니다.<br> <br> 
					
					<strong>- 제7조 (이용신청의 승낙)</strong>
					<br> 
					1. 회사는 이용신청이 다음 각호의1에 해당하는 경우 승낙을 하지 않을 수 있습니다.<br> 
					&nbsp;&nbsp;&nbsp; ① 타인 명의의 신청<br>
					&nbsp;&nbsp;&nbsp; ② 이용신청 시 기재사항을 허위로 하여 신청한 경우<br>
					&nbsp;&nbsp;&nbsp; ③ 이용신청자가 회사의 채무자로서 채무를 완제하지 않고 있는 경우<br>
					&nbsp;&nbsp;&nbsp; ④ 기타 이용신청자의 귀책사유로 이용승낙이 곤란한 경우<br> 
					
					2. 회사는 다음 각호의1에 해당하는 경우에는 그 사유가 해소될 때가지 이용승낙을 보류할 수 있습니다.<br>
					&nbsp;&nbsp;&nbsp; ① 설비의 여유가 없는 경우<br> 
					&nbsp;&nbsp;&nbsp; ② 기술상 또는 업무수행상 지장이 있는 경우<br> <br> 
					
					<strong>- 제8조 (회원 아이디 부여)</strong>
					<br> 
					1. 회사는 이용신청자에게 이용신청 순서에 따라 회원 아이디를 부여하는 것을 원칙으로 합니다.<br> 
					2. 다음 각호의1의 경우에는 회사는 이용신청자 또는 회원에게, 신청하는 아이디나 부여된 회원 아이디의 변경을 요구할 수 있습니다.<br> 
					&nbsp;&nbsp;&nbsp; ① 기존의 회원 아이디와 동일한 아이디로 이용 신청하는 경우<br> 
					&nbsp;&nbsp;&nbsp; ② 회원 아이디가 전화번호 또는 주민등록번호 등으로 등록되어 개인정보 침해의 우려가 있는 경우<br> 
					&nbsp;&nbsp;&nbsp; ③ 타인에게 혐오감을 주거나 미풍양속을 해치는 경우<br> 
					&nbsp;&nbsp;&nbsp; ④ 기타 합리적인
					사유가 있는 경우<br> <br> 
					<strong>- 제9조 (회원정보의 변경)</strong>
					<br>
					1. 회원은 회원정보관리 화면을 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다. 다만, 서비스 관리를
					위해 필요한 실명, 아이디 등은 수정이 불가능합니다.<br> 
					2. 회원은 회원가입신청 시 기재한 사항이
					변경되었을 경우 온라인으로 수정을 하거나 전자우편 및 기타 방법으로 회사에 대하여 그 변경사항을 알려야 합니다.<br>
					3. 제2항의 변경사항을 회사에 알리지 않아 발생한 불이익에 대하여 회사는 책임지지 않습니다.<br> <br>
					
					<strong>- 제10조 (개인정보보호 의무)</strong>
					<br> 
					"회사"는 "개인정보보호법", "정보통신망법" 등 관계 법령이 정하는 바에 따라 "회원"의 개인정보를 보호하기 위해 노력합니다. 개인정보의 보호 및
					사용에 대해서는 관련법 및 "회사"의 개인정보처리방침이 적용됩니다. 다만, "회사"의 공식 사이트 이외의 링크된 사이트에
					대해서는 "회사"의 개인정보처리방침이 적용되지 않습니다.<br>
				</p>

				<h3 class="ft_org17">제3장 계약당사자의 의무</h3>
				<p class="ft_gray15">
					<strong>- 제11조 (회사의 의무)</strong>
					<br> 
					1. 회사는 관련법과 이 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 계속적이고 안정적으로 서비스를 제공하기 위하여 최선을 다하여 노력합니다.<br>
					2. 회사는 회원이 안전하게 서비스를 이용할 수 있도록 개인정보보호를 위한 보안 시스템을 갖추어야 하며, 유지, 점검
					또는 복구 등의 조치를 성실히 이행하여야 합니다.<br> 
					3. 회사는 서비스의 제공과 관련하여 알게 된 회원의 개인정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않고 이를 보호하기 위하여 노력합니다. 회원의 개인정보보호에 관한
					기타의 사항은 개인정보보호법, 정보통신망법 및 회사가 별도로 정한 개인정보처리방침에 따릅니다.<br> 
					4. 회사는 회원으로부터 제기되는 불만이 정당하다고 인정할 경우에는 이를 즉시 처리함을 원칙으로 합니다. 회원이 제기한
					의견이나 불만사항에 대해서는 게시판을 활용하거나 전자우편 등을 통하여 회원에게 처리과정 및 결과를 전달합니다.<br>
					다만, 즉시 처리가 곤란한 경우에는 회원에게 그 사유와 처리 일정을 통보합니다.<br> 
					5. 개인정보의 관리책임자는 경영관리국/부장 이선형이며, 연락처는 02-@@@@-@@@@ / 이메일주소는 ####@####.com 입니다.<br> <br> 
					<strong>- 제12조 (회원의 의무)</strong>
					<br> 
					1. 회원은 관계법, 이 약관의 규정, 이용안내 및 서비스와 관련하여 공지한 주의사항, 회사가 통지하는 사항 등을 준수하여야 하며, 기타 회사의 업무에 방해되는 행위를 하여서는 안 됩니다.<br>
					2. 회원은 이용계약에 따라 요금 등을 지정된 기일까지 납입하여야 합니다.<br> 
					3. 회원은 다음 행위를 하여서는 안 됩니다.<br> 
					&nbsp;&nbsp;&nbsp; ① 신청 또는 변경 시 허위내용의 등록<br>
					&nbsp;&nbsp;&nbsp; ② 타인의 정보도용<br> 
					&nbsp;&nbsp;&nbsp; ③ 회사가 게시한 정보의 변경<br> 
					&nbsp;&nbsp;&nbsp; ④ 회사가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시<br> 
					&nbsp;&nbsp;&nbsp; ⑤ 회사와 기타 제3자의 저작권 등 지적재산권에 대한 침해<br> 
					&nbsp;&nbsp;&nbsp; ⑥ 회사 및 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위<br> 
					&nbsp;&nbsp;&nbsp; ⑦ 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 "서비스"에 공개 또는 게시하는 행위<br> 
					&nbsp;&nbsp;&nbsp; ⑧ 회사의 동의 없이 영리를 목적으로 "서비스"를 사용하는 행위<br> 
					&nbsp;&nbsp;&nbsp; ⑨ 기타 불법적이거나 부당한 행위<br> 
					4. 회원은 회원 ID 및 비밀번호를 철저히 관리하여야 하며, 관리소홀,
					부정사용 등에 의하여 발생하는 모든 결과에 대한 책임은 회원 본인이 부담하며, 회사는 이에 대한 어떠한 책임도 부담하지
					않습니다.<br> 
					5. 회원은 본인의 ID 및 비밀번호를 제3자에게 이용하게 하여서는 아니되며, 회원 본인의
					ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지하는 경우에는 즉시 비밀 번호를 변경하여야 하며, 해당
					사실을 회사에 통지하고 회사가 안내하는 바에 따라야 합니다.<br>
				</p>

				<h3 class="ft_org17">제4장 서비스 이용</h3>
				<p class="ft_gray15">
					<strong>- 제13조 (정보의 제공)</strong>
					<br> 
					회사는 회원이 서비스 이용 중 필요하다고 인정되는 다양한 정보를 공지사항이나 전자우편 등의 방법으로 회원에게 제공할 수 있습니다. 다만, 회원은 관련법에 따른
					거래관련 정보 및 고객문의 등에 대한 답변 등을 제외하고는 언제든지 전자우편에 대해서 수신을 거부할 수 있습니다.<br>
					<br>
					
					<strong>- 제14조 (서비스 이용시간)</strong>
					<br> 
					1. 서비스의 이용은 회사의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴, 1일24시간을 원칙으로 합니다. 다만 정기 점검 등의 필요로
					회사가 정한 일정이나 시간은 그러하지 않습니다.<br> 
					2. 회사는 서비스 별 이용가능 시간을 별도로 정할 수 있습니다. 이 경우 그 내용을 사전에 공지합니다.<br> <br> 
					
					<strong>- 제15조 (증권정보 서비스 이용)</strong>
					<br> 
					1. 회사의 증권관련 데이터와 서비스는 정보제공의 목적으로 제공되는
					것이며 실제 주식매매 거래를 위해 사용할 경우 정보의 오류 및 지연으로 인한 피해에 대해 회사는 어떠한 책임도 없습니다.<br>
					2. 증권정보 유료서비스 이용자의 경우 해지 신청 시 무료서비스 이용자로 전환되며, 결제 및 환불 등 이용요금에 대한
					처리는 회사가 이 약관 또는 공지, 이용안내에서 별도로 정하는 바 에 따릅니다.<br> <br> 
					
					<strong>- 제16조 (게시물 등의 관리)</strong>
					<br> 
					1. 회사는 회원이 본 서비스를 통하여 게시, 게재, 전자메일 또는 달리 전송한 내용물에 대해 일체 민형사상의 책임을 지지 않으며, 다음의 경우에 해당될 경우 사전통지 없이 삭제할 수 있습니다.<br>
					&nbsp;&nbsp;&nbsp; ① 타인의 권리를 침해하는 행위와 관련되거나, 그 행위를 구성하는 게시물, 자료로서
					이해 당사자의 삭제 등 요청이 있거나 회사가 피소, 고발될 수 있는 근거를 제공하는 게시물<br>
					&nbsp;&nbsp;&nbsp; ② 서비스에 위해를 가할 소지가 있는 바이러스 등이 포함된 게시물<br>
					&nbsp;&nbsp;&nbsp; ③ 게재기한을 초과한 게시물<br> 
					&nbsp;&nbsp;&nbsp; ④ 다른 회원의 서비스 이용에 현저한 지장을 초래하는 게시물<br> 
					2. 회원의 게시물이 정보통신망법 및 저작권법 등
					관련법에 위반되는 내용을 포함하는 경우, 권리자는 관련법이 정한 절차에 따라 해당 게시물의 게시중단 및 삭제 등을 요청할
					수 있으며, 회사는 관련법에 따라 조치를 취하여야 합니다. 
					3. 회사는 전항에 따른 권리자의 요청이 없는 경우라도
					권리침해가 인정될 만한 사유가 있거나 기타 회사 정책 및 관련법에 위반되는 경우에는 관련법에 따라 해당 게시물에 대해
					임시조치 등을 취할 수 있습니다.<br> <br> 
					
					<strong>- 제17조 (게시물에 대한 권리 및 책임)</strong><br> 
					1. 회사의 이름으로 게시된 모든 게시물에 대한 저작권은 회사에 귀속됩니다.
					회사의 허가 없이 타인에 의해 게시물이 다른 사이트에서 사용 또는 인용되는 것은 금지 됩니다.<br> 
					2. 회원이 게재한 게시물에 대한 저작권은 회원의 소유에 속합니다. 다만 회원은 회사에 무료로 이용할 수 있는 권리를 허락한
					것으로 봅니다.<br> 
					3. 전항의 의사 표시는 회사가 공지, 서비스 이용안내에서 정한 바에 따라 철회 할 수 있습니다.<br> <br> 
					<strong>- 제18조 (광고에 대한 동의)</strong>
					<br>
					회원은 회사가 광고, 정보 등을 회원에게 전자우편 등의 방법으로 송신하는 것에 대하여 별도(선택)로 동의합니다.<br>
				</p>

				<h3 class="ft_org17">제5장 이용제한 및 계약해지</h3>
				<p class="ft_gray15">
					<strong>- 제19조 (서비스 제공의 중지)</strong>
					<br> 
					1. 회사는 다음 각 호의 1에 해당하는 경우에는 사전통지 없이 이용계약을 해지하거나 회원의 서비스 이용을 일부 또는 전부 제한할 수 있습니다.<br>
					&nbsp;&nbsp;&nbsp; ① 서비스용 설비의 보수 등 공사로 인한 부득이한 경우<br>
					&nbsp;&nbsp;&nbsp; ② 전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를 중지했을 경우<br>
					&nbsp;&nbsp;&nbsp; ③ 기타 불가항력적 사유가 있는 경우<br> 
					2. 회사는 국가비상사태, 정전, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 때에는 서비스의 전부 또는 일부를
					제한하거나 정지할 수 있습니다.<br> <br> 
					
					<strong>- 제20조 (서비스 이용제한)</strong>
					<br> 
					1. 회사는 회원이 다음 각호의1에 해당하는 경우에는 회원의 서비스 이용을 일부 또는 전부 제한할 수 있습니다.<br> 
					&nbsp;&nbsp;&nbsp; ① 제12조 각항의 규정에 따른 의무를 이행하지 않는 경우<br> 
					&nbsp;&nbsp;&nbsp; ② 타인명의 신청 또는 허위의 신청, 중복가입인 것이 확인된 경우<br> 
					&nbsp;&nbsp;&nbsp; ③ 다량의 정보를 전송하여 서비스의 안정적 운영을 방해하는 경우<br>
					&nbsp;&nbsp;&nbsp; ④ 수신자의 의사에 반하는 광고성 정보, 전자우편을 지속적으로 전송하는 경우<br>
					&nbsp;&nbsp;&nbsp; ⑤ 정보통신설비의 오작동이나 정보 등의 파괴를 유발하는 컴퓨터 바이러스 등을 유포하는 경우<br> 
					&nbsp;&nbsp;&nbsp; ⑥ 타인의 지적재산권을 침해하는 경우<br>
					&nbsp;&nbsp;&nbsp; ⑦ 서비스를 이용하여 타인의 명예를 훼손하는 행위를 하는 경우<br>
					&nbsp;&nbsp;&nbsp; ⑧ 정보통신윤리위원회로부터의 이용제한 요구대상인 경우<br>
					&nbsp;&nbsp;&nbsp; ⑨ 선거관리위원회의 유권해석상의 불법선거운동을 하는 경우<br>
					&nbsp;&nbsp;&nbsp; ⑩ 다른 회원의 회원 아이디를 부정하게 사용하는 경우<br>
					&nbsp;&nbsp;&nbsp; ⑪ 서비스를 이용하여 얻은 정보를 회사의 동의 없이 상업적으로 이용하는 경우<br>
					&nbsp;&nbsp;&nbsp; ⑫ 전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를 중지하는 경우<br>
					2. 전항의 규정에 의하여 회원의 이용을 제한하는 경우의 제한의 종류 및 기간 등 구체적인 기준은 회사의 공지,
					이용안내에서 별도로 정하는 바에 의합니다.<br> <br> 
					
					<strong>- 제21조 (이용제한 및 해제절차)</strong>
					<br> 
					1. 회사는 사전 통지 없이 바로 전조의 이용제한 조치를 할 수 있습니다.<br>
					2. 회사로부터 이용제한 조치를 받은 회원은 회사에 이의를 제기할 수 있으며, 회사는 이의제기일로부터 7일 이내에 그
					사유를 회원에게 통지하여야 합니다.<br> 
					3. 회사는 이용제한 기간 중에 그 사유가 해소된 것이 확인된
					경우에는 제한조치를 즉시 해제합니다.<br> <br> 
					
					<strong>- 제22조 (인공지능 학습 및 대량 크롤링)</strong>
					<br> 
					1. 회사가 제공하는 제반 콘텐츠(외부 플랫폼에 유통된 콘텐츠 포함)
					및 온라인 서비스를 대상으로 자동화 도구(로봇, 매크로, 스파이더, 스크래퍼 등)를 활용하는 행위는 아래의 경우를
					제외하고 허용하지 않습니다.<br> 
					&nbsp;&nbsp;&nbsp; ① robots.txt 파일에 허용된 규칙에 따라 검색엔진의 색인을 생성하기 위한 목적인 경우<br> 
					&nbsp;&nbsp;&nbsp; ② 회사와의 적법한 계약에 따른 경우<br> 
					2. 회사를 통해 제공하는 콘텐츠와 온라인 서비스 내용을 인공지능(AI)
					학습데이터 등에 활용할 경우 회사와 사전에 반드시 합의해야 합니다. 특히 영리 목적의 경우 회사와 적법한 계약에 따라야
					합니다. 공익 및 비영리 목적인 경우에도 반드시 회사의 동의를 받아야 합니다.<br> 
					3. 인공지능 학습데이터 및 크롤링 등의 행위가 데이터 소유권과 콘텐츠 및 서비스 저작권 침해에 해당하는 경우, 회사는 민형사상 책임을 물을 수
					있습니다.<br>
				</p>

				<h3 class="ft_org17">제6장 계약 해지 및 이용요금</h3>
				<p class="ft_gray15">
					<strong>- 제23조 (계약해지)</strong>
					<br> 
					1. 회원은 언제든지 회원정보관리 화면 또는 고객센터 등을 통하여 이용계약 해지 신청을 할 수 있으며, 회사는 관련법 등이 정하는 바에 따라 이를 즉시 처리하여야
					합니다.<br> 
					2. 회원이 계약을 해지할 경우, 관련법 및 개인정보처리방침에 따라 회사가 회원정보를 보유하는
					경우를 제외하고는 해지 즉시 회원의 모든 데이터는 지체없이 소멸됩니다.<br> 
					3. 회원이 계약을 해지하는 경우, 회원이 작성한 게시물 중 본인 계정에 등록된 게시물 일체는 삭제됩니다. 다만, 타인에 의해 담기, 스크랩 등이
					되어 재게시되거나, 공용게시판에 등록된 게시물 등은 삭제되지 않으니 사전에 삭제 후 탈퇴하시기 바랍니다.<br>
					4. 회사는 제20조의 제1항 각호의 사유가 있을 경우 이용계약을 해지할 수 있습니다.<br> <br>
					
					<strong>- 제24조 (이용요금)</strong>
					<br> 
					1. 별도로 표시한 유료 서비스를 제외한 이 외 서비스는 회원들에게 무료로 제공됩니다.<br> 
					2. 유료 서비스의 이용요금 및 결제방식은 해당 서비스에서 명시한 규정 및 관련 법령을 따릅니다.<br>
				</p>

				<h3 class="ft_org17">제7장 손해배상 등</h3>
				<p class="ft_gray15">
					<strong>- 제25조 (손해배상)</strong>
					<br> 무료서비스의 이용과 관련하여 회사는 고의가 없는 한 회원에게 발생한 손해를 배상하지 않습니다.<br> <br> 
					
					<strong>- 제26조 (면책조항)</strong>
					<br> 
					1. 회사는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.<br> 
					2. 회사는 회원의 귀책사유로 인한 서비스 이용의 장애에 대해서는 책임을 지지 않습니다.<br> 
					3. 회사는 회원이 서비스와 관련하여 게재한 정보, 자료, 사실의 신뢰도, 정확성 등의 내용에 대해서는 책임을 지지 않습니다.<br> 
					4. 회사는 회원 간 또는 회원과 제3자 상호간에 서비스를 매개로 하여 거래 등을 하는 경우에는 책임이 면제됩니다.<br> 
					5. 회사는 무료로 제공되는 서비스 이용과 관련하여 관련법에 특별한 규정이 없는 한 책임을 지지 않습니다.<br> <br> 
					
					<strong>- 제27조 (관할법원)</strong>
					<br> 
					1. 요금 등 서비스 이용으로 발생한 분쟁에 대해 소송이 제기될 경우‘회사’의 본사 소재지를 관할하는 법원을 관할법원으로 합니다.<br> 
					2. '회사'와 이용자 간에 제기된 소송에는 대한민국법을 준거법으로 합니다.<br> <br> 
					
					<strong>[부칙]</strong><br>
					본 약관은 2024년 @@월 @@일부터 적용됩니다. 단, 본 약관의 공지 이후 시행일 이전에 본 약관에 동의한 경우에는
					동의 시부터 본 약관이 적용됩니다.<br>
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