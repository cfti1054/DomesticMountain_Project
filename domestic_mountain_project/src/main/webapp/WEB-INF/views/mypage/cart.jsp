<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.features-1 {
	height: auto; /* 수정 시 auto로 바꾸고 해야함 */

}

.body-container {
	margin: 30px auto;
    max-width: 1800px;
    padding-top: 120px;
}


</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css" type="text/css">

<section class="features-1">
	<div class="body-container">	
		<div class="body-title">
			
		</div>
		
		<div class="body-main">
		<div class="root">

      <section class="cart-section">
        <header class="flex-col-center mt-20">
          <h2 class="cart-section__title" style="padding-bottom: 5px;">장바구니</h2>

		<div class="xans-element- xans-order xans-order-basketpackage "><p class="orderStep"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/img_order_step1.gif" alt="01 장바구니"/></p></div>
		<div class="xans-element- xans-order xans-order-tabinfo ec-base-tab typeLight  "></div>
          <hr class="divide-line mt-20" />
        </header>


       <form name="cartForm" method="post">
        <div class="flex">
          <section class="cart-left-section">
            <div class="flex justify-between items-center">
              <div class="checkbox-container">
                <input
                  class="checkbox cart-chkAll"
                  name="chkAll"
                  type="checkbox"
                />
                <label class="checkbox-label" for="checkbox">모두&nbsp;선택/해제</label>
              </div>
              
              <button type="button" class="delete-button btn cart-deleteCheck" onclick="deleteCartSelect();">상품삭제</button>
              
            </div>
            
            <h3 class="cart-title">배송 상품(개)</h3>
            <hr class="divide-line-gray mt-10" />
            
            
			<table class="table cart-list">
				<tbody>
				<c:forEach var="dto" items="${list}">
		            <tr class="cart-container">
		              <td class="flex gap-15 mt-10">
		                <input class="checkbox" name="nums" type="checkbox" value="${dto.detail_num2}">
		              </td>
		                <td class="w-144 h-144">
		                  <img class="border rounded" src="">
		               </td>
		                <td class="cart-name">
		                	<p>이름${dto.product_name}</p>
		                	<p>선택사항 : ${dto.option_value}, ${dto.option_value2}</p>
		         
							<input type="hidden" name="product_nums" value="${dto.product_num}">
							<input type="hidden" name="detail_nums" value="${dto.detail_num1}">
							<input type="hidden" name="detail_nums2" value="${dto.detail_num2}">		                	
		                </td>
		                <td class="number-input-container">
		                  <input type="text" name="buyQtys" class="number-input" value="${dto.qty}" readonly class="form-control">
		                  <div>
		                    <button class="number-input-button btnPlus">▲</button>
		                    <button class="number-input-button btnMinus">▼</button>
		                  </div>
		                </td>
		                <td class="cart-price">
		                	<label><fmt:formatNumber value=""/></label><label>원</label>
		                	<input type="hidden" name="prices" value="">
		                </td>
		            </tr>
				</c:forEach>
	            </tbody>
		
           </table>

          </section>
			   <section class="cart-right-section">
			            <div class="cart-right-section__top">
			              <h3 class="cart-title">결제예상금액</h3>
			            </div>
			            <hr class="divide-line-thin" />
			            <div class="cart-right-section__bottom">
			              <div class="flex justify-between p-20 mt-20">
			                <span class="highlight-text">결제예상금액</span>
			                <span class="highlight-text"></span>
			                <input type="hidden" name="total_amounts" value="">
			              </div>
			              <div class="flex-center mt-30 mx-10">
			                <button class="primary-button flex-center">
			                  주문하기(3개)
			                </button>
			              </div>
			            </div>
          			  </section>
        </div>
      </form>   
        
      </section>			
	</div>
			
			
		</div>
	</div>
</section>