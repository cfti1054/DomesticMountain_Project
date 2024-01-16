<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.features-1 {
	height: auto; /* 수정 시 auto로 바꾸고 해야함 */
}

.body-container {
	margin: 30px auto;
	max-width: 1300px;
	padding-top: 120px;
	position: relative;
	align-items: center;
	min-height: 100vh;
	overflow-x: hidden;
	max-width: 1300px;
}

.nav-tabs .nav-link {
	min-width: 170px;
	background: #f3f5f7;
	border-radius: 0;
	border-right: 1px solid #dbdddf;
	color: #333;
	font-weight: 600;
}

.nav-tabs .nav-link.active {
	background: #3d3d4f;
	color: #fff;
}

.tab-pane {
	min-height: 300px;
}

.md-img {
	width: 100px;
	height: 100px;
	object-fit: cover;
}

.payment-dropdown, .payment-delete {
	cursor: pointer;
}

.payment-dropdown:hover, .payment-delete:hover {
	color: #0d6efd;
}

.payment-menu {
	display: none;
	position: absolute;
	width: 100px;
	min-height: 65px;
	background: #fff;
	border: 1px solid #d5d5d5;
	border-radius: 3px;
	z-index: 9999;
}

.payment-menu-item {
	text-align: center;
	cursor: pointer;
	padding: 7px;
}

.payment-menu-item:nth-child(1) {
	border-bottom: 1px solid #d5d5d5;
}

.payment-menu-item:hover {
	color: #0d6efd;
	font-weight: 500;
}

.review-form textarea {
	width: 100%;
	height: 75px;
	resize: none;
}

.review-form .star {
	font-size: 0;
	letter-spacing: -4px;
}

.review-form .star a {
	font-size: 22px;
	letter-spacing: 1px;
	display: inline-block;
	color: #ccc;
	text-decoration: none;
}

.review-form .star a:first-child {
	margin-left: 0;
}

.star a.on {
	color: #FFBB00;
}

.review-form .img-grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, 54px);
	grid-gap: 2px;
}

.review-form .img-grid .item {
	object-fit: cover;
	width: 50px;
	height: 50px;
	border-radius: 10px;
	border: 1px solid #c2c2c2;
	cursor: pointer;
}
</style>

