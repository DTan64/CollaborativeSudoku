<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 12/5/17
  Time: 8:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" href="login.css" type="text/css">
<head>
    <title>CollabSudoku Main</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        $(document).ready(function() { // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
            // this is the id of the form
            $(document).on("submit", "#login", function(e) {
                var $form = $(this);
                $.post("LoginServlet", $form.serialize(), function(data, status) {// Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...

                    if(data == "true")
                    {
                        window.location.href = "homepage.jsp";
                    }
                    else
                    {
                        alert("Login failed");
                        window.location.href = "index.jsp";
                    }

                });
                e.preventDefault(); // avoid to execute the actual submit of the form.
            });
        });
    </script>
</head>




<body background="images/login_sudoku.png">
<div id="centered">
  <form id="login">
    <p><input type="text" name="email" placeholder="E-Mail" id="Email"/></p>
    <p><input type="password" name="pswd" placeholder="Password" id="password"/></p>
    <input type="button" id="SignUpButton" value="Sign Up" onclick="window.location.href='signUp.jsp';"/>
    <input type="submit" id="LoginButton" value="Login"/>
  </form>
</div>
</body>
</html>