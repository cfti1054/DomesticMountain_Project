<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html oncontextmenu="return false;">
<head>
<meta charset="UTF-8">
<title>spring</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<style type="text/css">
* {
	padding: 0;
	margin: 0;
}

*, *::after, *::before {
	box-sizing: border-box;
}

body {
	font-family: "Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
	font-size: 14px;
	color: #222;
}

a {
	color: #222;
	text-decoration: none;
	cursor: pointer;
}

a:active, a:hover {
	color: #f28011;
	text-decoration: underline;
}

/* form-control */
.btn {
	color: #333;
	border: 1px solid #999;
	background-color: #fff;
	padding: 5px 10px;
	border-radius: 4px;
	font-weight: 500;
	cursor: pointer;
	font-size: 14px;
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
}

.btn:active, .btn:focus, .btn:hover {
	background-color: #f8f9fa;
	color: #333;
}

.title {
	width: 100%;
	font-size: 16px;
	font-weight: bold;
	padding: 13px 0;
}

.top {
	width: 700px;
	margin: 30px auto 5px;
	border-bottom: 2px solid #ccc;
	height: 50px;
	line-height: 50px;
}

.print-body {
	width: 700px;
	margin: 30px auto 0;
}
</style>

<script type="text/javascript">
	function onPrint() {
		// 배경이미지 출력 : 크롬 - 인쇄 - 설정 더보기 - 배경 그래픽 선택
		const printContents = document.querySelector(".print-body").innerHTML;
		var originalContents = document.body.innerHTML;

		document.body.innerHTML = printContents;
		// document.close();
		window.focus();

		window.print();

		document.body.innerHTML = originalContents;
	}
</script>

</head>
<body>
	<div class="top">
		<button type="button" class="btn" onclick="onPrint();">프린트</button>
	</div>

	<div class="print-body">
		<table style="width: 100%; margin: 0 auto;">
			<tr height="50">
				<td align="center" colspan="2"><span class="title">회원목록</span>
				</td>
			</tr>
		</table>

		<table
			style="width: 100%; margin: 0 auto; border-spacing: 1px; background: #ccc;">
			<tr>
				<td style="width: 10%;" align="center">회원번호</td>
				<td style="width: 10%;" align="center">회원이름</td>
				<td style="width: 10%;" align="center">회원구분</td>
				<td style="width: 10%;" align="center">생년월일</td>
				<td style="width: 30%;" align="center">가입일</td>
				<td style="width: 10%;" align="center">회원등급</td>
				<td style="width: 10%;" align="center">할인율</td>
				<td style="width: 10%;" align="center">상태</td>
			</tr>

			<c:forEach var="dto" items="${list}">
				<tr class="hover">
					<td align="center">${dto.useridx}</td>
					<td align="center">${dto.user_name}</td>
					<td align="center">
						${dto.usership==1?"일반회원":(dto.usership==51?"직원":"관리자")}</td>
					<td align="center">${dto.birth}</td>
					<td align="center">${dto.reg_date}</td>
					<td align="center">${dto.rank1}</td>
					<td align="center">${dto.sale}%</td>
					<td align="center">${dto.enabled==1?"활성":"잠금"}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>