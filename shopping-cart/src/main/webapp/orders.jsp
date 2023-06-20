<%@page import="sql.connection.*"%>
<%@page import="sql.model.*"%>
<%@page import="sql.servlet.*"%>
<%@page import="sql.dao.*"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    User auth = (User) request.getSession().getAttribute("auth");
    List<Order> orders = null;
    if(auth!=null){
    	request.setAttribute("auth", auth);
    	orders = new OrderDao(DbCon.getConnection()).userOrders(auth.getId());
    }else{
    	response.sendRedirect("login.jsp");
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if(cart_list != null){
    	request.setAttribute("cart_list", cart_list);
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<title>주문페이지</title>
<%@include file="includes/head.jsp" %>
</head>
<body>
<%@include file="includes/navbar.jsp" %>
<div class="container">
		<div class="card-header my-3">All Orders</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">주문 날짜</th>
					<th scope="col">상품 이름</th>
					<th scope="col">카테고리</th>
					<th scope="col">갯수</th>
					<th scope="col">가격</th>
					<th scope="col">취소</th>
				</tr>
			</thead>
			<tbody>
			
			<%
			if(orders != null){
				for(Order o:orders){%>
					<tr>
						<td><%=o.getDate() %></td>
						<td><%=o.getName() %></td>
						<td><%=o.getCategory() %></td>
						<td><%=o.getQuantity() %></td>
						<td><%=o.getPrice() %></td>
						<td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId()%>">주문 취소</a></td>
					</tr>
				<%}
			}
			%>
			
			</tbody>
		</table>
	</div>


<%@include file="includes/footer.jsp" %>
</body>
</html>