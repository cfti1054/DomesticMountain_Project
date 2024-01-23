<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="https://code.jquery.com/jquery-3.7.0.js"  rel="stylesheet"/>
<link href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.css"/>
<link href="https://cdn.datatables.net/select/1.7.0/css/select.dataTables.min.css"/>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/select/1.1.2/css/select.dataTables.min.css"/>   
<link href="${pageContext.request.contextPath}/resources/admin/static/css/styles.css" rel="stylesheet"/>
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
        		    	
        				console.log("status : ");
        				console.log(jqXHR.status);
        				console.log("statusText : ");
        				console.log(jqXHR.statusText);
        				console.log("responseText : ");
        				console.log(jqXHR.responseText);
        				console.log("readyState: ");
        				console.log(jqXHR.readyState);
        				
        			}
        	};
        	
        	if(file) {
        		settings.processData = false;  // file 전송시 필수. 서버로전송할 데이터를 쿼리문자열로 변환여부
        		settings.contentType = false;  // file 전송시 필수. 서버에전송할 데이터의 Content-Type. 기본:application/x-www-urlencoded
        	}
        	
        	$.ajax(url, settings);
        }
        
function showContent(faq_num) {
        	let dlg = $("#faq-dialog").dialog({
       			autoOpen: false,
       			modal: true,
       			buttons: {
       				 " 닫기 ": function() {
       					$(this).dialog("close");
       				}
       			},
       			
       			height: 550,
       			width: 800,
       			title: " FAQ 답변",
       			close: function(event, ui) {
       			}
       		});
       		
       		let url = "${pageContext.request.contextPath}/admin/support/show_content";
       		let query = "faq_num=" + faq_num;
       		
       		
       		const fn = function(data) {
       			$("#faq-dialog").html(data);
       			dlg.dialog("open");
       		};
       		ajaxFun(url, "get", query, "text", fn);
}
</script>

