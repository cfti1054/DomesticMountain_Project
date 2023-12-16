<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>

    .head-container {
        display: flex;
        justify-content: space-between;
    }

    .div1, .div2 {
        flex: 1;
        padding-top: 120px;
    }

    .div1 {
        text-align: left;
        margin-top: 30px;
        margin-left: 80px;
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
        margin-right: 80px;
    }

    .jemok{
        text-align: center;
        font-size: 50px;
        font-weight: bold;
        margin-top: 10px;
    }

    .img-container{
        display: flex;
        margin: 80px 300px 80px 300px;
        /* border: 1px solid black; */
        flex-direction: column; /* 세로 방향으로 정렬 */
    }

    .img-container1{
        display: flex;
        margin: 30px 300px 80px 300px;
        /* border: 1px solid black; */
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
        flex-wrap: wrap;
        margin-top: 10px;
        align-items: flex-start; /* 왼쪽 정렬 */
    }

    .box1{
        border: 1px solid green;
        width: 220px;
        height: 290px;
        border-radius: 10px;
        
    }

    .box2{
        border: 1px solid green;
        width: 220px;
        height: 290px;
        border-radius: 10px;
        margin-left: 50px;
    }

    .box3{
        border: 1px solid green;
        width: 220px;
        height: 290px;
        border-radius: 10px;
        margin-left: 50px;
    }

    .box4{
        border: 1px solid green;
        width: 220px;
        height: 290px;
        border-radius: 10px;
        margin-left: 50px;
    }

    .img{
        align-items: center;
        height: 200px;
        margin: 20px;
        border: 1px solid black;
        border-radius: 10px;
    }

    .product-name{
        text-align: center;

    }
    
    img{
    	align-items: center;
    	width: 180px;
        height: 200px;
        margin: 20px;
        border: 1px solid black;
        border-radius: 10px;
    }

</style>
<!-- ================== body ================== -->
<section class="features-1" style="height: auto;">
	<div class="head-container">
        <div class="div1">
        	<button class="button1" type="button"> 장비 견적 맞춰보기 </button>
        </div>
        <div class="div2"><p> > 등산 장비</p></div>
    </div>
    <div class="jemok"> 등산장비 </div>
    <div class="img-container">
        <div class="name"><a href="${pageContext.request.contextPath}/product/product_detail"> >> 신발과 양말 </a></div>
        <div class="box">
            <div class="img-box">
                <a href="#">
                	<div class="box1">
                    	<img src="${pageContext.request.contextPath}/resources/images/climbing.png">
                    	<div class="product-name">등산화</div>
                	</div>
                </a>
            </div>
            <div class="img-box">
                <div class="box2">
                    <img src="${pageContext.request.contextPath}/resources/images/hiking.png">
                    <div class="product-name">등산용 양말</div>
                </div>
            </div>
            <div class="img-box">
                <div class="box3">
                    <img src="${pageContext.request.contextPath}/resources/images/bg-image.png">
                    <div class="product-name">아이젠</div>
                </div>
            </div>
        </div>
    </div>

    <div class="img-container1">
        <div class="name"> >> 의류(남성) </div>
        <div class="box">
            <div class="img-box">
                <div class="box1">
                    <div class="img"></div>
                    <div class="product-name">아우터</div>
                </div>
            </div>
            <div class="img-box">
                <div class="box2">
                    <div class="img"></div>
                    <div class="product-name">겉옷과 내피</div>
                </div>
            </div>
            <div class="img-box">
                <div class="box3">
                    <div class="img"></div>
                    <div class="product-name">모자</div>
                </div>
            </div>
            <div class="img-box">
                <div class="box3">
                    <div class="img"></div>
                    <div class="product-name">장갑</div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="img-container1">
        <div class="name"> >> 의류(여성) </div>
        <div class="box">
            <div class="img-box">
                <div class="box1">
                    <div class="img"></div>
                    <div class="product-name">기능성 등산복</div>
                </div>
            </div>
            <div class="img-box">
                <div class="box2">
                    <div class="img"></div>
                    <div class="product-name">겉옷과 내피</div>
                </div>
            </div>
            <div class="img-box">
                <div class="box3">
                    <div class="img"></div>
                    <div class="product-name">모자</div>
                </div>
            </div>
            <div class="img-box">
                <div class="box3">
                    <div class="img"></div>
                    <div class="product-name">장갑</div>
                </div>
            </div>
        </div>
    </div>

    <div class="img-container1">
        <div class="name"> >> 가방 </div>
        <div class="box">
            <div class="img-box">
                <div class="box1">
                    <div class="img"></div>
                    <div class="product-name">등산용 가방</div>
                </div>
            </div>
            <div class="img-box">
                <div class="box2">
                    <div class="img"></div>
                    <div class="product-name">방수 커버</div>
                </div>
            </div>
            <div class="img-box">
                <div class="box3">
                    <div class="img"></div>
                    <div class="product-name">가방 악세사리</div>
                </div>
            </div>
        </div>
    </div>

    <div class="img-container1">
        <div class="name"> >> 보호장비 </div>
        <div class="box">
            <div class="img-box">
                <div class="box1">
                    <div class="img"></div>
                    <div class="product-name">등산 스틱</div>
                </div>
            </div>
            <div class="img-box">
                <div class="box2">
                    <div class="img"></div>
                    <div class="product-name">손전등</div>
                </div>
            </div>
            <div class="img-box">
                <div class="box3">
                    <div class="img"></div>
                    <div class="product-name">무릎 보호대</div>
                </div>
            </div>
            <div class="img-box">
                <div class="box3">
                    <div class="img"></div>
                    <div class="product-name">선글라스</div>
                </div>
            </div>
            <div class="img-box">
                <div class="box1">
                    <div class="img"></div>
                    <div class="product-name">의약품</div>
                </div>
            </div>
            <div class="img-box">
                <div class="box3">
                    <div class="img"></div>
                    <div class="product-name">임시대기</div>
                </div>
            </div>
            <div class="img-box">
                <div class="box3">
                    <div class="img"></div>
                    <div class="product-name">임시대기</div>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="features-6">
</section>