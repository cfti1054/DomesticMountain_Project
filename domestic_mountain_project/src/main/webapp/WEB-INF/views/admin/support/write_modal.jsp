<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<%-- <link href="${pageContext.request.contextPath}/resources/admin/static/css/styles.css" rel="stylesheet" /> --%>
</head>
<body>
<c:set var="" />
<!-- histoty Modal-->
<div class="modal-header">
    <h5 class="modal-title" id="historyModalLabel">ID - Modal</h5>
    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">×</span>
    </button>
</div>
<div class="modal-body">
    <div class="table-responsive">
        <div class="container">
        </div>
        <table class="table table-hover">
            <thead class="text-center">
            <tr class="content">
                <th class="text-center">
                    ID
                </th>
                <th class="text-center">
                    PassWord
                </th>
            </tr>
            </thead>
            <tbody class="text-center">
            <%-- <c:forEach items="${Moa}" var="Moa"> --%>
                <tr class="content" style="font-size: 12px;">
                    <td class="text-center">아이디</td>
                    <td class="text-center">패스워드</td>
                </tr>
            <%-- </c:forEach> --%>
            </tbody>
        </table>
    </div>

</div>
<div class="modal-footer">
    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
</div>
</body>
</html>	