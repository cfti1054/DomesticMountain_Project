<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div>
	<div class="mt-3">
		<div class="p-3 shadow bg-body rounded">
			<p class="fs-6 fw-semibold mb-0">주문 정보</p> 
		</div>
		<div class="mt-3 p-2">
			<table class="table table-bordered mb-1">
				<tr>
					<td class="table-light" width="105">주문번호</td>
					<td width="150">${order.order_num}</td>
					<td class="table-light" width="105">주문자</td>
					<td width="150">${order.user_name}</td>
					<td class="table-light" width="105">주문일자</td>
					<td width="150">${order.order_date}</td>
					<td class="table-light" width="110">주문상태</td>
					<td width="150">order.orderStateInfo</td>
				</tr>
				<tr>
					<td class="table-light">총금액</td>
					<td class="text-primary"><fmt:formatNumber value="${order.order_total_money}"/></td>
					<td class="table-light">적림금사용액</td>
					<td class="text-primary"><fmt:formatNumber value="${order.order_point}"/></td>
					<td class="table-light">결제금액</td>
					<td class="text-primary"><fmt:formatNumber value="${order.total_amount}"/></td>
					<td class="table-light">취소금액</td>
					<td class="text-warning order-cancelAmount" data-cancelAmount="order.cancelAmount">
						<fmt:formatNumber value="10000"/>
					</td>
				</tr>
				<tr>
					<td class="table-light">배송비</td>
					<td class="text-primary"><fmt:formatNumber value="${order.shipping}"/></td>
					<td class="table-light">배송업체</td>
					<td>order.deliveryName</td>
					<td class="table-light">송장번호</td>
					<td>order.invoiceNumber</td>
					<td class="table-light">상태변경일</td>
					<td>order.orderStateDate</td>
				</tr>
				<tr>
					<td class="table-light">결제구분</td>
					<td>order.payMethod</td>
					<td class="table-light">결제카드</td>
					<td>order.cardName</td>
					<td class="table-light">결제승인번호</td>
					<td>order.authNumber</td>
					<td class="table-light">승인일자</td>
					<td>order.authDate</td>
				</tr>
			</table>
			<table class="table table-borderless mb-1">
				<tr>
					<td width="50%">
						<c:if test="${order.order_status < 3}">
							<button type="button" class="btn btn-light btn-cancel-order" data-orderNum="${order.order_num}">판매취소</button>
						</c:if>
					</td>
					<td class="text-end">
						<c:if test="${order.order_status == 1}">
							<button type="button" class="btn btn-light btn-prepare-order" data-orderNum="${order.order_num}">발송처리</button>
						</c:if>
					
						<div class="row justify-content-end delivery-update-area">
							<c:if test="${order.order_status > 1 && order.order_status < 5 }">
								<div class="col-auto">
									<select class="form-select delivery-select">
										<option value="2" ${order.order_status==2?"selected":"" }>발송준비</option>
										<option value="3" ${order.order_status==3?"selected":"" }>배송시작</option>
										<option value="4" ${order.order_status==4?"selected":"" }>배송중</option>
										<option value="5" ${order.order_status==5?"selected":"" }>배송완료</option>
									</select>
								</div>
								<div class="col-auto">
									<button type="button" class="btn btn-light btn-delivery-order" data-orderNum="${order.order_num}" data-orderState="${order.order_status}">배송변경</button>
								</div>
							</c:if>
							<c:if test="${order.order_status == 5}">
								<div class="col-auto">
									<label>배송완료 일자 : order.orderStateDate</label>
								</div>
							</c:if>
							
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	<div class="mt-2 border-top pt-2">	
		<div class="p-3 shadow bg-body rounded">
			<p class="fs-6 fw-semibold mb-0">주문 상세정보</p> 
		</div>
		<div class="mt-3 p-3">
			
			<table class="table board-list order-detail-list">
				<thead class="table-light">
					<tr>
						<th width="80">상세번호</th>
						<th>상품명</th>
						<th width="90">상품가격</th>
						<th width="90">할인가격</th>
						<th width="130">옵션</th>
						<th width="80">주문수량</th>
						<th width="100">주문총금액</th>
						<th width="90">적립금</th>
						<th width="110">주문상태</th>
						<th width="60">변경</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="dto" items="${list_detail}" varStatus="status">
						<tr valign="middle" id="orderDetail-list${dto.order_detail_num}">
							<td>${dto.order_detail_num}</td>
							<td>dto.productName</td>
							<td><fmt:formatNumber value="${dto.order_detail_price}"/></td>
							<td><fmt:formatNumber value="999999"/></td>
							<td>dto.optionValue / dto.optionValue2</td>
							<td>${dto.order_detail_count}</td>
							<td><fmt:formatNumber value="${dto.order_detail_total_amount}"/></td>
							<td><fmt:formatNumber value="999999"/></td>
							<td>${order.order_status==1 && dto.order_status==0?"상품준비중":dto.change_num}</td>
							<td>
								<span class="orderDetailStatus-update" 
										data-orderNum="${order.order_num}" 
										data-orderState="${order.order_status}"
										data-productMoney="${dto.order_detail_total_amount}"
										data-orderDetailNum="${dto.order_detail_num}" 
										data-detailState="${dto.change_num}">수정</span>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		
		</div>
	</div>
</div>
