<%-- 
    Document   : payment
    Created on : 14 May, 2023, 2:27:03 PM
    Author     : sohel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link rel="stylesheet" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Space+Mono:wght@700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@500&family=Raleway&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">

        <title>Payment Page</title>
        <style> 
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                background-image: linear-gradient(rgba(0, 0, 0, 0.10), rgba(0, 0, 0, 0.10)), url("https://replicate.delivery/pbxt/1z2yHGWCd74mJpWK9mXiZPCT9MPJWKDzFBCJhkmWOdFXRJPE/output.png");
                background-size: cover;
                background-repeat: no-repeat;
            }
            a {
                text-decoration: none;
                color: #333;
            }
            header {
                background-color: transparent;
                height:15%;
                width:100%;
                display: flex;
                flex-wrap: nowrap;
                position:fixed;
                align-items: center;
                padding: 20px 50px;
                position:fixed;
                z-index: 1;
                top: 0;  
                transition: background-color 0.35s ease-in-out;
                justify-content: space-between;

            }
            header.scrolled {
                background-color: rgba(0, 0, 0, 0.074);
                width:100%;
                display: flex;
                position:fixed;
                align-items: center;
                padding: 20px 50px;
                border-bottom:1px solid white;
                position:fixed;
                z-index: 1;
                top: 0; 
                transition: background-color 0.5s ease-in-out;
                justify-content: space-between;
                backdrop-filter: blur(30px);
                box-shadow:0 10px 55px 1px #333333; 

            }
            .logo h1{
                text-align: center;
                margin-top: 20px;
            }
            .logo h1 a {
                font-size: 30px;
                color: white;
                font-family: 'Space Mono', monospace;
                font-weight: bold;
                transition: 0.4s;
            }
            .logo h1 a:hover{
                cursor: pointer;
                transition: 0.4s;
            }
            nav ul {
                display: flex;
                list-style: none;
                margin: 0;
                padding: 0;
                font-family: 'Space Mono', monospace;
            }
            nav ul li {
                margin: 0 10px;
            }
            nav ul li a {
                font-size: 20px;
                letter-spacing: 1px;
                transition: 0.4s;
                color: white;

            }
            header nav ul li a:hover {
                transition: 0.4s;
            }
            header button {
                font-size: 25px;
                font-weight: bold;
                font-family: 'Space Mono', monospace;
                cursor: pointer;
                position: relative;
                border: none;
                background: none;
                transition-timing-function: cubic-bezier(0.25, 0.8, 0.25, 1);
                transition-duration: 400ms;
                transition-property: color;
            }
            header button:focus,
            header button:hover {
                transition: 0.3s ease-in-out;
                transform: scale(1.1);
            }
            header button:focus:after,
            header button:hover:after {
                width: 100%;
                left: 0%;
            }
            header button:after {
                content: "";
                pointer-events: none;
                bottom: -2px;
                left: 50%;
                position: absolute;
                width: 0%;
                height: 3px;
                background-color: white;
                transition-timing-function: cubic-bezier(0.25, 0.8, 0.25, 1);
                transition-duration: 400ms;
                transition-property: width, left;
            }
            .form{
                width: 100%;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-content: center;
                align-items: center;
                margin: 150px 0 80px 0;
            }
            form {
                width: 550px;
                height: 600px;
                padding: 60px 40px 0px 40px;
                border-radius: 25px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
                backdrop-filter: blur(20px);
                border:1px solid white;
                color:white;
            }
            h1{
                margin-bottom: 30px;
                text-align: center;
                color: white;
                font-family: 'Space Mono', monospace;
            }
            label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
                margin-left:3%;
                font-family: 'Space Mono', monospace;
            }
            input[type="text"], input[type="number"] {
                padding: 10px;
                border-radius: 5px;
                border: 1px solid #ccc;
                width: 90%;
                margin-bottom: 20px;
                font-size: 16px;
                color: #555;
                margin-left:3%;
            }
            input[type="text"]:focus, input[type="number"]:focus {
                box-shadow: 0 0 5px rgba(0,0,0,0.1);
            }
            .btn {
                background-color: #4CAF50;
                color: #fff;
                padding: 10px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                width: 40%;
                font-size: 18px;
                margin-top: 15px;
                margin-left:32%;
                transition: 0.3s ease-in-out;
            }
            .btn:hover {
                background-color: #3e8e41;
            }
            .expiry-inputs{
                overflow: hidden;/* Makes this div contain its floats */
                display: grid;
                grid-template-columns: repeat(2, 2fr);
            }
            .half-width{
                margin-left: 10px;
            }
            .cvv label{
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
                margin-left:4%;
                font-family: 'Space Mono', monospace;
            }
            .date{
                margin-left: 10px;
            }
            .sdate{
                height: 30px;
                width: 30%;
                border: none;
                border-radius: 3px;
                padding: 5px 0 5px 7px;
            }

            #month{
                height: 30px;
                width: 30%;
                border: none;
                border-radius: 3px;
                padding: 5px 0 5px 7px;
                margin: 0 0 0 6px;
            }
            #year{
                height: 30px;
                width: 30%;
                border: none;
                border-radius: 3px;
                padding: 5px 0 5px 7px;
            }
            #cvv{
                height: 30px;
                width: 80%;
                border: none;
                border-radius: 3px;
                padding: 5px 0 5px 7px;
            }
            .d{
                width: 100%;
                border: none;
                border-radius: 3px;
                padding: 5px 0 5px 7px;   
                margin: 10px 0 0 4px;
            }

            #dob{
                height: 30px;
                width: 60%;
                border: none;
                border-radius: 3px;
                padding: 5px 0 5px 7px;
                margin: 0 0 0 6px;
            }

            .iconfoot{
                background-color: rgba(0,0,0,0.5);
                padding: 30px 0 0 0;
            }
            .social-icons {
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .social-icons a {
                display: inline-block;
                margin: 0 10px;
                font-size: 24px;
            }

            .social-icons a:hover {
                border-radius: 50%;
                transform: scale(1.2);
            }
            footer {
                display: flex;
                flex-wrap: wrap;
                flex-direction: row;
                align-content: center;
                align-items: center;
                justify-content: center;
                background-color: rgba(0,0,0,0.5);
                padding: 40px 60px 40px 70px;
                margin: 20px 0 0 0;
                color: rgba(232,210,169,255);
                text-align: center;
            }

            footer button{
                font-size: 15px;
                margin:0 40px 0 40px;
                color: orangered;
                font-weight: bold;
                font-family: 'Space Mono', monospace;
                cursor: pointer;
                border: none;
                background: none;
                transition-timing-function: cubic-bezier(0.25, 0.8, 0.25, 1);
                transition-duration: 400ms;
                transition-property: color;

            }
            footer button:hover{
                color:white;
            }


        </style>
    </head>
    <body>
        <%
            String user = request.getParameter("user");
            String name = request.getParameter("name");
            String role = request.getParameter("role");
            String price = request.getParameter("price");
        %>
        <header>
            <div class="logo">
                <h1><button><a href="mainpage.jsp?user=<%= user%>&role=<%= role%>" > Lenstory</a></button></h1>
            </div>
            <nav>
                <ul>
                    <li><button><a href="landingpage.jsp">Home</a></button></li>
                    <li><button><a href="gallery.jsp?user=<%= user%>&role=<%= role%>">Gallery</a></button></li>
                    <li><button><a href="about.jsp?user=<%= user%>&role=<%= role%>">About</a></button></li>
                    <li><button><a href="contact.jsp?user=<%= user%>&role=<%= role%>">Contact</a></button></li>
                    <li><button><a href="profile.jsp?user=<%= user%>&role=<%= role%>">Profile</a></button></li>
                </ul>
            </nav>
        </header>
        <div class="form">
            <form action="http://localhost:8080/photography/showpayment.jsp" >
                <input type="hidden"  name="price"  value="<%= price%>">
                <input type="hidden"  name="user"  value="<%= user%>">
                <input type="hidden"  name="role"  value="<%= role%>">
                <h1> Payment</h1>
                <label for="cardholder">Cardholder Name:</label>
                <input type="text" id="cardholder" name="cardholder"  placeholder="Enter Your Name"required>
                <label for="cardnumber">Card Number:</label>
                <input type="number" id="cardNumber" placeholder="Enter card number" required>
                <div class="expiry-inputs">
                    <div class="date">
                        <label>Expiration Date:</label>
                        <select class="sdate" id="month">
                            <option value="">Month</option>
                            <option value="01">01</option>
                            <option value="02">02</option>
                            <option value="03">03</option>
                            <option value="04">04</option>
                            <option value="05">05</option>
                            <option value="06">06</option>
                            <option value="07">07</option>
                            <option value="08">08</option>
                            <option value="09">09</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                        </select>
                        <select  id="year">
                            <option value="">Year</option>
                            <option value="23">2023</option>
                            <option value="24">2024</option>
                            <option value="25">2025</option>
                            <option value="26">2026</option>
                            <option value="27">2027</option>
                            <option value="28">2028</option>

                        </select>
                    </div>

                    <div class="cvv">
                        <label>CVV:</label>
                        <input type="password" id="cvv" name="cvv" class="half-width" placeholder="XXX" required maxlength="3">

                    </div>

                    <div class="d">
                        <label  for="Booking-date">Booking-date</label>
                        <input type="date" id="dob" name="DOB"  required>
                    </div>
                </div>
                <br>
                <br>
                <button class="btn" type="submit">Pay <%= price%>  </button>
            </form>
        </div>
        <div class="iconfoot">
            <div class="social-icons">
                <a href="#" id="facebook"><img src="https://img.icons8.com/color/48/null/facebook-new.png"/></a>
                <a href="#" id="twitter"><img src="https://img.icons8.com/color/48/null/twitter--v1.png"/></a>
                <a href="#" id="instagram"><img src="https://img.icons8.com/fluency/48/null/instagram-new.png"/></a>
            </div>
            <footer>

                <button onclick="termOfUse()"> Terms of use</button>
                <p>&copy; 2023 Lenstory</p> 
                <button onclick="pripol()"> Privacy policy</button>
            </footer>
        </div>
        <script>

            const header = document.querySelector('header');
            window.addEventListener('scroll', () => {
                if (window.scrollY > 0) {
                    header.classList.add('scrolled');
                } else if (window.scrollY === 0) {
                    header.classList.remove('scrolled');
                    header.classList.add('header');
                } else {
                    header.classList.remove('scrolled');
                    header.classList.add('header');
                }
            });
            function pripol() {
                window.location.href = "privacypolicy.jsp?user=<%= user%>&role=<%= role%>";
            }
            function termOfUse() {
                window.location.href = "termsofuse.jsp?user=<%= user%>&role=<%= role%>";
            }

            const facebookLink = document.getElementById("facebook");
            const twitterLink = document.getElementById("twitter");
            const instagramLink = document.getElementById("instagram");


            facebookLink.addEventListener("click", function () {
                window.open("https://www.facebook.com/");
            });

            twitterLink.addEventListener("click", function () {
                window.open("https://twitter.com/");
            });

            instagramLink.addEventListener("click", function () {
                window.open("https://www.instagram.com/");
            });

        </script>
         </body>
</html>
