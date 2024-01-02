<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>

/*=============== body (area) ===============*/
.features-1 {
	height: auto; /* 수정 시 auto로 바꾸고 해야함 */
}

.body-container {
	margin: 30px auto;
	max-width: 1300px;
	padding-top: 120px;
	position: relative;
	align-items: center;
	min-height: 100vh;
	overflow-x: hidden;
	max-width: 1300px;
}

.amain h1 {
	display: flex;
	justify-content: space-between;
	margin: 20px 0 80px 0;
	font-weight: 700;
	color: #6558be;
}

.amain-main {
	padding: 0 0 10px 10px;
	border-bottom: 2px solid #3a3a3a;
	font-size: xx-large;
	color: #6557be;
}

.amain-main a>span {
	font-size: 18px;
	color: gray;
	margin: 10px 0 0 20px;
}

.amain-main span {
	font-size: 14px;
	color: gray;
	margin: 15px 0 0 20px;
}

.features-1 a {
	color: hsl(212deg 35.69% 49.28%);
	text-decoration: none;
}

.features-1 img {
	-moz-user-select: none;
	-webkit-user-select: none;
	-ms-user-select: none;
	user-select: none;
	pointer-events: none;
}

#gallery {
	position: relative;
	left: calc(-1 * var(- -adjust-size));
	grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
	gap: 40px;
	max-width: auto;
	padding: 20px;
	-webkit-perspective: 0;
	perspective: 0;
}

#gallery figure {
	position: relative;
	display: inline-block;
	margin: 14px; 
	padding : 0.5rem;
	border-radius: 5px;
	box-shadow: 0 7px 8px rgba(0, 0, 0, 0.4);
	width: 220px;
	height: 260px;
	text-align: center;
	background-color: ghostwhite;
	background-size: cover;
	background-position: center;
	background-blend-mode: multiply;
	transform-origin: center 0.22rem;
	will-change: transform;
	break-inside: avoid;
	overflow: hidden;
	outline: 1px solid transparent;
	-webkit-backface-visibility: hidden;
	backface-visibility: hidden;
	padding: 0.5rem;
}

#gallery figure:hover {
	scale: 1.1;
}

figure img {
	aspect-ratio: 1/1;
	width: 100%;
	object-fit: cover;
	display: block;
	border-radius: 5px;
	margin-bottom: 10px;
	z-index: 1;
}

.features-1 figure figcaption {
	font-size: 18px;
	font-weight: 400;
	z-index: 1;
}

@media ( min-width : 800px) {
	#gallery {
		grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
	}
}

.gallery-main h3 {
	margin-top: 50px;
	margin-left: 10px;
}

</style>



