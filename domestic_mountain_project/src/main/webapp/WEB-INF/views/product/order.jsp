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

	
</style>
<!-- ================== body ================== -->
<section class="features-1" style="height: auto;">
	<div class="jemok"> 등산화 </div>
        
    <div class="order">
        <div class="order-part order-img">
            <div>
                <img class="img" src="${pageContext.request.contextPath}/resources/images/product/TC00005105.jpg">
            </div>
        </div>
        <div class="order-part order-content">
            <p class="jemok1">캠프라인 중등산화</p>
            <span class="percent">50%</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <span class="jul">400,000원</span>&nbsp;&nbsp;<span class="amount">200,000</span><br><br>
            <select class="select">
                <option disabled selected>색상</option>
                <option>검정</option>
                <option>빨강</option>
                <option>오렌지</option>
            </select>
            <br><br>
            <select class="select2">
                <option disabled selected>사이즈</option>
                <option>95</option>
                <option>100</option>
                <option>105</option>
                <option>110</option>
            </select>
            <br><br>
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
                <div style="margin-right:150px"><span>총 수량 n개 |</span> <span class="blue">0원</span></div>
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
</section>