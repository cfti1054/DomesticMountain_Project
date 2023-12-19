<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<script type="text/javascript">
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
					alert('��û ó���� ���� �߽��ϴ�.');
					return false;
		    	}
		    	
				console.log(jqXHR.responseText);
			}
	};
	
	if(file) {
		settings.processData = false;  // file ���۽� �ʼ�. ������������ �����͸� �������ڿ��� ��ȯ����
		settings.contentType = false;  // file ���۽� �ʼ�. ������������ �������� Content-Type. �⺻:application/x-www-urlencoded
	}
	
	$.ajax(url, settings);
}

function profile(useridx) {
	let dlg = $("#member-dialog").dialog({
		autoOpen: false,
		modal: true,
		buttons: {
			" ���� " :function(){
				updateOk();
			}, " �ݱ� ": function() {
				$(this).dialog("close");
			}
		},
		
		height: 550,
		width: 800,
		title: "ȸ�� �� ����",
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

function updateOk() {
	const f = document.deteailedMemberForm;
	
	if(! f.is_blocked.value) {
		alert("���� �ڵ带 �����ϼ���");
		f.is_blocked.focus();
		return;
	}
	
	if(! f.blocked_reason.value.trim()) {
		alert("���¿� ���� �޸� �Է� �ϼ���");
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
	if(confirm("������ ������ ���� �Ͻðڽ��ϱ� ?")) {
	}
	
	$('#member-dialog').dialog("close");
}

function memberStateDetaileView() {
	$("#memberStateDetaile").dialog({
		modal: true,
		minHeight: 100,
		maxHeight: 450,
		width: 750,
		title: "ȸ�� ���� ��",
		close: function(event, ui) {
			$(this).dialog("destroy");	
		}
	});
}

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

</script>
    <style type="text/css">
        /* container */
        .container { width: 600px; margin: 30px auto 25px; }
        .title { width:100%; font-size: 16px; font-weight: bold; padding: 13px 0; }
        
        .table-form { margin-top: 7px; }
        .table-form td { padding: 7px 0; }
        .table-form tr:first-child { border-top: 2px solid #212529; }
        .table-form tr > td:first-child { width: 120px; text-align: center; background: #f8f9fa; }
        .table-form tr > td:nth-child(2) {padding-left: 10px; }

        * { padding: 0; margin: 0; }
*, *::after, *::before { box-sizing: border-box; }

body {
	font-family:"Malgun Gothic", "���� ���", NanumGothic, �������, ����, sans-serif;
	font-size: 14px;
	color: #222;
}

a { color: #222; text-decoration: none; cursor: pointer; }
a:active, a:hover { color: #f28011; text-decoration: underline; }

/* form-control */
.btn {
	color: #333;
	border: 1px solid #999;
	background-color: #fff;
	padding: 5px 10px;
	border-radius: 4px;
	font-weight: 500;
	cursor:pointer;
	font-size: 14px;
	font-family: "���� ���", �������, ����, sans-serif;
	vertical-align: baseline;
}
.btn:active, .btn:focus, .btn:hover {
	background-color: #f8f9fa;
	color:#333;
}
.btn[disabled], fieldset[disabled] .btn {
	pointer-events: none;
	cursor: default;
	opacity: .65;
}

.form-control {
	border: 1px solid #999; border-radius: 4px; background-color: #fff;
	padding: 5px 5px; 
	font-family: "���� ���", �������, ����, sans-serif;
	vertical-align: baseline;
}
.form-control[readonly] { background-color:#f8f9fa; }

textarea.form-control { height: 170px; resize : none; }

.form-select {
	border: 1px solid #999; border-radius: 4px; background-color: #fff;
	padding: 4px 5px; 
	font-family: "���� ���", �������, ����, sans-serif;
	vertical-align: baseline;
}
.form-select[readonly] { background-color:#f8f9fa; }

textarea:focus, input:focus { outline: none; }
input[type=checkbox], input[type=radio] { vertical-align: middle; }

/* table */
.table { width: 100%; border-spacing: 0; border-collapse: collapse; }
.table th, .table td { padding-top: 10px; padding-bottom: 10px; }

.table-border thead > tr { border-top: 2px solid #212529; border-bottom: 1px solid #ced4da; }
.table-border tbody > tr { border-bottom: 1px solid #ced4da; }
.table-border tfoot > tr { border-bottom: 1px solid #ced4da; }
.td-border td { border: 1px solid #ced4da; }  

</style>

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Static Navigation - SB Admin</title>
        <link href="${pageContext.request.contextPath}/resources/admin/static/css/styles.css" rel="stylesheet" type = "text/css"/>
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
                            <div class="sb-sidenav-menu-heading">������</div>
                            <a class="nav-link" href="index.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                ��ú���
                            </a>
                            <div class="sb-sidenav-menu-heading">�� ���</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                ȸ������
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/memberManage/list">ȸ�� ���</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">������ ���� ����</a>
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
                            <div class="sb-sidenav-menu-heading">���</div>
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
                        ������
                    </div>
                </nav>
            </div>
                                 
   			<div class="body-container" style="width: 100%; margin: auto;" >
            	<main>
			        <div class="body-title">
			
			            <h2> ȸ�� ��� </h2>
			            <hr>
			    </div>

		<div>
			<ul class="tabs">
				<li id="tab-0" data-tab="0"><i class="fa-solid fa-person"></i>&nbsp;ȸ�� ����Ʈ</li>
				<li id="tab-1" data-tab="1"><i class="fa-solid fa-chart-column"></i>&nbsp;ȸ�� �м�</li>
			</ul>
		</div>			
			        
			    <div class="container">

			        <div style="padding-bottom: 10px; ">
			            <select id="selectEnabled" class="form-select" onchange="searchList();" style="float: left; margin-right: 5px; padding: 2px; width: 140px;">
							<option value="" ${enabled=="" ? "selected":""}>:��������:</option>
							<option value="0" ${enabled=="0" ? "selected":""}>��� ����</option>
							<option value="1" ${enabled=="1" ? "selected":""}>Ȱ�� ����</option>
			            </select>  
			           
						<form name="searchForm" action="${pageContext.request.contextPath}/admin/memberManage/list" method="post" style="float: left;">
							<select name="schType" class="form-select" style="width: 200px; padding: 3px;">
								<option value="useridx"     ${schType=="useridx" ? "selected":""}>ȸ����ȣ</option>
								<option value="user_name"   ${schType=="user_name" ? "selected":""}>�̸�</option>
								<option value="birth"      ${schType=="birth" ? "selected":""}>�������</option>
							</select>
							<input type="text" name="kwd" class="form-control" value="${kwd}" style="width: 300px; padding: 3px; float: left;" >
							<input type="hidden" name="enabled" value="${enabled}">
							<input type="hidden" name="page" value="1">
							<button type="button" class="btn" onclick="searchList()" style="width: 100px; padding: 3px; float: left;">�˻�</button>
			            	<a style="float: right;">${dataCount}��(${page}/${total_page} ������)</a>
						</form>	
			        </div>
			
			
			
			        <form name="memberForm" method="post" id="datatablesSimple">
			        <table class="table table-border table-form">
			            <tr>
			                <td style="width: 10%;" align="center">üũ</td>
			                <td style="width: 10%;" align="center">ȸ����ȣ</td>
			                <td style="width: 10%;" align="center">ȸ���̸�</td>
			                <td style="width: 10%;" align="center">�������</td>
			                <td style="width: 30%;" align="center">������</td>
			                <td style="width: 10%;" align="center">�̸���</td>
			                <td style="width: 10%;" align="center">ȸ������</td>
			                <td style="width: 10%;" align="center">����</td>
			            </tr>
						
			     		<c:forEach var="dto" items="${list}" varStatus="status">   
			            	<tr class="hover" onclick="profile('${dto.useridx}');">
				                <td align="center">
				                    <input type="checkbox">
				                </td>
				                <td align="center">
				                    ${dto.useridx}
				                </td>
				                <td align="center">
				                    ${dto.user_name}
				                </td>
				                <td align="center"> 
				                    ${dto.birth}
				                </td>
				                <td align="center">
									${dto.reg_date}
				                </td>
				                <td align="center">
									${dto.email}
				                </td>
				                <td align="center">
									${dto.usership==1?"�Ϲ�ȸ��":(dto.usership==51?"����":"������")}
				                </td>
				                <td align="center">
									${dto.enabled==1?"Ȱ��":"���"}
				                </td>
			            </tr>		
			          </c:forEach>   
			        </table>
			        
			   		<div class="page-navigation" align="center">
						${dataCount == 0 ? "��ϵ� �Խù��� �����ϴ�." : paging}
					</div>     
			   		
			        <table class="table">
			            <tr>
			                <td align="left">
			                    <button type="button" class="btn" style="border-color: black;"> ��μ��� </button>
			                    <button type="reset" class="btn" style="border-color: black;"> �������� </button>
			                    <button type="button" class="btn" style="float: right; border-color: black;"> ���û��� </button>
			                </td>
			            </tr>
			
			        </table>
			        
			        
			        </form>
			        
			    </div>	
			    
				<div id="member-dialog" style="display: none;"></div>	
						     
                </main>
                
                
                         <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; ŷ�� 2023</div>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous">

        window.addEventListener('DOMContentLoaded', event => {

            const datatablesSimple = document.getElementById('datatablesSimple');
            if (datatablesSimple) {
                new simpleDatatables.DataTable(datatablesSimple);
            }
        });
        
        </script>
    </body>
</html>