<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
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
</style>

<script type="text/javascript">
function sendOk() {
	const f = document.buyForm;
	
	if(! f.shipperName.value) {
		alert("먼저 배송지를 등록하세요..");
		return;
	}
/* 
	// 결제 API에서 응답 받을 파라미터
	let payMethod = "카드결제"; // 결제유형
	let cardName = "삼성 카드";  // 카드 이름
	let authNumber = "1234567890"; // 승인번호
	let authDate = ""; // 승인 날짜
	// toISOString() : "YYYY-MM-DDTHH:mm:ss.sssZ" 형식
	authDate = new Date().toISOString().replace('T', ' ').slice(0, -5); // YYYY-MM-DD HH:mm:ss

	// 결제 API에 요청할 파라미터
	let payment = f.payment.value; // 결제할 금액
	let merchant_uid = "${productOrderNumber}";  // 고유 주문번호
	let productName = "${productOrderName}";  // 주문상품명
	let buyer_email = "${orderUser.email}";  // 구매자 이메일
	let buyer_name = "${orderUser.userName}";  // 구매자 이름
	let buyer_tel = "${orderUser.tel}";   // 구매자 전화번호(필수)
	let buyer_addr = "${orderUser.addr1}" + " " + "${orderUser.addr2}";  // 구매자 주소
	buyer_addr = buyer_addr.trim();
	let buyer_postcode = "${orderUser.zip}"; // 구매자 우편번호
	
	// 결제 API로 결제 진행
	
	
	
	// 결제가 성공한 경우 ------------------------
	
	// 결제 방식, 카드번호, 승인번호, 결제 날짜
	f.payMethod.value = payMethod;
	f.cardName.value = cardName;
	f.authNumber.value = authNumber;
	f.authDate.value = authDate;
 */	
 
 
	f.action = "${pageContext.request.contextPath}/order/paymentOk"
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




		<div class="buy-main">
			<form name="buyForm" method="post">
				<div class="buy-title">장바구니 > 주문 및 결제 > 완료</div>
				<div class="buy-box">
					<div class="buy-left">
						<div class="address-box">
							<h3 class="order-title">배송인</h3>

							<div class="AddressView_article">
								<div class="AddressView_section-info">
									<strong class="AddressView_name">${sessionScope.loginUser.username}</strong>
									<div class="AddressView_area-tel">
										<ul class="AddressView_list-tel">
											<li class="AddressView_item-tel">${vo.tel}</li>
										</ul>

									</div>
								</div>
								<div class="AddressView_section-address">
									<p class="AddressView_address">${vo.addr1}&#09;${vo.addr2}&#09;(${vo.zip})</p>
								</div>

							</div>

						</div>

						<div class="address-box">
							<h3 class="order-title">수령인</h3>

							<div class="AddressView_article">
								<div class="AddressView_section-info">

									<div class="recipient">
										<label class="col-sm-2 col-form-label" for="recipient_name">이름</label>
										<input type="text" name=recipient_name id="recipient_name"
											style="width: auto;" class="form-control"
											value="${dto.recipient_name}" placeholder="이름">
									</div>
									<div class="recipient">
										<label class="col-sm-2 col-form-label" for="tel1">전화번호</label>
										<div class="col-sm-3 pe-1">
											<input type="text" name="recipient_phone1"
												id="recipient_phone1" class="form-control"
												value="${dto.recipient_phone1}" maxlength="3">
										</div>
										<div class="col-sm-1 px-1" style="width: 2%;">
											<p class="form-control-plaintext text-center">-</p>
										</div>
										<div class="col-sm-3 px-1">
											<input type="text" name="recipient_phone2"
												id="recipient_phone2" class="form-control"
												value="${dto.recipient_phone2}" maxlength="4">
										</div>
										<div class="col-sm-1 px-1" style="width: 2%;">
											<p class="form-control-plaintext text-center">-</p>
										</div>
										<div class="col-sm-3 ps-1">
											<input type="text" name="recipient_phone3"
												id="recipient_phone3" class="form-control"
												value="${dto.recipient_phone3}" maxlength="4">
										</div>
									</div>

									<div class="AddressView_section-address">

										<div class="recipient">
											<label class="col-sm-2 col-form-label" for="zip">우편번호</label>
											<div class="col-sm-5">
												<div class="input-group">
													<input type="text" name="address_num" id="address_num"
														class="form-control" placeholder="우편번호"
														value="${dto.address_num}" readonly>
													<button class="btn btn-light" type="button"
														onclick="daumPostcode();">우편번호 검색</button>
												</div>
											</div>
										</div>

										<div class="recipient">
											<label class="col-sm-2 col-form-label" for="addr1">주소</label>
											<div class="col-sm-10">
												<div style="margin-bottom: 8px;">
													<input type="text" name="address1" id="address1"
														class="form-control" placeholder="기본 주소"
														value="${dto.address1}" readonly>
												</div>
												<div>
													<input type="text" name="address2" id="address2"
														class="form-control" placeholder="상세 주소"
														value="${dto.address2}">
												</div>
											</div>
										</div>
									</div>
									<div class="recipient">
										<label class="col-sm-2 col-form-label" for="transports_memo">메모</label>
										<input type="text" name=transports_memo id="transports_memo"
											class="form-control"
											value="${dto.transports_memo}" placeholder="요구사항을 입력하세요">
									</div>

								</div>
								<div class="recipient">
									<input type="checkbox" id="shippingInfo" name="shippingInfo">
									<label style="margin-left: 10px;" for="bill_info" class="check">주문인
										정보와 배송인 정보가 같습니다.</label>
								</div>
							</div>
							
							
							<input type="hidden" name="shipperName" value="${sessionScope.loginUser.username}">
						

						</div>


						<div class="product-main">
							<h3 class="order-title">주문 상품</h3>
							<c:forEach var="dto" items="${listProduct}" varStatus="status">
								<div class="AddressView_article-2">

									<div class="ProductList_area">
										<a href="#" class="ProductList_thumbnail"><img
											src="${pageContext.request.contextPath}/resources/images/product/${dto.product_summary}"
											alt="" width="110" height="110"></a>
										<div class="ProductList_info">
											<a href="#" class="ProductList_name">${dto.product_name}</a>
											<ul class="ProductList_add-list">
												<li class="ProductList_option"><span
													class="ProductList_value"> <span>상품선택:
															${dto.option_name} : ${dto.option_value} <c:if
																test="${not empty dto.option_name2}">
															/ ${dto.option_name2} : ${dto.option_value2} 
															</c:if>
													</span> <span class="ProductList_count__2S3qL"> ${dto.qty}개</span>
												</span></li>
											</ul>
											<div class="ProductList_amount">
												<span class="ProductList_pay-sum"> <span
													class="blind">상품 금액</span> <b><fmt:formatNumber value="${dto.total_amount}" pattern="#,###"/></b>원
												</span>
											</div>
										</div>
									</div>
									<input type="hidden" name="product_nums" value="${dto.product_num}">
									<input type="hidden" name="detail_nums" value="${dto.detail_num}">
									<input type="hidden" name="detail_nums2" value="${dto.detail_num2}">
									<input type="hidden" name="buyQtys" value="${dto.qty}">
									<input type="hidden" name="product_prices" value="${dto.product_price}">
									<input type="hidden" name="od_total_amounts" value="${dto.total_amount}">
								</div>
							</c:forEach>
							<div class="AmountArea_article AmountArea_type-order">
								<div class="AmountArea_cell">
									<span class="AmountArea_title">전체 주문금액</span>
								</div>
								<div class="AmountArea_cell">
									<span class="AmountArea_amount"><fmt:formatNumber value="${totalMoney}" pattern="#,###"/>원</span>
								</div>
							</div>
						</div>



						<div class="Payment-box">
							<h3 class="order-title">결제</h3>

							<div class="AddressView_article">

								<div class="Payment_payment">
									<button type="button" name="payment " id="payment-point"
										class="Payment_payment-button" onclick="sendOk()">
										<span class="blind">일반 결제</span>
									</button>
								</div>
								
								<div class="Payment_payment">
									<button type="button" name="payment " id="payment-point"
										class="Payment_payment-button kakao-button">
										<span class="blind">카카오 페이</span>
									</button>
								</div>

							</div>
							<div style="margin: 5px;">
									<button type="button" name="payment-cancell" id="payment-point"
										class="Payment_payment-button cancell" onclick="location.href='${pageContext.request.contextPath}/product/product/'"
										style="float: right; background-color: unset; margin-bottom: 10px;">
									<span class="blind">결제 취소</span>
									</button>
							</div>
						</div>
					</div>

					<div class="buy-right" id="scroll-order">

						<div class="Payment-box-detail">
							<h3 class="order-title">결제 상세</h3>

							<div class="AddressView_article-2">
								<div class="Alignment_article">
									<span class="Alignment_title">주문금액</span> <span
										class="Alignment_value"><b><fmt:formatNumber value="${totalMoney}" pattern="#,###"/></b>원</span>
								</div>
								<div class="OrderSummary_inner">
									<ul class="OrderSummary_sub-list">
										<li class="OrderSummary_sub-item">
											<div class="Alignment_article">
												<span class="Alignment_title">상품금액</span> <span
													class="Alignment_icon"></span> <span
													class="Alignment_value"><b><fmt:formatNumber value="${totalMoney}" pattern="#,###"/></b>원</span>
											</div>
											<div class="Alignment_article">
												<span class="Alignment_title">배송비</span> <span
													class="Alignment_icon"></span> <span
													class="Alignment_value"><b><fmt:formatNumber value="${deliveryCharge}" pattern="#,###"/></b>원</span>
											</div>
											<div class="Alignment_article">
												<span class="Alignment_title">할인된 금액</span> <span
													class="Alignment_icon"></span> <span
													class="Alignment_value"><b><fmt:formatNumber value="${percentSale}" pattern="#,###"/></b>원</span>
											</div>
										</li>
									</ul>
								</div>
							</div>
							<div class="AmountArea_article AmountArea_type-order">
								<div class="AmountArea_cell">
									<span class="AmountArea_title">최종 주문금액</span>
								</div>
								<div class="AmountArea_cell">
									<span class="AmountArea_amount"><fmt:formatNumber value="${payment}" pattern="#,###"/>원</span>
								</div>
							</div>
						</div>

						<div class="Payment-box">
							<h3 class="order-title">포인트 혜택</h3>

							<div class="AddressView_article-point">
								<div class="Alignment_article">
									<span class="Alignment_title">회원 등급</span> <span
										class="Alignment_value">${vo.rank1}</span>
								</div>
								<div class="OrderSummary_inner">
									<ul class="OrderSummary_sub-list">
										<li class="OrderSummary_sub-item">
											<div class="Alignment_article">
												<span class="Alignment_title">적용 할인율</span> <span
													class="Alignment_icon"></span> <span
													class="Alignment_value"><b>${vo.sale}</b>%</span>
											</div>

										</li>
									</ul>
								</div>
							</div>
						</div>
						
						
						<input type="hidden" name="order_num" value="${productOrderNumber}">
						<input type="hidden" name="order_total_money" value="${totalMoney}">
						<input type="hidden" name="shipping" value="${deliveryCharge}">
						<input type="hidden" name="order_sale" value="${percentSale}">
						<input type="hidden" name="total_amount" value="${payment}">
						
						<input type="hidden" name="mode" value="${mode}">
					</div>
				</div>
			</form>
		</div>


	</div>
</section>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function daumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('address_num').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('address1').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('address2').focus();
					}
				}).open();
	}

	// 수령인 = 배송인 정보 넣기
	var check = document.querySelector("#shippingInfo"); //체크박스의 id

	check
			.addEventListener(
					"click",
					function() {//check요소에 이벤트가 발생했을 때 실행할 함수

						if (check.checked == true) { //체크되었다면
							document.querySelector("#recipient_name").value = "${sessionScope.loginUser.username}";
							document.querySelector("#recipient_phone1").value = "${vo.tel1}";
							document.querySelector("#recipient_phone2").value = "${vo.tel2}";
							document.querySelector("#recipient_phone3").value = "${vo.tel3}";
							document.querySelector("#address_num").value = "${vo.zip}";
							document.querySelector("#address1").value = "${vo.addr1}";
							document.querySelector("#address2").value = "${vo.addr2}";

						} else {
							document.querySelector("#recipient_name").value = "";
							document.querySelector("#recipient_phone1").value = "";
							document.querySelector("#recipient_phone2").value = "";
							document.querySelector("#recipient_phone3").value = "";
							document.querySelector("#address_num").value = "";
							document.querySelector("#address1").value = "";
							document.querySelector("#address2").value = "";
						}


					});
</script>