<section class="features-1">
	<div class="body-container">
		<div class="amain">
			<h1 class="amain-main">
				<a>DM Store 상품<span>| DM Store</span></a> <span><a
					href="/plus/">home</a> &gt; DM Store</span>
			</h1>
		</div>
		<div class="gallery-main">
			<h3><a>&gt;&gt; 신발과 양말</a></h3>
			<div id="gallery">
				<figure>
					<a href="${pageContext.request.contextPath}/product/product_detail?category_num=21">
						<img src="${pageContext.request.contextPath}/resources/images/product_illustration/shoes.png" alt="">
					</a>
					<figcaption>
						<a href="${pageContext.request.contextPath}/product/product_detail?category_num=21">등산화</a>
					</figcaption>
				</figure>
				<figure>
					<a href="${pageContext.request.contextPath}/product/product_detail?category_num=22">
						<img src="${pageContext.request.contextPath}/resources/images/product_illustration/socks.png" alt="">
					</a>
					<figcaption>
						<a href="${pageContext.request.contextPath}/product/product_detail?category_num=22">등산용 양말</a>
					</figcaption>
				</figure>
				<figure>
					<a href="${pageContext.request.contextPath}/product/product_detail?category_num=23">
						<img src="${pageContext.request.contextPath}/resources/images/product_illustration/eisen.png" alt="">
					</a>
					<figcaption>
						<a href="${pageContext.request.contextPath}/product/product_detail?category_num=23">아이젠</a>
					</figcaption>
				</figure>
			</div>
		</div>

		<div class="gallery-title">
			<h3><a>&gt;&gt; 의류(남성)</a></h3>
			<div id="gallery">
				<figure>
					<a href="${pageContext.request.contextPath}/product/product_detail?category_num=11">
						<img src="${pageContext.request.contextPath}/resources/images/product_illustration/jumper.png" alt="">
					</a>
					<figcaption>
						<a href="${pageContext.request.contextPath}/product/product_detail?category_num=11">자켓 / 점퍼 / 코트</a>
					</figcaption>
				</figure>
				<figure>
					<a href="${pageContext.request.contextPath}/product/product_detail?category_num=12">
						<img src="${pageContext.request.contextPath}/resources/images/product_illustration/vest.png" alt="">
					</a>
					<figcaption>
						<a href="${pageContext.request.contextPath}/product/product_detail?category_num=12">조끼</a>
					</figcaption>
				</figure>
				<figure>
					<a href="${pageContext.request.contextPath}/product/product_detail?category_num=13">
						<img src="${pageContext.request.contextPath}/resources/images/product_illustration/tshirt.png" alt="">
					</a>
					<figcaption>
						<a href="${pageContext.request.contextPath}/product/product_detail?category_num=13">티셔츠</a>
					</figcaption>
				</figure>
				<figure>
					<a href="${pageContext.request.contextPath}/product/product_detail?category_num=14">
						<img src="${pageContext.request.contextPath}/resources/images/product_illustration/hat.png" alt="">
					</a>
					<figcaption>
						<a href="${pageContext.request.contextPath}/product/product_detail?category_num=14">모자</a>
					</figcaption>
				</figure>
				<figure>
					<a href="${pageContext.request.contextPath}/product/product_detail?category_num=15">
						<img src="${pageContext.request.contextPath}/resources/images/product_illustration/gloves.png" alt="">
					</a>
					<figcaption>
						<a href="${pageContext.request.contextPath}/product/product_detail?category_num=15">장갑</a>
					</figcaption>
				</figure>
				
			</div>
		</div>

		<div class="gallery-title">
			<h3><a>&gt;&gt; 의류(여성)</a></h3>
			<div id="gallery">
				<figure>
					<a href="${pageContext.request.contextPath}/product/product_detail?category_num=16">
						<img src="${pageContext.request.contextPath}/resources/images/product_illustration/jumper.png" alt="">
					</a>
					<figcaption>
						<a href="${pageContext.request.contextPath}/product/product_detail?category_num=16">자켓 / 점퍼 / 코트</a>
					</figcaption>
				</figure>
				<figure>
					<a href="${pageContext.request.contextPath}/product/product_detail?category_num=17">
						<img src="${pageContext.request.contextPath}/resources/images/product_illustration/vest.png" alt="">
					</a>
					<figcaption>
						<a href="${pageContext.request.contextPath}/product/product_detail?category_num=17">조끼</a>
					</figcaption>
				</figure>
				<figure>
					<a href="${pageContext.request.contextPath}/product/product_detail?category_num=18">
						<img src="${pageContext.request.contextPath}/resources/images/product_illustration/tshirt.png" alt="">
					</a>
					<figcaption>
						<a href="${pageContext.request.contextPath}/product/product_detail?category_num=18">티셔츠</a>
					</figcaption>
				</figure>
				<figure>
					<a href="${pageContext.request.contextPath}/product/product_detail?category_num=19">
						<img src="${pageContext.request.contextPath}/resources/images/product_illustration/hat.png" alt="">
					</a>
					<figcaption>
						<a href="${pageContext.request.contextPath}/product/product_detail?category_num=19">모자</a>
					</figcaption>
				</figure>
				<figure>
					<a href="${pageContext.request.contextPath}/product/product_detail?category_num=20">
						<img src="${pageContext.request.contextPath}/resources/images/product_illustration/gloves.png" alt="">
					</a>
					<figcaption>
						<a href="${pageContext.request.contextPath}/product/product_detail?category_num=20">장갑</a>
					</figcaption>
				</figure>
			</div>
		</div>

		<div class="gallery-title">
			<h3><a>&gt;&gt; 가방</a></h3>
			<div id="gallery">
				<figure>
					<a href="${pageContext.request.contextPath}/product/product_detail?category_num=24">
						<img src="${pageContext.request.contextPath}/resources/images/product_illustration/bag.png" alt="">
					</a>
					<figcaption>
						<a href="${pageContext.request.contextPath}/product/product_detail?category_num=24">등산용 가방</a>
					</figcaption>
				</figure>
				<figure>
					<a href="${pageContext.request.contextPath}/product/product_detail?category_num=25">
						<img src="${pageContext.request.contextPath}/resources/images/product_illustration/waterproof.png" alt="">
					</a>
					<figcaption>
						<a href="${pageContext.request.contextPath}/product/product_detail?category_num=25">방수커버</a>
					</figcaption>
				</figure>
				<figure>
					<a href="${pageContext.request.contextPath}/product/product_detail?category_num=26">
						<img src="${pageContext.request.contextPath}/resources/images/product_illustration/guitar.png" alt="">
					</a>
					<figcaption>
						<a href="${pageContext.request.contextPath}/product/product_detail?category_num=26">기타</a>
					</figcaption>
				</figure>
			</div>
		</div>

		<div class="gallery-title">
			<h3><a>&gt;&gt; 보호장비</a></h3>
			<div id="gallery">
				<figure>
					<a href="${pageContext.request.contextPath}/product/product_detail?category_num=27">
						<img src="${pageContext.request.contextPath}/resources/images/product_illustration/stick.png" alt="">
					</a>
					<figcaption>
						<a href="${pageContext.request.contextPath}/product/product_detail?category_num=27">등산스틱</a>
					</figcaption>
				</figure>
				<figure>
					<a href="${pageContext.request.contextPath}/product/product_detail?category_num=28">
						<img src="${pageContext.request.contextPath}/resources/images/product_illustration/lighting.png" alt="">
					</a>
					<figcaption>
						<a href="${pageContext.request.contextPath}/product/product_detail?category_num=28">조명기구</a>
					</figcaption>
				</figure>
				<figure>
					<a href="${pageContext.request.contextPath}/product/product_detail?category_num=29">
						<img src="${pageContext.request.contextPath}/resources/images/product_illustration/knee.png" alt="">
					</a>
					<figcaption>
						<a href="${pageContext.request.contextPath}/product/product_detail?category_num=29">무릎 보호대</a>
					</figcaption>
				</figure>
				<figure>
					<a href="${pageContext.request.contextPath}/product/product_detail?category_num=30">
						<img src="${pageContext.request.contextPath}/resources/images/product_illustration/sunglasses.png" alt="">
					</a>
					<figcaption>
						<a href="${pageContext.request.contextPath}/product/product_detail?category_num=30">선글라스</a>
					</figcaption>
				</figure>
				<figure>
					<a href="${pageContext.request.contextPath}/product/product_detail?category_num=31">
						<img src="${pageContext.request.contextPath}/resources/images/product_illustration/medicines.png" alt="">
					</a>
					<figcaption>
						<a href="${pageContext.request.contextPath}/product/product_detail?category_num=31">의약품</a>
					</figcaption>
				</figure>
				<figure>
					<a href="${pageContext.request.contextPath}/product/product_detail?category_num=32">
						<img src="${pageContext.request.contextPath}/resources/images/product_illustration/cold_weather_items.png" alt="">
					</a>
					<figcaption>
						<a href="${pageContext.request.contextPath}/product/product_detail?category_num=32">방한용품</a>
					</figcaption>
				</figure>
			</div>
		</div>


	</div>
</section>
