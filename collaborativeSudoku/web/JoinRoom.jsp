<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 12/5/17
  Time: 8:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" href="JoinRoom.css" type="text/css">
<head>
    <title>JoinRoom</title>

    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        $(document).ready(function ()
        {
             $.get("JoinRoomServlet", function(responseText) {   // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...
                var data = [];
                var data = responseText.split(",");

                for(i = 0; i < data.length; i++){
                    $("ul").append("<li><form class =\"roomForm\" id=" + data[i] + ">\n" +
                        "                <input type=\"submit\" id=\"JRButton\" value=" + data[i] + "></form></li>");
                }

                /*$("li form input").each(function(index) {
                    $(this).val(data[index]);
                });*/
            });


            $(document).on("submit", ".roomForm", function(e)
            {
                console.log($(this).attr("id"));
                $.post("roomServlet", {
                    roomID : $(this).attr("id")
                }, function(response, status) {
                    if (status === "success")
                    {
                        window.location.href = "response1.jsp";
                    }
                    else
                    {
                        console.log("Failed to join room: " + status );
                    }
                });
                e.preventDefault(); // avoid to execute the actual submit of the form.
            });
        });
    </script>
</head>
<h1>Rooms Available</h1>
<body background="images/Game_background.png">
<input type="button" id="HomeButton" value="Home" onclick="window.location.href='homepage.jsp';" left="0px" top="0px"/>

<nav>
    <ul>
    </ul>
</nav>
</body>
</html>
