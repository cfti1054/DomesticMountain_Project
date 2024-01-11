<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet"/>
<link href="https://code.jquery.com/jquery-3.7.0.js"  rel="stylesheet"/>
<link href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.css"/>
<link href="https://cdn.datatables.net/select/1.7.0/css/select.dataTables.min.css"/>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/select/1.1.2/css/select.dataTables.min.css"/>   
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
</script>

<div id="layoutSidenav_content">
	<main class="mt-4">
		<div class="container-fluid px-4">


			<div>
				<h1 class="mt-4">주문 관리</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
					<li class="breadcrumb-item active">주문 리스트</li>
				</ol>
				<div class="card mb-4">
					<div class="card-body">
						고객들의 주문을 관리 할 수 있습니다.
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 주문 리스트
					</div>

					<div class="card-body">
						<form id="faq">
							<table id="order_table" class="display"
								style="width: 100%; text-align: center">
								<thead>
									<tr>
										<th>주문번호</th>
										<th>주문일자</th>
										<th>배송일자</th>
										<th>회원 아이디</th>
										<th>총 주문 금액</th>
										<th>배송비</th>
										<th>할인 금액</th>
										<th>포인트 사용 금액 </th>
										<th>총 적립 금액</th>
										<th>총 결제 금액</th>
									</tr>
								</thead>

								<tfoot>
									<tr>
										<th>주문번호</th>
										<th>주문일자</th>
										<th>배송일자</th>
										<th>회원 아이디</th>
										<th>총 주문 금액</th>
										<th>배송비</th>
										<th>할인 금액</th>
										<th>포인트 사용 금액 </th>
										<th>총 적립 금액</th>
										<th>총 결제 금액</th>
									</tr>
								</tfoot>

								<tbody>
									<c:forEach var="dto" items="${list}" varStatus="status">

										<tr>
											<td>${dto.order_num}</td>
											<td>${dto.order_date}</td>
											<td>${dto.transport_date}</td>
											<td>${dto.user_name}</td>
											<td>${dto.order_total_money}</td>
											<td>${dto.shipping}</td>
											<td>${dto.order_sale}</td>
											<td>${dto.order_point}</td>
											<td>${dto.order_earn}</td>
											<td>${dto.total_amount}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<input type="hidden" value="${dto.useridx}">
						</form>
						<p>
							<button type="submit" class="btn btn-secondary" id="visible_button">수정</button>
						</p>
						<p>
							<button type="button" class="btn btn-primary" id="add_button" >추가</button>
							<!-- onclick="write();" -->
						</p>

					</div>
				</div>
				<div id="order-dialog" style="display: none;"></div>
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
             function updateOk() {
				
        	 const f = document.categoryUpdateForm;
        	 let param=[];
        	 
        	 $(".input").each(function(index, item){
        		 
        		 	param.push($(item).val());
        		 	console.log($(item).val());
        		 });
        	 }
             
        $(document).ready(function() {
        	var oTable = $('#order_table').DataTable();

        	$('#order_table tbody').on( 'click', 'tr', function () {
        	    $(this).toggleClass('selected');
        	    var pos = oTable.row(this).index();
        	    var row = oTable.row(pos).data();
        	} );

        	$("#visible_button").on("click",function() {
        		var oAll =[];
        	 $('#order_table tbody tr.selected').each(function(){
        		 var pos = oTable.row(this).index();
        		 var row = oTable.row(pos).data();
        	    oAll.push(row);
        	 });
        	 	/* 수정 버튼 눌렸을 때의 action*/

        	 	if(oAll.length == 0) {
        	 		alert("수정하려면 한개 이상의 행을 선택하세요");
        	 		return;
        	 		
        	 	}
        	 	
        	 	
        	 		 let dlg = $("#order-dialog").dialog({
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
             			$("#order-dialog").html(data);
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
        
        /* 추가 모달 생성 */
        $("#add_button").on("click",function() {
        	let dlg = $("#order-dialog").dialog({
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
        		title: "카테고리 추가",
        		close: function(event, ui) {
        		}
        	});
        	
        	let url = "${pageContext.request.contextPath}/admin/support/faq_category_write";
        	let query = "mode=write&type=category";
        	
        	const fn = function(data) {
        		$("#order-dialog").html(data);
        		dlg.dialog("open");
        	};
        	
        	ajaxFun(url, "get", query, "text", fn);
        });
        
        /* 추가 확정 */
        function writeOk() {
        	const f = document.categoryWriteForm;
        	
        	if(! f.category_name.value) {
        		alert("카테고리 이름을 입력하세요.");
        		f.category_name.focus();
        		return;
        	}
        	
        	if(f.category_visible.value === "" ) {
        		alert("보이기 상태를 선택하세요.");
        		f.category_visible.focus();
        		return;
        	}
        	
        	let url = "${pageContext.request.contextPath}/admin/support/faq_category_write";
        	let query = $("#categoryWriteForm").serialize();
        	
        	const fn = function(data) {
        		
        	}
        	ajaxFun(url, "post", query, "json", fn);
        	
        	$("#order-dialog").dialog("close");
        	
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
			
        	 let category_list=[];
        	 
 
 
					$(".input").each(function(index, item){
						
						if( isEmpty($(item).val()) ) {
							alert("값을 입력하세요.");
							return;
						}
						
						
						category_list.push($(item).val())
						
						
						
					});
					
					
					let url = "${pageContext.request.contextPath}/admin/support/update_category_ok";
		        	let query = "category_list=" + category_list;
		        	
		        	const fn = function(data) {
		        		
		        	}
		        	ajaxFun(url, "get", query, "json", fn);
		        	
		        	
		        	$("#faq-dialog").dialog("close");
        
        	 }
         	
         	
         	
        </script>

