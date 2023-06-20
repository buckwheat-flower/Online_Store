package sql.servlet;
import sql.model.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class AddtoCartServlet
 */
@WebServlet("/add-to-cart")
public class AddtoCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try(PrintWriter out = response.getWriter()){
			ArrayList<Cart> cartList= new ArrayList<>();
			
			int id = Integer.parseInt(request.getParameter("id"));
			Cart cart = new Cart();
			cart.setId(id);
			cart.setQuantity(1);
			
			HttpSession session = request.getSession();
			ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
			
			if(cart_list == null) {
				cartList.add(cart);
				session.setAttribute("cart-list", cartList);
				response.sendRedirect("index.jsp");
			}else {
				cartList = cart_list;
				boolean exist = false;
				
				
				for(Cart c:cart_list) {
					if(c.getId() == id) {
						exist = true;
						out.println("<h3 style='color:crimson; text-align:center'>이미 장바구니에 담겨있습니다<a href='cart.jsp'>장바구니로 가기</a></h3>");
					}
				}
					
					if(!exist) {
						cartList.add(cart);
						response.sendRedirect("index.jsp");
					}
				}
		}
		
	}

}
