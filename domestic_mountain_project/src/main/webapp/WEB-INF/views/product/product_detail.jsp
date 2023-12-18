<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
    * {
        box-sizing: border-box;
        padding: 0;
        margin: 0;
    }

    .head-container {
        display: flex;
        justify-content: space-between;
        margin-top:100px;
    }

    .div1, .div2 {
        flex: 1;
    }

    .div1 {
        text-align: left;
        margin-top: 30px;
        margin-left: 40px;
    }

    .button1{
        background-color: white;
        width: 150px;
        height: 25px;
        border-radius: 5px;
    }

    .div2 {
        text-align: right;
        font-size: 13px;
        color: blue;
        margin-top: 40px;
        margin-right: 40px;
    }

    .jemok{
        text-align: center;
        font-size: 50px;
        font-weight: bold;
        margin-top: 10px;
    }

    .img-container{
        display: flex;
        margin: 80px 250px 80px 250px;
        flex-direction: column; /* 세로 방향으로 정렬 */
    }

    .img-container1{
        display: flex;
        margin: 30px 250px 80px 250px;
        border: 1px solid black;
        flex-direction: column; /* 세로 방향으로 정렬 */
    }

    .name{
        text-align: left;
        font-weight: bold;
    }

    .img-box{
        /* border: 1px solid blue; */
        margin-top: 10px;
		transition: transform 0.3s ease;
    }
    
    .img-box:hover{
        transform: scale(1.1); /* 1.1 배 확대 */
    }
    
    

    .box{
        display: flex; /* 가로 방향으로 정렬 */
        justify-content: space-between; /* 가로 간격을 맞추는 부분 */
        flex-wrap: wrap;
        margin-top: 10px;
        align-items: flex-start; /* 왼쪽 정렬 */
    }

    .box1{
        border: 1px solid green;
        width: 320px;
        height: 370px;
        border-radius: 10px;
        margin-top: 50px;
    }

    .product-name{
        text-align: left;
        margin-left: 25px;
    }

    .price{
        text-align: left;
        margin-left: 25px;
    }

    .review{
        text-align: left;
        margin-left: 25px;
        margin-top: 10px;
        display: flex;
  		align-items: center; /* 수직 가운데 정렬 */
    }
    
    .img{
    	align-items: center;
    	width: 280px;
        height: 230px;
        margin: 20px;
        border: 1px solid black;
        border-radius: 10px;
    }
    
    .star{
    	width: 15px;
    	height:15px;
    	margin-right: 5px;
    }

</style>
<!-- ================== body ================== -->
<section class="features-1" style="height: 2600px;">
	<div class="head-container">
        <div class="div2"> > 등산장비 > 신발과 양말 > 등산화</div>
    </div>
    <div class="jemok"> 등산화 </div>
    <div class="img-container">
        <div class="box">
        	<c:forEach var="dto" items="${list}" varStatus="status">
	            <div class="img-box" data-productNum="${dto.product_num}">
	                <div class="box1">
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
	                    <div class="product-name">${dto.product_name}</div>
	                    <c:set var="formattedPrice" value="${dto.product_price}" />
						<fmt:formatNumber value="${formattedPrice}" pattern="#,###" var="formattedPriceWithComma" />
						
						<div class="price">${formattedPriceWithComma}</div>
	                    
	                    <div class="review">
	                    	<img class="star" src="${pageContext.request.contextPath}/resources/images/product/star.png">5.0 리뷰 87
	                    </div>
	                </div>
	            </div>
	        </c:forEach>
        </div>
    </div>
</section>
<section class="features-6">
</section>