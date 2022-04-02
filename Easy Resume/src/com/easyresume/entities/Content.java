package com.easyresume.entities;
import java.sql.*;

public class Content {
	private int resume_id;
	private int user_id;
	private String resume_type;
	private Timestamp date_time;
	private String heading;
	private String sub_heading;
	private String introduction;
	private String contact;
	private String experience;
	private String skill;
	private String education;
	private String award;
	
	public Content(){
	 
 }

	public Content(int resume_id, int user_id, String resume_type, Timestamp date_time, String heading,
			String sub_heading, String introduction, String contact, String experience, String skill, String education,
			String award) {
		super();
		this.resume_id = resume_id;
		this.user_id = user_id;
		this.resume_type = resume_type;
		this.date_time = date_time;
		this.heading = heading;
		this.sub_heading = sub_heading;
		this.introduction = introduction;
		this.contact = contact;
		this.experience = experience;
		this.skill = skill;
		this.education = education;
		this.award = award;
	}

	public int getResume_id() {
		return resume_id;
	}

	public void setResume_id(int resume_id) {
		this.resume_id = resume_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getResume_type() {
		return resume_type;
	}

	public void setResume_type(String resume_type) {
		this.resume_type = resume_type;
	}

	public Timestamp getDate_time() {
		return date_time;
	}

	public void setDate_time(Timestamp date_time) {
		this.date_time = date_time;
	}

	public String getHeading() {
		return heading;
	}

	public void setHeading(String heading) {
		this.heading = heading;
	}

	public String getSub_heading() {
		return sub_heading;
	}

	public void setSub_heading(String sub_heading) {
		this.sub_heading = sub_heading;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getAward() {
		return award;
	}

	public void setAward(String award) {
		this.award = award;
	}
	
}
 