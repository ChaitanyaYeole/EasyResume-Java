<%@page import="com.easyresume.helper.ConnectionProvider"%>
<%@page import="com.easyresume.entities.Message1"%>
<%@page import="com.easyresume.entities.Users"%>
<%@page import="com.easyresume.dao.UsersDao"%>
<%@page import="com.easyresume.dao.ContentDao"%>
<%@page errorPage="error_page.jsp" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Easy Resume</title>
<link rel="shortcut icon" href="img/ER_ico.png" type="image/x-icon"/>

<!-- css -->
<!-- bootstrap css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/aos.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<!-- page css -->
<link rel="stylesheet" type="text/css" href="css/index.css">

</head>
<body>
	<!-- ***** Preloader Start ***** -->
	<div id="preloader">
		<div class="jumper">
			<div></div>
			<div></div>
			<div></div>
		</div>
	</div>
	<!-- ***** Preloader End ***** -->

	<!-- Navigation -->
	<nav
		class="navbar fixed-top navbar-expand-lg navbar-light bg-light fixed-top">
		<div class="container">
			<a class="navbar-brand" href="index.jsp"><img
				src="img/easyresume.png" style="width: 200px; height: 40px;"></a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="#resume_tips">Resume
							tips</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownPortfolio" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> Resume Formats </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownPortfolio">

							<a class="dropdown-item" href="#chronological">Chronological
								resume</a> <a class="dropdown-item" href="#functional">Functional
								resume</a> <a class="dropdown-item" href="#combination">Combination
								resume</a>
						</div></li>

					<li class="nav-item"><a class="nav-link" href="#"
						onclick="document.getElementById('id01').style.display='block'">Create
							resume</a></li>
					<li class="nav-item">
						<%
						Users user = (Users) session.getAttribute("currentUser");
						if (user == null) {
						%> <a class="nav-link" href="login_register.jsp">Sign in</a> <%
 } else {
 %> <a class="nav-link" href="#!" data-toggle="modal"
						data-target="#profile-modal"> <span
							class="fa fa-user-circle "></span> <%=user.getName()%>
					</a> <%} %>

					</li>


				</ul>
			</div>
		</div>
	</nav>
	
	
	 <!--profile modal-->

	<%
						if (user == null) {
						
 } else {
 %>

	<!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header text-white text-center" style="background:#4481eb">
                        <h5 class="modal-title" id="exampleModalLabel"> EasyResume </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                        <div class="text-center">
                            <img src="img/profile.svg" class="img-fluid" style="border-radius:50%;max-width: 150px;;" >
                            <br>
                            <h5 class="modal-title mt-3" id="exampleModalLabel"> <%= user.getName()%> </h5>
                        </div>
                            <!--//details-->

                            <div id="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row"> ID :</th>
                                            <td> <%= user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row"> Email : </th>
                                            <td><%= user.getEmail()%></td>

                                        </tr>
                                        
                                           
                                        <tr>
                                            <th scope="row">Registered on :</th>
                                            <td><%= user.getSignup_date().toString()%></td>

                                        </tr>
                                        <td class="text-center" colspan="2"><a href="LogoutServlet" class="btn btn-danger my-2 my-sm-0  nav-btn" type="button">Logout</a></td>
                                        <tr>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!--profile edit-->

                            <div id="profile-edit" style="display: none;">
                                <h3 class="mt-2 text-center">Edit Carefully</h3>
                                <form action="EditServlet" method="post">
                                    <table class="table">
                                        <tr>
                                            <td>ID :</td>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Email :</td>
                                            <td><%= user.getEmail()%></td>
                                        </tr>
                                        <tr>
                                            <td>Name :</td>
                                            <td> <input type="text" class="form-control" name="user_name" value="<%= user.getName()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Password :</td>
                                            <td> <input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>" > </td>
                                        </tr>
                                       

                                    </table>

                                    <div class="text-center">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>

                                </form>    

                            </div>

                        </div>
                        
                    </div>
                    
                    <div class="modal-footer" style="background:#4481eb">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button  id="edit-profile-button" type="button" class="btn btn-primary">EDIT</button>
                    </div>
                </div>
            </div>
        </div>

	<%} %>
	
        <!--end of profile modal-->
     
     <%
            Message1 m = (Message1) session.getAttribute("msg");
            if (m != null) {
        %>
       
			<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
  </symbol>
</svg>
<div class="alert alert-success d-flex align-items-center fixed-bottom" role="alert">
  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
  <div style="margin-left: 10px;">
     <%= m.getContent()%>
  </div>
  <a type="button" class="close" href="index.jsp" style="position:absolute;right:0;padding:15px;">
                            <span aria-hidden="true">&times;</span>
                        </a>
</div>

        <%
                session.removeAttribute("msg");
            }
        %>
     
        
        
 



	<!-- HERO -->
	<section
		class="hero hero-bg d-flex justify-content-center align-items-center">
		<div class="container">
			<div class="row">

				<div
					class="col-lg-6 col-md-10 col-12 d-flex flex-column justify-content-center align-items-center">
					<div class="hero-text">

						<h1 class="text-white" data-aos="fade-up">Do you know?
							Easyresume makes you easy to build an effective resume in just
							few minutes.</h1>

						<a href="#"
							onclick="document.getElementById('id01').style.display='block'"
							class="custom-btn btn-bg btn mt-3" data-aos="fade-up"
							data-aos-delay="100">Create Resume</a>


					</div>
				</div>

				<div class="col-lg-6 col-12">
					<div class="hero-image" data-aos="fade-up" data-aos-delay="300">

						<img src="img/Hiring.svg" class="img-fluid" alt="easy resume">
					</div>
				</div>

			</div>
		</div>
	</section>

	<!-- choices section -->
	<div id="id01" class="tmodal">
		<span onclick="document.getElementById('id01').style.display='none'"
			class="tclose" title="Close Modal">x</span>
		<form class="tmodal-content animate" action="/Resume_builder.jsp">
			<div class="tcontainer">
				<h2 class="text-white" style="border-bottom: 3px solid var(--primary-color);">Which format do want to make Resume?</h2>
				<div class="card-deck">
					<div class="card">
						<img class="card-img-top" src="img/chro.jpg" alt="Card image cap">
						<div class="card-body">
							<h5 class="card-title">Chronological Resume</h5>

						</div>
						<div class="card-footer">
							<a href="Resume_builder.jsp" onclick="localStorage.setItem('resume_type','chronological');" class="btn btn-primary">This one</a> <a
								href="#chronological"
								onclick="document.getElementById('id01').style.display='none'"><i
								class="fa fa-info-circle"></i></a>
						</div>
					</div>
					<div class="card">
						<img class="card-img-top" src="img/func.jpg" alt="Card image cap">
						<div class="card-body">
							<h5 class="card-title">Functional Resume</h5>
						</div>
						<div class="card-footer">
							<a href="Resume_builder.jsp" onclick="localStorage.setItem('resume_type','functional');" class="btn btn-primary">This one</a> <a
								href="#functional"
								onclick="document.getElementById('id01').style.display='none'"><i
								class="fa fa-info-circle"></i></a>
						</div>
					</div>
					<div class="card">
						<img class="card-img-top" src="img/comb.jpg" alt="Card image cap">
						<div class="card-body">
							<h5 class="card-title">Combination Resume</h5>
						</div>
						<div class="card-footer">
							<a href="Resume_builder.jsp" onclick="localStorage.setItem('resume_type','combination');" class="btn btn-primary">This one</a> <a
								href="#combination"
								onclick="document.getElementById('id01').style.display='none'"><i
								class="fa fa-info-circle"></i></a>
						</div>
					</div>
					<div class="card">
						<img class="card-img-top" src="img/custom.jpg"
							alt="Card image cap">
						<div class="card-body">
							<h5 class="card-title">Custom Resume</h5>
						</div>
						<div class="card-footer">
							<a href="custom_designer.jsp" class="btn btn-primary">This one</a> <a
								href="#resume_tips"
								onclick="document.getElementById('id01').style.display='none'"><i
								class="fa fa-info-circle"></i></a>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>

	<!-- Features Section -->
	<section>
		<div class="container" data-aos="fade-up" data-aos-delay="100">
			<hr></hr>
			<div class="row">
				<div class="col-lg-6 blockquote">
					<h2>Why good resume important?</h2>

					<p>A good resume format will help you highlight your marketable
						traits and downplay your weaknesses. Choose the right one, and you
						immediately improve your chances of success on the job hunt.</p>

					<h2>The 3 best resume formats</h2>

					<p>These are the three most commonly used resume formats in
						2021:</p>
					<ul style="color: var(- -primary-color)">
						<li>Chronological (or "Reverse-Chronological")</li>
						<li>Functional</li>
						<li id="chronological">Combination (or "Hybrid")</li>
					</ul>

				</div>
				<div class="col-lg-6">
					<img class="img-fluid rounded" src="img/interview.svg"
						alt="Interview">
				</div>
			</div>
		</div>
	</section>

	<!-- Chronological Resume -->
	<section>
		<div class="container" data-aos="fade-up" data-aos-delay="300">
			<hr></hr>
			<div class="row">
				<div class="col-lg-12">
					<h2>1. Chronological (the standard resume format)</h2>

					<p>The chronological resume format is what the majority of
						people use to create their own resume.</p>

					<p>Chronological resumes begin with your contact details and
						resume introduction, but then immediately move into your most
						recent work experience. Because hiring managers care a lot about
						your work experience (if you have any), featuring this information
						near the top helps them evaluate your application quickly.</p>

					<p>The importance of professional experience for most jobs is
						why the chronological resume format is used by so many people.
						However, depending on your background and job experience, you may
						want to choose a different layout for your resume.</p>
					<div class="row">
						<div class="col-lg-6">
							<div class="card border-success mb-3" style="max-width: 100%;">
								<div class="card-header text-success">
									<h3>You should use a chronological format if...</h3>
								</div>
								<div class="card-body text-success blockquote">
									<ul>
										<li>You want to demonstrate vertical career progression.</li>
										<li>You want to apply to a job in a similar field.</li>
										<li>You don't have large work experience gaps.</li>
									</ul>
								</div>
								<a href="Resume_builder.jsp" onclick="localStorage.setItem('resume_type','chronological');" class="btn btn-outline-success">Create
									Chronological Resume</a>
							</div>
						</div>

						<div class="col-lg-6">
							<div class="card border-danger mb-3" style="max-width: 100%;">
								<div class="card-header text-danger">
									<h3>You shouldn't use a chronological format if...</h3>
								</div>
								<div class="card-body text-danger blockquote">
									<ul>
										<li>You have multiple gaps in your employment history.</li>
										<li>You are considering working in a new industry.</li>
										<li>You frequently change jobs.</li>
									</ul>
								</div>
								<button type="button" class="btn btn-outline-danger"
									id="functional" onclick="location.href='#functional';">Next
									format...</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Functional Resume -->
	<section>
		<div class="container" data-aos="fade-up" data-aos-delay="300">
			<hr></hr>
			<div class="row">
				<div class="col-lg-12">
					<h2>2. Functional (good for career changers)</h2>

					<p>The functional resume format focuses on your relevant job
						skills.</p>

					<p>Unlike a chronological resume, the functional format ignores
						when and where you learned your skills. Instead of focusing on
						your work history, functional resumes are used to list your
						strongest resume skills at the top.</p>

					<p>In a functional resume, including work experience bullet
						points is optional. You only need to write your company name,
						location, and job title for the previous positions you held.</p>
					<p>Because functional resumes focus on your skills, this is the
						ideal format if you have many job-related hard and soft skills.</p>

					<div class="row">
						<div class="col-lg-6">
							<div class="card border-success mb-3" style="max-width: 100%;">
								<div class="card-header text-success">
									<h3>You should use a functional resume format if...</h3>
								</div>
								<div class="card-body text-success blockquote">
									<ul>
										<li>You have unusually large gaps in your employment
											history.</li>
										<li>You are in the midst of a big career change into a
											new industry.</li>
										<li>You want to promote a specific skill set.</li>
									</ul>
								</div>
								<a href="Resume_builder.jsp" onclick="localStorage.setItem('resume_type','functional');" class="btn btn-outline-success">Create
									Functional Resume</a>
							</div>
						</div>

						<div class="col-lg-6">
							<div class="card border-danger mb-3" style="max-width: 100%;">
								<div class="card-header text-danger">
									<h3>You shouldn't use a functional resume format if...</h3>
								</div>
								<div class="card-body text-danger blockquote">
									<ul>
										<li>You want to highlight your upward career mobility for
											job.</li>
										<li>You are a student or entry-level candidate that lacks
											experience.</li>
										<li>You lack relevant or transferable skills.</li>
									</ul>
								</div>
								<button type="button" class="btn btn-outline-danger"
									id="combination" onclick="location.href='#combination';">Next
									format...</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Combination Resume -->
	<section>
		<div class=" container" data-aos="fade-up" data-aos-delay="300">
			<hr></hr>
			<div class="row">
				<div class="col-lg-12">
					<h2>3. Combination (best for specialized jobs)</h2>

					<p>A combination resume is a blend of the chronological and
						functional resume formats.</p>

					<p>Combination resumes:
					<ul>
						<li>Lead with a core skills section (like a functional
							resume)</li>
						<li>End with a detailed work experience section (like a
							chronological resume)</li>
					</ul>
					</p>

					<p>If this seems like a lot of information to include, that's
						the point. Combination resumes are best if you have many skills
						and a long career using those skills.</p>
					<div class="row">
						<div class="col-lg-6">
							<div class="card border-success mb-3" style="max-width: 100%;">
								<div class="card-header text-success">
									<h3>You should use a combination resume format if...</h3>
								</div>
								<div class="card-body text-success blockquote">
									<ul>
										<li>You want to showcase a relevant and well-developed
											skill set.</li>
										<li>You want to transfer to a different industry as per
											your needs.</li>
										<li>You are a master at what you do.</li>
									</ul>
								</div>
								<a href="Resume_builder.jsp" onclick="localStorage.setItem('resume_type','combination');" class="btn btn-outline-success">Create
									Combination Resume</a>
							</div>
						</div>

						<div class="col-lg-6">
							<div class="card border-danger mb-3" style="max-width: 100%;">
								<div class="card-header text-danger">
									<h3>You shouldn't use a combination resume format if...</h3>
								</div>
								<div class="card-body text-danger blockquote">
									<ul>
										<li>You have zero work experience.</li>
										<li>You want to emphasize your educational background.</li>
										<li>You lack the relevant qualifications and skill set
											for a role.</li>
									</ul>
								</div>
								<button type="button" class="btn btn-outline-danger"
									id="confused" onclick="location.href='#confused';">Still
									confused? Which is best for you?</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Resume format -->
	<section>
		<div class=" container" data-aos="fade-up" data-aos-delay="300">
			<hr></hr>
			<h2>What's the best resume format for you?</h2>
			<p>Just because the chronological resume format is used by most
				job seekers doesn't mean it's the best option for everyone. Each
				format serves a specific purpose, so only one will work best for
				your skillset and professional background.</p>
			<h3>Infographic: how to choose the right resume format?</h3>
			<p>Use the following infographic to quickly determine which
				resume format you should pick when writing your own resume:</p>
			<img class="img-fluid rounded" src="img/infographic.jpg"
				style="width: 100%;" />
		</div>
	</section>

	<!-- Resume tips -->
	<section id="resume_tips">
		<div class=" container" data-aos="fade-up" data-aos-delay="300">
			<hr></hr>
			<h1 style="color: var(- -primary-color)">Resume formatting tips</h1>
			<p>Although it's your resume's content that will get you
				interviews, you should still ensure your resume layout is neat and
				easy to read.</p>
			<p>Here are five quick tips to correctly format your professional
				resume.</p>
			<img class="img-fluid rounded" src="img/organize_resume.svg"
				style="width: 100%;" />
			<h2>1. Left align the content</h2>
			<p>In general, you should left-align your resume. Unless your
				resume template was specifically designed with a different
				alignment, left is the standard, because it's how people in the US
				are trained to read.</p>
			<h2>2. Keep your resume on one page</h2>
			<p>99% of the time, it's best to only send out one page resumes.
				That's because one page is the standard resume length for most
				industries, and it allows hiring managers to quickly view your
				relevant qualifications.</p>
			<p>However, there are some reasons to break this rule. For
				instance, you might need a two-page resume if:</p>
			<ul>
				<li>You have 10+ years of experience relevant to the job you
					want</li>
				<li>You're writing a management level or executive resume</li>
				<li>You're an academic writing a professional CV</li>
			</ul>
			<p>If you're still unsure how long your resume should be, make it
				one page to be safe.</p>
			<h2>3. Use .63" by 1" margins</h2>
			<p>The correct margins for a resume are .63" left/right and 1"
				top/bottom. This combination strikes the perfect balance between
				making your resume easy to read, while including as much information
				as possible on a single page.</p>
			<p>If you're worried you have too much (or too little)
				information on your resume, you can tweak the margins as necessary.
				Just don't get carried away, or you risk making your resume look
				unprofessional.</p>
			<h2>4. Use an HR-approved resume font</h2>
			<p>The font style and size you choose for your resume won't
				improve your chances of getting the job, but they can definitely
				hurt your chances. If you choose a professional font at a readable
				font size, you'll be okay.</p>
			<h3>Recommended fonts</h3>
			<ul>
				<li>Book Antiqua</li>
				<li>Georgia</li>
				<li>Lato</li>
				<li>Trebuchet MS</li>
				<li>Arial Narrow</li>
				<li>Garamond</li>
				<li>Calibri</li>
				<li>Helvetica</li>
				<li>Cambria</li>
			</ul>
			<h3>Recommended font size:</h3>
			<p>While the best font for a resume is debatable, experts agree
				that font size shouldn't fall below 10.5 or exceed 12.</p>
			<p>However, some fonts look better smaller, and some fonts look
				better at larger sizes. Experiment until your resume looks
				professional and readable.</p>
			<h2>5. Save your resume as a PDF</h2>
			<p>PDF is the best file format to save your resume in. Saving
				your resume as a PDF ensures its formatting remains exactly how you
				want it, and that it's easy for employers to open.</p>
			<p>Additionally, the red spell-check underlines used by Microsoft
				Word don't show up on your resume if it's saved as a PDF, making it
				more visually appealing.</p>
			<p>However, you should always check the job listing first for any
				instructions about how to send your resume.</p>
			<p>For example, many bigger companies that use an applicant
				tracking system (ATS) to scan through resumes will tell applicants
				to send their resumes as a .docx file. That's because ATS software
				has an easier time scanning Word Docs.</p>

			<img class="img-fluid rounded" id="counter" src="img/about_me.svg"
				style="width: 100%;" data-aos="fade-up" data-aos-delay="100" />
		</div>
	</section>



