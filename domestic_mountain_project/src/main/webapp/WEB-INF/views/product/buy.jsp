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

<section class="features-1">
	<div class="body-container">
		<div class="amain">
			<h1 class="amain-main">
				<a>DM Store 상품<span>| DM Store</span></a> <span><a
					href="/plus/">home</a> &gt; DM Store</span>
			</h1>
		</div>




		<div class="buy-main">
			<div class="buy-title">장바구니 > 주문 및 결제 > 완료</div>
			<div class="buy-box">
				<div class="buy-left">
					<div class="address-box">
						<h3 class="order-title">배송인</h3>

						<div class="AddressView_article">
							<div class="AddressView_section-info">
								<strong class="AddressView_name">홍길동</strong>
								<div class="AddressView_area-tel">
									<ul class="AddressView_list-tel">
										<li class="AddressView_item-tel">010-1212-3434</li>
									</ul>

								</div>
							</div>
							<div class="AddressView_section-address">
								<p class="AddressView_address">대한민국 서울특별시 관악구 신림동 (12126)</p>
							</div>

						</div>

					</div>

					<div class="address-box">
						<h3 class="order-title">수령인</h3>

						<div class="AddressView_article">
							<div class="AddressView_section-info">

								<div class="recipient">
									<label class="col-sm-2 col-form-label" for="user_name">이름</label>
									<input type="text" name=user_name id="user_name" style="width: auto;"
										class="form-control" value="" placeholder="이름">
								</div>
								<div class="recipient">
									<label class="col-sm-2 col-form-label" for="tel1">전화번호</label>
									<div class="col-sm-3 pe-1">
										<input type="text" name="tel1" id="tel1" class="form-control"
											value="" maxlength="3">
									</div>
									<div class="col-sm-1 px-1" style="width: 2%;">
										<p class="form-control-plaintext text-center">-</p>
									</div>
									<div class="col-sm-3 px-1">
										<input type="text" name="tel2" id="tel2" class="form-control"
											value="" maxlength="4">
									</div>
									<div class="col-sm-1 px-1" style="width: 2%;">
										<p class="form-control-plaintext text-center">-</p>
									</div>
									<div class="col-sm-3 ps-1">
										<input type="text" name="tel3" id="tel3" class="form-control"
											value="" maxlength="4">
									</div>
								</div>

								<div class="AddressView_section-address">

									<div class="recipient">
										<label class="col-sm-2 col-form-label" for="zip">우편번호</label>
										<div class="col-sm-5">
											<div class="input-group">
												<input type="text" name="zip" id="zip" class="form-control"
													placeholder="우편번호" value="${dto.zip}" readonly>
												<button class="btn btn-light" type="button" onclick="daumPostcode();">우편번호
													검색</button>
											</div>
										</div>
									</div>

									<div class="recipient">
										<label class="col-sm-2 col-form-label" for="addr1">주소</label>
										<div class="col-sm-10">
											<div style="margin-bottom: 8px;">
												<input type="text" name="addr1" id="addr1"
													class="form-control" placeholder="기본 주소"
													value="${dto.addr1}" readonly>
											</div>
											<div>
												<input type="text" name="addr2" id="addr2"
													class="form-control" placeholder="상세 주소"
													value="${dto.addr2}">
											</div>
										</div>
									</div>
								</div>


							</div>
							<button type="button" class="AddressView_button-action">배송인 정보 동일</button>
						</div>

					</div>


					<div class="product-main">
						<h3 class="order-title">주문 상품</h3>
						<div class="AddressView_article-2">

							<div class="ProductList_area">
								<a href="#" class="ProductList_thumbnail"><img src="#"
									alt="" width="110" height="110"></a>
								<div class="ProductList_info">
									<a href="#" class="ProductList_name">상품 명</a>
									<ul class="ProductList_add-list">
										<li class="ProductList_option"><span
											class="ProductList_value"> <span>상품선택:
													BBLC(레귤러) / 옵션 선택: 사이즈 260, 색상 레드</span> <span
												class="ProductList_count__2S3qL">1개</span>
										</span></li>
									</ul>
									<div class="ProductList_amount">
										<span class="ProductList_pay-sum"> <span class="blind">상품
												금액</span> <b>219,000</b>원
										</span>
									</div>
								</div>
							</div>

						</div>
						<div class="AmountArea_article AmountArea_type-order">
							<div class="AmountArea_cell">
								<span class="AmountArea_title">전체 주문금액</span>
							</div>
							<div class="AmountArea_cell">
								<span class="AmountArea_amount">219,000원</span>
							</div>
						</div>
					</div>

					<div class="Payment-box">
						<h3 class="order-title">결제</h3>

						<div class="AddressView_article">

							<div class="Payment_payment">
								<button type="button" name="payment " id="payment-point"
									class="Payment_payment-button">
									<span class="blind">카카오 페이</span>
								</button>
							</div>

						</div>
					</div>
				</div>
				
				<div class="buy-right" id="scroll-order">
				
					<div class="Payment-box-detail">
						<h3 class="order-title">결제 상세</h3>

						<div class="AddressView_article-2">
							<div class="Alignment_article">
								<span class="Alignment_title">주문금액</span> <span
									class="Alignment_value"><b>219,000</b>원</span>
							</div>
							<div class="OrderSummary_inner">
								<ul class="OrderSummary_sub-list">
									<li class="OrderSummary_sub-item">
										<div class="Alignment_article">
											<span class="Alignment_title">상품금액</span> <span
												class="Alignment_icon"></span> <span class="Alignment_value"><b>219,000</b>원</span>
										</div>
										<div class="Alignment_article">
											<span class="Alignment_title">배송비</span> <span
												class="Alignment_icon"></span> <span class="Alignment_value"><b>0</b>원</span>
										</div>
										<div class="Alignment_article">
											<span class="Alignment_title">포인트</span> <span
												class="Alignment_icon"></span> <span class="Alignment_value"><b>0</b>원</span>
										</div>
									</li>
								</ul>
							</div>
						</div>
						<div class="AmountArea_article AmountArea_type-order">
							<div class="AmountArea_cell">
								<span class="AmountArea_title">전체 주문금액</span>
							</div>
							<div class="AmountArea_cell">
								<span class="AmountArea_amount">219,000원</span>
							</div>
						</div>
					</div>

					<div class="Payment-box">
						<h3 class="order-title">포인트 혜택</h3>

						<div class="AddressView_article">
							<div class="Alignment_article">
								<span class="Alignment_title">회원 등급</span> <span
									class="Alignment_value">브론즈</span>
							</div>
							<div class="OrderSummary_inner">
								<ul class="OrderSummary_sub-list">
									<li class="OrderSummary_sub-item">
										<div class="Alignment_article">
											<span class="Alignment_title">적용 포인트</span> <span
												class="Alignment_icon"></span> <span class="Alignment_value"><b>0</b>p</span>
										</div>

									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
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
						document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('addr1').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('addr2').focus();
					}
				}).open();
	}
</script>