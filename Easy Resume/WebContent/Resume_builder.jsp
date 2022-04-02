
<%@page import="com.easyresume.helper.ConnectionProvider"%>
<%@page import="com.easyresume.entities.Users"%>
<%@page import="com.easyresume.dao.ContentDao"%>
<%@page errorPage="error_page.jsp"%>
<%
Users user = (Users) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login_register.jsp");
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Resume Builder|EasyResume</title>
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
<link rel="stylesheet" type="text/css" href="css/Resume_builder.css">
<link rel="stylesheet" type="text/css" href="css/index.css">
</head>
<body>


<nav
		class="navbar navbar-light bg-light justify-content-between fixed-top">
		<a class="navbar-brand" href="index.jsp"><img
			src="img/easyresume.png" style="width: 200px; height: 40px;"></a>

		<form class="form-inline">
		<!-- editors -->
		<select name="subject" id="input-font" class="input"  onchange="changeFont (this);"
							value="select font style" title="Font style Highlighted Text">
								<option value="Calibri" selected="selected">Calibri</option>
								<option value="Book Antiqua">Book Antiqua</option>
								<option value="Georgia">Georgia</option>
								<option value="Lato">Lato</option>
								<option value="Trebuchet MS">Trebuchet MS</option>
								<option value="Arial Narrow">Arial Narrow</option>
								<option value="Garamond">Garamond</option>
								<option value="Helvetica">Helvetica</option>
								<option value="Cambria">Cambria</option>
						</select>
		<select name="subject" id="font-size" onchange="changeSize()" title="Font style Highlighted Text">
								
								<option value="2">Extra Small</option>
								<option value="3">Small</option>
								<option value="4" selected="selected">Medium</option>
								<option value="7">Heading 1</option>
								<option value="6">Heading 2</option>
								<option value="5">Heading 3</option>
						</select>
		<button type="button" class="btn btn-light fontStyle bold" onclick="document.execCommand( 'bold',false,null);" title="Bold Highlighted Text"><i class="fa fa-bold" aria-hidden="true"></i></button>
		<button type="button" class="btn btn-light fontStyle italic" onclick="document.execCommand('italic',false,null);" title="Italicize Highlighted Text"><i class="fa fa-italic" aria-hidden="true"></i></button>
		<button type="button" class="btn btn-light fontStyle underline" onclick="document.execCommand( 'underline',false,null);" title="Underline Highlighted Text"><i class="fa fa-underline" aria-hidden="true"></i></button>
		<button type="button" class="btn btn-light fontStyle align-left" onclick="document.execCommand( 'justifyLeft',false,null);" title="Left Align Highlighted Text"><i class="fa fa-align-left" aria-hidden="true"></i></button>
		<button type="button" class="btn btn-light fontStyle align-center" onclick="document.execCommand( 'justifyCenter',false,null);" title="Center Highlighted Text"><i class="fa fa-align-center" aria-hidden="true"></i></button>
		<button type="button" class="btn btn-light fontStyle align-right" onclick="document.execCommand( 'justifyRight',false,null);" title="Right Align Highlighted Text"><i class="fa fa-align-right" aria-hidden="true"></i></button>
		<button type="button" class="btn btn-light fontStyle orderedlist" onclick="document.execCommand('insertOrderedList', false, null);" title="OrderedList Highlighted Text"><i class="fa fa-list-ol" aria-hidden="true"></i></button>
		<button type="button" class="btn btn-light fontStyle unorderedlist" onclick="document.execCommand('insertUnorderedList',false, null)" title="UnorderedList Highlighted Text"><i class="fa fa-list-ul" aria-hidden="true"></i></i></button>
		<ul class="nav nav-pills"><li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
				role="button" aria-haspopup="true" aria-expanded="false">Colors</a>
				<div class="dropdown-menu">
					<span class="dropdown-item" href="#">Font Color:<input class="color-apply" type="color" onchange="chooseColor()" id="myColor" style="float: right;clear: both;"></span>
						<div class="dropdown-divider"></div>
					<span class="dropdown-item" href="#">Primary Color:<input
						type="color" onchange="primary1()" id="primary-color" value="#808080" style="float: right;clear: both;"/></span> 
						<div class="dropdown-divider"></div>
					<span class="dropdown-item" href="#">Secondary Color:<input
						type="color" onchange="secondary1()" id="secondary-color" value="#c0c0c0" style="float: right;clear: both;"/></span> 
						<div class="dropdown-divider"></div>
					<span class="dropdown-item" href="#">Background Color:<input
						type="color" onchange="background1()" id="background-color" value="#ffffff"/></span> 

				</div></li></ul>

			<button onclick="print1()"
				class="btn btn-outline-success my-2 my-sm-0 nav-btn" type="button">Print</button>

			<button id="save_content"
				class="btn btn-outline-primary my-2 my-sm-0  nav-btn" type="button">Save</button>
		</form>
	</nav>


