<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
// 회원목록/회원분석 구분
$(function(){
	$("#tab-1").addClass("active");

	$("ul.tabs li").click(function() {
		let tab = $(this).attr("data-tab");
		
		$("ul.tabs li").each(function(){
			$(this).removeClass("active");
		});
		
		$("#tab-"+tab).addClass("active");
		
		let url = "${pageContext.request.contextPath}/admin/memberManage/analysis";	
		location.href = url;
	});
});

function searchList() {
	const f = document.searchForm;
	f.enabled.value = $("#selectEnabled").val();
	f.action = "${pageContext.request.contextPath}/admin/memberManage/list";

	f.submit();
}

function ajaxFun(url, method, formData, dataType, fn, file = false) {
	const settings = {
			type: method, 
			data: formData,
			success:function(data) {
				fn(data);
			},
			beforeSend: function(jqXHR) {
				jqXHR.setRequestHeader('AJAX', true);
			},
			complete: function () {
			},
			error: function(jqXHR) {
				if(jqXHR.status === 403) {
					login();
					return false;
				} else if(jqXHR.status === 400) {
					alert('요청 처리가 실패 했습니다.');
					return false;
		    	}
		    	
				console.log(jqXHR.responseText);
			}
	};
	
	if(file) {
		settings.processData = false;  // file 전송시 필수. 서버로전송할 데이터를 쿼리문자열로 변환여부
		settings.contentType = false;  // file 전송시 필수. 서버에전송할 데이터의 Content-Type. 기본:application/x-www-urlencoded
	}
	
	$.ajax(url, settings);
}

// 회원상세정보
function profile(useridx) {
	let dlg = $("#member-dialog").dialog({
		autoOpen: false,
		modal: true,
		buttons: {
			" 수정 " :function(){
				updateOk();
			}, " 닫기 ": function() {
				$(this).dialog("close");
			}
		},
		
		height: 550,
		width: 800,
		title: "회원 상세 정보",
		close: function(event, ui) {
		}
	});
	
	let url = "${pageContext.request.contextPath}/admin/memberManage/profile";
	let query = "useridx=" + useridx;
	
	const fn = function(data) {
		$("#member-dialog").html(data);
		dlg.dialog("open");
	};
	
	ajaxFun(url, "get", query, "text", fn);
}

// 회원계정 잠금/활성 수정
function updateOk() {
	const f = document.deteailedMemberForm;
	
	if(! f.is_blocked.value) {
		alert("상태 코드를 선택하세요");
		f.is_blocked.focus();
		return;
	}
	
	if(! f.blocked_reason.value.trim()) {
		alert("상태에 대한 메모를 입력 하세요");
		f.blocked_reason.focus();
		return;
	}
	
	let url = "${pageContext.request.contextPath}/admin/memberManage/updateMemberState";	
	let query = $("#deteailedMemberForm").serialize();
	
	const fn = function(data) {
		$("form input[name=page]").val("${page}");
		searchList();
	};
	ajaxFun(url, "post", query, "json", fn);
	
	$("#member-dialog").dialog("close");
}

function deleteOk(useridx) {
	if(confirm("선택한 계정을 삭제 하시겠습니까 ?")) {
	}
	
	$('#member-dialog').dialog("close");
}

// 회원상세 뷰
function memberStateDetaileView() {
	$("#memberStateDetaile").dialog({
		modal: true,
		minHeight: 100,
		maxHeight: 450,
		width: 750,
		title: "회원 상태 상세",
		close: function(event, ui) {
			$(this).dialog("destroy");	
		}
	});
}

// 회원등급 상세 뷰
function memberRankDetaileView() {
	$("#memberRankDetaile").dialog({
		modal: true,
		minHeight: 100,
		maxHeight: 450,
		width: 750,
		title: "회원 등급 상세",
		close: function(event, ui) {
			$(this).dialog("destroy");	
		}
	});
}

// 회원등급 수정
function updateRankOk() {

	let url = "${pageContext.request.contextPath}/admin/memberManage/updateMemberRank";	
	let query = $("#memberRankForm").serialize();
	
	const fn = function(data) {
		$("form input[name=page]").val("${page}");
		searchList();
	};
	ajaxFun(url, "post", query, "json", fn);
	
	$("#member-dialog").dialog("close");
}

// 회원상세정보 메모 select
function selectStateChange() {
	const f = document.deteailedMemberForm;
	
	let s = f.is_blocked.value;
	let txt = f.is_blocked.options[f.is_blocked.selectedIndex].text;
	
	f.blocked_reason.value = "";	
	if(! s) {
		return;
	}

	if(s!=="0" && s!=="6") {
		f.blocked_reason.value = txt;
	}
	
	f.blocked_reason.focus();
}

