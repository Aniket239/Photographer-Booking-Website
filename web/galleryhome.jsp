<%-- 
    Document   : gallery
    Created on : 14 May, 2023, 12:01:28 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Gallery</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Space+Mono:wght@700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Monoton&display=swap" rel="stylesheet">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            /* Global styles */
            body {
                font-family: 'Roboto', sans-serif;
                font-size: 16px;
                background-color: #ebe2cd;
            }
            a {
                text-decoration: none;
                color: #333;
            }
            header {
                background-color: transparent;
                height:11%;
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
                background-color: rgba(255, 255, 255, 0.274);
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
                color: #60422b;
                font-family: 'Space Mono', monospace;
                font-weight: bold;
                transition: 0.4s;
            }
            .logo h1 a:hover{
                cursor: pointer;
                transition: 0.4s;
                color: #284041;

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
                color: #60422b;

            }
            header nav ul li a:hover {
                transition: 0.4s;
                color: #284041 ;
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
                background-color: red;
                transition-timing-function: cubic-bezier(0.25, 0.8, 0.25, 1);
                transition-duration: 400ms;
                transition-property: width, left;
            }
            .tools{
                margin-top: 50px;
                display:flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                align-content: center;
            }
            .tools h1 {
                font-family: 'Space Mono', monospace;
                font-size:50px;
                margin-top:50px;
                color: #60422b;
            }
            .tools h2 {
                font-family: 'Space Mono', monospace;
                font-size:40px;
                margin-top:20px;
                color: #8f6d54;
            }
            .row {
                background-color: #F5ECD7;
                display: flex;
                flex-wrap: wrap;
                padding: 20px 120px 0 120px;
            }
            .column {
                flex: 25%;
                max-width: 25%;
                padding: 10px;
            }

            .column img {
                border:10px solid white;
                margin-top: 20px;
                vertical-align: middle;
                display: block;
                transition: 3s ease-in-out;
                transition: transform 0.5s, filter 0.5s;
            }

            .column img:hover {
                border:10px solid white;
                transition: 0.3s ease-in-out;
                transform: scale(1.03);
                transition: transform 0.5s, filter 0.5s;
                box-shadow: 0 0 20px 0.01px black;

            }
            @media (max-width: 1500px) {
                .column {
                    flex: 50%;
                    max-width: 25%;
                }
            }
            @media (max-width: 1000px) {
                .column {
                    flex: 100%;
                    max-width: 100%;
                }
            }

            footer {
                display: flex;
                flex-wrap: wrap;
                flex-direction: row;
                align-content: center;
                align-items: center;
                justify-content: center;
                background-color:  #3e4f5a;;
                padding: 40px 60px 40px 70px;
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
                    <li><button><a href="abouthome.jsp">About</a></button></li>
                    <li><button><a href="contacthome.jsp">Contact</a></button></li>
                </ul>
            </nav>
        </header>
        <div class="tools">
            <h1> Gallery</h1>
            <h2>Our Top Picks</h2>
        </div>
        <div class="row">
            <div class="column">
                <img src="https://images.pexels.com/photos/15185102/pexels-photo-15185102.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load.jpg" style="width:100%">
                <img src="https://images.pexels.com/photos/16407235/pexels-photo-16407235.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load.jpg" style="width:100%">
                <img src="https://images.pexels.com/photos/5546810/pexels-photo-5546810.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load.jpg" style="width:100%">
                <img src="https://images.pexels.com/photos/15561915/pexels-photo-15561915.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load.jpg" style="width:100%">
            </div>

            <div class="column">
                <img src="https://images.pexels.com/photos/16237228/pexels-photo-16237228.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load.jpg" style="width:100%">
                <img src="https://images.pexels.com/photos/4738517/pexels-photo-4738517.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load.jpg" style="width:100%">
                <img src="https://images.pexels.com/photos/12909596/pexels-photo-12909596.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load.jpg" style="width:100%">
                <img src="https://images.pexels.com/photos/9116510/pexels-photo-9116510.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load.jpg" style="width:100%">
            </div> 

            <div class="column">
                <img src="https://images.pexels.com/photos/14245756/pexels-photo-14245756.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load.jpg" style="width:100%">
                <img src="https://images.pexels.com/photos/16447264/pexels-photo-16447264.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load.jpg" style="width:100%">
                <img src="https://images.pexels.com/photos/2775861/pexels-photo-2775861.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load.jpg" style="width:100%">
                <img src="https://images.pexels.com/photos/7763201/pexels-photo-7763201.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load.jpg" style="width:100%">
            </div>

            <div class="column">
                <img src="https://images.pexels.com/photos/15895540/pexels-photo-15895540.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load.jpg" style="width:100%">
                <img src="https://images.pexels.com/photos/16022624/pexels-photo-16022624.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=loadjpg" style="width:100%">
                <img src="https://images.pexels.com/photos/13445491/pexels-photo-13445491.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load.jpg" style="width:100%">
                <img src="https://images.pexels.com/photos/6692160/pexels-photo-6692160.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load.jpg" style="width:100%">
            </div>
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
            function scrollToSection() {
                const section = document.getElementById('pg');
                section.scrollIntoView({behavior: 'smooth'});
            }

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
                window.location.href = "privacypolicyhome.jsp";
            }
            function termOfUse() {
                window.location.href = "termsofusehome.jsp";
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

