<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.features-1 {
	height: auto; /* 수정 시 auto로 바꾸고 해야함 */
}

.body-container {
	margin: 30px auto;
    max-width: 1600px;
    padding-top: 120px;
    padding-bottom: 150px;
    
}

.product-item {
  position: relative;
  padding: 16px;
  background: #FFFFFF;
  border: 1px solid #FBFBFB;
  box-shadow: 0px 5px 22px rgba(0, 0, 0, 0.04);
  border-radius: 16px;
  margin-bottom: 30px;
  transition: box-shadow 0.3s ease-out;
}
.product-item:hover {
  box-shadow: 0px 21px 44px rgba(0, 0, 0, 0.08);
}
.product-item h3 {
  display: block;
  width: 100%;
  font-weight: 600;
  font-size: 18px;
  line-height: 25px;
  text-transform: capitalize;
  color: #333333;
  margin: 0;
}
.product-item figure {
  background: #F9F9F9;
  border-radius: 12px;
  text-align: center;
}
.product-item figure img {
  max-height: 210px;
  height: auto;
}
.product-item .btn-wishlist {
  position: absolute;
  top: 20px;
  right: 20px;
  width: 50px;
  height: 50px;
  border-radius: 50px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: #fff;
  border: 1px solid #d8d8d8;
  transition: all 0.3s ease-out;
}
.product-item .btn-wishlist:hover {
  background: rgb(240, 56, 56);
  color: #fff;
}
.product-item .qty {
  font-weight: 400;
  font-size: 13px;
  line-height: 18px;
  letter-spacing: 0.02em;
  text-transform: uppercase;
  color: #9D9D9D;
}
.product-item .rating {
  font-weight: 600;
  font-size: 13px;
  line-height: 18px;
  text-transform: capitalize;
  color: #222222;
}
.product-item .rating iconify-icon {
  color: #FFC43F;
}
.product-item .price {
  display: block;
  width: 100%;
  font-weight: 600;
  font-size: 22px;
  line-height: 30px;
  text-transform: capitalize;
  color: #222222;
}
.product-item .product-qty {
  width: 85px;
}
.product-item .btn-link {
  text-decoration: none;
}
.product-item #quantity {
  height: auto;
  width: 28px;
  text-align: center;
  border: none;
  margin: 0;
  padding: 0;
}
.product-item .btn-number {
  width: 26px;
  height: 26px;
  line-height: 1;
  text-align: center;
  background: #FFFFFF;
  border: 1px solid #E2E2E2;
  border-radius: 6px;
  color: #222;
  padding: 0;
}

</style>

<script type="text/javascript">
function deleteZzimSelect() {
	// 선택된 항목 삭제
	let cnt = $("form input[name=nums]:checked").length;
    if (cnt === 0) {
		alert("삭제할 상품을 선택해주세요. ");
		return;
    }
    
	if(! confirm('선택한 상품을 찜목록에서 비우시겠습니까 ? ')) {
		return;
	}
	
	const f = document.zzimForm;
	f.action = "${pageContext.request.contextPath}/mypage/deleteListZzim";
	f.submit();
}


</script>

<section class="features-1">
	<div class="body-container">	
		
		<div class="body-main">


      <div class="container-fluid">
        
        <div class="row">
          <div class="col-md-12">

            <div class="bootstrap-tabs product-tabs">
              <div class="tabs-header d-flex justify-content-between border-bottom my-5">
              	<c:choose>
                	<c:when test="${list.size() > 0}">
              			<h3 style="font-weight: bold;">${list[0].user_name}님 찜목록</h3>
                    </c:when>
            	</c:choose>
			<button type="button" class="delete-button btn zzim-deleteCheck" onclick="deleteZzimSelect();">선택 삭제</button>	
              </div>
				
              <form name="zzimForm" method="post">
              <table class="tab-content" id="nav-tabContent">
              <tbody>

                  <div class="product-grid row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-5">
		           	  <c:forEach var="dto" items="${list}">

                    <div class="col">
                      <div class="product-item">
                        <figure>
						<input type="hidden" name="product_nums" value="${dto.product_num}">
						<input type="hidden" name="useridx" value="${dto.useridx}">
                          <a href="#" class="btn-wishlist"><i class="bi bi-heart" style="width: px; height: 24px;"></i></a>
                          <a href="${pageContext.request.contextPath}/product/${dto.product_num}">
                            <img src="${pageContext.request.contextPath}/resources/images/product/${dto.product_summary}" class="tab-image">
                          </a>
                        </figure>
                        <h3>${dto.product_name}</h3>
                    	<hr>
                        <span class="price">${dto.product_price}원</span>
                        <div class="d-flex align-items-center justify-content-between">

                          	<a href="#" class="nav-link">Add to Cart <iconify-icon icon="uil:shopping-cart"></a>
                        	<input class="checkbox" name="nums" type="checkbox" value="${dto.product_num}" style="zoom:2.0;">
                        </div>
                      </div>
                    </div>

				</c:forEach>
                  </div>

				</tbody>
                  </table>
                  </form>
                  
				<c:choose>
					<c:when test="${list.size() == 0}">
						<div class="mt-3 p-3 text-center" style="font-weight: bold; font-size: x-large;">
							찜목록이 없습니다.
						</div>
					</c:when>
					<c:otherwise>
						<div class="mt-3 p-3 text-end">
							<input type="hidden" name="mode" value="zzim">
						</div>
					</c:otherwise>
				</c:choose>  

                  </div>
				
                  
                </div>
                
              </div>
            </div>

          </div>
        </div>

</section>