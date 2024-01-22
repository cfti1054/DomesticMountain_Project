<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.features-1 {
	height: auto; /* 수정 시 auto로 바꾸고 해야함 */
}
.p-4 {
    margin: 120px 0;
    border-color: hsl(230, 100%, 97%) !important;
    
    background-color: var(--container-color);
    border-radius: 0.8rem;
    box-shadow: 0 8px 32px hsla(230, 75%, 15%, .2);
}

</style>

<div class="features-1">
	<div class="body-container">	

        <div class="row justify-content-md-center mt-5">
            <div class="col-md-8">
                <div class="border border-primary p-4">
                       <h4 class="text-center fw-bold">${title}</h4>
                       <hr class="mt-4">
                       
	                <div class="d-grid p-3">
						<p class="text-center">${message}</p>
	                </div>
                       
                       <div class="d-grid">
                           <button type="button" class="btn btn-lg btn-primary" onclick="location.href='${pageContext.request.contextPath}/';">메인화면 <i class="bi bi-check2"></i> </button>
                       </div>
                </div>

            </div>
        </div>
	        
	</div>
</div>