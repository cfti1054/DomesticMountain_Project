<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tables - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="https://code.jquery.com/jquery-3.7.0.js"  rel="stylesheet"/>
        <link href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.css"></script>
        <link href="https://cdn.datatables.net/select/1.7.0/css/select.dataTables.min.css"></script>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css">

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/select/1.1.2/css/select.dataTables.min.css">   
        <link href="${pageContext.request.contextPath}/resources/admin/static/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        
        <script>
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
        </script>
        
        
        
    </head>
    <body class="sb-nav-fixed">
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
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="index.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            <div class="sb-sidenav-menu-heading">Interface</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Layouts
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="layout-static.html">Static Navigation</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">Light Sidenav</a>
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
                            <div class="sb-sidenav-menu-heading">Addons</div>
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
                        Start Bootstrap
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Tables</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                            <li class="breadcrumb-item active">Tables</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the
                                <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>
                                
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                FAQ 카테고리
                            </div>

						<div class="card-body">
						<form id="faq">
							<table id="faq_category_table" class="display"
								style="width: 100%; text-align: center">
								<thead>
									<tr>
										<th>카테고리 번호</th>
										<th>카테고리 이름</th>
										<th>등록인</th>
										<th>등록일자 </th>
										<th>보이기</th>
									</tr>
								</thead>

								<tfoot>
									<tr>
										<th>카테고리 번호</th>
										<th>카테고리 이름</th>
										<th>등록인</th>
										<th>등록일자</th>
										<th>보이기</th>
									</tr>
								</tfoot>

								<tbody>
									<c:forEach var="dto" items="${list}" varStatus="status">

										<tr>
											<td>${dto.faq_category_num}</td>
											<td>${dto.category_name}</td>
											<td>${dto.category_reg_id}</td>
											<td>${dto.category_reg_date}</td>
											<td>${dto.category_visible == 1 ? "O":"X"}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							</form>
							<p>
								<button type="submit" class="btn btn-secondary" id="visible_button">수정</button>
							</p>
							<p>
								<button type="button" class="btn btn-primary"
									onclick="location.href='${pageContext.request.contextPath}/admin/support/faq_category_write';">추가</button>
							</p>
							
							
							
							
							
                                
                            </div>
                        </div>
                    </div>
                    <div id="faq-dialog" style="display: none;"></div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
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
	
	

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.js" crossorigin="anonymous"></script>
        
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
    	<script src="https://cdn.datatables.net/select/1.7.0/js/dataTables.select.min.js"></script>
        <script type="text/javascript" src="//gyrocode.github.io/jquery-datatables-checkboxes/1.2.12/js/dataTables.checkboxes.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
		<script type="text/javascript" src="https://cdn.datatables.net/select/1.1.2/js/dataTables.select.min.js"></script>
        
        <script>
             /* simple data table 행 다중선택 스크립트 */
        $(document).ready(function() {
        	var oTable = $('#faq_category_table').DataTable();

        	$('#faq_category_table tbody').on( 'click', 'tr', function () {
        	    $(this).toggleClass('selected');
        	    var pos = oTable.row(this).index();
        	    var row = oTable.row(pos).data();
        	} );

        	$("#visible_button").on("click",function() {
        		var oAll =[];
        	 $('#faq_category_table tbody tr.selected').each(function(){
        		 var pos = oTable.row(this).index();
        		 var row = oTable.row(pos).data();
        	    oAll.push(row);
        	 });
        	 	/* 수정 버튼 눌렸을 때의 action*/

        	 		 let dlg = $("#faq-dialog").dialog({
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
             			title: " FAQ 카테고리 ",
             			close: function(event, ui) {
             			}
             		});
             		
             		let url = "${pageContext.request.contextPath}/admin/support/multi_category";
             		let query = "category_dto=" + oAll;
             		
             		
             		const fn = function(data) {
             			$("#faq-dialog").html(data);
             			dlg.dialog("open");
             		};
             		ajaxFun(url, "get", query, "text", fn);
             		
            	 			
            	 		
        	 	});
        	 	
        	 	});

             
             
            /*
            https://stackoverflow.com/questions/35498357/datatable-multiple-selection
            */
        </script>
        
        <script>
	
         function profile() {
        	let dlg = $("#faq-dialog").dialog({
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
        		title: "FAQ 카테고리",
        		close: function(event, ui) {
        		}
        	});
        	
        	var oAll =[];
       	 $('#faq_category_table tbody tr.selected').each(function(){
       		 var pos = $('#faq_category_table').DataTable().row(this).index();
       		 var row = $('#faq_category_table').DataTable().row(pos).data();
       	    oAll.push(row);
       	 })
       	 
       	 
        	let url = "${pageContext.request.contextPath}/admin/support/faq_category_write";
        	let query= oAll;
        	
        	const fn = function(data) {
        		$("#faq-dialog").html(data);
        		console.log("html data : ");
        		console.log(data);
        		dlg.dialog("open");
        	};
        	
        	ajaxFun(url, "post", query, "text", fn);
        } 
         function isEmpty(strIn)
         {
             if (strIn === undefined)
             {
                 return true;
             }
             else if(strIn == null)
             {
                 return true;
             }
             else if(strIn == "")
             {
                 return true;
             }
             else
             {
                 return false;
             }
         }
			
         function updateOk() {
				
        	 let param=[];
        	 
        	 $(".input").each(function(i){
        		 
        		 var data = {
        				 faq_category_num :$(this).parents('tr').find("input.faq_category_num").text(),
        				 category_name :$(this).parents('tr').find("input.category_name").text(),
        				 category_visible :$(this).parents('tr').find("input.category_visible").text(),
        		 };
        		 
        		 param.push(data);
        		 
        	 })
			var jsonData = JSON>stringify(param);
			jQuery.ajaxSettings.traditional=true;
				
			 $.ajax({
			        url : "${pageContext.request.contextPath}/admin/support/update_category_ok";,
			        type: 'POST',
			        headers: {
			            "mode" : CommonConstant.RequestMode.regist
			        },
			        data: {"jsonData" : jsonData},
			        dataType:'json',
			        success: function(data) {
			            alert('리스트에 추가하였습니다.');
			            
			        },
			        error: function(x, e) {
			            //err msg 출력
			            $.failMsg('error');
			        }
			    });
        	 
        		
        		$("#faq-dialog").dialog("close");
        	}
        </script>
        
        
    </body>
</html>
