<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.features-1 {
	height: auto; /* 수정 시 auto로 바꾸고 해야함 */
}

.body-container {
	padding-top: 120px;
	max-width: 1400px;
	margin: 30px auto;
}

.delete-button {
	padding: 12px 22px;
	border: 1px solid #bbbbbb;
}

*, *::before, *::after {
	box-sizing: border-box;
}

.number-input-button {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 4px 12px;
	border: 1px solid #dddddd;
	font-size: 100%;
	cursor: pointer;
}

.table>:not(caption)>*>* {
	border-bottom-width: unset;
	border-style: none;
	background-color: unset;
} 

</style>

<script type="text/javascript">
	$(function() {
		let cartSize = "${list.size()}";
		if (cartSize !== "" && cartSize !== "0") {
			$(".cart-chkAll").prop("checked", true);
			$("form input[name=nums]").prop("checked", true);
		}

		$(".cart-chkAll").click(function() {
			$("form input[name=nums]").prop("checked", $(this).is(":checked"));
		});
	});

	function deleteCartAll() {
		// 장바구니 비우기
		if (!confirm('장바구니를 비우시겠습니까 ? ')) {
			return;
		}

		location.href = '${pageContext.request.contextPath}/mypage/deleteCartAll';
	}

	function deleteCartSelect() {
		// 선택된 항목 삭제
		let cnt = $("form input[name=nums]:checked").length;
		if (cnt === 0) {
			alert("삭제할 상품을 선택해주세요. ");
			return;
		}

		if (!confirm('선택한 상품을 장바구니에서 비우시겠습니까 ? ')) {
			return;
		}

		const f = document.cartForm;
		f.action = "${pageContext.request.contextPath}/mypage/deleteListCart";
		f.submit();
	}

	// 결제로 이동
	function sendOk() {
		const f = document.cartForm;
		
		let cnt = $("form input[name=nums]:checked").length;
	    if (cnt === 0) {
			alert("구매할 상품을 선택 하세요.");
			return;
	    }
	    
	    $("form input[name=nums]").each(function(index, item){
			if(! $(this).is(":checked")) {
				$(this).closest("tr").remove();
			}
		});
		
		f.action = "${pageContext.request.contextPath}/order/buy";
		f.submit();
	}

	// 수량 증가/감소
	$(function() {
		$(".btnMinus")
				.click(
						function() {
							const $tr = $(this).closest("tr");
							let qty = Number($tr.find("input[name=buyQtys]")
									.val()) || 1;
							let product_price = Number($tr.find(
									"input[name=product_prices]").val()) || 0;

							if (qty <= 1) {
								return false;
							}

							qty--;
							$tr.find("input[name=buyQtys]").val(qty);
							let total = product_price * qty;

							$tr.find(".cart-price")
									.text(total.toLocaleString());
							$tr.find("input[name=od_total_amounts]").val(total);
						});

		$(".btnPlus")
				.click(
						function() {
							const $tr = $(this).closest("tr");
							let qty = Number($tr.find("input[name=buyQtys]")
									.val()) || 1;
							let product_price = Number($tr.find(
									"input[name=product_prices]").val()) || 0;

							if (qty >= 99) {
								return false;
							}

							qty++;
							$tr.find("input[name=buyQtys]").val(qty);
							let total = product_price * qty;

							$tr.find(".cart-price")
									.text(total.toLocaleString());
							$tr.find("input[name=od_total_amounts]").val(total);
						});
	});
</script>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/index.css"
	type="text/css">



				<section class="features-1">
	<div class="body-container">
					<header class="flex-col-center mt-20">
						<h2 class="cart-section__title" style="padding-bottom: 5px;">장바구니</h2>

						<div class="xans-element- xans-order xans-order-basketpackage ">
							<p class="orderStep">
								<img
									src="//img.echosting.cafe24.com/skin/base_ko_KR/order/img_order_step1.gif"
									alt="01 장바구니" />
							</p>
						</div>
						<div
							class="xans-element- xans-order xans-order-tabinfo ec-base-tab typeLight  "></div>
						<hr class="divide-line mt-20" />
					</header>


					<form name="cartForm" method="post">
						<div class="flex">
							<section class="cart-left-section">
								<div class="flex justify-between items-center">
									<div class="checkbox-container">
										<input class="checkbox cart-chkAll" name="chkAll"
											type="checkbox" /> <label
											class="checkbox-label" for="checkbox">모두&nbsp;선택/해제</label>
									</div>
									<div>
										<button type="button"
											class="delete-button btn cart-deleteCheck"
											onclick="deleteCartAll();">모두 비우기</button>
										<button type="button"
											class="delete-button btn cart-deleteCheck"
											onclick="deleteCartSelect();">선택 삭제</button>
									</div>
								</div>

								<h3 class="cart-title">배송 상품</h3>
								<hr class="divide-line-gray mt-10" />


								<table class="table cart-list">
								
									<tbody>
										<c:forEach var="dto" items="${list}">
											<tr class="cart-container">
												<td class="flex gap-15 mt-10"><input class="checkbox"
													name="nums" type="checkbox" value="${dto.cart_num}">
													<input type="hidden" name="cart_nums"
													value="${dto.cart_num}"></td>
												<td class="w-144 h-144">
													<a class="product-hov" href="${pageContext.request.contextPath}/product/${dto.product_num}"><img class="border rounded"
													src="${pageContext.request.contextPath}/resources/images/product/${dto.product_summary}"></a>
												</td>
												
												<td class="cart-name" style="width: 520px;">
													<a class="product-hov" href="${pageContext.request.contextPath}/product/${dto.product_num}" style="color: #000;"><span>${dto.product_name}</span></a>
													<p style="font-size: small; font-weight: bold;">선택사항 :
														${dto.option_value}, ${dto.option_value2}</p>

													<input type="hidden" name="product_nums"
													value="${dto.product_num}"> <input type="hidden"
													name="detail_nums" value="${dto.detail_num1}"> <input
													type="hidden" name="detail_nums2"
													value="${dto.detail_num2}">
												</td>
												<td class="number-input-container"><input type="text"
													name="buyQtys" class="number-input" value="${dto.qty}">
													<input type="hidden" name="product_prices"
													value="${dto.product_price}">
													<div class="border-box">
														<button type="button"
															class="number-input-button btn btnPlus">▲</button>
														<button type="button"
															class="number-input-button btn btnMinus">▼</button>
													</div></td>
												<td class="cart-price"><label><fmt:formatNumber
															value="${dto.od_total_amount}" />원</label> <input type="hidden"
													name="od_total_amounts" value="${dto.od_total_amount}">
												</td>
											</tr>
										</c:forEach>
									</tbody>

								</table>

								<c:choose>
									<c:when test="${list.size() == 0}">
										<div class="mt-3 p-3 text-center">장바구니가 비었습니다.</div>
									</c:when>
									<c:otherwise>
										<div class="mt-3 p-3 text-end">
											<input type="hidden" name="mode" value="cart">
										</div>
									</c:otherwise>
								</c:choose>

							</section>
							<section class="cart-right-section">
									<div class="flex-center mt-30 mx-10">
										<button class="primary-button flex-center" onclick="sendOk();">주문하기</button>
									</div>
							</section>
						</div>
					</form>
</div>
				</section>