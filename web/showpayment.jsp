<%-- 
    Document   : showpayment
    Created on : 13 May, 2023, 5:00:54 PM
    Author     : sohel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Space+Mono:wght@700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Monoton&display=swap" rel="stylesheet">
        <style>
            body{
                background-color: white;
            }
            .container {
                max-width: 600px;
                margin: 6% auto;
                text-align: center;
                padding-top: 50px;
            }
            img{
                width:100px;
                margin-top: -50px;
                border-radius: 50%;
                box-shadow: 0 2px 5px rgba(0,0,0,0.2);

                margin-top: 5%;
            } 
            h1 {
                font-size: 35px;
                margin-bottom: 30px;
                font-family: 'Space Mono', monospace;
            }

            .booking-details {
                margin-bottom: 40px;

                font-size: 20px;
                display: flex;
                flex-direction: column;
                align-content: center;
                align-items: center;
            }

            .buttons {
                display: flex;
                justify-content: center;
            }


            .main-btn {
                color: white;
                margin-top: 20px;
                margin-right: 30px;
                font-weight: bold;
                background: black;
                width: 200px;
                padding: 15px 25px;
                font-size: 15px;
                border: 2px solid white;
                border-radius: 15px;
                transition: all 0.3s;
                text-align:center;
                cursor:pointer;
                font-family: 'Space Mono', monospace;
            }
            .main-btn:hover{
                background-color:#ff3333 ;
                color:white;
                transform: scale(1.1);
            }

            .main-btns {
                color: white;
                margin-top: 20px;
                margin-right: 30px;
                font-weight: bold;
                background: black;
                width: 200px;
                padding: 15px 25px;
                font-size: 15px;
                border: 2px solid white;
                border-radius: 15px;
                transition: all 0.3s;
                text-align:center;
                cursor:pointer;
                font-family: 'Space Mono', monospace;
            }
            .main-btns:hover{
                background-color: #66ff66;
                color:black;
                transform: scale(1.1);
            }

        </style>
        <title>Payment Successful</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <%
            String user = request.getParameter("user");
            String role = request.getParameter("role");
            String date = request.getParameter("DOB");
            String price = request.getParameter("price");
        %>
        <div class="container">
            <h1>Your Payment was Successful!</h1>
            <div class="booking-details">
                <img src="https://creazilla-store.fra1.digitaloceanspaces.com/emojis/47298/check-mark-button-emoji-clipart-xl.png">
                <br>
                <br>
                <p><strong>Booking Date:</strong> <%= date%></p>

                <p><strong>Amount paid:</strong> <%= price%></p>
            </div>
            <div class="buttons">
                <button class="main-btn" onclick="login()"> Sign out</button> 
                <button class="main-btns" onclick="main()"> Explore More </button>

            </div>
        </div>

        <script>

            function main() {
                window.location.href = "mainpage.jsp?user=<%= user%>&role=<%= role%>";
            }
            function login() {
                window.location.href = "landingpage.jsp";
            }
        </script>
    </body>
</html>