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
        
     // 탭
        $(function(){
        	$("button[role='tab']").on('click', function(){
        		const tab = $(this).attr("aria-controls");
        		
        		if(tab === "1") { // 주문관리
        			location.href = "${pageContext.request.contextPath}/admin/orderManage/status";
        		} else if( tab === "2") { // 배송관리
        			location.href = "${pageContext.request.contextPath}/admin/orderManage/delivery";
        		}
        	});
        });
</script>

<div id="layoutSidenav_content">
	<main class="mt-4">
		<div class="container-fluid px-4">


			<div>
				<h1 class="mt-4">주문 현황</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
					<li class="breadcrumb-item active">주문 리스트</li>
				</ol>
				<div class="card mb-4">
					<div class="card-body">
						고객들의 주문을 관리 할 수 있습니다.
					</div>
				</div>
				
				<ul class="nav nav-tabs mt-5" id="myTab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link ${orderStatus=='status'?'active':''}" id="tab-1" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="1" aria-selected="${orderStatus=='status'?'true':'false'}">주문관리</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link ${orderStatus=='delivery'?'active':''}" id="tab-2" data-bs-toggle="tab" data-bs-target="#tab-pane" type="button" role="tab" aria-controls="2" aria-selected="${orderStatus=='delivery'?'true':'false'}">배송관리</button>
					</li>
				</ul>
				
				<div class="tab-content pt-4" id="myTabContent">
				
				<div class="card mb-4">
					<div class="card-header">
						<c:if test="${orderStatus =='status'}">
			            	<div class="form-check form-check-inline">
			            		<input type="radio" id="order-state1" class="form-check-input" name="orderstatus" value="1" ${state==1 ? "checked='checked'" : ""}> <label class="form-check-label" for="order-state1">신규 주문</label>
			            	</div>
			            	<div class="form-check form-check-inline">
			            		<input type="radio" id="order-state2" class="form-check-input" name="orderstatus" value="2" ${state==2 ? "checked='checked'" : ""}> <label class="form-check-label" for="order-state2">전체 주문</label>
			            	</div>
		            	</c:if>
					</div>

					<div class="card-body">
						<form id="order">
							<table id="order_table" class="display"
								style="width: 100%; text-align: center">
								<thead>
									<tr>
										<th>주문번호</th>
										<th>주문일자</th>
										<th>회원 아이디</th>
										<th>${orderStatus=="status"?"주문수량":"송장번호"}</th>
										<th>취소건수</th>
										<th>할인 액</th>
										<th>배송비</th>
										<th>총 주문 금액</th>
										<th>총 결제 금액</th>
									</tr>
								</thead>

								<tfoot>
									<tr>
										<th>주문번호</th>
										<th>주문일자</th>
										<th>회원 아이디</th>
										<th>${orderStatus=="status"?"주문수량":"송장번호"}</th>
										<th>취소건수</th>
										<th>할인 액</th>
										<th>배송비</th>
										<th>총 주문 금액</th>
										<th>총 결제 금액</th>
									</tr>
								</tfoot>

								<tbody>
									<c:forEach var="dto" items="${list}" varStatus="status">

										<tr valign="middle" data-orderNum="${dto.orderNum}">
											<td>${dto.orderNum}</td>
											<td>${dto.orderDate}</td>
											<td>${dto.userName}</td>
											<td>${orderStatus=="status"?dto.totalQty:dto.invoiceNumber}</td>
											<td>${dto.detailCancelCount}</td>
											<td><fmt:formatNumber value="${dto.orderSale}"/></td>
											<td><fmt:formatNumber value="${dto.deliveryCharge}"/></td>
											<td><fmt:formatNumber value="${dto.totalMoney}"/></td>
											<td><fmt:formatNumber value="${dto.payment}"/></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<input type="hidden" value="${dto.memberIdx}">
						</form>
					</div>
				</div>
			</div>


		</div>
	</main>
</div>

<!-- 주문정보-상태변경/배송변경 대화상자  -->
<div class="modal fade" id="orderDialogModal" tabindex="-1" aria-labelledby="orderDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="orderDialogModalLabel">주문정보</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body pt-1">
				<div class="modal-order-detail"></div>
			</div>
		</div>
	</div>
</div>