<script type="text/javascript">
function login() {
	location.href = '${pageContext.request.contextPath}/member/login';
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

// 주문상세, 주문취소, 반품, 교환 메뉴
$(function(){
	$("body").on("click", ".payment-dropdown", function(){
		const $menu = $(this).next(".payment-menu");
		if($menu.is(':visible')) {
			$menu.fadeOut(100);
		} else {
			$(".payment-menu").hide();
			$menu.fadeIn(100);

			let pos = $(this).offset();
			$menu.offset( {left:pos.left-70, top:pos.top+30} );
		}
	});
	$("body").on("click", function(evt) {
		if($(evt.target.parentNode).hasClass("payment-dropdown")) {
			return false;
		}
		$(".payment-menu").hide();
	});
});

$(function(){
	$(".payment-delete").click(function(){
		// 주문 내역 삭제 - 주문자화면에 보이지 않게 설정(userDelete 컬럼을 1로 설정)
		if(! confirm("주문내역을 삭제하시겠습니까 ?")) {
			return false;
		}		
		
		let orderDetailNum = $(this).attr("data-orderDetailNum");

		let qs = "orderDetailNum=" + orderDetailNum + "&page=${page}";
		location.href = "${pageContext.request.contextPath}/myPage/updateOrderHistory?" + qs;
	});
});

$(function(){
	$(".payment-confirmation").click(function(){
		// 구매 확정
		if(! confirm("구메확정을 진행하시겠습니까 ?")) {
			return false;
		}
		
		let orderDetailNum = $(this).attr("data-orderDetailNum");
		let url = "${pageContext.request.contextPath}/myPage/confirmation?orderDetailNum="+orderDetailNum+"&page=${page}";
		location.href = url;
	});
});

$(function(){
	$(".order-details").click(function(){
		// 주문 상세 정보
		let orderDetailNum = $(this).attr("data-orderDetailNum");
		alert(orderDetailNum);
	});
});

$(function(){
	$(".order-cancel").click(function(){
		// 구매(주문) 취소
		let orderDetailNum = $(this).attr("data-orderDetailNum");

		const f = document.userOrderDetailForm;
		f.orderDetailNum.value = orderDetailNum;
		f.detailState.value = 4;

		$("#orderDetailUpdateDialogModalLabel").html("구매취소");
		$("#orderDetailUpdateDialogModal").modal("show");
		
	});
});

$(function(){
	$(".return-request").click(function(){
		// 반품 요청
		let orderDetailNum = $(this).attr("data-orderDetailNum");
		
		const f = document.userOrderDetailForm;
		f.orderDetailNum.value = orderDetailNum;
		f.detailState.value = 10;
		
		$("#orderDetailUpdateDialogModalLabel").html("반품요청");
		$("#orderDetailUpdateDialogModal").modal("show");
	});
});

$(function(){
	$(".exchange-request").click(function(){
		// 교환 요청
		let orderDetailNum = $(this).attr("data-orderDetailNum");

		const f = document.userOrderDetailForm;
		f.orderDetailNum.value = orderDetailNum;
		f.detailState.value = 6;
		
		$("#orderDetailUpdateDialogModalLabel").html("교환요청");
		$("#orderDetailUpdateDialogModal").modal("show");
		
	});
});

$(function(){
	$('.btnUserOrderDetailUpdateOk').click(function(){
		// 주문취소/교환요청/반품요청 완료
		const f = document.userOrderDetailForm;

		if(! f.stateMemo.value.trim()) {
			alert('요청 사유를 입력 하세세요');
			f.stateMemo.focus();
			return false;
		}
		
		f.action = '#';
		f.submit();
	});
});
</script>



<section class="features-1">
	<div class="body-container">

		<ul class="nav nav-tabs mt-5" id="myTab" role="tablist"
			style="-bs-nav-tabs-border-color: none">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="tab-1" data-bs-toggle="tab"
					data-bs-target="#tab-pane-1" type="button" role="tab"
					aria-controls="1" aria-selected="true">주문 내역</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="tab-2" data-bs-toggle="tab"
					data-bs-target="#tab-pane-2" type="button" role="tab"
					aria-controls="2" aria-selected="false">취소/반품 내역</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="tab-3" data-bs-toggle="tab"
					data-bs-target="#tab-pane-3" type="button" role="tab"
					aria-controls="3" aria-selected="false">정기배송 신청내역</button>
			</li>
		</ul>


		<div class="tab-content pt-2" id="myTabContent">
			<div class="tab-pane fade show active" id="tab-pane-1"
				role="tabpanel" aria-labelledby="tab-1" tabindex="0">


				<div class="mt-3 pt-3 border-bottom">
					<p class="fs-4 fw-semibold">주문 내역</p>
				</div>



				<div class="mt-3">
					<c:forEach var="dto" items="${list}">
						<div class="mt-3 p-2 border-bottom payment-list">
							<div class="row pb-2">
								<div class="col-6">
									<div class="fs-6 fw-semibold text-black-50">
										<label>stateProduct</label><label></label>
									</div>
								</div>

								<div class="col-6 text-end">
									<label class='payment-delete' title="주문내역삭제"
										data-orderDetailNum="#"><i class="bi bi-x-lg"></i></label>
								</div>

							</div>
							<div class="row">
								<div class="col-auto">
									<img class="border rounded md-img" src="#">
								</div>


								<div class="col">
									<div class="pt-1">
										<label class="text-black-50">${dto.order_datetime}</label>
									</div>
									<div class="fw-semibold pt-2">${dto.reception_datatime}</div>
									<div class="pt-1">
										<label>주문수량 : 4</label> <label class="fw-semibold ps-3"><fmt:formatNumber
												value="${dto.total_amount}" />원</label>
									</div>
									<div class="pt-1">옵션 : ${dto.detail_num1} ${dto.option_name2}/ 퍼플, 사이즈 / XL</div>
								</div>
							</div>
							<div class="mt-3 p-3 text-end">
								<button type="button" class="btn border" style="width: 130px;"
									data-orderDetailNum="#">배송조회</button>

								<c:if test="#">
									<button type="button" class="btn border payment-confirmation"
										style="width: 130px;" data-orderDetailNum="#">구매확정</button>
								</c:if>
								<button type="button" class="btn border" style="width: 130px;"
									onclick="location.href='#';">재구매</button>

								<button type="button" class="btn border payment-dropdown"
									title="주문상세">
									<i class="bi bi-three-dots"></i>
								</button>
								<div class="payment-menu">
									<div class="payment-menu-item order-details"
										data-orderDetailNum="#">주문상세</div>
									<div class="payment-menu-item order-cancel"
										data-orderDetailNum="#">구매취소</div>
									<div class="payment-menu-item return-request"
										data-orderDetailNum="#">반품요청</div>
									<div class="payment-menu-item exchange-request"
										data-orderDetailNum="#">교환요청</div>
								</div>

							</div>

						</div>
						
					</c:forEach>
					
					
					<div class="page-navigation">${dataCount == 0 ? "주문 내역이 없습니다." : paging }</div>

				</div>
			</div>
			<div class="tab-pane fade" id="tab-pane-2" role="tabpanel"
				aria-labelledby="tab-2" tabindex="0">
				<div class="mt-3 pt-3 border-bottom">
					<p class="fs-4 fw-semibold">취소/반품 내역</p>
				</div>
				<div class="mt-3">
					<p>취소/반품 내역 입니다.</p>
				</div>
			</div>
			<div class="tab-pane fade" id="tab-pane-3" role="tabpanel"
				aria-labelledby="tab-3" tabindex="0">
				<div class="mt-3 pt-3 border-bottom">
					<p class="fs-4 fw-semibold">정기배송 신청내역</p>
				</div>
				<div class="mt-3">
					<p>정기배송 신청내역 입니다.</p>
				</div>
			</div>
		</div>

	</div>
</section>

<!-- 구매취소/교환요청/반품요청 대화상자  -->
<div class="modal fade" id="orderDetailUpdateDialogModal" tabindex="-1"
	aria-labelledby="orderDetailUpdateDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="orderDetailUpdateDialogModalLabel">구매취소</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body pt-1">
				<div class="p-1">
					<form name="userOrderDetailForm" method="post"
						class="row justify-content-center" style="width: auto;">
						<div class="col-7 p-1">
							<input type="text" name="stateMemo" class="form-control"
								placeholder="사유를 입력 하세요">
						</div>
						<div class="col-auto p-1">
							<input type="hidden" name="page" value="${page}"> <input
								type="hidden" name="orderDetailNum"> <input
								type="hidden" name="detailState">
							<button type="button"
								class="btn btn-light btnUserOrderDetailUpdateOk">요청하기</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
</div>