<!-- Chronological layout start -->
	

<div id="chronological" class="page" title="Chronological Resume">

		<table>
			<tr class="primary heading" id="primary2">
				<th colspan="2"><div class="editor1 chronological-heading" id="editor1"
						contenteditable="true" data-text="Heading...."></div></th>

			</tr>
			<tr class="primary sub-heading"  id="primary2">
				<td colspan="2"><div class="editor1 chronological-subHeading" id="editor1"
						contenteditable="true" data-text="Sub-Heading...."></div></td>
			</tr>
			<tr>
				<td class="resume-introduction background"><div class="editor1 chronological-introduction"
						id="editor1" contenteditable="true" data-text="Resume Introduction..."></div></td>
				<td class="secondary resume-contact"><div class="editor1 chronological-contact" id="editor1"
						contenteditable="true" data-text="contact details..."></div></td>
			</tr>
			<tr>
				<td rowspan="3" class="resume-experience background"><div class="editor1 chronological-experience"
						id="editor1" contenteditable="true" data-text="Experience..."></div></td>
				<td class="secondary resume-skills"><div class="editor1 chronological-skill"
						id="editor1" contenteditable="true" data-text="Skills..."></div></td>
			</tr>
			<tr>

				<td class="secondary resume-education"><div class="editor1 chronological-education"
						id="editor1" contenteditable="true" data-text="Education..."></div></td>
			</tr>
			<tr>

				<td class="secondary resume-awards"><div class="editor1 chronological-award"
						id="editor1" contenteditable="true" data-text="Awards/Achievments..."></div></td>
			</tr>

		</table>
	</div>


<!-- Chronological layout end -->

<!-- Functional layout start -->


	<div id="functional" class="page" title="Functional Resume">

		<table>
			<tr class="primary heading">
				<th colspan="2"><div  class="editor1 functional-heading" id="editor1"
						contenteditable="true" data-text="Heading..."></div></th>

			</tr>
			<tr class="primary sub-heading">
				<td colspan="2"><div class="editor1 functional-subHeading" id="editor1"
						contenteditable="true" data-text="Sub-heading..."></div></td>
			</tr>
			<tr>
				<td class="secondary resume-introduction"><div class="editor1 functional-introduction"
						id="editor1" contenteditable="true" data-text="Introduction..."></div></td>
				<td class="resume-contact background"><div class="editor1 functional-contact" id="editor1"
						contenteditable="true" data-text="Contact Details..."></div></td>
			</tr>
			<tr>
				<td rowspan="3" class="secondary resume-skills"><div class="editor1 functional-skill"
						id="editor1" contenteditable="true" data-text="Skills..."></div></td>
				<td class="resume-experience background"><div class="editor1 functional-experience"
						id="editor1" contenteditable="true" data-text="Experience..."></div></td>
			</tr>
			<tr>

				<td class="resume-education background"><div class="editor1 functional-education"
						id="editor1" contenteditable="true" data-text="Education..."></div></td>
			</tr>
			<tr>

				<td class="resume-awards background"><div class="editor1 functional-award"
						id="editor1" contenteditable="true" data-text="Awards/Achievments..."></div></td>
			</tr>

		</table>
	</div>


<!-- Functional layout end -->