<!-- 주문상세정보-상태변경/상태확인 대화상자  -->
<div class="modal fade" id="orderDetailStateDialogModal" tabindex="-1" aria-labelledby="orderDetailStateDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="orderDetailStateDialogModalLabel">주문상세정보</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body pt-1">
				<div class="mt-1 p-1">
					<div class="p-1"><p class="form-control-plaintext optionDetail-value"></p></div>
					<table class="table board-list">
						<thead class="table-light">
							<tr>
								<td width="50">코드</td>
								<td width="120">구분</td>
								<td width="90">작성자</td>
								<td width="120">날짜</td>
								<td>설명</td>
							</tr>
						</thead>
						<tbody class="detailState-list"></tbody>	
					</table>
				</div>
				
				<div class="p-1 detailStateUpdate-form">
					<form name="detailStateForm" class="row justify-content-center">
						<div class="col-auto p-1">
							<select name="detailState" class="form-select"></select>
						</div>
						<div class="col-6 p-1">
							<input type="text" name="stateMemo" class="form-control" placeholder="상태 메시지 입력">
						</div>
						<div class="col-auto p-1">
							<input type="hidden" name="orderNum">
							<input type="hidden" name="orderDetailNum">
							<input type="hidden" name="productMoney">
							<input type="hidden" name="cancelAmount">
							<button type="button" class="btn btn-light btnDetailStateUpdateOk"> 변경 </button>
						</div>
					</form>
				</div>
				
			</div>
		</div>
	</div>
</div>
<!-- 발송처리 대화상자 -->
<div class="modal fade" id="prepareDialogModal" tabindex="-1" aria-labelledby="prepareDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="prepareDialogModalLabel">발송처리</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body pt-1">
				<form class="row text-center" name="invoiceNumberForm">
					<div class="col-auto p-1">
						<select name="deliveryName" class="form-select">
							<c:forEach var="vo" items="${listDeliveryCompany}">
								<option>${vo.DELIVERYNAME}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col p-1">
						<input name="invoiceNumber" type="text" class="form-control" placeholder="송장번호입력">
					</div>
					<div class="col-auto p-1">
						<input type="hidden" name="orderNum" value="">
						<input type="hidden" name="orderState" value="2">
						<button type="button" class="btn btnInvoiceNumberOk">변경완료</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- 주문상세 대화상자  -->
<div class="modal fade" id="orderDialogModal" tabindex="-1" aria-labelledby="orderDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="orderDialogModalLabel">주문상세정보</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body pt-1">
				<div class="modal-order-detail"></div>
			</div>
		</div>
	</div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.js" crossorigin="anonymous"></script>
        
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.js" crossorigin="anonymous"></script>
        
        <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
    	<script src="https://cdn.datatables.net/select/1.7.0/js/dataTables.select.min.js"></script>
        <script type="text/javascript" src="//gyrocode.github.io/jquery-datatables-checkboxes/1.2.12/js/dataTables.checkboxes.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
		<script type="text/javascript" src="https://cdn.datatables.net/select/1.1.2/js/dataTables.select.min.js"></script>
        
<script>
//라디오버튼(신규주문/전체주문)
$(function(){
	$("input[name=orderstatus]").click(function(){
		let state = $(this).val();
		let url = "${pageContext.request.contextPath}/admin/orderManage/${orderStatus}?state="+state;
		location.href = url;
	});
});

//주문정보-상태변경/배송변경 대화상자 
$(function(){
	$(".orderStatus-update").click(function(){
		let orderNum = $(this).attr("data-orderNum");
		let orderStatus = "${orderStatus}";
		let url = "${pageContext.request.contextPath}/admin/orderManage/order_detail/info?orderNum="+orderNum+"&orderStatus="+orderStatus;
		
		$(".modal-order-detail").load(url);
		
		$("#orderDialogModal").modal("show");
	});
});

//발송처리 대화상자(송장번호 입력)
$(function(){
	$("body").on("click", ".btn-prepare-order",function(){
		let orderNum = $(this).attr("data-orderNum");
		
		document.invoiceNumberForm.orderNum.value = orderNum;
		
		$("#prepareDialogModal").modal("show");
	});
});

