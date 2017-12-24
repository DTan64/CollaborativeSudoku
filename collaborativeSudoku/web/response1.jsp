<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Try Me</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        $(document).ready(function() {
            var userID = 1;
            var roomNum = 1;


            // give each cell an id
            {
                var counter1 = 0;

                $("#board tr td input").each(function () {
                    $(this).attr("id", counter1++);
                });
            }

            $('.txt').keydown(function (e){
                //console.log(e.keyCode);

                if( e.keyCode == 13 )
                {
                    var cellNum = $(this).attr('id');
                    var cellVal = $(this).val();

                    console.log("Cell Val " +  cellVal + ": "+ cellNum);

                    $.post("boardServlet", {
                        cellVal : cellVal,
                        cellNum : cellNum
                    }, function(response,status) {
                        console.log("Edited room: " + response);
                    });
                }
            });

            $(document).on("click", "#getboard", function() { // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
                $.get("boardServlet", function(responseText) {   // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...

                    console.log(responseText);

                    var length = responseText.length;

                    var counter = 0;

                    $("#board tr td input").each(function() {
                        var hasFocus = $(this).is(":focus");
                        if( !hasFocus )
                        {
                            $(this).val(responseText.charAt(counter++)); //responseText.charAt(counter)
                        }
                        else
                        {
                            console.log("in focous");
                        }
                    });
                });
            });
            setInterval(pollBoard, 1500);
        });

        function pollBoard()
        {
            $.get("boardServlet", function(responseText) {   // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...

                console.log(responseText);

                var length = responseText.length;

                var counter = 0;

                $("#board tr td input").each(function() {
                    $(this).val(responseText.charAt(counter++)); //responseText.charAt(counter)
                });
            });
        }

    </script>

    <link rel="stylesheet" href="response1.css">

</head>
<body background="images/Game_background.png">
<div id="boarddiv">
    <table id="board">
        <tr id="row1">
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell right" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell right" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
        </tr>
        <tr id="row2">
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell right" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell right" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
        </tr>
        <tr id="row3">
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell right" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell right" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
        </tr>
        <tr id="row4">
            <td class="cell top" ><input class="txt" type="text"></td>
            <td class="cell top" ><input class="txt" type="text"></td>
            <td class="cell top right" ><input class="txt" type="text"></td>
            <td class="cell top" ><input class="txt" type="text"></td>
            <td class="cell top" ><input class="txt" type="text"></td>
            <td class="cell top right" ><input class="txt" type="text"></td>
            <td class="cell top" ><input class="txt" type="text"></td>
            <td class="cell top" ><input class="txt" type="text"></td>
            <td class="cell top" ><input class="txt" type="text"></td>
        </tr>
        <tr id="row5">
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell right" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell right" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
        </tr>
        <tr id="row6">
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell right" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell right" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
        </tr>
        <tr id="row7">
            <td class="cell top" ><input class="txt" type="text"></td>
            <td class="cell top" ><input class="txt" type="text"></td>
            <td class="cell top right" ><input class="txt" type="text"></td>
            <td class="cell top" ><input class="txt" type="text"></td>
            <td class="cell top" ><input class="txt" type="text"></td>
            <td class="cell top right" ><input class="txt" type="text"></td>
            <td class="cell top" ><input class="txt" type="text"></td>
            <td class="cell top" ><input class="txt" type="text"></td>
            <td class="cell top" ><input class="txt" type="text"></td>
        </tr>
        <tr id="row8">
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell right" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell right" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
        </tr>
        <tr id="row9">
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell right" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell right" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
            <td class="cell" ><input class="txt" type="text"></td>
        </tr>
    </table>
</div>

<button id="getboard">press here</button>

</body>
</html>