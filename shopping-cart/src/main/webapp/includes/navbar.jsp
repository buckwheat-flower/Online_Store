<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
<div class="container">
  <a class="navbar-brand" href="index.jsp">Joyful 쇼핑몰</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">메인메뉴</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="cart.jsp">장바구니<span class="badge badge-danger px-1"  style="font-size:90%">${cart_list.size()}</span></a>
      </li>
      <% 
      if(auth != null) {%>
    	  <li class="nav-item">
          <a class="nav-link" href="orders.jsp">주문</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="log-out">로그아웃</a>
        </li>
      <%}else{%>
    	  <li class="nav-item">
          <a class="nav-link" href="login.jsp">로그인</a>
        </li>
     <% }
      %>
<!--       <li class="nav-item dropdown"> -->
<!--         <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
<!--           Dropdown -->
<!--         </a> -->
<!--         <div class="dropdown-menu" aria-labelledby="navbarDropdown"> -->
<!--           <a class="dropdown-item" href="#">Action</a> -->
<!--           <a class="dropdown-item" href="#">Another action</a> -->
<!--           <div class="dropdown-divider"></div> -->
<!--           <a class="dropdown-item" href="#">Something else here</a> -->
<!--         </div> -->
<!--       </li> -->
      
      
    </ul>
  </div>
  </div>
</nav>