<!-- Combination layout start -->


	<div id="combination" class="page" title="Combination Resume">

		<table>
			<tr>
				<td colspan="2" class="primary"></td>
			</tr>
			<tr class="secondary heading">
				<td><div  class="editor1 combination-heading" id="editor1"
						contenteditable="true" data-text="Heading..."></div></td>
						<td rowspan="2" class="resume-contact"><div class="editor1 combination-contact" id="editor1"
						contenteditable="true" data-text="Contact Details..."></div></td>
			</tr>
			<tr class="secondary sub-heading">
				<td><div class="editor1 combination-subHeading" id="editor1"
						contenteditable="true" data-text="Sub-heading..."></div></td>
			</tr>
			<tr>
			<td colspan="2" class="resume-introduction background"><div class="editor1 combination-introduction" id="editor1"
						contenteditable="true" data-text="Introduction..."></div></td>
			</tr>
			<tr>
			<td colspan="2" class="resume-skills background"><div class="editor1 combination-skill" id="editor1"
						contenteditable="true" data-text="Skills..."></div></td>
			</tr>
			<tr>
			<td colspan="2" class="resume-experience background"><div class="editor1 combination-experience" id="editor1"
						contenteditable="true" data-text="Experience..."></div></td>
			</tr> 
			<tr>
			<td colspan="2" class="resume-education background"><div class="editor1 combination-education" id="editor1"
						contenteditable="true" data-text="Education..."></div></td>
			</tr> 
			<tr>
			<td colspan="2" class="primary"></td>
			</tr> 
		</table>
	</div>


<!-- Combination layout end	 -->

<!-- hidden temp form-->
<form id="resume-content" action="addContentServlet" method="post">
	<div style="display: none;">
		<input name="resumeType" type="text" placeholder="resume type" class="resumeType-input"/>
		<input name="heading" type="text" placeholder="heading" class="heading-input"/>
		<input name="subHeading" type="text" placeholder="subHeading" class="subHeading-input"/>
		<input name="introduction" type="text" placeholder="introduction" class="introduction-input"/>
		<input name="contact" type="text" placeholder="contact" class="contact-input"/>
		<input name="experience" type="text" placeholder="experience" class="experience-input"/>
		<input name="skill" type="text" placeholder="skill" class="skill-input"/>
		<input name="education" type="text" placeholder="education" class="education-input"/>
		<input name="award" type="text" placeholder="award" class="award-input"/>
	</div>		
</form>
<!-- hidden temp form end -->

<%-- <% ContentDao Content=new ContentDao(ConnectionProvider.getConnection());%><%=Content.getContentByIdAndResumeType(1,"chronological") %> --%>


<!-- footer start -->	

	<footer class="site-footer" style="margin-top: 50px;">
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
<!-- footer end -->
	
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
		
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script src="js/Resume_builder.js" type="text/javascript"></script>

	<!-- Jquery needed -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		
	<!-- script -->
	<script src="js/aos.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/custom.js"></script>
	<script src="js/smoothscroll.js"></script>
	
	
	<!-- js : Add content  to database -->
	<script>
	 $(document).ready(function (e) {
		 
		 /*Onload if user and resume_type exist then fill all content data*/
		 
		 
		 
		 /* save button clicked */
		 $("#save_content").click(function () {
			 
			 
			 
			 
			/* setting resume content data to form */
			$(".resumeType-input").val(resumeType);
			$(".heading-input").val($("."+resumeType+"-heading").text());
			$(".subHeading-input").val($("."+resumeType+"-subHeading").text());
			$(".introduction-input").val($("."+resumeType+"-introduction").text());
			$(".contact-input").val($("."+resumeType+"-contact").text());
			$(".experience-input").val($("."+resumeType+"-experience").text());
			$(".skill-input").val($("."+resumeType+"-skill").text());
			$(".education-input").val($("."+resumeType+"-education").text());
			$(".award-input").val($("."+resumeType+"-award").text());
			
			/* submiting form */
			
    		$("#resume-content").submit();
  		 });
         //sending content to servlet
         $("#resume-content").on("submit", function (event) {
             //this code gets called when form is submitted....
             event.preventDefault();
             console.log("you have clicked on submit..");
             let form = new FormData(this);
             //now requesting to server
             $.ajax({
                 url: "addContentServlet",
                 type: 'POST',
                 data: form,
                 
                 success: function (data, textStatus, jqXHR) {
                     //success ..
                     console.log(data);
                     if (data.trim() == 'done')
                     { 
                         swal("Good job!", "saved successfully", "success");
                     } else
                     {
                         swal("Error!!", "insidebox Something went wrong try again...", "error");
                     } 
                 },
                 error: function (jqXHR, textStatus, errorThrown) {
                     //error..
                     swal("Error!!", "outofbox Something went wrong try again...", "error");
                 }, 
                 processData: false,
                 contentType: false
                 
             })
         })
     })
	
	</script>
	
	
</body>
</html>