<!-- counter -->
	
	
	<section>
	<hr class="container"></hr>
	<div class="row text-uppercase" style="color:white;background: var(--primary-color); font-family:var(--base-font-family);">
	<div class="col-lg-12 text-center" style="padding: 50px;"><p class="h1">Total User</p><span class="Count h2"><% UsersDao UserCount=new UsersDao(ConnectionProvider.getConnection());%><%=UserCount.getUserCount() %>
	</span>

	
	
	</div>
	<div class="bg-white text-center col-12"><h1 style="color: var(--primary-color);font-family:var(--font-bold-family);">Resume Users</h1></div>
	<div class="col-lg-4 text-center" style="padding: 50px;"><p class="h1">Chronological</p><span class="Count h2"><% ContentDao ChronologicalCount=new ContentDao(ConnectionProvider.getConnection());%><%=ChronologicalCount.getChronologicalCount() %></span></div>
	<div class="col-lg-4 text-center" style="padding: 50px;"><p class="h1">Functional</p><span class="Count h2"><% ContentDao FunctionalCount=new ContentDao(ConnectionProvider.getConnection());%><%=FunctionalCount.getFunctionalCount() %></span></div>
	<div class="col-lg-4 text-center" style="padding: 50px;"><p class="h1">Combination</p><span class="Count h2"><% ContentDao CombinationCount=new ContentDao(ConnectionProvider.getConnection());%><%=CombinationCount.getCombinationCount() %></span></div>
	</div>
	</section>

