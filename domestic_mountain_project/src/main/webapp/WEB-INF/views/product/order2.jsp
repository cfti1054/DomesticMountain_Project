<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page trimDirectiveWhitespaces="true"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/product_order.css"
	type="text/css">

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

.p-2 {
	display: flex;
}

.icon {
	margin: 10px;
}
.star {
	width: 15px;
	height: 15px;
	margin-right: 10px;
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
</script>

<script type="text/javascript">
$(function(){
	// 필수 옵션-1
	$(".requiredOption").change(function(){
		let option2 = $(this).val();
		
		// 있는지 없는지 확인 있으면 아래 실행, 없으면 option 하나 
		if($('.list-option').find('.requiredOption2').length==0){
			if(! $(".requiredOption :selected").val()){
				return false;
			}
			
			optionSelect();
			
			// 번외로 결제 페이지로 넘길때 옵션 1개인지 2개인지 확인 필요 
			// 1개면 넘길때 값을 0으로 설정하고 null로 받게 해야함 -> Long 타입으로 잡아야 null값이 들어감
			
			return false;
		}
		
		$(".requiredOption2 option").each(function(){
			
			if($(this).is(":first-child")) {
				return true; // continue
			}
			
        	$(this).remove();
        });
		
		let detail_num1 = $(this).val();
		if(! detail_num1) {
			return false;
		}
		
		let option_num = $(".requiredOption").attr("data-optionNum");
		let option_num2 = $(".requiredOption2").attr("data-optionNum2");
		
		
		let url = "${pageContext.request.contextPath}/product/listOptionDetail2";
		$.get(url, {option_num:option_num, option_num2:option_num2, detail_num:detail_num1}, function(data){
			$(data).each(function(index, item){
				let detail_num = item.detail_num;
				let option_value = item.option_value;
				
				$(".requiredOption2").append("<option value='"+detail_num+"'>"+option_value+"</option>");
				
				
			});
		});
	});
	
	function optionSelect(){
		let product_num = "${dto.product_num}";
		if(! product_num) {
			return false;
		}
		
		let detail_num1 = $(".requiredOption").val();
		
		let b = true;
		$(".order-area input[name=detail_nums]").each(function(){
			let dnum = $(this).val();
			if(detail_num1 === dnum) {
				alert("선택된 옵션입니다.");
				$(".requiredOption").val("");
				b = false;
				return false;
			}
		});
		if(! b) {
			return false;
		}
		
		let optionValue = $(".requiredOption :selected").text();
		
		let salePrice = ${dto.product_price};
		let totalPrice = salePrice.toLocaleString();
		
		let s = optionValue;
		
		let out = "";
		out += "<div class='order-qty'>";
		out += "  <div class='mt-2 pb-1'>";
		out += "    <label>"+s+"</label>";
		out += "  </div>";
		out += "  <div class='border-bottom mt-1 pb-2'>";
		out += "    <div class='col'>";
		out += "      <div class='input-group'>";
		out += "        <i class='bi bi-dash input-group-text bg-white qty-minus'></i>";
		out += "        <input type='text' name='buyQtys' class='form-control' value='1' style='flex:none; width: 60px; text-align: center;' readonly>";
		out += "        <input type='hidden' name='product_nums' value='"+product_num+"'>";
		out += "        <input type='hidden' name='detail_nums' value='"+detail_num1+"'>";
		out += "        <i class='bi bi-plus input-group-text bg-white qty-plus'></i>";
		out += "      </div>";
		out += "    </div>";
		out += "    <div class='col text-end product-salePrice' data-salePrice='"+salePrice+"';>";
		out += "      <label class='pt-2 fs-6 fw-semibold item-totalPrice'>"+totalPrice+"원</label>";
		out += "      <label class='pt-2 ps-1'><i class='bi bi-x qty-remove'></i></label>";
		out += "    </div>";
		out += "  </div>";
		out += "</div>";
		
		$(".order-area").append(out);
		
		totalProductPrice();		
		
	}
	
	
	// 필수 옵션-2
	$(".requiredOption2").change(function(){
		if(! $(this).val()) {
			return false;
		}
		let product_num = "${dto.product_num}";
		if(! product_num) {
			return false;
		}
		
		let detail_num1 = $(".requiredOption").val();
		let detail_num2 = $(this).val();
		
		let b = true;
		$(".order-area input[name=detail_nums2]").each(function(){
			let dnum = $(this).closest(".input-group").find("input[name=detail_nums]").val();
			let dnum2 = $(this).val();
			if(detail_num1 === dnum && detail_num2 === dnum2) {
				alert("선택된 옵션입니다.");
				$(".requiredOption").val("");
				$(".requiredOption").trigger("change");
				b = false;
				return false;
			}
		});
		if(! b) {
			return false;
		}
		
		let optionValue = $(".requiredOption :selected").text();
		let optionValue2 = $(".requiredOption2 :selected").text();
		
		let salePrice = ${dto.product_price};
		let totalPrice = salePrice.toLocaleString();
		
		let s = optionValue + " / " + optionValue2;
		let out = "";
		out += "<div class='order-qty'>";
		out += "  <div class='mt-2 pb-1'>";
		out += "    <label>"+s+"</label>";
		out += "  </div>";
		out += "  <div class='border-bottom mt-1 pb-2'>";
		out += "    <div class='col'>";
		out += "      <div class='input-group'>";
		out += "        <i class='bi bi-dash input-group-text bg-white qty-minus'></i>";
		out += "        <input type='text' name='buyQtys' class='form-control' value='1' style='flex:none; width: 60px; text-align: center;' readonly>";
		out += "        <input type='hidden' name='product_nums' value='"+product_num+"'>";
		out += "        <input type='hidden' name='detail_nums' value='"+detail_num1+"'>";
		out += "        <input type='hidden' name='detail_nums2' value='"+detail_num2+"'>";
		out += "        <i class='bi bi-plus input-group-text bg-white qty-plus'></i>";
		out += "      </div>";
		out += "    </div>";
		out += "    <div class='col text-end product-salePrice' data-salePrice='"+salePrice+"';>";
		out += "      <label class='pt-2 fs-6 fw-semibold item-totalPrice'>"+totalPrice+"원</label>";
		out += "      <label class='pt-2 ps-1'><i class='bi bi-x qty-remove'></i></label>";
		out += "    </div>";
		out += "  </div>";
		out += "</div>";
		
		$(".order-area").append(out);
		
		totalProductPrice();
	});

	// 수량 더하기
	$(".order-area").on("click", ".qty-plus", function() {
		let $order = $(this).closest(".order-qty");
		let qty = parseInt($order.find("input[name=buyQtys]").val()) + 1;
		
		
		/* 
		let option_num = $(".requiredOption").attr("data-optionNum");
		let option_num2 = $(".requiredOption2").attr("data-optionNum2");
		
		let dnum = $(this).closest(".input-group").find("input[name=detail_nums]").val();
		let dnum2 = $(this).val();

		// 옵션이 하나인가 두개인가 체크 -> 해당되는 옵션 넘버를 찾는다 -> 옵션의 수량 조건을 건다.?????
		if($('.list-option').find('.requiredOption2').length==0) { // 옵션 하나
			if(option_num) {
				console.log(option_num)
				console.log(${dto.total_stock})
			}
			
		} else { // 옵션 두개
			console.log("옵션 두개");
			if(option_num2 && option_num) {
				console.log(option_num, option_num2)
				console.log(${dto.total_stock})
			}
		}
		 */
		
		
		if(qty > 5) {
			alert("한 상품 옵션당 최대 5개까지 구매 가능합니다.");
			$(".requiredOption").val("");
			$(".requiredOption").trigger("change");
				
			totalProductPrice();
				
			return false;
		}
		
		$order.find("input[name=buyQtys]").val(qty);
		let salePrice = $order.find(".product-salePrice").attr("data-salePrice");
		let item = qty * salePrice;
		let totalPrice = item.toLocaleString();
		$order.find(".item-totalPrice").text(totalPrice+"원");
		
		
		totalProductPrice();
	});

	// 수량 빼기
	$(".order-area").on("click", ".qty-minus", function() {
		let $order = $(this).closest(".order-qty");
		let qty = parseInt($order.find("input[name=buyQtys]").val()) - 1;
		if(qty <= 0) {
			alert("구매 수량은 한개 이상입니다.");
			$(".requiredOption").val("");
			$(".requiredOption").trigger("change");
			
			totalProductPrice()
			
			return false;
		}
		
		$order.find("input[name=buyQtys]").val(qty);
		let salePrice = $order.find(".product-salePrice").attr("data-salePrice");
		let item = qty * salePrice;
		let totalPrice = item.toLocaleString();
		$order.find(".item-totalPrice").text(totalPrice+"원");
		
		totalProductPrice();
	});
	
	// 수량 제거
	$(".order-area").on("click", ".qty-remove", function() {
		let $order = $(this).closest(".order-qty");
		
		$(".requiredOption").val("");
		$(".requiredOption").trigger("change");
		$order.remove();
		
		totalProductPrice();
	});
	
	function totalProductPrice() {
		let totalQty = 0;
		let totalPrice = 0;
		$(".order-qty").each(function(){
			let qty = parseInt($(this).find("input[name=buyQtys]").val());
			let salePrice = parseInt($(this).find(".product-salePrice").attr("data-salePrice"));
			
			totalQty += qty;
			totalPrice += (salePrice * qty);
		});
		
		let s = totalPrice.toLocaleString();
		
		$(".product-totalQty").text(totalQty);
		$(".product-totalAmount").text(s);
	}
});

$(function(){
	$(".sm-img img").click(function(){
		let url = $(this).attr("src");
		$(".lg-img img").attr("src", url);
	});
});

function sendOk(mode) {
	let totalQty = 0;
	$(".order-qty").each(function(){
		let qty = parseInt($(this).find("input[name=buyQtys]").val());
		
		totalQty += qty;
	});
	
	if(totalQty <= 0) {
		alert("구매 상품의 수량을 선택하세요 !!! ");
		return;
	}

	const f = document.buyForm;
	if(mode === "buy") {
		// GET 방식으로 전송. 로그인후 결제화면으로 이동하기 위해
		// 또는 자바스크립트 sessionStorage를 활용 할 수 있음
		f.method = "get";
		f.action = "${pageContext.request.contextPath}/order/buy";
	} else if(mode == "cart"){
		if(! confirm("선택한 상품을 장바구니에 담으시겠습니까 ? ")) {
			f.method = "get";
			return false;
		}
		
		f.method = "post";
        f.action = "${pageContext.request.contextPath}/mypage/saveCart";
	} else if(mode == "zzim"){
		if(! confirm("선택한 상품을 찜하시겠습니까 ? ")) {
			return false;
		}
		
		f.method = "post";
        f.action = "${pageContext.request.contextPath}/mypage/saveZzim";		
	}
	
	f.submit();
}

</script>

<section class="features-1">
	<div class="body-container">
		<div class="amain">
			<h1 class="amain-main">
				<a>DM Store 상품<span>| DM Store</span></a> <span><a
					href="/plus/">home</a> &gt; DM Store</span>
			</h1>
		</div>

		<div class="body-main">
			<div class="product-main-box">
				<div class="product-detail-img-box">
					<c:choose>
						<c:when
							test="${not empty dto.product_summary and dto.product_summary.startsWith('TC')}">
							<img class="img"
								src="${pageContext.request.contextPath}/resources/images/product/${dto.product_summary}">
						</c:when>
						<c:when
							test="${not empty dto.product_summary and dto.product_summary.startsWith('ht')}">
							<img class="img" src="${dto.product_summary}">
						</c:when>

						<c:otherwise>

						</c:otherwise>
					</c:choose>
				</div>

				<div class="col-md-6 detail-main-box">
					<form name="buyForm">

						<div class="row-style pt-2">
							<div class="col fs-4 fw-semibold">${dto.product_name}</div>
						</div>



						<div class="row-style mt-2">

							<div class="col text-end">
								<label class="fs-5 pe-2 fw-semibold"> <fmt:formatNumber
										value="${dto.product_price}" />원
								</label>

							</div>
						</div>



						<div class="border-bottom mt-2 text-black-50 pb-2">
							무이자 할부 | 카드 자세히 보기 <i class="bi bi-question-circle"></i>
						</div>

						<div class="border-bottom mt-2 pb-2">
							<div>
								<label>택배 배송 | </label> <label> 무료 배송 </label> <label>(주문시
									결제)</label>
							</div>
							<div>
								<label>회원 등급이 높아짐에 따라 할인율이 더 많아집니다!</label>
							</div>
							<div>
								<label style="color: darkblue; font-weight: 700;">할인 적용
									가격은 결제 페이지에서 적용됩니다.</label>
							</div>
						</div>

						<div class="mt-2">* 필수 옵션</div>
						<div class="mt-2 list-option">

							<c:if test="${not empty listOptionDetail}">
								<select class="form-select requiredOption"
									data-optionNum="${listOption[0].option_num}">
									<option value="">${listOption[0].option_name}</option>
									<c:forEach var="vo" items="${listOptionDetail}">
										<option value="${vo.detail_num}">${vo.option_value}</option>
									</c:forEach>
								</select>
							</c:if>

							<c:if test="${not empty listOptionDetail1}">
								<div class="mt-2 border-bottom pb-2">
									<select class="form-select requiredOption2"
										data-optionNum2="${listOption[1].option_num}">
										<option value="">${listOption[1].option_name}</option>
									</select>
								</div>
							</c:if>

						</div>

						<div class="order-area"></div>

						<div class="row-style mt-2 pb-2">
							<div class="col-auto fw-semibold pt-1">총상품금액</div>
							<div class="col text-end">
								<label>총수량 <span class="product-totalQty">0</span>개 |
								</label> <label><span
									class="product-totalAmount fs-5 fw-semibold text-primary">0</span>원</label>
							</div>
						</div>

						<div class="mt-2">
							<input type="hidden" name="mode" value="buy">
							<button type="button" class="btn btn-primary w-100 btn-buySend"
								onclick="sendOk('buy');">구매하기</button>
						</div>
						<div class="row-style mt-2 mb-2">
							<div class="col pe-1 probtn-hover" onclick="sendOk('zzim');">
								<button type="button" class="btn w-100 btn-productBlind" id="order-btn"
									${empty sessionScope.member.memberIdx ? "disabled='disabled'" : ""}>
									찜하기 <i class="bi bi-heart heart"></i>
								</button>
							</div>
							<div class="col ps-1 probtn-hover" onclick="sendOk('cart');">
								<button type="button" class="btn w-100 btn-productCart" id="order-btn"
									${empty sessionScope.member.memberIdx ? "disabled='disabled'" : ""}>
									장바구니 <i class="bi bi-bag bag"></i>
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>

		</div>

	</div>
</section>

<section class="features-6 features-6-product">
	<ul class="nav nav-tabs mt-5" id="myTab" role="tablist"
		style="align-items: end;">
		<li class="nav-item" role="presentation">
			<button class="nav-link active" id="tab-1" data-bs-toggle="tab"
				data-bs-target="#tab-pane-1" type="button" role="tab"
				aria-controls="1" aria-selected="true">상세정보</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="tab-2" data-bs-toggle="tab"
				data-bs-target="#tab-pane-2" type="button" role="tab"
				aria-controls="2" aria-selected="false">리뷰</button>
		</li>

	</ul>
	<div class="tab-content pt-2" id="myTabContent">
		<div class="tab-pane fade show active" id="tab-pane-1" role="tabpanel"
			aria-labelledby="tab-1" tabindex="0">
			<br> <br>
			<div class="centered">${dto.product_content}</div>
			<div></div>
		</div>



		<div class="tab-pane fade" id="tab-pane-2" role="tabpanel"
			aria-labelledby="tab-2" tabindex="0">
			<div class="mt-3 review-mainbox">
				<c:forEach var="dto" items="${list}" varStatus="status">
					<div class="border-bottom review-box">
						<div class="p-2">
							<div class="col-auto fs-2">
								<i class="bi bi-person-circle text-muted icon"></i>
							</div>
							<div class="col pt-3 ps-0 fw-semibold" style="display: flex; align-items: center;">${dto.user_name} &nbsp;&nbsp;&nbsp;&nbsp;
								<img class="star" src="${pageContext.request.contextPath}/resources/images/product/star.png">${dto.review_star}</div>
							<div class="col pt-3 text-end">
								<span>${dto.review_reg_date}</span> |<span class="notifyReview" data-num="4">신고</span>
							</div>
						</div>
						<div class="mt-2 p-2">${dto.review_content}</div>
					</div>
				</c:forEach>
			</div>
		</div>


	</div>






</section>
