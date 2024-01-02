<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
.body-container {
	max-width: 900px;
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

ul.tabs > li {
	margin: 0;
	cursor: pointer;
	padding: 0px 21px;
	height: 35px;
	overflow: hidden;
	background: #fff;
	border-bottom: 1px solid #ddd;
	display: flex; align-items: center;
}

ul.tabs li:hover {
	background: #e7e7e7;
}	
ul.tabs li.active {
	font-weight: 700;
	border: 1px solid #ddd;
	border-bottom-color:  transparent;
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

.score-star { font-size: 0; letter-spacing: -4px; }
.score-star .item {
	font-size: 22px; letter-spacing: 1px; display: inline-block;
	color: #ccc; text-decoration: none; vertical-align: middle;
}
.score-star .item:first-child{ margin-left: 0; }
.score-star .on { color: #00D8FF; }

.md-img img { width: 150px; height: 150px; cursor: pointer; object-fit: cover; }

.item-basic-content { cursor: pointer; }
.item-detail-content { display: none; }

.answer-form textarea { width: 100%; height: 75px; resize: none; }

.answerReview, .deleteReview { cursor: pointer; padding-left: 5px; }
.answerReview:hover, .deleteReview:hover { font-weight: 500; color: #2478FF; }
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<div id="container">
	<main class="stockForm">
		<div class="body-container">

			<div class="body-title">
				<h3>재고 관리</h3>
			</div>

		<div class="body-main">

	        <div class="row board-list-header">
	            <div class="col-auto pt-2">
	            	<span>${dataCount}개(${page}/${total_page} 페이지)</span>
	            </div>
	        </div>
			
			<table class="table table-borderless board-list">
				<thead class="table-light">
					<tr class="border-bottom1">
						<th width="100">재고번호</th>
						<th width="100">상품번호</th>
						<th>상품이름</th>
						<th width="100">상세번호1</th>
						<th width="100">상세번호2</th>
						<th width="100">재고</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="dto" items="${listProductStock}" varStatus="status">
						<tr class="item-basic-content border-bottom">
							<td>
								${dto.stock_num}
							</td>
							<td>
								${dto.product_num}
							</td>
							<td>
								<span>${dto.product_name}</span>
							</td>
							<td>${dto.detail_num}</td>
							<td>${dto.detail_num2}</td>
							<td>${dto.total_stock}</td>
						</tr>
						
					</c:forEach>
				</tbody>
			</table>
			
			<div class="page-navigation">
				${dataCount == 0 ? "등록된 상품이 없습니다." : paging}
			</div>

		</div>


		</div>
	</main>
</div>

