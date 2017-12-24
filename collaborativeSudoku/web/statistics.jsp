<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 12/5/17
  Time: 8:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" href="statistics.css" type="text/css">
<head>
    <title>Title</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        $(document).ready(function() { // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
            $.get("ShowStatisticsServlet", function(responseText) {   // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...

                var data = [];

                var data = responseText.split(",");

                $("table tr td").each(function(index) {
                    var indexCheck = index + 1;
                    var i = 0;
                    if(indexCheck % 5 == 0) {
                        $(this).text(data[i]);
                        i++;
                    }
                });
            });
        });
    </script>
</head>
<body background="images/Statistics.png">
<input type="button" id="HomeButton" value="Home" onclick="window.location.href='homepage.jsp';" left="0px" top="0px"/>
<div class="centered">
<table width="450" height="450">
    <tr>
        <td width="150" style="background-color: lightblue ; font-size: 200%">Games Played</td>
        <td width="50" backgr></td>
        <td width="40" style="background-color: lightblue; padding: 5px"></td>
        <td width="50"></td>
        <td width="150" style="background-color: lightblue; font-size: 200%""</td>
    </tr>
    <tr>
        <td width="150" style="background-color: lightblue ; font-size: 200%">Moves Made</td>
        <td width="50"></td>
        <td width="40" style="background-color: lightblue; padding: 5px"></td>
        <td width="50"></td>
        <td width="150" style="background-color: lightblue; font-size: 200%""></td>
    </tr>
    <tr>
        <td width="150" style="background-color: lightblue; font-size: 200%">Board Wins</td>
        <td width="50"></td>
        <td width="40" style="background-color: lightblue; padding: 5px"></td>
        <td width="50"></td>
        <td width="150" style="background-color: lightblue; font-size: 200%"></td>
    </tr>
</table>
</div>

</body>
</html>
