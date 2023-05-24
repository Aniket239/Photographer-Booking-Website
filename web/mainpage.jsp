<%-- 
    Document   : mainpage
    Created on : 10 May, 2023, 12:49:25 AM
    Author     : HP
--%>

<%@page import="java.sql.Blob"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Photography Website</title>
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
            body {
                font-family: 'Roboto', sans-serif;
                font-size: 16px;
                background-color: #e7f0fa;
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
            main {
                margin: 0 auto;
            }
            .hero {
                background-image:linear-gradient(rgba(0, 0, 0, 0.10), rgba(0, 0, 0, 0.10)), url("https://replicate.delivery/pbxt/zfUdUJ1dpPXCQa3NUg6iDnzyCDjmEzvCvyHFGYiZPxCDbOeQA/output.png");
                filter:contrast(120%);
                background-size: 100% 100%;
                background-repeat: no-repeat;
                background-size: calc(100% 90%);
                height: 900px;
                background-position: center;
                color: #fff;
                box-shadow:0 0px 55px 1px #333333;
                border-radius: 0 0 40px 40px;

            }
            .heading{
                text-align: center;
            }
            .highlight{
                background-color: #53cdd1  ;
                -webkit-background-clip: text;
                -webkit-text-stroke-width: 2px;   
                -webkit-text-stroke-color: black;
            }
            .hero h2 {
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                -webkit-text-stroke-width: 2px;   
                -webkit-text-stroke-color: black; 
                padding-top:100px;
                padding-bottom: 14px;
                font-size: 5em;
                background: transparent;
                font-family: 'Space Mono', monospace;
            }

            .hero button {
                color: black  ;
                -webkit-background-clip: text;
                -webkit-text-stroke-width: 1px;   
                -webkit-text-stroke-color: white;
                margin: 370px 0 0 0;
                animation: glow 1s ease-in-out infinite alternate;
                font-size: 3em;
                font-family: 'Space Mono', monospace;
                cursor: pointer;
                position: relative;
                border: 2px solid white;
                border-radius: 20px;
                padding: 10px 20px;
                background: rgba(255,255,255,0.5);
                transition:0.3s ease-in-out;
            }
            .hero button:hover {
                transform: scale(1.03);

            }

            .gallery {
                font-family: 'Space Mono', monospace;
                padding-top:140px;
                display: flex;
                flex-wrap: wrap;
                flex-direction: row;
                align-items: stretch;
                justify-content: center;
            }

            .gallery h2 {
                font-size: 36px;
                margin: 10px 0 0 45px;
                padding-bottom: 30px;
                color: orangered;
                font-family: 'Space Mono', monospace;
                display: flex;
                flex-wrap: nowrap;
                justify-content: center;
            }

            .gallery-items {
                display: flex;
                flex-wrap: wrap;
                flex-direction: row;
                align-items: stretch;
                justify-content: center;
            }

            .gallery-item {
                margin: 10px 25px 50px 25px;
                background-color: #12659e;
                box-shadow: 0px 0px 20px rgba(0,0,0,1); 
                border-radius: 5px;
                overflow: hidden;
                transition:0.3s;
                width:330px;

            }

            .gallery-item img {
                width: 330px;
                height: 200px;
                object-fit: cover;
            }
            .gallery-item p{
                font-size: 18px;
                margin:0 10px 20px 20px;
                color:#bcf8ff ;
            }
            .gallery-item h3 {
                font-size: 24px;
                margin: 20px;
                color: #fece00 ;
            }
            .gallery-item:hover{
                box-shadow: 0px 0px 20px rgba(0,0,0,1);
                transition: 0.4s;
                transform: scale(1.1);
            }
            .more a{
                color: black;
                margin :50px 0 100px 48%;
                bottom: 100px;
                font-size: 25px;
                letter-spacing: 3px;
                font-family: 'Space Mono', monospace;
                transition-timing-function: cubic-bezier(0.25, 0.8, 0.25, 1);
                transition-duration: 400ms;
            }
            .more a:hover{
                color: #fff;
            }
            .mottoabout
            {
                padding: 20px 0 10px 0 ;
                display: flex;
                flex-direction: column;
                align-content: center;
                justify-content: center;
                background: #3d5173;
                border-radius: 50px;
                box-shadow: -50px 50px 60px -1px rgba(0, 0, 0, 0.75);
                margin: 2% 2% 2% 2%;
                background-position: center;
            }
            .motto-container {
                display: flex;
                flex-wrap: wrap;
                display: flex;
                flex-wrap: wrap;
                flex-direction: row;
                align-items: center;
                justify-content: space-around;
            }
            .motto {
                background-color:transparent;
                font-family: 'Space Mono', monospace;
                width: 400px;
                word-spacing: 5px;
                font-size: 20px;
                font-weight: bold;
                border-radius: 20px;
                justify-content: space-around;
                padding-bottom: 10px;

            }
            .motto h2{
                color: #fa5620 ;
                text-align: center;
                padding: 10px 20px 20px 20px;
            }
            .motto p{
                padding:  20px 50px 20px 50px;
                color: white;
            }
            .motto img{
                padding-top: 20px;
                padding-left:30%;         
            }
            .about {
                font-family: 'Space Mono', monospace;
                padding-bottom:  40px;
                text-align: center;
                border-radius: 20px 20px 0 0;
            }
            .about a{
                color: black;
                background-color: #fa5e24;
                padding: 10px 20px 10px 20px;
                border: 3px solid black;
                border-radius: 20px;
                font-family: 'Space Mono', monospace;
                transition-timing-function: cubic-bezier(0.25, 0.8, 0.25, 1);
                transition-duration: 400ms;
                transition-property: color;
            }
            .about a:hover{
                color: white;
            }
            .about h2 {
                font-size: 36px;
                margin: 0;
                color: #fa5620 ;
            }

            .about p {
                font-size: 20px;
                padding:  20px 50px 40px 50px;
                color: white;
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
                background-color: transparent;
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
            #scroll-to-top {
                position: fixed;
                bottom: 20px;
                right: 20px;
                padding: 10px;
                border: none;
                margin:0 auto;
                background-color:transparent;
                color: #fff;
                cursor: pointer;
                left:49%;
                right:48.8%;
                border-radius: 25px;
            }
            #scroll-to-top span {
                display: block;
                width: 20px;
                height: 20px;
                opacity:1;
                border-top: 3px solid white;
                border-right: 3px solid white;
                transform: rotate(-45deg);
            }

        </style>
    </head>
    <body>
        <%
            String user = (String) request.getAttribute("user");
            String role = (String) request.getAttribute("role");
            String user1 = request.getParameter("user");
            String role1 = request.getParameter("role");
            if (user == null) {
                user = user1;
                role = role1;
            }
        %>

        <header >
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
        <main>
            <section class="hero">

                <div class="heading">
                    <h2>Welcome To <span class="highlight"> Lenstory</span></h2>
                    <button class="btn" id="explore-pg-btn" onclick="scrollToSection()">Get Started</button>
                </div>
            </section>
            <section id="pg" class="gallery">
                <h2>Our Photographers</h2>
                <div class="gallery-items">
                    <div class="gallery-item">
                        <a href="pg-page.jsp?name=Joseph Radhik&address=Mumbai in Maharashtra, IN&user=<%= user%>&role=<%= role%>">
                            <img src="https://wpja.s3.us-east-2.amazonaws.com/s3fs-public/styles/tile_portrait_small__450x112_5_/public/images/portraits/RM209395.jpg?itok=g-IW5V0T" >
                            <h3>Joseph Radhik</h3>
                            <p>Mumbai in Maharashtra, IN</p>
                        </a>
                    </div>
                    <div class="gallery-item">
                        <a href="pg-page.jsp?name=Nitika Bhasin&address=Mumbai in Maharashtra, IN&user=<%= user%>&role=<%= role%>">
                            <img src="https://wpja.s3.us-east-2.amazonaws.com/s3fs-public/styles/tile_portrait_small__450x112_5_/public/images/portraits/Wedding-Photographer-Nitika-Bhasin.jpg?itok=ibYCh24i">
                            <h3>Nitika Bhasin</h3>
                            <p>Mumbai in Maharashtra, IN</p>
                        </a>
                    </div>
                    <div class="gallery-item">
                        <a href="pg-page.jsp?name=Sujith Kumar&address=Chennai in Tamil Nadu, IN&user=<%= user%>&role=<%= role%>">
                            <img src="https://wpja.s3.us-east-2.amazonaws.com/s3fs-public/styles/tile_portrait_small__450x112_5_/public/images/portraits/MF3A6278.jpg?itok=2cljU8Vc">
                            <h3>Sujith Kumar</h3>
                            <p>Chennai in Tamil Nadu, IN</p>
                        </a>

                    </div>
                    <div class="gallery-item">
                        <a href="pg-page.jsp?name=Nitin Dangwal&address=New Delhi, IN&user=<%= user%>&role=<%= role%>">
                            <img src="https://wpja.s3.us-east-2.amazonaws.com/s3fs-public/styles/tile_portrait_small__450x112_5_/public/images/portraits/Nitin-Dangwal-Shutterink-Top-India-Wedding-Photographer.jpg?itok=CGpsraJB">
                            <h3>Nitin Dangwal</h3>
                            <p>New Delhi, IN</p>
                        </a>
                    </div>
                    <div class="gallery-item">
                        <a href="pg-page.jsp?name=Shivali Chopra&address=Chennai in Tamil Nadu, IN&user=<%= user%>&role=<%= role%>">
                            <img src="https://www.fearlessphotographers.com/images/photogs/shivali-chopra-bio-6410.jpg">
                            <h3>Shivali Chopra</h3>
                            <p>New Delhi, IN</p>
                        </a>
                    </div>
                    <div class="gallery-item">
                        <a href="pg-page.jsp?name=Tej Nookala&address=Bangalore, IN&user=<%= user%>&role=<%= role%>">
                            <img src="https://www.fearlessphotographers.com/images/photogs/Tej-Nookala.jpg">
                            <h3>Tej Nookala</h3>
                            <p> Bangalore, IN
                            </p>
                        </a>
                    </div>
                    <div class="gallery-item">
                        <a href="pg-page.jsp?name=Tuhina Chopra&address=New Delhi, IN&user=<%= user%>&role=<%= role%>">
                            <img src="https://www.fearlessphotographers.com/images/photogs/tuhina-chopra-bio-9190.jpg">
                            <h3>Tuhina Chopra</h3>
                            <p>New Delhi, IN</p>

                        </a>
                    </div>
                    <div class="gallery-item">
                        <a href="pg-page.jsp?name=Sanoj Kumar&address=Kerala,IN&user=<%= user%>&role=<%= role%>">
                            <img src="https://www.fearlessphotographers.com/images/photogs/sanoj-kumar-bio-4295.jpg">
                            <h3>Sanoj Kumar</h3>
                            <p> Kerala,IN</p>
                        </a>

                    </div>
                    <div class="gallery-item">
                        <a href="pg-page.jsp?name=Rish Agarwal&address=Delhi, IN&user=<%= user%>&role=<%= role%>">
                            <img src="https://wpja.s3.us-east-2.amazonaws.com/s3fs-public/styles/square_profile/public/images/portraits/Rish%20Agarwal%20Wedding%20Photographer.jpeg?itok=Rx9JODB5">
                            <h3>Rish Agarwal</h3>
                            <p> Delhi, IN</p>
                        </a>
                    </div>
                    <div class="gallery-item">
                        <a href="pg-page.jsp?name=Geeshan Bandara&address=Dubai, UAE&user=<%= user%>&role=<%= role%>">
                            <img src="https://wpja.s3.us-east-2.amazonaws.com/s3fs-public/styles/square_profile/public/images/portraits/20210623_181520.jpg?itok=nyLPlca-">
                            <h3>Geeshan Bandara</h3>
                            <p>Dubai, UAE</p>
                        </a>
                    </div>
                </div>
            </section>
            <div class='more'>
                <a href="mainpage2.html">More</a>
            </div>
            <div class="mottoabout">
                <div class="motto-container">
                    <div class="motto">
                        <img src="https://img.icons8.com/bubbles/200/null/compact-camera.png"/>                       
                        <h2>Capturing Life's Moments</h2>
                        <p> "The best thing about a picture is that it never changes, even when the people in it do." - Andy Warhol</p>
                    </div>
                    <div class="motto" >
                        <img src="https://img.icons8.com/bubbles/200/null/stack-of-photos.png"/>
                        <h2>Preserving Memories</h2>
                        <p>"Photography takes an instant out of time, altering life by holding it still." - Dorothea Lange</p>
                    </div>
                    <div class="motto" >
                        <img src="https://img.icons8.com/bubbles/200/null/aperture.png"/>
                        <h2>Seeing the World Through a Lens</h2>
                        <p>"Photography is the story I fail to put into words." - Destin Sparks</p>
                    </div>
                </div>

                <div class="about">
                    <h2>About Us</h2>
                    <p>We have passionate photographers who love to capture the beauty of the world. We travel to different places to capture the moments that take our breath away. We are dedicated to providing you with the best photos that you can treasure forever.</p>
                    <a href="contact.jsp">Contact Us</a>
                </div>
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
        </main>

        <button id="scroll-to-top">
            <span></span></button>
        <script>
            function scrollToSection() {
                const section = document.getElementById('pg');
                section.scrollIntoView({behavior: 'smooth'});
            }
            const scrollToTopButton = document.getElementById('scroll-to-top');
            window.onscroll = function () {
                if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                    scrollToTopButton.style.display = 'block';
                } else {
                    scrollToTopButton.style.display = 'none';
                }
            };
            scrollToTopButton.addEventListener('click', function () {
                window.scrollTo({
                    top: 0,
                    behavior: "smooth"
                });
            });

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

