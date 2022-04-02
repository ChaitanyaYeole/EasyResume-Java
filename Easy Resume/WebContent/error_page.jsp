<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>

		<link rel="shortcut icon" href="img/ER_ico.png" type="image/x-icon"/>
        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            img{
            width: 50%;
            margin: 50px;
            }
            
            .btn-primary{
            background-color: #4481eb;
            
            }
            
            .btn-primary:hover {
            background-color: #446AEB;
            }
        </style>

    </head>
    <body>
        <div class="container text-center">
            <img src="img/error.svg" class="img-fluid" >
            <h3 class="display-3">Something went wrong...</h3>
            <%= exception%>
            <br>
            <a href="index.jsp" class="btn btn-primary primary-background btn-lg mt-3">Home </a>
        </div>


    </body>
</html>