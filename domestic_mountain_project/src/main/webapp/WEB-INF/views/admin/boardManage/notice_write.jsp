<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 850px;
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">
$( function() {
	$("#notice_board_invisible_date").datepicker();
});

function check() {
    const f = document.boardForm;
	let str;
	let x;
	
    str = f.notice_board_title.value.trim();
    if(!str) {
        alert("제목을 입력하세요. ");
        f.notice_board_title.focus();
        return false;
    }

	str = f.notice_board_content.value;
	if( !str || str === "<p><br></p>" ) {
        alert("내용을 입력하세요. ");
        f.notice_board_content.focus();
        return false;
    }
	
	str = f.notice_category_num.value;
	console.log(str);
	if(!str) {
		alert("카테고리 분류를 선택하세요. ");
		f.notice_category_num.focus();
		return false;
		
	}
	
	str = f.notice_board_invisible_date.value;
	x = f.expireUse.value;
	if(!str && $('#expireUse').is(':checked')) {
		alert("만료일자를 입력하세요. ");
		f.notice_board_invisible_date.focus();
		return false;
	}
	console.log(f.notice_board_invisible_date.value);
	
    f.action = "${pageContext.request.contextPath}/admin/boardManage/notice_board_${mode}";
    
    return true;
}
$(function() {
	$("#write_table").on('click', 'tr', function() {
		if ($("input[name=expireUse]").is(":checked")) {
			$("#expire").show();
			console.log("yes");
		} else {
			$("#expire").hide();
			console.log("no");
		}
	})
});
</script>
<div id="layoutSidenav_content">
	<main class="mt-4">
		<div class="container-fluid px-4">
<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3><i class="bi bi-app"></i> 게시판 </h3>
		</div>
		
		<div class="body-main">
		
			<form name="boardForm" method="post" enctype="multipart/form-data">
				<table class="table mt-5 write-form" id="write_table">
					<tr>
						<td class="bg-light col-sm-2" scope="row">제 목</td>
						<td>
							<input type="text" name="notice_board_title" class="form-control" value="${dto.notice_board_title}">
						</td>
					</tr>
					
					<tr>
						<td class="bg-light col-sm-2" scope="row">카테고리 분류</td>
						<td>
							<select style="text-align: center;" name="notice_category_num" id="notice_category_num" class="form-select" style=" width: 100%;">
									<option value=""> :: 카테고리 선택 :: </option>
								<c:forEach var="dto" items="${list}" varStatus="status">
									<option value="${dto.notice_category_num}">${dto.notice_category_name}</option>
								</c:forEach>
							</select>					
						</td>
					</tr>
        
					<tr>
						<td class="bg-light col-sm-2" scope="row">작성자명</td>
 						<td>
							<%-- <p class="form-control-plaintext">${sessionScope.member.userName}</p> --%>
							<p class="form-control-plaintext">관리자</p>
						</td>
					</tr>
					
					<tr>
						<td class="bg-light col-sm-2" scope="row">만료 기한 사용</td>
						<td><input type="checkbox" name="expireUse" id="expireUse" value="checked"></td>
						
					</tr>
					
					<tr id="expire" style="display:none;">
							<td class="bg-light col-sm-2">만료 날짜</td>
							<td><input type="text" name="notice_board_invisible_date" id="notice_board_invisible_date" value="${dto.notice_board_invisible_date}"></td>
					</tr>
					
					
					<tr>
						<td class="bg-light col-sm-2" scope="row">내 용</td>
						<td>
							<textarea name="notice_board_content" id="ir1" class="form-control" style="width: 99%; height: 300px;">${dto.notice_board_content}</textarea>
						</td>
					</tr>
					
					
				</table>
				
				<table class="table table-borderless">
 					<tr>
						<td class="text-center">
							<button type="button" class="btn btn-dark" onclick="submitContents(this.form);">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i class="bi bi-check2"></i></button>
							<button type="reset" class="btn btn-light">다시입력</button>
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/admin/boardManage/notice_board_list';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
							<c:if test="${mode=='update'}">
								<input type="hidden" name="num" value="${dto.notice_board_num}">
								<%-- <input type="hidden" name="page" value="${page}"> --%>
							</c:if>
						</td>
					</tr>
				</table>
			</form>
		
		</div>
	</div>
</div>
</div>
</main>
</div>


<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "${pageContext.request.contextPath}/resources/vendor/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2",
	fOnAppLoad: function () {
		oEditors.getById['ir1'].setDefaultFont( "나눔고딕", 12);
		
	}
});

function submitContents(elClickedObj) {
	 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	 try {
		if(! check()) {
			return;
		}
		
		elClickedObj.submit();
		
	} catch(e) {
	}
}

function setDefaultFont() {
	var sDefaultFont = '나눔고딕';
	var nFontSize = 12;
	oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>
