package com.easyresume.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.easyresume.dao.UsersDao;
import com.easyresume.entities.Message1;
import com.easyresume.entities.Users;
import com.easyresume.helper.ConnectionProvider;
import com.mysql.cj.protocol.Message;
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		
		        response.setContentType("text/html;charset=UTF-8");
		        try (PrintWriter out = response.getWriter()) {
		            /* TODO output your page here. You may use following sample code. */
		            out.println("<!DOCTYPE html>");
		            out.println("<html>");
		            out.println("<head>");
		            out.println("<title>Servlet LoginServlet</title>");
		            out.println("</head>");
		            out.println("<body>");
//		          login 
//		            fetch username and password from request
		            String userEmail = request.getParameter("email");
		            String userPassword = request.getParameter("password");

		            UsersDao dao = new UsersDao(ConnectionProvider.getConnection());

		            Users u = dao.getUserByEmailAndPassword(userEmail, userPassword);

		            if (u == null) {
		                //login.................
//		                error//
		                // out.println("Invalid Details..try again");
		            	Message1 msg = new Message1("Invalid Details! try with another", "error", "red");
		                HttpSession s = request.getSession();
		                s.setAttribute("msg", msg);

		                response.sendRedirect("login_register.jsp");
		            } else {
		                //......
//		                login success
		                HttpSession s = request.getSession();
		                s.setAttribute("currentUser", u);
		                response.sendRedirect("index.jsp");

		            }

		            out.println("</body>");
		            out.println("</html>");
		        }
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
