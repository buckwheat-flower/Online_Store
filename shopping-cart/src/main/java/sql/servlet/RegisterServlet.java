package sql.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sql.connection.DbCon;
import sql.dao.UserDao;
import sql.model.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.sendRedirect("register.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter()){
			String name = request.getParameter("register-name");
			String email = request.getParameter("register-email");
			String password = request.getParameter("register-password");
			
			try {
				UserDao udao = new UserDao(DbCon.getConnection());
				User user = udao.userRegister(name, email, password);
				response.sendRedirect("login.jsp");
				
				if(user != null) {
					
				}
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			
			
		}
	}

}
