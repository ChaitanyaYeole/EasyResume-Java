package com.easyresume.servlets;

import java.io.IOException; 
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.easyresume.dao.UsersDao;
import com.easyresume.entities.Users;
import com.easyresume.helper.ConnectionProvider;

/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/SignupServlet")
@MultipartConfig
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */PrintWriter out;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

		String name = request.getParameter("user_name");
		String email = request.getParameter("user_email");
		String password = request.getParameter("user_pass");
		//create user object and set all data to the object..
		Users user=new Users(name,email,password);
		
		
		
		//create users dao object
		UsersDao dao= new UsersDao(ConnectionProvider.getConnection());
		if(dao.saveUser(user)) {
			//save
			response.getWriter().append("done");
		
		}else {
			response.getWriter().append("Email already exist, Try to sign in.");
			
		}
		
	}

}