<!-- end-counter -->





	<footer class="site-footer">
		<div class="container">
			<div class="row">

				<div class="col-lg-5 mx-lg-auto col-md-8 col-10">
					<h1 class="text-white" data-aos="fade-up" data-aos-delay="100">
						EasyResume helps you to make <strong>Standard,
							Professional & Effective</strong> Resumes.
					</h1>
				</div>

				<div class="col-lg-3 col-md-6 col-12" data-aos="fade-up"
					data-aos-delay="200">
					<h4 class="my-4">Contact Info</h4>



					<p>
						<a href="#"> <i class="fa fa-envelope mr-2 footer-icon"></i>
							easyresume@gmail.com
						</a>
					</p>
				</div>

				<div class="col-lg-3 col-md-6 col-12" data-aos="fade-up"
					data-aos-delay="300">
					<h4 class="my-4">Our Vision</h4>

					<p class="mb-1">
						<i class="fa fa-eye mr-2 footer-icon"></i> Helping job seekers to
						improve there chances of success on the job hunt.
					</p>
				</div>

				<div class="col-lg-4 mx-lg-auto text-center col-md-8 col-12"
					data-aos="fade-up" data-aos-delay="400">
					<p class="copyright-text">
						Copyright &copy; 2021 EasyResume <br>
					</p>
				</div>



				<div class="col-lg-3 mx-lg-auto col-md-6 col-12" data-aos="fade-up"
					data-aos-delay="600">
					<ul class="social-icon">
						<li><a href="#" class="fa fa-facebook"></a></li>
						<li><a href="#" class="fa fa-instagram"></a></li>
						<li><a href="#" class="fa fa-twitter"></a></li>
						<li><a href="#" class="fa fa-linkedin"></a></li>
					</ul>
				</div>

			</div>
		</div>
	</footer>




	<!-- java script -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script src="js/myjs.js" type="text/javascript"></script>

	<!-- Jquery needed -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

	<!-- script -->
	<script src="js/aos.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/custom.js"></script>
	<script src="js/smoothscroll.js"></script>
	
	
	
	
	
	
	
	<!-- profile -->
	
	 <script>
                                $(document).ready(function () {
                                    let editStatus = false;
                                    $('#edit-profile-button').click(function ()
                                    {
                                        if (editStatus == false)
                                        {
                                            $("#profile-details").hide()
                                            $("#profile-edit").show();
                                            editStatus = true;
                                            $(this).text("Back")
                                        } else
                                        {
                                            $("#profile-details").show()
                                            $("#profile-edit").hide();
                                            editStatus = false;
                                            $(this).text("Edit")
                                        }
                                    })
                                });
        </script>

<!-- counter js -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/jquery.waypoints.js"></script>
<script>
$('#counter').waypoint(function()  {
$('.Count').each(function () {
    $(this).prop('Counter',0).animate({
        Counter: $(this).text()
    }, {
        duration: 1000,
        easing: 'swing',
        step: function (now) {
            $(this).text(Math.ceil(now));
        }
    
    });
});
});

</script>

<!-- end counter js -->

</body>
</html>