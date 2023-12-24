<%@ page contentType="text/html; charset=UTF-8" %>
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

// (미구현) 계정지우면 큰일남
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
		color: white;"	
		
	}

	.btn2 { 
		font-weight: bold; 
		background-color: darkgreen; 
		color: white;"	
		
	}

	.btn3 { 
		font-weight: bold; 
		background-color: orange; 
		color: white;"	
		
	}	
</style>

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Static Navigation - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="https://code.jquery.com/jquery-3.7.0.js"  rel="stylesheet"/>
        <link href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.css"></script>
        
        <link href="${pageContext.request.contextPath}/resources/admin/static/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">Start Bootstrap</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">국내산</div>
                            <a class="nav-link" href="index.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                대시보드
                            </a>
                            <div class="sb-sidenav-menu-heading">주 기능</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                회원관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/memberManage/list">회원 목록</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">관리자 권한 설정</a>
                                </nav>
                            </div>           
                            
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                Pages
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        Authentication
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="login.html">Login</a>
                                            <a class="nav-link" href="register.html">Register</a>
                                            <a class="nav-link" href="password.html">Forgot Password</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        Error
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="401.html">401 Page</a>
                                            <a class="nav-link" href="404.html">404 Page</a>
                                            <a class="nav-link" href="500.html">500 Page</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">통계</div>
                            <a class="nav-link" href="charts.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Charts
                            </a>
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Tables
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        관리자
                    </div>
                </nav>
            </div>
                                 
   			<div class="body-container" style="width: 100%; margin: auto;" >
            	<main>
			        <div class="body-title">
			
			            <h2> 회원 목록 </h2>
			            <hr>
			    </div>

		<div>
			<ul class="tabs">
				<li id="tab-0" data-tab="0"><i class="fa-solid fa-person"></i>&nbsp;회원 리스트</li>
				<li id="tab-1" data-tab="1"><i class="fa-solid fa-chart-column"></i>&nbsp;회원 분석</li>
			</ul>
		</div>			
			        
			    <div class="container">

			        <div style="padding-bottom: 10px; display: flex;">
			            <select id="selectEnabled" class="form-select" onchange="searchList();" style="margin-right: 5px; padding: 2px; width: 140px;  display: flex;">
							<option value="" ${enabled=="" ? "selected":""}>:계정상태:</option>
							<option value="0" ${enabled=="0" ? "selected":""}>잠금 계정</option>
							<option value="1" ${enabled=="1" ? "selected":""}>활성 계정</option>
			            </select>  
			           
						<form name="searchForm" action="${pageContext.request.contextPath}/admin/memberManage/list" method="post" style="width: 650px; display: flex;">
							<select name="schType" class="form-select" style="width: 200px; padding: 3px; ">
								<option value="useridx"     ${schType=="useridx" ? "selected":""}>회원번호</option>
								<option value="user_name"   ${schType=="user_name" ? "selected":""}>이름</option>
								<option value="birth"      ${schType=="birth" ? "selected":""}>생년월일</option>
							</select>
							<input type="text" name="kwd" class="form-control" value="${kwd}" style="width: 200px; padding: 3px; display: flex;" >
							<input type="hidden" name="enabled" value="${enabled}">
							<input type="hidden" name="page" value="1">
							<button type="button" class="btn" onclick="searchList()" style="width: 100px; padding: 3px; ">검색</button>
			            	<a>${dataCount}개(${page}/${total_page} 페이지)</a>
						</form>	
			            	<button type="button" class="btn1" onclick="printMemberManage();" style="float: right;">Print</button>
			            	<button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/memberManage/excel';" class="btn2" style="float: right;">EXCEL</button>
							<button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/memberManage/pdf';" class="btn3" style="float: right;">PDF</button>
			        </div>
			
			
			
			        <form name="memberForm" method="post">
			        <table class="table table-border table-form" id="">
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
			            
			     		<c:forEach var="dto" items="${list}"  >   
			            	<tr class="hover" onclick="profile('${dto.useridx}');">
				                <td align="center">
				                    ${dto.useridx}
				                </td>
				                <td align="center">
				                    ${dto.user_name}
				                </td>
				                <td align="center">
				                    ${dto.usership==1?"일반회원":(dto.usership==51?"직원":"관리자")}
				                </td>
				                <td align="center"> 
				                    ${dto.birth}
				                </td>
				                <td align="center">
									${dto.reg_date}
				                </td>
				                <td align="center">
									${dto.rank1}
				                </td>
				                <td align="center">
									${dto.sale}%
				                </td>
				                <td align="center">
									${dto.enabled==1?"활성":"잠금"}
				                </td>
			            </tr>		
			          </c:forEach>   
			        </table>
			        
			   		<div class="page-navigation" align="center">
						${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
					</div>     
			        
			       </form>
			        
			    </div>	
			    
				<div id="member-dialog" class="modal" style="display: none;"></div>	
				<div id="member-dialog2" class="modal" style="display: none;"></div>	
						     
                </main>
                
                
                         <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; 킹혁 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/resources/admin/static/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.js"></script>
        
        
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

