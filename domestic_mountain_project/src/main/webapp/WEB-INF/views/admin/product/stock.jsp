<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
.body-container {
	max-width: 1100px;
	position: relative;
	top: 100px;
	left: 20%;
	margin: -25px 0 0 -25px;
}

ul.tabs {
	display: flex;
	margin: 0;
	padding: 0;
	list-style: none;
	height: 35px;
	width: 100%;
	border-bottom: 1px solid #ddd;
}

ul.tabs>li {
	margin: 0;
	cursor: pointer;
	padding: 0px 21px;
	height: 35px;
	overflow: hidden;
	background: #fff;
	border-bottom: 1px solid #ddd;
	display: flex;
	align-items: center;
}

ul.tabs li:hover {
	background: #e7e7e7;
}

ul.tabs li.active {
	font-weight: 700;
	border: 1px solid #ddd;
	border-bottom-color: transparent;
}

.table .ellipsis {
	position: relative;
	min-width: 200px;
}

.table .ellipsis span {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	position: absolute;
	left: 9px;
	right: 9px;
	cursor: pointer;
}

.table .ellipsis:before {
	content: '';
	display: inline-block;
}

.md-img img {
	width: 150px;
	height: 150px;
	cursor: pointer;
	object-fit: cover;
}

.item-basic-content {
	cursor: pointer;
}

.item-detail-content {
	display: none;
}

.btn1 {
	background-color: #FFC596;
	border-color: white;	
	border-radius: 5px;
}

.text1 {
	border-radius: 5px;
	border-color: #dcdcdc;
}

</style>
<script type="text/javascript">
$(function(){
	$('.btnStockUpdate').click(function(){
		const $btn = $(this);
		const $input = $(this).closest('tr').find('input[name="total_stock"]');
		
		if(! /^[0-9]+$/.test($input.val())) {
			alert('숫자만 가능합니다.');
			$input.focus();
			return false;
		}
		
		if(parseInt($input.val()) < 1) {
			alert('재고는 하나 이상 가능합니다.');
			$input.focus();
			return false;			
		}
	
		let detail_num = $btn.attr("data-detail_num");
		let detail_num2 = $btn.attr("data-detail_num2");
		let stock_num = $btn.attr("data-stock_num");
		let total_stock = $input.val();
		
		const f = document.stockUpdateForm;
		f.detail_num.value = detail_num;
		f.detail_num2.value = detail_num2;
		f.stock_num.value = stock_num;
		f.total_stock.value = total_stock;
		
		f.action = "${pageContext.request.contextPath}/admin/product/updateStock";
		f.submit();
		
	});
});
</script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/boot-board.css"
	type="text/css">

<div id="container">
	<main class="stockForm">
		<div class="body-container">

			<div class="body-title">
				<h3>재고 관리</h3>
			</div>

			<div class="body-main">

				<div class="row board-list-header">
					<div class="col-auto me-auto pt-2">
						<h3>${productName}(${productNum})</h3>
					</div>
					<div class="col-auto pt-2">
						<span>상품 종류 : ${listProductStock.size()} 개</span>
					</div>					
				</div>

				<table class="table table-borderless board-list">
					<thead class="table-light">
						<tr class="border-bottom1">
							<th width="110">번호</th>
							<th width="250">${titleOptionParent}</th>
							<th width="250">${titleOptionSub}</th>
							<th width="250">재고</th>
							<th>관리</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="dto" items="${listProductStock}"
							varStatus="status">
							<tr class="item-basic-content border-bottom">
								<td>${status.count}</td>
								<td>${dto.poption_value}</td>
								<td>${dto.soption_value}</td>

								<td><input type="text" class="form-control" name="total_stock" value="${dto.total_stock}">  </td>
								<td>	
									<button type="button" class="form-control btnStockUpdate" data-detail_num="${dto.pdetail_num}" data-detail_num2="${dto.sdetail_num}" data-stock_num="${dto.stock_num}">${total_stock == 0 ?"변경":"등록"}</button>
								</td>
							</tr>

						</c:forEach>
					</tbody>
				</table>

			</div>
			<table class="table table-borderless">
				<tr>
					<td>					
						<button type="button" class="btn btn-dark" onclick="location.href='${pageContext.request.contextPath}/admin/product/product_list?page=${page}';" style="float: right;">돌아가기</button>
					</td>
				</tr>
			</table>
			
			<form name="stockUpdateForm" method="post">
				<input type="hidden" name="product_num" value="${productNum}">
				<input type="hidden" name="detail_num" value="${detail_num}">
				<input type="hidden" name="detail_num2" value="${detail_num2}">
				<input type="hidden" name="stock_num" value="${stock_num}">
				<input type="hidden" name="total_stock" value="${total_stock}">
				<input type="hidden" name="page" value="${page}">
			</form>

		</div>
	</main>
</div>

