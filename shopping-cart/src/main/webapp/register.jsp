<%@page import="sql.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("euc-kr"); %>
	
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	response.sendRedirect("index.jsp");
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<title>쇼핑몰 회원가입</title>
<%@include file="includes/head.jsp"%>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">회원가입</div>
			<div class="card-body">
				<form action="register" method="post">
					<div class="form-group">
						<label>이름</label> <input type="text" class="form-control"
							name="register-name" placeholder="이름을 입력해주세요" required>
					</div>
					<div class="form-group">
						<label>이메일 주소</label> <input type="email" class="form-control"
							name="register-email" placeholder="이메일을 입력해주세요" required>
					</div>
					<div class="form-group">
						<label>비밀번호</label> <input type="password" class="form-control"
							name="register-password" placeholder="******" required>
					</div>

					<div class="text-center">
						<button type="submit" class="btn btn-primary">회원가입</button>
					</div>
					
				</form>
			</div>
		</div>
	</div>
	<%@include file="includes/footer.jsp"%>
</body>
</html>