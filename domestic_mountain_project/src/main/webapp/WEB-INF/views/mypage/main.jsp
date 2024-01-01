<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
</head>
<style>
.features-1 {
	height: auto; /* 수정 시 auto로 바꾸고 해야함 */
}

.body-container {
	padding-top: 120px;
}

</style>

<section class="features-1">
	<div class="body-container">
		<div class="mypage-main">
			<div class="mypage-left">
				<div class="mymain-img-div">
					<img class="mymain-img"
						src="${pageContext.request.contextPath}/resources/images/climbing.png">
					<h2>박진영</h2>
					<span>jypark234@naver.com</span>
				</div>
				<p class="p1">내프로필</p>
				<p class="p1">보안설정</p>
				<p class="p1">이력관리</p>
				<br>
				<hr>
				<p class="p2">스마트봇 상담</p>
				<p class="p2">회원톡톡</p>
				<br> <img class="ad-img"
					src="${pageContext.request.contextPath}/resources/images/mypage.jpg">
				<hr>
				<br>
				<p class="p3">로그아웃&nbsp;&nbsp; | &nbsp;&nbsp;고객센터&nbsp;&nbsp; |
					&nbsp;&nbsp;한국어</p>
				<img class="left-footer-img"
					src="${pageContext.request.contextPath}/resources/images/logo/logo_black.png">
			</div>


			<div class="mypage-right">
				<br>
				<br>
				<div class="profile">
					<div class="profile-correction" style="border-bottom: 1px solid #ccc;">
						<div class="privacy-main">
							<div>
								<img class="submain-img"
									src="${pageContext.request.contextPath}/resources/images/climbing.png">
							</div>
							<div>
								<span style="font-weight: bold; font-size: 20px;">박진영</span><br>
								<span style="font-weight: lighter; font-size: 15px;">jypark234@naver.com</span>
							</div>
						</div>
						<button type="button" class="btn_edit" onclick="#">
                    		<span class="text">정보수정</span>
                		</button>
					</div>

					<div class="privacy">
						<div class="privacy-2">
							<div>
								<i class="small-img fa-solid fa-phone"></i>
							</div>
							<div>
								<span style="font-size: 13px;">+82 010-1111-2222</span>
							</div>
						</div>
					</div>

					<div class="privacy">
						<div class="privacy-2">
							<div>
								<i class="small-img fa-solid fa-cake-candles"></i>
							</div>
							<div>
								<span style="font-size: 13px;">2019-03-01</span>
							</div>
						</div>
					</div>

					<div class="privacy">
						<div class="privacy-2">
							<div>
								<i class="small-img fa-solid fa-location-dot"></i>
							</div>
							<div>
								<span style="font-size: 13px;">서울시 강남구 @@@@@</span>
							</div>
						</div>
					</div>
				</div>
				<br>


				<p class="titlebox">프로모션 정보수신 동의</p>
				<div class="sub-profile">
					<div class="privacy" style="border-bottom: 1px solid #ccc;">
						<div class="privacy-2">
							<div>
								<i class="small-img fa-solid fa-phone-volume"></i>
							</div>
							<div>
								<span style="font-size: 13px;">휴대전화</span>
							</div>
						</div>


						<input class="mypage-onoff" type="checkbox" id="switch1" /><label
							class="onoff-label" for="switch1">Toggle</label>


					</div>

					<div class="privacy">
						<div class="privacy-2">
							<div>
								<i class="small-img fa-solid fa-square-envelope"></i>
							</div>
							<div>
								<span style="font-size: 13px;">이메일</span>
							</div>
						</div>
						<input class="mypage-onoff" type="checkbox" id="switch2" /><label
							class="onoff-label" for="switch2">Toggle</label>
					</div>
				</div>
				<br>

				<p class="titlebox">게시물 조치 알림 수신 동의</p>
				<div class="sub-profile">
					<div class="privacy">
						<div class="privacy-2">
							<div>
								<i class="small-img fa-solid fa-envelope"></i>
							</div>
							<div>
								<span style="font-size: 13px;">휴대전화(문자메시지)</span>
							</div>
						</div>
						<input class="mypage-onoff" type="checkbox" id="switch3" /><label
							class="onoff-label" for="switch3">Toggle</label>
					</div>
				</div>
				<br>

				<p class="titlebox">부가 정보 관리</p>
				<div class="sub-profile">
					<div class="privacy" style="border-bottom: 1px solid #ccc;">
						<div class="privacy-2">
							<div>
								<i class="small-img fa-solid fa-truck-fast"></i>
							</div>
							<div>
								<span style="font-size: 13px;">배송지 관리</span>
							</div>
						</div>
						<button type="button" class="btn_edit" onclick="#">
                    		<span class="text">확인</span>
                		</button>
					</div>

					<div class="privacy">
						<div class="privacy-2">
							<div>
								<i class="small-img fa-solid fa-inbox"></i>
							</div>
							<div>
								<span style="font-size: 13px;">개인정보 이용내역</span>
							</div>
						</div>
						<button type="button" class="btn_edit" onclick="#">
                    		<span class="text">확인</span>
                		</button>
					</div>
				</div>

				<p class="secession-btn">회원탈퇴 ></p>
			</div>
		</div>
	</div>
</section>

</html>