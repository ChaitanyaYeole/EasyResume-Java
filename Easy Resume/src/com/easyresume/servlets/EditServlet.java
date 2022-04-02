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

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");

//            fetch all data
            String userName = request.getParameter("user_name");
            String userPassword = request.getParameter("user_password");
            

            //get the user from the session...
            HttpSession s = request.getSession();
            Users user = (Users) s.getAttribute("currentUser");
            user.setName(userName);
            user.setPassword(userPassword);
            

            //update database....
            UsersDao userDao = new UsersDao(ConnectionProvider.getConnection());

            boolean ans = userDao.updateUser(user);
            if (ans) {

               
                    out.println("Profile updated...");
                    Message1 msg = new Message1("Profile details Edited.", "success", "green");
                    s.setAttribute("msg", msg);

                
            } else {
                out.println("not updated..");
                Message1 msg = new Message1("Something went wrong..", "error", "green");
                s.setAttribute("msg", msg);

            }

            response.sendRedirect("index.jsp");

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
