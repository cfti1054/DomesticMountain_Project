<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
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
	margin: 20px 0 60px 0;
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

#gallery .gallery-box {
	position: relative;
	display: inline-block;
	margin: 14px;
	border-radius: 5px;
	box-shadow: 0 7px 8px rgba(0, 0, 0, 0.4);
	width: 280px;
	height: 420px;
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
#gallery .gallery-box:hover{
	scale: 1.05;
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
	padding: 2px;
	
	width: 100%;
	height: 80px;
}

.price{
	width: 100%;
    text-align: left;
    padding-left: 10px;
}
.star {
	width: 15px;
	height: 15px;
	margin-right: 10px;
}

.review {
	text-align: left;
	display: flex;
	align-items: center; /* 수직 가운데 정렬 */
	padding-left: 10px;
}

.review p {
	margin-bottom: 8px;
}

@media ( min-width : 800px) {
	#gallery {
		grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
	}
}
</style>
<script type="text/javascript">
	$(function() {
		$(".gallery-box").click(
				function() {
					let product_num = $(this).attr("data-productNum");
					let url = "${pageContext.request.contextPath}/product/"+ product_num;
					location.href = url;
				});
	});
</script>
<!-- ================== body ================== -->
<section class="features-1">
	<div class="body-container">
	
		<div class="amain">
			<h1 class="amain-main">
				<a>${vo.category_name}<span>| DM Store</span></a> <span><a href="/plus/">home</a>
					&gt; DM Store &gt; ${vo.category_name}</span>
			</h1>
		</div>

		<div class="gallery-main">
			
			<div id="gallery">
				<c:forEach var="dto" items="${list}" varStatus="status">
					<div class="gallery-box" data-productNum="${dto.product_num}" >
						<figure>
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
	
	
							<figcaption>
								<span>${dto.product_name}</span>
							</figcaption>
							
							<c:set var="formattedPrice" value="${dto.product_price}" />
							<fmt:formatNumber value="${formattedPrice}" pattern="#,###" var="formattedPriceWithComma" />
	
	
							<div class="price">${formattedPriceWithComma}</div>
	
							<div class="review">
								<img class="star" src="${pageContext.request.contextPath}/resources/images/product/star.png">
									<p>${dto.review_star}&nbsp;&nbsp;&nbsp;  리뷰&nbsp; &nbsp;${dto.review_count}</p>
							</div>
	
						</figure>
					</div>
				</c:forEach>

			</div>
		</div>

	</div>
</section>