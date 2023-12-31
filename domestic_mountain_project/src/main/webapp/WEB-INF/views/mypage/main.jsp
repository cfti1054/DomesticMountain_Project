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
    .main {
        display: flex; /* flex 속성을 사용하여 가로 정렬 설정 */
        justify-content: space-between; /* 자식 요소 간에 공간을 동일하게 분배 */
        align-items: center; /* 세로 방향 가운데 정렬 */
        margin: 80px 200px 80px 200px;
    }

	.main1 {
		flex: 1;
		border: 1px solid green;
		height: 900px;
	}

	.main2 {
		flex: 2;
		border: 1px solid green;
		height: 900px;
	}

	.img1{
		border: 1px solid green;
		border-radius: 80px;
		margin: 0 auto;
		width: 120px;
		height: 120px;
		margin-bottom: 30px;
	}

	.img2{
		border: 1px solid green;
		border-radius: 20px;
		width: 320px;
		height: 90px;
		margin: 0 auto;
		display: block;
		margin-bottom: 30px;
	}

	.img3{
		border: 1px solid green;
		width: 100px;
		height: 30px;
		margin: 0 auto;
		display: block;
		margin-bottom: 30px;
	}

	.p1{
		font-size: 18px;
		font-weight: bold;
		margin-left: 25px;
	}

	.p2{
		font-size: 14px;
		font-weight:lighter;
		margin-left: 25px;
	}

	.p3{
		font-size: 10px;
		font-weight:lighter;
		text-align: center;
		margin-bottom: 30px;
	}

	

	.main1-1{
		text-align: center;
	}

	.main2-1{
		margin: 0 auto;
		display: block;
		border: 1px solid green;
		border-radius: 10px;
		width: 580px;
	}

	.main2-2{
		margin: 0 auto;
		display: block;
		border: 1px solid gray;
		border-radius: 10px;
		width: 580px;
	}

	.img4{
		border: 1px solid green;
		border-radius: 50px;
		width: 50px;
		height: 50px;
		margin-left: 15px;
		margin-top: 15px;
	}

	.img5{
		border: 1px solid green;
		width: 18px;
		height: 18px;
		margin-left: 15px;
		margin-top: 9px;
	}

	.img6{
		border: 1px solid green;
		width: 18px;
		height: 18px;
		margin-left: 15px;
		margin-top: 3px;
	}

	.img7{
		border: 1px solid green;
		width: 18px;
		height: 18px;
		margin-left: 15px;
		margin-top: 10px;
	}

	.main3-1{
		display: flex; /* flex 속성을 사용하여 가로 정렬 설정 */
        justify-content: space-between;
	}

	.main3-2{
		display: flex; /* flex 속성을 사용하여 가로 정렬 설정 */
        justify-content: space-between;
	}

	.q2{
		margin-left: 15px;
		margin-top: 15px;
	}

	.q2-1{
		margin-top: 5px;
		margin-left: 10px;
		margin-bottom: 5px;
	}

	.q2-3{
		margin-top: 5px;
		margin-left: 10px;
		margin-bottom: 5px;
	}

	.q2-3-1{
		margin-left: 10px;
	}

	.q2-3-3{
		margin-left: 10px;
		margin-top: 7px;
	}

	.q3 {
    	margin-top: 15px;
		margin-right: 15px;
	}

	.q3-1 {
    	margin-top: 5px;
		margin-bottom: 5px;
		margin-right: 15px;
	}

	.q3-3 {
    	margin-top: 9px;
		margin-right: 15px;
	}

	.q3-3-1 {
    	margin-bottom: 10px;
		margin-right: 15px;
	}

	.q3-3-2 {
    	margin-top: 9px;
		margin-right: 15px;
		margin-bottom: 10px;
	}

	.q3-3-3 {
    	margin-top: 9px;
		margin-right: 15px;
		margin-bottom: 10px;
	}

	.main4-1{
		display: flex;
	}

	.main4-2{
		display: flex;
	}

