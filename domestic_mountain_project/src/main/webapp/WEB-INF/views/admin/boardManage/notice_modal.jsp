<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<h3 style="font-size: 15px; padding-top: 10px;"><i class="fa-solid fa-angles-right"></i> 공지사항 </h3>

<c:choose>

	<c:when test="${mode == 'write' && type =='category' }">
		<form name="categoryWriteForm" method="post" id="categoryWriteForm">
			<table class="table td-border mx-auto my-10" style="width: 99%; vertical-align: middle;">
				<tr>
					<td width="25%" class="text-center bg-light">카테고리 이름</td>
					<td width="75%" class="ps-5"><input type="text" class="form-control" name="notice_category_name"  id="notice_category_name" value="${dto.notice_category_name}"></td>
				</tr>
				<tr>
					<td class="text-center bg-light"> 보이기 </td>
					<td class="ps-5">
						<select id="notice_category_visible" name="notice_category_visible" class="form-select">
							<option value=""> :: 보이기 상태 :: </option>
							<option value="0">안보이기</option>
							<option value="1">보이기</option>
						</select>
					</td>
				</tr>
			</table>
		</form>
	</c:when>
	
	<c:when test="${mode=='update' && type=='category' }">
		<form name="categoryUpdateForm" method="post" id="categoryUpdateForm">
			<c:forEach var="dto" items="${list}" varStatus="status">
				<table class="table td-border mx-auto my-10" style="width: 99%; vertical-align: middle;">
					<tr>
						<td width="15%" class="text-center bg-light">번호</td>
						<td width="15%" class="ps-5"><input type="text" class="input" id="notice_category_num" value="${dto.notice_category_num}" readonly></td>
						<td width="35%" class="text-center bg-light">카테고리 이름</td>
						<td width="35%" class="ps-5"><input type="text" class="input" name="notice_category_name"  id="notice_category_name" value="${dto.notice_category_name}"></td>
					</tr>
					<tr>
						<td class="text-center bg-light">등록인</td>
						<td class="ps-5">${dto.notice_category_reg_id}</td>
						<td class="text-center bg-light">등록일자</td>
						<td class="ps-5">${dto.notice_category_reg_date}</td>
					</tr>
					<tr>
						<td colspan="3" class="text-center bg-light"> 보이기 </td>
						<td colspan="1" class="ps-5">
							<input type="number" class="input" name="notice_category_visible" id="notice_category_visible" value="${dto.notice_category_visible}">
						</td>
					</tr>
				</table>
			</c:forEach>
		</form>
	</c:when>
	

	<c:when test="${mode=='show' && type=='board'}">
		<table class="showTable table td-border mx-auto my-10" style="width: 99%; word-break: keep-all; height:100%;">
			<tr>
				<td class="text-center bg-light">제목</td>
				<td class="ps-3"><p class="input" id="inquiry_board_title">${dto.notice_board_title}</p></td>
			</tr>
			
			<tr>
				<td class="text-center bg-light">작성자</td>
				<td class="ps-3">${dto.notice_board_reg_id}</td>
			</tr>
			
			<tr>
				<td class="text-center bg-light">등록일자</td>
				<td class="ps-3">${dto.notice_board_reg_date}</td>
			</tr>
			
			
			<tr>
				<td class="text-center bg-light">내용</td>
				<td colspan="3" class="ps-3"><p class="input" id=notice_board_content>${dto.notice_board_content}</p></td>	
			</tr>
			
		</table>
	</c:when>
	
	
</c:choose>

<script>
		$(document).on("change", "input[name^=category_visible]", function() {
		    var val= $(this).val();

		    
		    if(val < 0 || val > 1) {
		        alert("0~1 범위로 입력해 주십시오.");
		        $(this).val('');
		    }
		});
		
		$(document).on("change", "input[name^=visible]", function() {
		    var val= $(this).val();

		    
		    if(val < 0 || val > 1) {
		        alert("0~1 범위로 입력해 주십시오.");
		        $(this).val('');
		    }
		});
		
		
</script>