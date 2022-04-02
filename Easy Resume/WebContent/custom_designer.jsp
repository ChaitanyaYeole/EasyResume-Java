
<%@page import="com.easyresume.helper.ConnectionProvider"%>
<%@page import="com.easyresume.entities.Users"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Resume Designer|EasyResume</title>
<link rel="shortcut icon" href="img/ER_ico.png" type="image/x-icon"/>
<link
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/smoothness/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
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
<link rel="stylesheet" type="text/css" href="css/custom_designer.css">
<link rel="stylesheet" type="text/css" href="css/index.css">

</head>
<body onafterprint="recover()">
	<nav
		class="navbar navbar-light bg-light justify-content-between fixed-top">
		<a class="navbar-brand" href="index.jsp"><img
			src="img/easyresume.png" style="width: 200px; height: 40px;"></a>

		<form class="form-inline">
			<button onclick=" $('.sections').css({ border : 'none'});$('.ui-icon-gripsmall-diagonal-se').css({ display : 'none'});window.print()"
				class="btn btn-outline-success my-2 my-sm-0 nav-btn" type="button">Print</button>

			<button onclick="add()" id="add_pan"
				class="btn btn-outline-success my-2 my-sm-0  nav-btn" type="button">Add</button>
		</form>
	</nav>

	<!-- Add pannel -->
	<div id="add_pannel">
		<div class="pannel_container">
			<form class="content">

				<table>
					<tr>
						<th colspan="2"><h1>Add Section:</h1></th>
					</tr>
					<tr>
						<th colspan="2"><h2>Font:</h2></th>
					</tr>
					<tr>
						<td><h3>Font style:</h3></td>
						<td><select name="subject" id="font-family"
							value="select font style">
								<option value="Calibri" selected="selected">Calibri</option>
								<option value="Book Antiqua">Book Antiqua</option>
								<option value="Georgia">Georgia</option>
								<option value="Lato">Lato</option>
								<option value="Trebuchet MS">Trebuchet MS</option>
								<option value="Arial Narrow">Arial Narrow</option>
								<option value="Garamond">Garamond</option>
								<option value="Helvetica">Helvetica</option>
								<option value="Cambria">Cambria</option>
						</select></td>
					</tr>
					<tr>
						<td><h3>Font size:</h3></td>
						<td><select name="subject" id="font-size">
								<option value="18pt">10.5(Paragraph)</option>
								<option value="18.5pt">11(Paragraph)</option>
								<option value="19pt">11.5(Paragraph)</option>
								<option value="20pt" selected="selected">12(Paragraph)</option>
								<option value="41pt">29(Heading 1)</option>
								<option value="35pt">24(Heading 2)</option>
								<option value="29pt">18(Heading 3)</option>
						</select></td>
					</tr>
					<tr>
						<th colspan="2"><h2>Colors:</h2></th>
					</tr>
					<tr>
						<td><h3>Background color:</h3></td>
						<td><input type="color" id="bg-color" value="#ffffff"></td>
					</tr>
					<tr>
						<td><h3>Font color:</h3></td>
						<td><input type="color" id="font-color" value="#000"></td>
					</tr>
					<tr style="border: none;">
						<td><h2>Type your content:</h2></td>
						<td><textarea id="addtext"></textarea></td>
					</tr>
					<tr style="border: none;">
						<th style="padding-right: 15px; border: none;"><button type="button"
								class="btn btn-success" onclick="add_section()" id="add_section">Add
								Section</button></th>
						<th style="padding-left: 15px; border: none;"><button
								type="button" class="btn btn-danger" onclick="default1()"
								id="default">Set Default</button></th>
					</tr>
					
					
				</table>
				
				<span id="extra" style="border: none; display: none; width:100%;padding-top: 30px;">
						<button id="up"
								type="button" class="btn btn-info container"
								onclick="up1()">Update</button>
								
								
					</span>
				
			</form>
		</div>
	</div>

	<div id="divContainer">
		<h1 class="Spawner" id="spawner">+</h1>
	</div>



	<section id="page"></section>


<footer class="site-footer" style="margin-top: 300px;">
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
	
	
	<script src="js/Resume_builder.js" type="text/javascript"></script>

		
	<!-- script -->
	<script src="js/aos.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/custom.js"></script>
	<script src="js/smoothscroll.js"></script>
	<script src="js/custom_designer.js" type="text/javascript"></script>
</body>
</html>