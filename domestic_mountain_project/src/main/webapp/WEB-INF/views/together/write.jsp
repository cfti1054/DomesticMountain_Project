<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/tabs.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/board.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/together.css"
	type="text/css">

<style type="text/css">
.features-1 {
	height: auto; /* 수정 시 auto로 바꾸고 해야함 */
	    margin-bottom: 200px;
}

.body-container {
	padding-top: 120px;
	max-width: 1400px;
	display: flex;
	margin: auto;
}

.body-main {
	max-width: 900px;
}

.table-article img {
	max-width: 650px;
}

.table {
	--bs-table-bg: none;
}
</style>

<script type="text/javascript">
	function isValidDateFormat(data) {
		if (data.length !== 8 && data.length !== 10)
			return false;

		let p = /(\.)|(\-)|(\/)/g;
		data = data.replace(p, "");
		if (data.length !== 8)
			return false;

		let format = /^[12][0-9]{7}$/;
		if (!format.test(data))
			return false;

		let y = parseInt(data.substr(0, 4));
		let m = parseInt(data.substr(4, 2));
		let d = parseInt(data.substr(6));

		if (m<1 || m>12)
			return false;
		let lastDay = (new Date(y, m, 0)).getDate();
		if (d<1 || d>lastDay)
			return false;

		return true;
	}

	function check() {
		const f = document.togetherForm;
		let mode = "${mode}";

		let str = f.post_title.value;
		if (!str) {
			alert("제목을 입력하세요. ");
			f.post_title.focus();
			return false;
		}

		if (!isValidDateFormat(f.start_date.value)) {
			alert("동행 시작 날짜를 입력하세요.");
			f.start_date.focus();
			return false;
		}

		if (!isValidDateFormat(f.end_date.value)) {
			alert("동행 종료 날짜를 입력하세요.");
			f.end_date.focus();
			return false;
		}

		let sd = new Date(f.start_date.value);
		let ed = new Date(f.end_date.value);

		if (sd.getTime() > ed.getTime()) {
			alert("동행 시작 날짜는 동행 종료 날짜보다 클수 없습니다.");
			f.start_date.focus();
			return false;
		}

		if (mode === "write" && new Date().getTime() > sd.getTime()) {
			alert("동행 시작 날짜는 현재 시간보다 작을수 없습니다.");
			f.end_date.focus();
			return false;
		}

		if (!/^(\d)+$/.test(f.gather_max.value)) {
			alert("신청 가능 인원수를 입력 하세요.");
			f.gather_max.focus();
			return false;
		}

		if ("0" < f.gather_max.value && f.gather_max.value <= "8") {
			if (!isValidDateFormat(f.gather_expire_date.value)) {
				alert("모집 종료일자를 입력하세요.");
				f.gather_expire_date.focus();
				return false;
			}

			let wd = new Date(f.gather_expire_date.value);

			if (wd.getTime() >= sd.getTime()) {
				alert("모집일자는 동행 시작날짜보다 클거나 작을 수 없습니다.");
				f.gather_expire_date.focus();
				return false;
			}
		}

		str = f.location_addr.value;
		if (!str || str === "<p><br></p>") {
			alert("활동지역을 입력하세요. ");
			f.location_addr.focus();
			return false;
		}

		str = f.post_content.value;
		if (!str || str === "<p><br></p>") {
			alert("내용을 입력하세요. ");
			f.post_content.focus();
			return false;
		}

		f.action = "${pageContext.request.contextPath}/together/${mode}";

		return true;
	}