//송장번호 등록
$(function(){
	$(".btnInvoiceNumberOk").click(function(){
		const f = document.invoiceNumberForm;
		if(! f.invoiceNumber.value.trim()) {
			alert('송장 번호를 입력하세요');
			return false;
		}
		
		let qs = $('form[name=invoiceNumberForm]').serialize();
		let url = '${pageContext.request.contextPath}/admin/orderManage/order_detail/invoiceNumber';
		
		const fn = function(data) {
			if(data.state === "true") {
				
				f.reset();
				
				$("#prepareDialogModal").modal("hide");
				$("#orderDialogModal").modal("hide");
				
				let url = "${pageContext.request.contextPath}/admin/orderManage/${orderStatus}";
				location.href = url;
			} else {
				alert("발송처리가 실패 했습니다.");
			}
		};
		
		ajaxFun(url, "post", qs, "json", fn);
	});
});

//배송 변경(배송중/배송완료)
$(function(){
	$("body").on("click", ".btn-delivery-order", function(){
		const $EL = $(this);
		let orderNum = $EL.attr("data-orderNum");
		let preState = $EL.attr("data-trStatus");
		
		let orderState = $EL.closest(".delivery-update-area").find("select").val();
		let orderStateInfo = $EL.closest(".delivery-update-area").find("select option:selected").text();
		
		if(preState >= orderState) {
			alert('배송 변경은 현 배송 단계보다 적거나 같을수 없습니다.');
			return false;
		}
		
		let qs = 'orderNum=' + orderNum + '&orderState=' + orderState;
		let url = '${pageContext.request.contextPath}/admin/orderManage/order_detail/delivery';

		const fn = function(data) {
			if(data.state === "true") {
				
				$("#orderDialogModal").modal("hide");
				
				let url = "${pageContext.request.contextPath}/admin/orderManage/${orderStatus}";
				location.href = url;
			}
		};
		
		ajaxFun(url, "post", qs, "json", fn);
	});
});

//판매 취소
$(function(){
	$('body').on('click', '.btn-cancel-order',function(){
		let orderNum = $(this).attr('data-orderNum');
		
		
		let qs = 'orderNum=' + orderNum;
		let url = '${pageContext.request.contextPath}/admin/orderManage/order_detail/cancel';
		
		const fn = function(data) {
			if(data.state === "true") {
				alert('모든 구매내역 판매취소...');
				$("#orderDialogModal").modal("hide");
			} else {
				alert("취소처리가 실패했습니다.");
			}
		};
	
		ajaxFun(url, "post", qs , "json" , fn);
		
	});
});