// 프린트출력
function printMemberManage() {
	let url="${pageContext.request.contextPath}/admin/memberManage/print";
	window.open(url, "score", "width=800, height=500, left=50, top=50");
}


</script>

<style type="text/css">
.btn1 {
	font-weight: bold;
	background-color: red;
	color: white;
	"
}

.btn2 {
	font-weight: bold;
	background-color: darkgreen;
	color: white;
	"
}

.btn3 {
	font-weight: bold;
	background-color: orange;
	color: white;
	"
}
</style>


<div id="layoutSidenav_content">
	<main class="mt-4">
		<div class="container-fluid px-4">

			<h2>&nbsp;<i class='fas fa-user-tie'></i> 등급변경 내역</h2>
			

			<div class="container">

				<div style="padding-bottom: 10px; display: flex;">
					<select id="selectEnabled" class="form-select"
						onchange="searchList();"
						style="margin-right: 5px; padding: 2px; width: 140px; display: flex;">
						<option value="" ${enabled=="" ? "selected":""}>:계정상태:</option>
						<option value="0" ${enabled=="0" ? "selected":""}>잠금 계정</option>
						<option value="1" ${enabled=="1" ? "selected":""}>활성 계정</option>
					</select>

					<form name="searchForm"
						action="${pageContext.request.contextPath}/admin/memberManage/list"
						method="post" style="width: 650px; display: flex;">
						<select name="schType" class="form-select"
							style="width: 200px; padding: 3px;">
							<option value="useridx" ${schType=="useridx" ? "selected":""}>회원번호</option>
							<option value="user_name" ${schType=="user_name" ? "selected":""}>이름</option>
							<option value="birth" ${schType=="birth" ? "selected":""}>생년월일</option>
						</select> <input type="text" name="kwd" class="form-control" value="${kwd}"
							style="width: 200px; padding: 3px; display: flex;"> <input
							type="hidden" name="enabled" value="${enabled}"> <input
							type="hidden" name="page" value="1">
						<button type="button" class="btn" onclick="searchList()"
							style="width: 100px; padding: 3px;">검색</button>
					</form>
					<button type="button" class="btn1" onclick="printMemberManage();"
						style="float: right;">Print</button>
					<button type="button"
						onclick="location.href='${pageContext.request.contextPath}/admin/memberManage/excel';"
						class="btn2" style="float: right;">EXCEL</button>
					<button type="button"
						onclick="location.href='${pageContext.request.contextPath}/admin/memberManage/pdf';"
						class="btn3" style="float: right;">PDF</button>
				</div>



				<form name="memberForm" method="post">
					<table class="table table-border table-form" id="">
						<tr>
							<td style="width: 10%;" align="center">회원번호</td>
							<td style="width: 10%;" align="center">회원이름</td>
							<td style="width: 10%;" align="center">회원구분</td>
							<td style="width: 10%;" align="center">생년월일</td>
							<td style="width: 30%;" align="center">등급변동날짜</td>
							<td style="width: 10%;" align="center">회원등급</td>
							<td style="width: 10%;" align="center">할인율</td>
							<td style="width: 10%;" align="center">상태</td>
						</tr>

						<c:forEach var="dto" items="${list}">
							<tr class="hover" onclick="profile('${dto.useridx}');">
								<td align="center">${dto.useridx}</td>
								<td align="center">${dto.user_name}</td>
								<td align="center">
									${dto.usership==1?"일반회원":(dto.usership==51?"직원":"관리자")}</td>
								<td align="center">${dto.birth}</td>
								<td align="center">${dto.update_rank}</td>
								<td align="center">${dto.rank1}</td>
								<td align="center">${dto.sale}%</td>
								<td align="center">${dto.enabled==1?"활성":"잠금"}</td>
							</tr>
						</c:forEach>
					</table>

					<div class="page-navigation" align="center">${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
					</div>

				</form>

			</div>

			<div id="member-dialog" class="modal" style="display: none;"></div>
			<div id="member-dialog2" class="modal" style="display: none;"></div>
		</div>
	</main>



</div>

<script>
        // 부트스트랩 table (미적용)
          window.addEventListener('DOMContentLoaded', event => {
            const datatablesSimple = document.getElementById('memberManage_table');
            if (datatablesSimple) {
                new simpleDatatables.DataTable(datatablesSimple);
            }
            
            datatablesSimple.on("datatable.selectrow", (rowIndex, event) => {
            	event.preventDefault()
            	const row = dataTable.data.data
            	
            	console.log(row)
            })
        });  
               
        </script>

