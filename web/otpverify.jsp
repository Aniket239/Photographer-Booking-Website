<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link rel="stylesheet" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Space+Mono:wght@700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Monoton&display=swap" rel="stylesheet">
        <title>Send Message</title>
        <style>
            body{
                background-color: white;
            }
            .wallpaper{
                background-image: url("https://replicate.delivery/pbxt/wxrezuHB0vwiS6dixCSMruXL2khRODyZ6c6DH2LWjX0MWMeQA/output.png");
                background-size: 100% 100%;
                background-repeat: no-repeat;
                width: 500px;
                height: 500px;
                position: fixed;
                right: 0;
                margin: 0 100px 0 0;
                z-index: -1;
            }
            form{
                width: 600px;
                margin:150px auto 0 200px;
                padding: 50px 20px 50px 20px;
                border-radius: 25px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
                backdrop-filter: blur(20px);
                border:1px solid white;
            }
            h1{
                text-align: center;
                font-family: 'Space Mono', monospace;
            }
            h4{
                font-family: 'Space Mono', monospace;
                text-align: center;
                margin: 10px 20px 10px 20px;
                font-size: 18px;
            }

            .item{
                margin-bottom: 51px;

            }

            .buttons{
                display: flex;
                flex-direction: row;
                justify-content: space-around;
                margin-left: 90%;
                margin-bottom: 40px;
                margin-top: 5%;
                font-family: 'Space Mono', monospace;
            }
            .button{
                color: black;
                margin-top: 5%;
                font-weight: bold;
                background: transparent;
                width: 150px;
                height: 45px;
                padding: 10px 35px;
                font-size: 15px;
                border: 2px solid black;
                border-radius: 15px;
                transition: all 0.3s;
                text-align:center;
                cursor:pointer;
                font-family: 'Space Mono', monospace;
                margin-left: 50px;
            }
            .button:hover{
                background-color: green;
                color: white;
                transform: scale(1.1);
            }
            .container{
                width: 50%;
                height: auto;
            }
            .items{
                display: flex;
                flex-direction: column;
                height: 100px;
                margin-top: 25px;
                width:100%;
            }
            p{
                margin-left: 85px;
                font-family: 'Space Mono', monospace;
            }
            #passwordCheck{
                height:10%;
            }
            .password{
                color:red;
            }
            .a{
                width: 150%;
                height: 40px;
                margin-left: 80px;
                border: 2px solid black;
                border-radius: 10px;
                padding: 10px;
            }
        </style>
    </head>
    <body>
        <%
            String otp = (String) request.getAttribute("otp");
            int otpnum = Integer.parseInt(otp);
            String email = (String) request.getAttribute("email");
            String status = (String) request.getAttribute("status");

        %>
        <div class="wallpaper"></div>
        <form action="http://localhost:8080/photography/verifyotp" method="post">
            <h1>OTP Verification</h1>
            <h4> 4-digit verification code has been sent to <%= email%>.</h4>
            <h4>The code is valid for 30 minutes.</h4>
            <div class="container">
                <div class="items">
                    <p> Enter OTP
                    </p>
                    <% if (status !=null && status.equals("wrong")) { %>
                    <div id="passwordCheck" style="display:block;">
                        <p class="password">Incorrect OTP!</p>
                    </div>
                    <% }%>
                    <br>
                    <br>
                    <input class="a" type="text" id="otp" name="tbTo" required="">
                    <input class="a" type="hidden" id="otp" name="otp" value="<%= otpnum%>" required="">
                </div>
                <div id="countdown"></div>
                <br>
                <br>
                <div class="buttons">
                    <input class="button" type="submit" value="OK">
                </div>
            </div>
        </form>

        <script>
            
        </script>

         </body>
</html>