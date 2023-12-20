﻿<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.features-1 {
	height: auto; /* 수정 시 auto로 바꾸고 해야함 */
	display: flex;
	justify-content: center;
}
.body-container {
	padding: 130px 0 60px 0;
	max-width: 800px;
}
.row {
	width:auto;
}

.justify-content-md-center {
    background-color: var(--container-color);
    padding: 2rem;
    border-radius: 0.8rem;
    box-shadow: 0 8px 32px hsla(230, 75%, 15%, .2);
}

.div-form {
	margin: 30px;
}
</style>

<div class="features-1">
	<div class="body-container">	

        <div class="row justify-content-md-center mt-5">
            <div class="">
                <div class="div-form">
                       <h4 class="text-center fw-bold">${title}</h4>
                       <hr class="mt-4">
                       
	                <div class="d-grid p-3">
						<p class="text-center">${message}</p>
	                </div>
                       
                       <div class="d-grid">
                           <button type="button" class="login__button" onclick="location.href='${pageContext.request.contextPath}/';">메인화면</button>
                       </div>
                </div>

            </div>
        </div>
	        
	</div>
</div>