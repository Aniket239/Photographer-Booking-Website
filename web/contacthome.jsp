<%-- 
    Document   : contact_website
    Created on : 14 May, 2023, 2:44:29 PM
    Author     : sohel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link rel="stylesheet" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Space+Mono:wght@700&display=swap" rel="stylesheet">
        <title>Send Message</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            body{
                font-family: 'Space Mono', monospace;
                background-image: linear-gradient(rgba(0, 0, 0, 0.20), rgba(0, 0, 0, 0.20)), url("https://replicate.delivery/pbxt/l9StArMLsaLiOVCVOaFYeuBH4lFQRc5LTpQ2fTHDUzSRkH8QA/output.png");
                background-size: cover;
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

            /* Global styles */



            form{
                width: 600px;
                margin: 150px auto;
                padding: 50px 60px 50px 60px;
                border-radius: 25px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
                backdrop-filter: blur(20px);
                border:1px solid white;
                color:white;
                text-align: center:

            }
            h2{
                text-align: center;
                font-family: 'Space Mono', monospace;
            }

            .item{
                font-family: 'Space Mono', monospace;
                display: flex;
                flex-direction: column;
                margin: 30px 0 0 0;
                font-size: 18px;
            }
            .input{
                margin: 10px 0 0 0;
                height: 40px;
                border-radius: 5px;
                border:none;
                padding: 10px;
            }
            #message{
                height: 120px;
            }

            .buttons{
                display: flex;
                flex-direction: row;
                justify-content: center;
                margin: 40px 40px 40px 0;
            }
            .button{
                color: white;
                margin-top: 20px;
                font-weight: bold;
                background: transparent;
                width: 150px;
                padding: 10px 25px;
                font-size: 15px;
                border: 2px solid white;
                border-radius: 15px;
                transition: all 0.3s;
                text-align:center;
                cursor:pointer;
                font-family: 'Space Mono', monospace;
                margin-left: 50px;
            }
            .button:hover{
                background-color: green;
                color:black;
                transform: scale(1.1);
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
        <header >
            <div class="logo">
                <h1><button><a href="landingpage.jsp" > Lenstory</a></button></h1>
            </div>

            <nav>
                <ul>
                    <li><button><a href="landingpage.jsp">Home</a></button></li>
                    <li><button><a href="galleryhome.jsp">Gallery</a></button></li>
                    <li><button><a href="abouthome.jsp">About</a></button></li>
                </ul>
            </nav>
        </header>
        <form method="post" action="http://localhost:8080/photography/contact">
            <h2>Contact Us</h2>
            <div class="container">
                <input type="hidden" name="tbTo" value="lenstory.official@gmail.com">

                <div class="item">
                    <p> Email </p>
                    <input class="input" type="email" name="tbSubject" required="">
                </div>

                <input type="hidden" name="tbCC" value="lenstory.official@gmail.com" >

                <div class="item">
                    <p>Message </p>
                    <textarea class="input" id='message' name="taBody" required=""></textarea>
                </div>

                <input type="hidden" name="tbBCC" value="lenstory.official@gmail.com">

                <div class="buttons">
                    <input class="button" type="reset" value="Clear">
                    <input class="button" id='clear' type="submit" value="Send">
                </div>
            </div>
        </form>
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
                window.location.href = "privacypolicy.jsp";
            }
            function termOfUse() {
                window.location.href = "termsofuse.jsp";
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
