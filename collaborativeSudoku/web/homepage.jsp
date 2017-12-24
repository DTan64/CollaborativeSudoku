<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 12/5/17
  Time: 8:17 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<div>
    <link rel="stylesheet" href="homepage.css" type="text/css">
    <h1>Welcome to CollabSudoku!</h1>
    <title>Homepage</title>
<head>
    <title>Title</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        $(document).ready(function() { // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
            // this is the id of the form
            $(document).on("submit", "#Statistics", function(e)
            {
                window.location.href = "statistics.jsp";
                e.preventDefault(); // avoid to execute the actual submit of the form.
            });

            $(document).on("submit", "#CreateRoom", function(e) {

                var $form = $(this);
                $.post("CreateRoomServlet", $form.serialize(), function (data, status) {
                    if(data === "true")
                        alert("room created");
                        //redirect to new room
                    else {
                        alert("room name exists");
                        window.location.href = "homepage.jsp";
                    }
                });
                e.preventDefault();
            });

            $(document).on("submit", "#JoinRoom", function(e) {
                window.location.href = "JoinRoom.jsp";
                e.preventDefault();
            });
        });

    </script>
</head>

<div id="centered"></div>
<body background="images/Game_background.png">
<img src="images/board.jpg">
<form id="CreateRoom">
    <input type="submit" id="CRButton" value="Create Room">
    <input type="text" name="roomName" id="RoomName" placeholder="Room Name">
</form>

<p>
<form id="JoinRoom">
    <input type="submit" id="JRButton" value="Join Room">
</form>
</p>

<p>
    <form id="Statistics">
<p><input type="submit" id="StatsButton" value="Statistics"></p>
</form>
</p>
</body>
</div>
</html>