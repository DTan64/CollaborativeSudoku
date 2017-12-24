<%--
  Created by IntelliJ IDEA.
  User: cody.towstik
  Date: 12/7/17
  Time: 2:02 AM
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>Title</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>

    <form>
        <input id="message" type="text">
        <input onclick ="wsSendMessage();" value="Echo" type="button">
        <input onclick="wsCloseConnection();" value="Disconnect" type="button">
    </form>
    <br>
    <textarea id="echoText" rows="5" cols="30"></textarea>

    <script type="text/javascript">
        var webSocket = new WebSocket("ws://localhost:8080/websocketendpoint");

        var echoText = document.getElementById("echoText");



        var getmessage = ""; //document.getElementById("message");

        webSocket.onopen = function() { wsOpen(); };
        webSocket.onmessage = function(getmessage){ wsGetMessage(getmessage); };
        webSocket.onclose = function(getmessage) { wsClose(getmessage); };
        webSocket.onerror = function(getmessage) {  wsError(getmessage);};

        function wsOpen()
        {
            echoText.value += "Connected! \n";
        }

        function wsSendMessage()
        {
            var message = $("#message").val();

            console.log(message);
            webSocket.send(message);
            echoText.value += "Message sent to server: " + message + "\n";
        }

        function wsCloseConnection()
        {
            webSocket.close();
        }

        // message.value vs message.data
        function  wsGetMessage(mymessage)
        {
            echoText.value += "Message received: " + mymessage.data + "\n";
        }

        function wsClose(message)
        {
            echoText.value += "Disconnected! \n"
        }

        function wsError(message)
        {
            echoText.value += "Error! \n";
        }

    </script>

</body>
</html>
