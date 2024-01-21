<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

.notice-container {
	margin: 3rem;
}

</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/boot-board.css"
	type="text/css">

<script type="text/javascript">
	function check() {
		const f = document.recommendForm;
		let str;

		str = f.post_title.value;
		if (!str) {
			alert("제목을 입력하세요. ");
			f.post_title.focus();
			return false;
		}

		str = f.post_content.value;
		if (!str || str === "<p><br></p>") {
			alert("내용을 입력하세요. ");
			f.post_content.focus();
			return false;
		}

		f.action = "${pageContext.request.contextPath}/recommend/${mode}";

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
						<li class="eq1"><a
							href="${pageContext.request.contextPath}/recommend/list">&gt;
								추천 코스</a></li>
						<li class=""><a
							href="${pageContext.request.contextPath}/createcourse/list">&gt; 유저가
								만든 코스</a></li>
						<li class=""><a href="#">&nbsp;</a></li>
						<li class=""><a
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
							href="${pageContext.request.contextPath}/recommend/list">&gt;
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
					<a>추천 코스<span>| Recommended course</span></a> <span><a
						href="${pageContext.request.contextPath}/">home</a> &gt; community
						&gt; 추천코스</span>
				</h1>
			</div>

			<div class="notice-container">
				<form name="recommendForm" method="post"
				enctype="multipart/form-data">
					<table class="table mt-5 write-form">
						<tr>
							<td class="bg-light col-sm-2" scope="row">제 목</td>
							<td><input type="text" name="post_title"
								class="form-control" value="${dto.post_title}"></td>
						</tr>

						<tr>
							<td class="bg-light col-sm-2" scope="row">작성자명</td>
							<td>
								<p class="form-control-plaintext">${sessionScope.loginUser.username}</p>
							</td>
						</tr>

						<tr>
							<td class="bg-light col-sm-2" scope="row">내 용</td>
							<td><textarea name="post_content" id="ir1"
									class="form-control" style="width: 99%; height: 300px;">${dto.post_content}</textarea>
							</td>
						</tr>

						<tr>
							<td>첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
							<td><input type="file" name="selectFile"
								class="form-control" multiple>
								<p class="help-block">파일은 선택사항입니다.(다중 선택 가능)11</p></td>

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

					<table class="table table-borderless">
						<tr>
							<td class="text-center">
								<button type="button" class="btn btn-dark"
									onclick="submitContents(this.form);">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i
										class="bi bi-check2"></i>
								</button>
								<button type="reset" class="btn btn-light">다시입력</button>
								<button type="button" class="btn btn-light"
									onclick="location.href='${pageContext.request.contextPath}/recommend/list';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i
										class="bi bi-x"></i>
								</button> <c:if test="${mode=='update'}">
									<input type="hidden" name="num" value="${dto.post_num}">
									<input type="hidden" name="saveFilename"
										value="${dto.saveFilename}">
									<input type="hidden" name="originalFilename"
										value="${dto.originalFilename}">
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
		function deleteFile(file_num) {
			if (!confirm("파일을 삭제하시겠습니까 ?")) {
				return;
			}
			let url = "${pageContext.request.contextPath}/recommend/deleteFile?file_num="
					+ file_num + "&page=${page}&num=${dto.post_num}";
			location.href = url;
			alert('--------------------')
		}
	</script>
</c:if>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/vendor/se2/js/service/HuskyEZCreator.js"
	charset="utf-8"></script>
<script type="text/javascript">
	/* 스크롤 따라다니기 */
	$(document).ready(function() {
		var currentPosition = parseInt($("#scroll").css("top"));
		$(window).scroll(function() {
			var position = $(window).scrollTop();
			$("#scroll").stop().animate({
				"top" : position + currentPosition + "px"
			}, 500);
		});
	});

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
</script>
