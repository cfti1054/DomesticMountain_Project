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
						<h3 class="order-title">배송지</h3>

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
							<button type="button" class="AddressView_button-action">변경</button>
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
										<li class="ProductList_option">
											<span class="ProductList_value"> 
												<span>상품선택: BBLC(레귤러) / 옵션 선택: 사이즈 260, 색상 레드</span> 
												<span class="ProductList_count__2S3qL">1개</span>
											</span>
										</li>
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
				<div class="buy-right">
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
