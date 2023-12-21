<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>

    .jemok{
        text-align: center;
        font-size: 50px;
        font-weight: bold;
        margin-top: 90px;
    }

    .order {
        display: flex; 
        justify-content: space-between;
        align-items: center;
        margin: 80px 200px 80px 200px;
    }

    .order-part {
        flex: 1;
        text-align: center;
    }

    .order-img {
        height:550px;
    }

    .order-content {
        height:550px;
    }

    .img{
        border: 1px solid black;
        width: 100%;
        height: auto;
        
    }
    
    .select {
        color: black;
        background-color: white;
        border: 1px solid #ccc;
        padding: 5px;
        border-radius: 5px;
        text-align: left;
        width: 350px;
    }

    .select option {
         color: black; 
    }

    .select2 {
        color: black;
        background-color: white;
        border: 1px solid #ccc;
         padding: 5px;
        border-radius: 5px;
        text-align: left;
        width: 350px;
    }

    .select2 option {
         color: black; 
    }

    .select3 {
        color: black;
        background-color: white;
        border: 1px solid #ccc;
         padding: 5px;
        border-radius: 5px;
        text-align: left;
        width: 350px;
    }

    .select3 option {
         color: black; 
    }

    .price {
        display: flex;
        justify-content: space-between;
     }

	.img{
		width:100%;
		height: 550px;
		border-radius: 50px;
	}
	
	.jemok1{
		margin-top: 20px;
		font-size:40px;
	}
	
	.percent{
		color: red;
		font-size: 35px;
	}
	
	.jul{
    	text-decoration: line-through;  
    	font-size:20px;   
    }
    
    .amount{
    	font-size: 35px;
    }
	
	.blue{
		color:blue;
		font-size: 17px;
	}
	
	.gume{
		width:350px;
		height:50px;
		background-color: yellow;
	}
	
	.gume1{
		display: flex;
        justify-content: space-between;
        align-items: center;
		width:350px;
		height:50px;
		margin: 0 auto;
	}
	
	.gume2, .gume3, .gume4 {
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  width: 110px;
	  height: 50px;
	  border: 1px solid black;
	  border-width: 1px;
	}
	
	.gume3, .gume4 {
	  margin-left: 10px;
	}
	
	.gara{
		width:30px;
		height:30px;
		vertical-align: middle;
	}
	
	.centered {
	    display: flex;
	    justify-content: center;
	    align-items: center;
	}

	
</style>
<script>
	document.addEventListener('DOMContentLoaded', function () {
	    // 총 수량 및 금액을 업데이트하는 함수
	    function updateTotal() {
	        var selectedQuantity = parseInt(document.querySelector('.select3').value, 10);
	        var productPrice = parseInt('${dto.product_price}', 10); // 제품 가격을 가져오기 위한 JSP 표현식 사용
	
	        // 수량이 선택되지 않은 경우 0으로 초기화
	        selectedQuantity = isNaN(selectedQuantity) ? 0 : selectedQuantity;
	
	        // 총 수량 업데이트
	        document.querySelector('.product-totalQty').innerText = selectedQuantity;
	
	        // 총 금액 업데이트
	        var totalAmount = selectedQuantity * productPrice;
	        totalAmount = isNaN(totalAmount) ? 0 : totalAmount;
	
	        document.querySelector('.product-totalAmount').innerText = totalAmount.toLocaleString(); // 필요에 따라 금액 형식 지정
	    }
	
	    // 수량 선택 요소에 이벤트 리스너 추가
	    document.querySelector('.select3').addEventListener('change', updateTotal);
	
	    // 페이지 로드 시 초기 업데이트 수행
	    updateTotal();
	});
</script>
<!-- ================== body ================== -->
<section class="features-1" style="height: auto;">
	<div class="jemok"> 등산화 </div>
        
    <div class="order">
        <div class="order-part order-img">
            <div>
                <c:choose>
					<c:when test="${not empty dto.product_summary and dto.product_summary.startsWith('TC')}">
						<img class="img" src="${pageContext.request.contextPath}/resources/images/product/${dto.product_summary}">
					</c:when>
					<c:when test="${not empty dto.product_summary and dto.product_summary.startsWith('ht')}">
						<img class="img" src="${dto.product_summary}">
					</c:when>
						   
					<c:otherwise>
						       
					</c:otherwise>
				</c:choose>
            </div>
        </div>
        <div class="order-part order-content">
            <p class="jemok1">${dto.product_name}</p>
            <span class="percent">50%</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <span class="jul">${dto.product_price}원</span>&nbsp;&nbsp;<span class="amount">${dto.product_price}원</span><br><br>
			<c:if test="${not empty listOptionDetail}">
			    <select class="select" data-optionNum="${listOption[0].option_num}">
			        <option value="">${listOption[0].option_name}</option>
			        <c:forEach var="vo" items="${listOptionDetail}">
			            <option value="${vo.detail_num}">${vo.option_value}</option>
			        </c:forEach>
			    </select><br><br>
			</c:if>
			<c:if test="${not empty listOptionDetail1}">
			    <select class="select" data-optionNum2="${listOption[1].option_num}">
			        <option value="">${listOption[1].option_name}</option>
			        <c:forEach var="vo1" items="${listOptionDetail1}">
			            <option value="${vo1.detail_num}">${vo1.option_value}</option>
			        </c:forEach>
			    </select><br><br>
			</c:if>
            <select class="select3">
                <option disabled selected>수량</option>
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
                <option>6</option>
                <option>7</option>
                <option>8</option>
                <option>9</option>
                <option>10</option>
            </select>
            <br><br>
            <div class="price">
                <div style="margin-left:150px"><p>총 상품금액</p></div>
                <div style="margin-right:150px"><span>총 수량 <span class="product-totalQty">0</span>개 |</span> <span class="blue"><span class="product-totalAmount">0</span>원</span></div>
            </div><br>
            <button class="gume">구매하기</button><br><br>
            <div class="gume1">
            	<div class="gume2"><img class="gara" src="${pageContext.request.contextPath}/resources/images/product/gogek.png">&nbsp;<span>문의</span></div>
            	<div class="gume3"><img class="gara" src="${pageContext.request.contextPath}/resources/images/product/love.png">&nbsp;<span>찜하기</span></div>
            	<div class="gume4"><img class="gara" src="${pageContext.request.contextPath}/resources/images/product/jangbaguni.png">&nbsp;<span>장바구니</span></div>
            </div>
        </div>
    </div>
</section>
<section class="features-6">
	<br><br><div class="centered">${dto.product_content}</div>
</section>