<div id="layoutSidenav_content">
	<main class="mt-4">
		<div class="container-fluid px-4">
			<div>
			<h1 class="mt-4">Tables</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/">Dashboard</a></li>
                            <li class="breadcrumb-item active">FAQ 질문과 답변</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                고객이 자주 묻는 질문과 답변들을 추가 / 수정할 수 있습니다.
                                
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                FAQ 질문과 답변
                            </div>

						<div class="card-body">
						<form id="faq">
							<table id="faq_board_table" class="display"
								style="width: 100%; text-align: center; word-break: keep-all;">
								<thead>
									<tr>
										<th>번호</th>
										<th>분류</th>
										<th>질문</th>
										<th>답변 </th>
										<th>등록인</th>
										<th>등록일자</th>
										<th>보이기</th>
									</tr>
								</thead>

								<tfoot>
									<tr>
										<th>번호</th>
										<th>분류</th>
										<th>질문</th>
										<th>답변 </th>
										<th>등록인</th>
										<th>등록일자</th>
										<th>보이기</th>
									</tr>
								</tfoot>

								<tbody>
									<c:forEach var="dto" items="${list}" varStatus="status">

										<tr>
											<td width="5%">${dto.faq_num}</td>
											<td width="15%">${dto.category_name}</td>
											<td width="25%">${dto.faq_question}</td>
											<td width="20%">
												<%-- <textarea  style="white-space: pre-line; width: 80%;" cols="40" rows="3" readonly>
													${dto.faq_content}
												</textarea> --%>
												<button type="button" class="btn btn-info" id="show_content" onclick="showContent('${dto.faq_num}');">답변 보기</button>
											</td>
											<td width="10%">${dto.faq_reg_id}</td>
											<td width="15%">${dto.faq_reg_date}</td>
											<td width="10%">${dto.visible == 1 ? "O":"X"}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							</form>
							<p>
								<button type="submit" class="btn btn-secondary" id="visible_button">수정</button>
							</p>
							<p>
								<button type="button" class="btn btn-primary" id="add_button">추가</button>
							</p>
                            </div>
                        </div>
					<div id="faq-dialog" style="display: none;"></div>
				</div>	
		</div>
	</main>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.js" crossorigin="anonymous"></script>
        
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.js" crossorigin="anonymous"></script>

        <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
    	<script src="https://cdn.datatables.net/select/1.7.0/js/dataTables.select.min.js"></script>
        <script type="text/javascript" src="//gyrocode.github.io/jquery-datatables-checkboxes/1.2.12/js/dataTables.checkboxes.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
		<script type="text/javascript" src="https://cdn.datatables.net/select/1.1.2/js/dataTables.select.min.js"></script>
        
        <script>
             /* simple data table 행 다중선택 스크립트 */
              var columnIndex = 1;
            var newHeaderText = "분류";
        $(document).ready(function() {
        	var oTable = $('#faq_board_table').DataTable({
        		language: {
        			"emptyTable": "데이터가 없습니다",
        		    "info": "_START_ - _END_ \/ _TOTAL_",
        		    "infoEmpty": "0 - 0 \/ 0",
        		    "infoFiltered": "(총 _MAX_ 개)",
        		    "infoThousands": ",",
        		    "lengthMenu": "페이지당 데이터 수 _MENU_",
        		    "loadingRecords": "읽는중...",
        		    "processing": "처리중...",
        		    "search": "검색:",
        		    "zeroRecords": "검색 결과가 없습니다",
        		    "paginate": {
        		        "first": "처음",
        		        "last": "마지막",
        		        "next": "다음",
        		        "previous": "이전"
        		    },
        		    "aria": {
        		        "sortAscending": ": 오름차순 정렬",
        		        "sortDescending": ": 내림차순 정렬"
        		    }
        		}
        	});
        	var columnHeader = oTable.column(columnIndex).header();
        	var columnFooter = oTable.column(columnIndex).footer();
        	/* $(columnHeader).attr('aria-label', newAriaLabel); */
        	$(columnHeader).text(newHeaderText);
        	$(columnFooter).text(newHeaderText);

        	$('#faq_board_table tbody').on( 'click', 'tr', function () {
        	    $(this).toggleClass('selected');
        	    var pos = oTable.row(this).index();
        	    var row = oTable.row(pos).data();
        	} );

        	$("#visible_button").on("click",function() {
        		var oAll =[];
        	 $('#faq_board_table tbody tr.selected').each(function(){
        		 var pos = oTable.row(this).index();
        		 var row = oTable.row(pos).data();
        	    oAll.push(row);
        	 });
        	 	/* 수정 버튼 눌렸을 때의 action*/

        	 	if(oAll.length === 0) {
        	 		alert("수정하려면 한개 이상의 행을 선택하세요");
        	 		return;
        	 	}
        	 	
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
             			title: " FAQ 질문글 ",
             			close: function(event, ui) {
             			}
             		});
             		
             		let url = "${pageContext.request.contextPath}/admin/support/multi_board";
             		let query = "dto_list=" + oAll;
             		
             		
             		const fn = function(data) {
             			$("#faq-dialog").html(data);
             			dlg.dialog("open");
             		};
             		ajaxFun(url, "get", query, "text", fn);
             		
            	 			
            	 		
        	 	});
        	
        	/* 답변 보기 버튼 눌렀을  때 */
        	/* $("#show_content").on("click", function() {
        		var oAll = [];
        		$('#faq_board_table tbody tr.selected').each(function(){
        		
        		
        		var pos = oTable.row(this).index();
        		var row = oTable.row(pos).data();
        		oAll.push(row);
        		console.log(pos);
        		console.log(row);
        		});	
        		 let dlg = $("#faq-dialog").dialog({
           			autoOpen: false,
           			modal: true,
           			buttons: {
           				 " 닫기 ": function() {
           					$(this).dialog("close");
           				}
           			},
           			
           			height: 550,
           			width: 800,
           			title: " FAQ 답변",
           			close: function(event, ui) {
           			}
           		});
           		
           		let url = "${pageContext.request.contextPath}/admin/support/show_content";
           		let query = "num=" + oAll;
           		
           		
           		const fn = function(data) {
           			$("#faq-dialog").html(data);
           			dlg.dialog("open");
           		};
           		ajaxFun(url, "get", query, "text", fn);
        		
        	}); */
	});

             
             
            /*
            https://stackoverflow.com/questions/35498357/datatable-multiple-selection
            */
        </script>
        
        <script>
        
        
        
        $("#add_button").on("click",function() {
        	let dlg = $("#faq-dialog").dialog({
        		autoOpen: false,
        		modal: true,
        		buttons: {
        			" 추가 " :function(){
        				writeOk();
        			}, " 닫기 ": function() {
        				$(this).dialog("close");
        			}
        		},
        		
        		height: 550,
        		width: 800,
        		title: "FAQ 추가",
        		close: function(event, ui) {
        		}
        	});
        	
        	let url = "${pageContext.request.contextPath}/admin/support/faq_board_write";
        	let query = "mode=write&type=board";
        	
        	const fn = function(data) {
        		$("#faq-dialog").html(data);
        		dlg.dialog("open");
        	};
        	
        	ajaxFun(url, "get", query, "text", fn);
        });
        
        function writeOk() {
        	const f = document.boardWriteForm;
        	
        	if(! f.faq_question.value) {
        		alert("질문을 입력하세요.");
        		f.faq_question.focus();
        		return;
        	}
        	
        	if(! f.faq_content.value) {
        		alert("내용을 입력하세요.");
        		f.faq_content.focus();
        		return;
        	}
        	
        	if(f.category_list.value === "" ) {
        		alert("카테고리를 선택하세요.");
        		f.category_list.focus();
        		return;
        	}
        	
        	let url = "${pageContext.request.contextPath}/admin/support/faq_board_write";
        	let query = $("#boardWriteForm").serialize() + "&faq_category_num=" + $("#category_list").val();
        	
        	const fn = function(data) {
        		
        	}
        	ajaxFun(url, "post", query, "json", fn);
        	
        	$("#faq-dialog").dialog("close");
        	
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
         
		/* 수정 확정 */
         function updateOk() {
			
        	 let board_list=[];
        	 let content_list=[];
        	 const f = document.boardUpdateForm;
 
					$(".input").each(function(index, item){
						
						if( isEmpty($(item).val()) ) {
							alert("값을 입력하세요.");
							f.$(item).focus();
							return;
						}
						
						board_list.push($(item).val())

					});
					/*
					$(".textarea").each(function(index, item){
						
						if( isEmpty($(item).val()) ) {
							alert("값을 입력하세요.");
							return;
						}
						
						content_list.push($(item).val())
					});
					*/
					
					
					
					let url = "${pageContext.request.contextPath}/admin/support/update_board_ok";
		        	let query = "board_list=" + board_list;
		        	
		        	const fn = function(data) {
		        		
		        	}
		        	ajaxFun(url, "get", query, "json", fn);
		        	
		        	
		        	$("#faq-dialog").dialog("close");
        
        	 }
        </script>
