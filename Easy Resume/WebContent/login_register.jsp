
<%@page import="com.easyresume.entities.Message1"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script
      src="https://kit.fontawesome.com/64d58efce2.js"
      crossorigin="anonymous"
    ></script>
    
    
    
    <link rel="shortcut icon" href="img/ER_ico.png" type="image/x-icon"/>
    <link rel="stylesheet" href="css/login_register.css" />
    <title>Login & Signup|EasyResume</title>
  </head>
  <body>
    <div class="container">
      <div class="forms-container">
        <div class="signin-signup">
          <form action="LoginServlet" method="POST" class="sign-in-form">
          <a href="index.jsp"><img src="img/easyresume.png" class="image" alt="" /></a>
            <h2 class="title">Sign in</h2>

					<%
					Message1 m = (Message1) session.getAttribute("msg");
								if (m != null) {
					%>
					<div class="alert" style="color: <%=m.getCssClass()%>;" role="alert">
						<%=m.getContent()%>
					</div>


					<%
					session.removeAttribute("msg");
					}
					%>

					<div class="input-field">
              <i class="fas fa-user"></i>
              <input name="email" required type="text" placeholder="Email Id" />
            </div>
            <div class="input-field">
              <i class="fas fa-lock"></i>
              <input name="password" required type="password" placeholder="Password" />
            </div>
            <input type="submit" value="Login" class="btn solid" />
            
            
            
            <p class="social-text">Or Sign in with social platforms</p>
            <div class="social-media">
              <a href="#" class="social-icon">
                <i class="fab fa-facebook-f"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-twitter"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-google"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-linkedin-in"></i>
              </a>
            </div>

				


				</form>
          <form id="signup-form" action="SignupServlet" class="sign-up-form" method="POST">
          <img src="img/easyresume.png" class="image" alt="" />
            <h2 class="title">Sign up</h2>
            <div class="input-field">
              <i class="fas fa-user"></i>
              <input name="user_name" type="text" placeholder="Username" />
            </div>
            <div class="input-field">
              <i class="fas fa-envelope"></i>
              <input name="user_email" type="email" placeholder="Email" />
            </div>
            <div class="input-field">
              <i class="fas fa-lock"></i>
              <input name="user_pass" type="password" placeholder="Password" />
            </div>
            <input type="submit" class="btn" value="Sign up" />
            <p class="social-text">Or Sign up with social platforms</p>
            <div class="social-media">
              <a href="#" class="social-icon">
                <i class="fab fa-facebook-f"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-twitter"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-google"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-linkedin-in"></i>
              </a>
            </div>
          </form>
        </div>
      </div>

      <div class="panels-container">
        <div class="panel left-panel">
          <div class="content">
            <h3>New here ?</h3>
            <!-- <p>
              Most welcome to EasyResume, Do you know? Easyresume makes you easy to build an effective resume in just few minutes.
            </p> -->
            <p>
              Are you new here? You can join to us by just click on sign up and create an account to get started with building resume.
            </p>
            <button class="btn transparent" id="sign-up-btn">
              Sign up
            </button>
          </div>
          <img src="img/log.svg" class="image" alt="" />
        </div>
        <div class="panel right-panel">
          <div class="content">
            <h3>One of us ?</h3>
            <!-- <p>
              Hey there, Are you wandering for the platform that will help you in creating effective and proper way to building a resume so that, it will help you in getting first impression on HR? then easy resume is perfect platform for you.
            </p> -->
            <p>  
              Have you already joined to us? then click on sign in!
            </p>
            <button class="btn transparent" id="sign-in-btn">
              Sign in
            </button>
          </div>
          <img src="img/register.svg" class="image" alt="" />
        </div>
      </div>
    </div>

    <script src="js/login_register.js"></script>
    
     <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {
                console.log("loaded........")
                $('#signup-form').on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);
                    
                    //send register servlet:
                    $.ajax({
                        url: "SignupServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)
                            
                            if (data.trim() === 'done')
                            {
                                swal("You are registered successfully.")
                                        .then((value) => {
                                        	$('#sign-in-btn').click();
                                        });
                            } else
                            {
                                swal(data);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            
                            swal("Something went wrong..try again");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
    
    
    
  </body>
</html>