//주문상세 - 상태확인/변경
$(function(){
	$('body').on('click', '.orderDetailStatus-update', function(){
		const f = document.detailStateForm;
		f.reset();
		
		let orderNum = $(this).attr("data-orderNum");
		let orderState = $(this).attr("data-orderState");
		let orderDetailNum = $(this).attr("data-orderDetailNum");
		let detailState = $(this).attr("data-detailState");
		
		let productMoney = $(this).attr("data-productMoney");
		console.log(productMoney);
		let cancelAmount = $(".order-cancelAmount").attr("data-cancelAmount");
		
		f.orderNum.value = orderNum;
		f.orderDetailNum.value = orderDetailNum;
		f.productMoney.value = productMoney;
		f.cancelAmount.value = cancelAmount;
		
		let opt = $(this).closest("tr").find("td").eq(4).text();

		let $SELECT = $('form[name=detailStateForm] select[name=detailState]');
		$('form[name=detailStateForm] select[name=detailState] option').remove();
		
		if(orderState==="3") {
			// 주문상태-판매취소
			$(".detailStateUpdate-form").hide();
		} else if(detailState==='1' || detailState==='2' || detailState==='5' || detailState==='12') {
			// 주문상세상태- 구매확정,자동구매확정,취소완료,반품완료,판매취소
			$SELECT.append('<option value="14">기타</option>');
		} else if(detailState==='4') { // 주문상세상태-주문취소요청
			$SELECT.append('<option value="5">주문취소완료</option>');
		} else if(detailState==='6'){ // 주문상세상태-교환요청
			$SELECT.append('<option value="7">교환접수</option>');
			$SELECT.append('<option value="8">교환발송완료</option>');
			$SELECT.append('<option value="9">교환불가</option>');
		} else if(detailState==='10'){ // 주문상세상태-반품요청
			$SELECT.append('<option value="11">반품접수</option>');
			$SELECT.append('<option value="12">반품완료</option>');
			$SELECT.append('<option value="13">반품불가</option>');
		} else {
			 // 배송완료
			if(orderState==="18") {
				$SELECT.append('<option value="2">자동구매확정</option>');
			}
			
			$SELECT.append('<option value="3">판매취소</option>');
			$SELECT.append('<option value="14">기타</option>');
		}
		
		$('.optionDetail-value').html('옵션 : ' + opt + ' ');
		$('#orderDetailStateDialogModal').modal('show');

	});
	
	function listDetailState() {
		$('.detailState-list').empty();
		
		const f = document.detailStateForm;
		let orderDetailNum = f.orderDetailNum.value;
		
		let qs = 'orderDetailNum=' + orderDetailNum;
		let url = '${pageContext.request.contextPath}/admin/orderManage/order_detail/listDetailState';

		const fn = function(data) {
			let out;
			for(let item of data.list) {
				out  = '<tr>';
				out += '<td>'+item.DETAILSTATE+'</td>';
				out += '<td>'+item.DETALSTATEINFO+'</td>';
				out += '<td>'+item.USERNAME+'</td>';
				out += '<td>'+item.DETAILSTATEDATE+'</td>';
				out += '<td align="left">'+item.STATEMEMO+'</td>';
				out += '</tr>';
				
				$('.detailState-list').append(out);
			}
		};
		
		ajaxFun(url, "get", qs, "json", fn);
	}
	
	const modalEl = document.getElementById('orderDetailStateDialogModal');
	modalEl.addEventListener('show.bs.modal', function(){
		// 모달 대화상자가 보일때
		listDetailState();
	});
	
	modalEl.addEventListener('hidden.bs.modal', function(){
		// 모달 대화상자가 안보일때
	});
	
	$(".btnDetailStateUpdateOk").click(function(){
		// 주문상세 상태정보변경 등록
		const f = document.detailStateForm;
		let orderDetailNum = f.orderDetailNum.value;
		let productMoney = f.productMoney.value;
		let cancelAmount = f.cancelAmount.value;
		
		// 이전상태
		let preDetailState = $("#orderDetail-list" + orderDetailNum).find("td").eq(9).attr("data-detailState");
		if(preDetailState === "3" || preDetailState === "5" || preDetailState === "12") {
			alert("판매취소 또는 반품완료 상품은 변경이 불가능합니다.");
			return false;
		}

		let changeStateInfo = $("form[name=detailStateForm] select option:selected").text();
		
		if(! f.stateMemo.value.trim()) {
			alert("상태 메시지를 등록하세요");
			f.stateMemo.focus();
			return false;
		}
		
		let qs = $('form[name=detailStateForm]').serialize();
		let url = '${pageContext.request.contextPath}/admin/orderManage/order_detail/updateDetailState';

		const fn = function(data) {
			if(data.state === "true") {
				listDetailState();
				
				let detailState = data.detailState;

				$("#orderDetail-list" + orderDetailNum).find("td").eq(8).html(changeStateInfo);
				$("#orderDetail-list" + orderDetailNum).find("td").eq(9).attr("data-detailState", detailState);
				
				// 주문취소완료인 경우
				if(detailState == 3 || detailState == 5 || detailState == 12) {
					cancelAmount = parseInt(cancelAmount) + parseInt(productMoney);
					$(".order-cancelAmount").attr("data-cancelAmount", cancelAmount);
					$(".order-cancelAmount").text(cancelAmount.toLocaleString());
				}
				
				alert("정보가 변경되었습니다.");
				f.reset();
			}
		};
		
		ajaxFun(url, "post", qs, "json", fn);
		
	});
});
        
</script>
        
        
<script>
$(document).ready(function() {
	var oTable = $('#order_table').DataTable();
	
	$('#order_table tbody').on( 'click', 'tr', function () {
		let orderNum = $(this).attr("data-orderNum");
		let orderStatus = "${orderStatus}";
		let url = "${pageContext.request.contextPath}/admin/orderManage/order_detail/info?orderNum="+orderNum+"&orderStatus="+orderStatus;
		
		$(".modal-order-detail").load(url);
		
		$("#orderDialogModal").modal("show");
	});
	
});

     
     
    /*
    https://stackoverflow.com/questions/35498357/datatable-multiple-selection
    */
</script>
        

