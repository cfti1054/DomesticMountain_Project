<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
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

.table tr {
	height: 48px;
}

.table tr td > * {
	height: 38px;
}
.table form {
	display: flex;
	padding: 0 200px;
}

.table button,
.table-select button {
	width: auto;
	border: 1px solid #ccc;
}

.table form .form-select,
.table form .form-control{
	width: 200px;
	margin: 0 3px;
}

.table-select {
	margin-bottom: 15px;
}

.table-list tbody tr {
	height: 65px;
}
.table-list tbody tr td {
	vertical-align: middle;
}
.form-list {
	width: auto; 
	padding: 0;
	display: flex;
}
.form-list select,
.form-list button {
	margin-right: 5px;
}
</style>

<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}

function changeList() {
	const f = document.boardListForm;
	f.submit();
}

$(function(){
	$('#tab-${category}').addClass('active');

	$('ul.tabs li').click(function() {
		let category = $(this).attr('data-category');
		
		location.href = '${pageContext.request.contextPath}/admin/product/'+category+'/product_list';
	});
});


</script>


<div id="layoutSidenav_content">
	<main class="mt-4">
		<div class="container-fluid px-4 ">

			<div class="body-title">
				<h2>
					<i class="fa-regular fa-calendar"></i> Product Management
				</h2>
			</div>

			<div>
				<ul class="tabs">
					<li id="tab-all" data-category="all">등산장비 목록</li>
					<li id="tab-special" data-category="special">특가 상품</li>
					<li id="tab-order" data-category="order">주문현황</li>
					<li id="tab-review" data-category="review">상품리뷰 및 문의</li>
				</ul>
			</div>

			<div id="tab-content" style="padding: 15px 10px 5px; clear: both;">
				
				<table class="table-select" style="width: 100%">
					<tr>
						<td align="left" width="80%">
							<form action="${pageContext.request.contextPath}/admin/product/${category}/product_list" name="boardListForm" class="form-list" method="post">
								<c:if test="${dataCount!=0 && category == 'all'}">
									<select name="size" class="form-select" onchange="changeList();">
										<option value="10" ${size==10 ? "selected ":""}>10개씩 출력</option>
										<option value="20" ${size==20 ? "selected ":""}>20개씩 출력</option>
										<option value="30" ${size==30 ? "selected ":""}>30개씩 출력</option>
									</select>
								</c:if>
								<c:if test="${dataCount!=0 && category == 'special'}">
									<select name="size" class="form-select" onchange="changeList();">
										<option value="" >브랜드 분류1</option>
										<option value="" >브랜드 분류2</option>
										<option value="" >브랜드 분류3</option>
									</select>
									<select name="size" class="form-select" onchange="changeList();">
										<option value="" >종류 분류1</option>
										<option value="" >종류 분류2</option>
										<option value="" >종류 분류3</option>
									</select>
								</c:if>
								<c:if test="${dataCount!=0 && category == 'order'}">
									<input type="date" name="sday" class="form-control" value="" style="width: auto;">&nbsp;<p style="margin: 5px;">&#126;</p>&nbsp;
									<input type="date" name="eday" class="form-control" value="" style="width: auto; margin-right: 20px;">
									<button type="button" class="btn" onclick="location.href='#';">오늘</button>
									<button type="button" class="btn" onclick="location.href='#';">1개월</button>
									<button type="button" class="btn" onclick="location.href='#';">3개월</button>
									<button type="button" class="btn" onclick="location.href='#';">6개월</button>
								</c:if>
								<input type="hidden" name="schType" value="${schType}">
								<input type="hidden" name="kwd" value="${kwd}">
							</form>
						</td>
						
						<td align="right" width="50%">
							<button type="button" class="btn" onclick="location.href='#';">상품등록</button>
						</td>
					</tr>
				</table>

				<table class="table table-border table-list">
					<thead class="table-light">
						<tr>
							<th width="60">번호</th>
							<th>이름</th>
							<th width="200">상품코드</th>
							<th width="150">등록일</th>
							<th width="80">진열상태</th>
							<th width="80">재고</th>
							<th width="150">판매가</th>
							<th width="150">관리</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="dto" items="${list}" varStatus="status">
							<tr>
								<td>${dataCount - (page-1) * size - status.index}</td>
								<td class="left">
									<a href="#">${dto.product_name}</a>
								</td>
								<td>${dto.product_num}</td>
								<td>${dto.product_reg_date}</td>
								<td>${dto.product_status == 1 ? "진열" : "숨김"}</td>
								<td>재고</td>
								<td>${dto.product_price}</td>
								<td>
								<button type="button" class="btn" style="height: auto; width: auto" onclick="location.href='#';">수정</button>
							</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="page-navigation">${dataCount == 0 ? "등록된 상품이 없습니다." : paging}
				</div>

				<table class="table">
					<tr>
						<td align="left" width="200">
							<button type="button" class="btn" onclick="location.href='#';"
								title="모두선택">모두선택</button>
							<button type="button" class="btn" onclick="location.href='#';"
								title="선택해제">선택해제</button>
						</td>
						<td align="center">
							<form name="searchForm" 
								action="${pageContext.request.contextPath}/admin/product/${category}/product_list"
								method="post">
								<select name="schType" class="form-select">
									<option value="all" ${schType=="all"?"selected":""}>모두</option>
									<option value="startDate">분류1</option>
									<option value="endDate">분류2</option>
									<option value="winningDate">분류3</option>
								</select> <input type="text" name="kwd" value="${kwd}"
									class="form-control">
								<button type="button" class="btn" onclick="searchList()">검색</button>
							</form>
						</td>
						<td align="right" width="100">
							<button type="button" class="btn" onclick="location.href='#';">선택삭제</button>
						</td>
					</tr>
				</table>
			</div>

		</div>
	</main>
</div>

