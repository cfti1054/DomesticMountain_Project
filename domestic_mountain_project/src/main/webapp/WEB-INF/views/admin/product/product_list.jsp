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
	float: right;
	
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

$(function(){
	$('#tab-${category}').addClass('active');

	$('ul.tabs li').click(function() {
		let category = $(this).attr('data-category');
		
		location.href = '${pageContext.request.contextPath}/admin/product/product_list';
	});
});

function changeList() {
	let parent_num = $("#changeCategory").val();
	let product_status = $("#changeShowProduct").val();
	
	const f = document.searchForm;
	f.parent_num.value = parent_num;
	f.category_num.value = 0;
	f.product_status.value = product_status;
	searchList();
}

function changeSubList() {
	let parent_num = $("#changeCategory").val();
	let category_num = $("#changeSubCategory").val();
	let product_status = $("#changeShowProduct").val();
	
	const f = document.searchForm;
	f.parent_num.value = parent_num;
	f.category_num.value = category_num;
	f.product_status.value = product_status;
	searchList();
}

</script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<div id="layoutSidenav_content">
	<main class="mt-4">
		<div class="container-fluid px-4 ">

			<div class="body-title">
				<h2>
					<i class="fa-regular fa-calendar"></i> Product Management
				</h2>
			</div>



			<div id="tab-content" style="padding: 15px 10px 5px; clear: both;">
				
				<table class="table-select" style="width: 100%">
					<tr>
						<td align="left" width="80%" >
							<form>
								<div style="float: left">
									<select id="changeCategory" class="form-select" onchange="changeList();">
										<c:if test="${listCategory.size() == 0}">
											<option value="0">:: 메인카테고리 ::</option>
										</c:if>
										<c:forEach var="vo" items="${listCategory}">
											<option value="${vo.category_num}" ${parent_num==vo.category_num?"selected":""}>${vo.category_name}</option>
										</c:forEach>
									</select>
								</div>
								
								<div style="float: left">
									<select id="changeSubCategory" class="form-select" onchange="changeSubList();">
										<c:if test="${listSubCategory.size() == 0}">
											<option value="0">:: 카테고리 ::</option>
										</c:if>
										<c:forEach var="vo" items="${listSubCategory}">
											<option value="${vo.category_num}" ${category_num==vo.category_num?"selected":""}>${vo.category_name}</option>
										</c:forEach>
									</select>
								</div>							
								
								<div style="float: left"> 
									<select id="changeShowProduct" class="form-select" onchange="changeList();">
										<option value="-1">:: 진열 여부 ::</option>
										<option value="1" ${product_status==1?"selected":""}>상품 진열</option>
										<option value="0" ${product_status==0?"selected":""}>상품 숨김</option>
									</select>						
								</div>
								
								<div style="float: right">
									${dataCount}개(${page}/${total_page} 페이지)
								</div>																										
							</form>
						</td>
						
						<td align="right" width="50%">
							<c:if test="${dataCount!=0 && (category == 'all' || category == 'special')}">
								<button type="button" class="btn" onclick="location.href='#';">상품등록</button>
							</c:if>
							<c:if test="${dataCount!=0 && category == 'order'}">
								<button type="button" class="btn" onclick="location.href='#';">Excel 저장</button>
							</c:if>
							<c:if test="${dataCount!=0 && category == 'review'}">
								전체 : n 건
							</c:if>
						</td>
					</tr>
				</table>


				<table class="table table-border table-list">
					<thead class="table-light">
						<tr>
							<th width="80">이미지</th>
							<th width="60">번호</th>
							<th>이름</th>
							<th width="150">상품코드</th>
							<th width="120">등록일</th>
							<th width="80">진열상태</th>
							<th width="80">재고</th>
							<th width="150">판매가</th>
							<th width="150">관리</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="dto" items="${list}" varStatus="status">
							<tr>
								<td>
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
								</td>
								<td>${dataCount - (page-1) * size - status.index}</td>
								<td class="left">
									<a href="${pageContext.request.contextPath}/product/${dto.product_num}">${dto.product_name}</a>
								</td>
								<td>${dto.product_num}</td>
								<td>${dto.product_reg_date}</td>
								<td>${dto.product_status == 1 ? "진열" : "숨김"}</td>
								<td>${dto.total_stock}</td>
								<td>${dto.product_price}</td>
									<c:url var="updateUrl" value="/admin/product/update">
										<c:param name="product_num" value="${dto.product_num}"/>
										<c:param name="parent_num" value="${parent_num}"/>
										<c:param name="category_num" value="${category_num}"/>
										<c:param name="page" value="${page}"/>
									</c:url>
									<c:url var="stockUrl" value="/admin/product/stock">
										<c:param name="product_num" value="${dto.product_num}"/>
										<c:param name="page" value="${page}"/>				
									</c:url>									
								<td>
								<button type="button" class="btn" style="height: auto; width: auto" onclick="location.href='${stockUrl}';">재고</button>
								<button type="button" class="btn" style="height: auto; width: auto" onclick="location.href='${updateUrl}';">수정</button>
							</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="page-navigation">${dataCount == 0 ? "등록된 상품이 없습니다." : paging}
				</div>

				<table class="table">
					<tr>
	
						<td>
							<form name="searchForm" 
								action="${pageContext.request.contextPath}/admin/product/product_list"
								method="post">
							<div class="col-auto p-1">
										<select name="schType" class="form-select">
											<option value="all" ${schType=="all"?"selected":""}>상품명+설명</option>
											<option value="product_num" ${schType=="product_num"?"selected":""}>상품코드</option>
											<option value="product_name" ${schType=="product_name"?"selected":""}>상품명</option>
											<option value="product_content" ${schType=="product_content"?"selected":""}>설명</option>
										</select>
									</div>
									<div class="col-auto p-1">
										<input type="text" name="kwd" value="${kwd}" class="form-control">
										<input type="hidden" name="size" value="${size}">
										<input type="hidden" name="parent_num" value="${parent_num}">
										<input type="hidden" name="category_num" value="${category_num}">
										<input type="hidden" name="product_status" value="${product_status}">
									</div>
									<div class="col-auto p-1">	
										<button type="button" class="btn" onclick="searchList()">검색</button>
									</div>

							<div>
								<c:url var="url" value="/admin/product/write">
								</c:url>
								<button type="button" class="btn" onclick="location.href='${url}';">등록하기</button>
							</div>
							</form>
						</td>
					</tr>
				</table>
			</div>

		</div>
	</main>
</div>

