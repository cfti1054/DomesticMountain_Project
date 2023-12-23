<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<footer class="footer">
	<div class="footer__addr">
		<div class="img-div-tag">
				<a class="img-a-tag" href="${pageContext.request.contextPath}/"> 
					<img alt="" src="${pageContext.request.contextPath}/resources/images/logo/logo_white.png">
				</a>
			</div>

		<h2>E-mail</h2>

		<address>
			<a class="footer__btn">DM_Project@gmail.com</a>
			<br>
			서울 강남구 자바로 123(역삼동) 스프링 빌딩 02-3**2-***1
		</address>
	</div>

	<ul class="footer__nav">
		<li class="nav__item">
			<h2 class="nav__title">DM</h2>

			<ul class="nav__ul">
				<li><a href="#">소개</a></li>
				
			</ul>
		</li>

		<li class="nav__item nav__item--extra">
			<h2 class="nav__title">서비스</h2>

			<ul class="nav__ul nav__ul--extra">

				<li><a href="#">개인정보처리방침</a></li>

				<li><a href="#">이용약관</a></li>

				<li><a href="#">댓글 운영정책</a></li>

				<li><a href="#">서비스 전화번호 안내</a></li>
			</ul>
		</li>

		<li class="nav__item">
			<h2 class="nav__title">통합</h2>

			<ul class="nav__ul">
				<li><a href="#">DM 스토어</a></li>
				
				<li><a href="#">커뮤니티</a></li>

				<li><a href="#">지원</a></li>
			</ul>
		</li>
		<li class="nav__item">
			<h2 class="nav__title"><a href="#" style="color: inherit;">QnA</a></h2>
			
			<h2 class="nav__title"><a href="#" style="color: inherit;">회원 정보</a></h2>
		</li>
	</ul>

	<div class="legal">
		<p>&copy; 2023 DM Project. All rights reserved.</p>

		<div class="legal__links">
			<span>홈페이지 : www.DMProject.ac.kr
			</span>
		</div>
	</div>
</footer>
