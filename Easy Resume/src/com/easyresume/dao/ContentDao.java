package com.easyresume.dao;
import java.sql.*;

import com.easyresume.entities.Content;
import com.easyresume.entities.Users;
public class ContentDao {

	Connection con;

	public ContentDao(Connection con) {
		super();
		this.con = con;
	}
	
	
	 public boolean saveContent(Content c) {
	        boolean f = false;
	        try {

	            String q = "insert into resume_content( id , resume_type , heading , sub_heading , introduction ,  contact , experience , skill , education , award ) values(?,?,?,?,?,?,?,?,?,?)";
	            PreparedStatement pstmt = con.prepareStatement(q);
	            pstmt.setInt(1, c.getUser_id());
	            pstmt.setString(2, c.getResume_type());
	            pstmt.setString(3, c.getHeading());
	            pstmt.setString(4, c.getSub_heading());
	            pstmt.setString(5, c.getIntroduction());
	            pstmt.setString(6, c.getContact());
	            pstmt.setString(7, c.getExperience());
	            pstmt.setString(8, c.getSkill());
	            pstmt.setString(9, c.getEducation());
	            pstmt.setString(10, c.getAward());
	            
	            
	            pstmt.executeUpdate();
	            f = true;

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return f;
	    }
	 
	 public int getChronologicalCount() {
	    	int ChronologicalCount= 0;
	    	try {
	    		String q="select  count(*) from resume_content where resume_type = 'chronological'";
	    		PreparedStatement p=this.con.prepareStatement(q);
	    		
				ResultSet set=p.executeQuery();
				
				if(set.next()) {
					ChronologicalCount=set.getInt("count(*)");
				}
	    		
	    		
	    		
	    	}
	    	catch (Exception e) {
	    		e.printStackTrace();
	    	}
	    	return ChronologicalCount;
	    }
	 public int getFunctionalCount() {
	    	int FunctionalCount= 0;
	    	try {
	    		String q="select  count(*) from resume_content where resume_type = 'Functional'";
	    		PreparedStatement p=this.con.prepareStatement(q);
	    		
				ResultSet set=p.executeQuery();
				
				if(set.next()) {
					FunctionalCount=set.getInt("count(*)");
				}
	    		
	    		
	    		
	    	}
	    	catch (Exception e) {
	    		e.printStackTrace();
	    	}
	    	return FunctionalCount;
	    }
	 public int getCombinationCount() {
	    	int CombinationCount= 0;
	    	try {
	    		String q="select  count(*) from resume_content where resume_type = 'Combination'";
	    		PreparedStatement p=this.con.prepareStatement(q);
	    		
				ResultSet set=p.executeQuery();
				
				if(set.next()) {
					CombinationCount=set.getInt("count(*)");
				}
	    		
	    		
	    		
	    	}
	    	catch (Exception e) {
	    		e.printStackTrace();
	    	}
	    	return CombinationCount;
	    }
		
	
	//get content by userid and resumeType:
	    public Content getContentByIdAndResumeType(int id, String ResumeType) {
	        Content content = null;

	        try {

	            String query = "select * from resume_content where id = ? and resume_type= ? ";
	            PreparedStatement pstmt = con.prepareStatement(query);
	            pstmt.setInt(1, id);
	            pstmt.setString(2, ResumeType);

	            ResultSet set = pstmt.executeQuery();

	            if (set.next()) {
	                content = new Content();

//	             data from db
	            
//	             set to user object
	                content.setHeading(set.getString("heading"));
	                content.setSub_heading(set.getString("sub_heading"));
	                content.setIntroduction(set.getString("introduction"));
	                content.setContact(set.getString("contact"));
	                content.setExperience(set.getString("experience"));
	                content.setSkill(set.getString("skill"));
	                content.setEducation(set.getString("education"));
	                content.setAward(set.getString("award"));
	                
	              
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return content;
	    }
	 
	 
	 
}
