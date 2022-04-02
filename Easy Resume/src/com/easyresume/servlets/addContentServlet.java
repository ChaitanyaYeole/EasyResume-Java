package com.easyresume.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.easyresume.dao.ContentDao;
import com.easyresume.entities.Content;
import com.easyresume.entities.Users;
import com.easyresume.helper.ConnectionProvider;

/**
 * Servlet implementation class addContentServlet
 */
@WebServlet("/addContentServlet")
@MultipartConfig
public class addContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addContentServlet() {
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
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		 try (PrintWriter out = response.getWriter()) {
	            /* TODO output your page here. You may use following sample code. */

			 	String resumeType = request.getParameter("resumeType");
			 	String heading = request.getParameter("heading");
				String subHeading = request.getParameter("subHeading");
				String introduction = request.getParameter("introduction");
				String contact = request.getParameter("contact");
				String experience = request.getParameter("experience");
				String skill = request.getParameter("skill");
				String education = request.getParameter("education");
				String award = request.getParameter("award");
				
				/*
				 * out.println(resumeType); out.println(heading); out.println(subHeading);
				 * out.println(introduction); out.println(contact); out.println(experience);
				 * out.println(skill); out.println(education); out.println(award);
				 */
				
//	            getting currentuser id
	            HttpSession session = request.getSession();
	            Users user = (Users) session.getAttribute("currentUser");
	            
	            
				/* out.println(user.getId()); */
	            
	            
	            Content c = new Content(0, user.getId(),  resumeType, null, heading,
	        			subHeading, introduction, contact, experience, skill, education,
	        			award);
	            ContentDao dao = new ContentDao(ConnectionProvider.getConnection());
	            if (dao.saveContent(c)) {
	            	
	                out.println("done");
	                
	            } else {
	            	
	                out.println("error");
	                
	            }

	        }
		
		
		
		
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
	}

}
