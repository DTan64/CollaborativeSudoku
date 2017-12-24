<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 12/5/17
  Time: 8:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" href="signUp.css" type="text/css">
<head>
    <title>SignUp</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        $(document).ready(function() { // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
            // this is the id of the form
            $(document).on("submit", "#signup", function(e) {
                var $form = $(this);
                $.post("SignupServlet", $form.serialize(), function(data, status) {// Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...
                    if(data == "true")
                    {
                        alert("Signup sucess");
                        window.location.href = "homepage.jsp";
                    }
                    else
                    {
                        alert("Username already exists");
                        window.location.href = "signUp.jsp";
                    }
                });
                e.preventDefault(); // avoid to execute the actual submit of the form.
            });
        });
    </script>
</head>
<body bgcolor="aqua" background="images/signup_sudoku.png">
<div id="centered">
    <form id="signup" >
        <head><h1 >Create An Account</h1>
            <p><h2> To play CollabSudoku, users must have an account. </h2></p>
            <p><h3>Simply enter in a username and a password to begin!</h3></p>
        </head>
        <p></p><input type="text" name="email" placeholder="Email" id="email"/>
        <p></p><input type="password" name="pswd" placeholder="Password" id="password"/>
        <p><input type="submit" id="Register" value="Register!"></p>
    </form>
</div>
</body>
</html>