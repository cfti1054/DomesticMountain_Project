<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>


<html>


<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">대시보드</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active">대시보드</li>
			</ol>
		<div class="inner-page">

			<div class="row g-1 mt-4 p-1">
				<div class="col p-2">
					<div class="fs-6 fw-semibold mb-2">
						<i class="bi bi-chevron-right"></i> 오늘 판매 현황
					</div>
					<div class="border rounded p-5 text-center">
						<div class="fs-5 mb-2">
							총 판매 건수 : <span
								class="product-totalAmount fw-semibold text-primary">${today.COUNT}</span>
						</div>
						<div class="fs-5">
							총 판매 금액 : <span
								class="product-totalAmount fw-semibold text-danger"><fmt:formatNumber
									value="${today.TOTAL}" /></span>원
						</div>
					</div>
				</div>

				<div class="col p-2">
					<div class="fs-6 fw-semibold mb-2">
						<i class="bi bi-chevron-right"></i> 이번주 판매 현황
					</div>
					<div class="border rounded p-5 text-center" style="border-color: black;">
						<div class="fs-5 mb-2">
							총 판매 건수 : <span
								class="product-totalAmount fw-semibold text-primary">${thisMonth.COUNT}</span>
						</div>
						<div class="fs-5">
							총 판매 금액 : <span
								class="product-totalAmount fw-semibold text-danger"><fmt:formatNumber
									value="${thisMonth.TOTAL}" /></span>원
						</div>
					</div>
				</div>

				<div class="col p-2">
					<div class="fs-6 fw-semibold mb-2">
						<i class="bi bi-chevron-right"></i> 이번달 판매 현황
					</div>
					<div class="border rounded p-5 text-center">
						<div class="fs-5 mb-2">
							총 판매 건수 : <span
								class="product-totalAmount fw-semibold text-primary">${previousMonth.COUNT}</span>
						</div>
						<div class="fs-5">
							총 판매 금액 : <span
								class="product-totalAmount fw-semibold text-danger"><fmt:formatNumber
									value="${previousMonth.TOTAL}" /></span>원
						</div>
					</div>
				</div>
			</div>
		</div>
			<div class="row">
				<div class="col-xl-6 col-md-9">
					<div class="card bg-danger text-white mb-4">
						<div class="card-body">관리 현황</div>
						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<div class="fs-5">
								신규 주문 : <a class="small text-white stretched-link" href="#">5건</a>
							</div>
							<div class="fs-5 ">
								민원답변 대기 : <a class="small text-white stretched-link" href="#">3건</a>
							</div>
						</div>
						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<div class="fs-5">
								구매 취소 : <a class="small text-white stretched-link" href="#">1건</a>
							</div>
							<div class="fs-5">
								반품 대기 : <a class="small text-white stretched-link" href="#">3건</a>
							</div>
						</div>
						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<div class="fs-5">
								신규 리뷰 : <a class="small text-white stretched-link" href="#">3건</a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-xl-6 col-md-9">
					<div class="card bg-success text-white mb-4">
						<div class="card-body">판매 현황</div>
						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<div class="fs-5">
								당일 판매 건수 : <a class="small text-white stretched-link" href="#">1건</a>
							</div>
							<div class="fs-5">
								당일 판매 금액 : <a class="small text-white stretched-link" href="#">250,000
									원</a>
							</div>
						</div>
						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<div class="fs-5">
								이번주 판매 건수 : <a class="small text-white stretched-link" href="#">3건</a>
							</div>
							<div class="fs-5">
								이번주 판매 금액 : <a class="small text-white stretched-link" href="#">1,350,000
									원</a>
							</div>
						</div>
						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<div class="fs-5">
								이번달 판매 건수 : <a class="small text-white stretched-link" href="#">1건</a>
							</div>
							<div class="fs-5">
								이번달 판매 금액 : <a class="small text-white stretched-link" href="#">4,250,000
									원</a>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>


		<div class="row">
			<div class="col-xl-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-area me-1"></i> 차트
					</div>
					<div class="card-body">
						<canvas id="myAreaChart" width="100%" height="40"></canvas>
					</div>
				</div>
			</div>
			<div class="col-xl-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-bar me-1"></i> 표
					</div>
					<div class="card-body">
						<canvas id="myBarChart" width="100%" height="40"></canvas>
					</div>
				</div>
			</div>
		</div>
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> faq 질문 리스트
			</div>
			<div class="card-body">
				<table id="datatablesSimple" class="display"
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
									<button type="button" class="btn btn-info" id="show_content"
										onclick="showContent('${dto.faq_num}');">답변 보기</button>
								</td>
								<td width="10%">${dto.faq_reg_id}</td>
								<td width="15%">${dto.faq_reg_date}</td>
								<td width="10%">${dto.visible == 1 ? "O":"X"}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
</div>
</main>
</div>



</html>
