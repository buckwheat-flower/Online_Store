<%@page import="java.util.*"%>
<%@page import="sql.dao.*"%>
<%@page import="sql.connection.*"%>
<%@page import="sql.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if(cart_list != null){
	ProductDao pDao = new ProductDao(DbCon.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	int total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("cart_list", cart_list);
	request.setAttribute("total",total);
}
%>
<!DOCTYPE html>
<html>
<head>
<title>장바구니</title>
<%@include file="includes/head.jsp"%>
<style type="text/css">
.table tbody td {
	vertical-align: middle;
}

.btn-incre, .btn-decre {
	box-shadow: none;
	font-size
	=90%
}
</style>

</head>
<body>
	<%@include file="includes/navbar.jsp"%>

	<div class="container">
		<div class="d-flex py-3">
			<h3>총 결제금액: ${ (total>0)?total:0 }원</h3>
			<a class="mx-3 btn btn-primary" href="check-out">결제하기</a>
		</div>
		<table class="table table-right">
			<thead>
				<tr>
					<th scope="col">이름</th>
					<th scope="col">카테고리</th>
					<th scope="col">가격</th>
					<th scope="col">갯수</th>
					<th scope="col">취소</th>
				</tr>
			</thead>
			<tbody>
			<%
			if(cart_list !=null){
			for(Cart c:cartProduct){%>
				<tr>
				<td><%= c.getName() %></td>
				<td><%= c.getCategory() %></td>
				<td><%= c.getPrice() %>원</td>
				<td>
					<form action="order-now" method="post" class="form-inline">
						<input type="hidden" name="id" value="<%= c.getId() %>" class="form-input">
						<div class="form-group d-flex justify-content-between w-50">
							<a class="btn btn-sm btn-incre" href="quantity-inc-dec?action=dec&id=<%= c.getId()%>"><i
								class="fas fa-minus-square"></i></a> <input type="text"
								name="quantity" class="form-control w-50" value="<%= c.getQuantity() %>" readonly>
							<a class="btn btn-sm btn-incre" href="quantity-inc-dec?action=inc&id=<%= c.getId()%>"><i
								class="fas fa-plus-square"></i></a>
						</div>
						<button type="submit" class="btn btn-primary btn-sm">구매</button>
					</form>
				</td>
				<td><a class="btn btn-sm btn-danger" href="remove-from-cart?id=<%= c.getId()%>">제거</a></td>
			</tr>
			<%}
			}%>
				
			</tbody>
		</table>
	</div>
	<%@include file="includes/footer.jsp"%>
</body>
</html>