</style>
<body>
    <div class="main">
		<div class="main1">
			국내산 마이페이지<br><br><br>
			<div class="main1-1">
				<img class="img1" src="${pageContext.request.contextPath}/resources/images/climbing.png">
				<h2>박진영</h2>
				<span>jypark234@naver.com</span>
			</div>
			<br><p class="p1">내프로필</p>
			<p class="p1">보안설정</p>
			<p class="p1">이력관리</p>
			<br><hr>
			<p class="p2">스마트봇 상담</p>
			<p class="p2">회원톡톡</p>
			<br>
			<img class="img2" src="${pageContext.request.contextPath}/resources/images/climbing.png">
			<hr><br>
			<p class="p3">로그아웃&nbsp;&nbsp; | &nbsp;&nbsp;고객센터&nbsp;&nbsp; | &nbsp;&nbsp;한국어</p>
			<img class="img3" src="${pageContext.request.contextPath}/resources/images/climbing.png">
		</div>
		

		<div class="main2"><br><br>
			<div class="main2-1">
				<div class="main3-1">
					<div class="main4-1">
						<div class="q1">
							<img class="img4" src="${pageContext.request.contextPath}/resources/images/climbing.png">
						</div>
						<div class="q2">
							<span style="font-weight: bold; font-size: 20px;">박진영</span><br>
							<span style="font-weight: lighter; font-size: 15px;">jypark234@naver.com</span>
						</div>
					</div>
					<div class="q3"><button>실명수정</button></div>
				</div><hr>

				<div class="main3-2">
					<div class="main4-2">
						<div class="q1">
							<img class="img5" src="${pageContext.request.contextPath}/resources/images/climbing.png">
						</div>
						<div class="q2-1">
							<span style="font-size: 13px;">+82 010-1111-2222</span>
						</div>
					</div>
					<div class="q3-1"><button>수정</button></div>
				</div><hr>

				<div class="main3-2">
					<div class="main4-2">
						<div class="q1">
							<img class="img5" src="${pageContext.request.contextPath}/resources/images/climbing.png">
						</div>
						<div class="q2-1">
							<span style="font-size: 13px;">jinyeong9571@hanmail.net</span>
						</div>
					</div>
					<div class="q3-1"><button>수정</button></div>
				</div>

				<div class="main3-2">
					<div class="main4-2">
						<div class="q1-3">
							<img class="img5" src="${pageContext.request.contextPath}/resources/images/climbing.png">
						</div>
						<div class="q2-3">
							<span style="font-size: 13px;">euntaing@gmail.net</span>
						</div>
					</div>
					<div class="q3-3-2"><button>수정</button></div>
				</div>
			</div><br>


			<p style="margin-left: 78px; font-weight: bold;">프로모션 정보수신 동의</p>
			<div class="main2-2">
				<div class="main3-2">
					<div class="main4-2">
						<div class="q1-3">
							<img class="img5" src="${pageContext.request.contextPath}/resources/images/climbing.png">
						</div>
						<div class="q2-3">
							<span style="font-size: 13px;">휴대전화</span>
						</div>
					</div>
					<div class="q3-3"><button>off</button></div>
				</div><hr>

				<div class="main3-2">
					<div class="main4-2">
						<div class="q1-3">
							<img class="img6" src="${pageContext.request.contextPath}/resources/images/climbing.png">
						</div>
						<div class="q2-3-1">
							<span style="font-size: 13px;">이메일</span>
						</div>
					</div>
					<div class="q3-3-1"><button>off</button></div>
				</div>
			</div><br>

			<p style="margin-left: 78px; font-weight: bold;">게시물 조치 알림 수신 동의</p>
			<div class="main2-2">
				<div class="main3-2">
					<div class="main4-2">
						<div class="q1-3">
							<img class="img7" src="${pageContext.request.contextPath}/resources/images/climbing.png">
						</div>
						<div class="q2-3-3">
							<span style="font-size: 13px;">휴대전화(문자메시지)</span>
						</div>
					</div>
					<div class="q3-3-3"><button>off</button></div>
				</div>
			</div><br>

			<p style="margin-left: 78px; font-weight: bold;">부가 정보 관리</p>
			<div class="main2-2">
				<div class="main3-2">
					<div class="main4-2">
						<div class="q1-3">
							<img class="img5" src="${pageContext.request.contextPath}/resources/images/climbing.png">
						</div>
						<div class="q2-3">
							<span style="font-size: 13px;">배송지 관리</span>
						</div>
					</div>
					<div class="q3-3"><button>확인</button></div>
				</div><hr>

				<div class="main3-2">
					<div class="main4-2">
						<div class="q1-3">
							<img class="img6" src="${pageContext.request.contextPath}/resources/images/climbing.png">
						</div>
						<div class="q2-3-1">
							<span style="font-size: 13px;">개인정보 이용내역</span>
						</div>
					</div>
					<div class="q3-3-1"><button>확인</button></div>
				</div>
			</div>

			<p style="margin-left: 100px; font-weight:lighter; font-size: 13px;">회원탈퇴 ></p>
		</div>
	</div>

    
</body>
</html>