</script>

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
						<li class=""><a
							href="${pageContext.request.contextPath}/recommend/list">&gt;
								추천 코스</a></li>
						<li class=""><a
							href="${pageContext.request.contextPath}/createcourse/list">&gt; 유저가
								만든 코스</a></li>
						<li class=""><a href="#">&nbsp;</a></li>
						<li class="eq1"><a
							href="${pageContext.request.contextPath}/together/list">&gt;
								동행 산행 신청</a></li>
					</ul>

					<h3>
						<a>Share Tips</a>
					</h3>
					<ul>
						<li class=""><a
							href="${pageContext.request.contextPath}/share/list">&gt; 유용한
								정보</a></li>
					</ul>

					<h3>
						<a>Walk &amp; Climbing</a>
					</h3>
					<ul>
						<li class=""><a
							href="${pageContext.request.contextPath}/appearance/list">&gt;
								회원들의 모습</a></li>
					</ul>

					<h3>
						<a>Look &amp; Style</a>
					</h3>
					<ul>
						<li class=""><a
							href="${pageContext.request.contextPath}/ootd/list">&gt; 스트릿
								스냅 (OOTD)</a></li>
					</ul>

				</div>
			</div>
		</div>


		<div class="contentWrap">

			<div class="amain">
				<h1 class="amain-main">
					<a>동행 산행 신청<span>| An application for a hike Together</span></a> <span><a
						href="${pageContext.request.contextPath}/">home</a> &gt; community
						&gt; 동행 산행 신청</span>
				</h1>
			</div>

			<div class="notice-container">

				<form name="togetherForm" method="post"
					enctype="multipart/form-data">
					<table class="table table-border border-top2 table-form">
						<tr>
							<td>제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
							<td><input type="text" name="post_title" maxlength="100"
								class="form-control" value="${dto.post_title}"></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td>
								<p class="form-control-plaintext">${sessionScope.loginUser.username}</p>
							</td>
						</tr>

						<tr>
							<td>동행 시작 일자</td>
							<td class="td-date"><input type="date" name="start_date"
								class="form-control" value="${dto.start_date}"></td>
						</tr>

						<tr>
							<td>동행 종료 일자</td>
							<td class="td-date"><input type="date" name="end_date"
								class="form-control" value="${dto.end_date}"></td>
						</tr>

						<tr>
							<td>신청 가능 인원수</td>
							<td>
								<p>
									<input type="text" name="gather_max" class="form-control"
										value="${dto.gather_max}">
								</p>
								<p class="help-block">신청 가능 인원수는 최대 1~8명까지 가능합니다.</p>
							</td>
						</tr>
						<tr>
							<td>모집 종료일자</td>
							<td class="td-date">
								<p>
									<input type="date" name="gather_expire_date"
										class="form-control" value="${dto.gather_expire_date}">
								</p>
								<p class="help-block">모집 종료일자가 지나면 신청이 불가합니다.</p>
							</td>
						</tr>

						<tr>
							<td>활동 지역</td>
							<td>
								<p>
									<input type="text" name="location_addr" class="form-control"
										value="${dto.location_addr}">
								</p>
							</td>
						</tr>

						<tr>
							<td valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
							<td valign="top"><textarea name="post_content" id="ir1"
									class="form-control">${dto.post_content}</textarea></td>
						</tr>

						<tr>
							<td>첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
							<td><input type="file" name="selectFile"
								class="form-control" multiple>
								<p class="help-block">파일은 선택사항입니다.(다중 선택 가능)</p></td>

						</tr>
						<c:if test="${mode=='update'}">
							<c:forEach var="vo" items="${listFile}">
								<tr>
									<td>첨부된파일</td>
									<td><span class="delete-file"
										data-fileNum="${vo.file_num}"><i
											class="fa-solid fa-trash-can"></i></span>${vo.originalFilename}</td>
								</tr>
							</c:forEach>
						</c:if>

					</table>

					<table class="table">
						<tr>
							<td align="center">
								<button type="button" class="btn btn-dark"
									onclick="submitContents(this.form);">${mode=='update'?'수정완료':'등록하기'}</button>
								<button type="reset" class="btn btn-light">다시입력</button>
								<button type="button" class="btn btn-light"
									onclick="location.href='${pageContext.request.contextPath}/together/list';">${mode=='update'?'수정취소':'등록취소'}</button>

								<c:if test="${mode=='update'}">
									<input type="hidden" name="post_num" value="${dto.post_num}">
									<input type="hidden" name="page" value="${page}">

								</c:if>


							</td>
						</tr>




					</table>
				</form>
			</div>
		</div>
	</div>
</section>

<c:if test="${mode=='update'}">
	<script type="text/javascript">
		$('.delete-file')
				.click(
						function() {
							if (!confirm('선택한 파일을 삭제 하시겠습니까 ? ')) {
								return false;
							}

							let $tr = $(this).closest('tr');
							let file_num = $(this).attr('data-fileNum');
							let url = '${pageContext.request.contextPath}/together/deleteFile';

							$.ajaxSetup({
								beforeSend : function(e) {
									e.setRequestHeader('AJAX', true);
								}
							});
							$.post(url, {
								file_num : file_num
							}, function(data) {
								$($tr).remove();
							}, 'json').fail(function() {
								alert('error...');
							});
						});
	</script>
</c:if>



<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/vendor/se2/js/service/HuskyEZCreator.js"
	charset="utf-8">
	
</script>

<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator
			.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "ir1",
				sSkinURI : "${pageContext.request.contextPath}/resources/vendor/se2/SmartEditor2Skin.html",
				fCreator : "createSEditor2"
			});

	function submitContents(elClickedObj) {
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		try {
			if (!check()) {
				return;
			}

			elClickedObj.submit();

		} catch (e) {
		}
	}

	function setDefaultFont() {
		var sDefaultFont = '돋움';
		var nFontSize = 12;
		oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
	}

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