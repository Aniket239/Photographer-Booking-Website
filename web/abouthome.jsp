<%-- 
    Document   : about
    Created on : 13 May, 2023, 11:58:27 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="stylesheet" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Space+Mono:wght@700&display=swap" rel="stylesheet">
        <style>
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }
            body{
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
                background-color: rgba(0, 0, 0, 0.174);
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

            .about-us{
                height: 900px;
                width: 100%;
                display: flex;
                justify-content: center;
                align-content: center;
                align-items: center;
                background-color: lightblue;
                background-size: cover;
            }

            .about{
                width: auto;
                margin: 0 auto;
                display: flex;
                align-items: center;
                justify-content: space-around;
            }
            .text{
                width: 80%;
            }
            .text h2{
                font-size: 90px;
                font-weight: 600;
                margin-bottom: 10px;

            }
            .text h5{
                font-size: 22px;
                font-weight: 500;
                margin-bottom: 20px;
            }
            span{
                color: #4070f4;
            }
            .text p{
                font-size: 18px;
                line-height: 25px;
                letter-spacing: 1px;
            }

            .contactdiv{
                margin-top: 30px;
            }
            .contact{
                font-size: 18px;
                background: #4070f4;
                color: white;
                text-decoration: none;
                border: none;
                padding: 10px 20px;
                border-radius: 6px;
                transition: 0.5s;
                font-family: 'Space Mono', monospace;
            }
            .contact:hover{
                background: darkblue;
                border: 1px solid #4070f4;
            }

            .about {
                display: flex;
                flex-wrap: nowrap;
                margin-left: 10%;
                margin-right: 10%;                
            }
            .aboutteam h1{
                color: black;
                font-size: 38px;
                text-align: center;
                margin: 50px 0 40px 0;
                font-family: 'Space Mono', monospace;
            }
            .aboutteam img{
                width:auto;
                height:400px;
                margin: 50px 0 50px 0;
            }

            .info{
                margin: 0 20% 0 20%;
            }

            h3{
                font-size: 32px;
                margin-bottom: 10px;
            }
            h2{
                font-size: 25px;
                margin-bottom: 15px;
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
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <!--<title> An About Us Page | CoderGirl </title>-->
        <!---Custom Css File!--->
        <link rel="stylesheet" href="style.css">

    </head>
    <body>
        <%
            String user = request.getParameter("user");
            String role = request.getParameter("role");
        %>
        <header>
            <div class="logo">
                <h1><button><a href="landingpage.jsp?" > Lenstory</a></button></h1>
            </div>
            <nav>
                <ul>              
                    <li><button><a href="landingpage.jsp">Home</a></button></li>
                    <li><button><a href="galleryhome.jsp">Gallery</a></button></li>
                    <li><button><a href="contacthome.jsp">Contact</a></button></li>
                </ul>
            </nav>
        </header>
        <section class="about-us">
            <div class="text">
                <h2>About Us</h2>
                <h5><span>Developer </span>& <span>Designer</span></h5>
                <p>Our photography website is the foreground of our business, it’s the first point of contact for fans or buyers. Even though every photographer envisions his/her website differently, some details should always be there.

                    Having worked with many photographers, I’ve noticed patterns in the way great websites are built and what contributes to their success (and try to always do the same in my work).

                    To help move you forward with your photography business goals and create an appealing website, I’ve compiled a list of 15 important photography ideas for your inspiration. They’re valid regardless of whether you’re just starting out as a photographer & looking for some guidance or simply need a photo website refresh</p>
                <div class="contactdiv">
                    <a href="contacthome.jsp" class="contact">Contact Us</a>
                </div>
            </div>
        </section>
        <div class="aboutteam">
            <h1>About Our Team </h1>
            <div class="about">
                <div class="image">
                    <img src=" https://images.squarespace-cdn.com/content/v1/59d55d412aeba54362e00bb1/1547328988541-D732YCKXID8578E23KGT/_DSC7599ashleebrookecrop.jpg?format=1000w.jpg">
                </div>
                <div class="info">
                    <h3>Aniket kumar Biswas</h3>
                    <h2>Web Designer & web Developer</h2>
                    <p> Aniket Kumar Biswas is a talented web designer and developer who creates stunning and functional websites. With a keen eye for detail, he blends creativity with technical skills to deliver tailored solutions for his clients. Aniket is proficient in programming languages and platforms such as HTML, CSS, JavaScript, and WordPress, and design tools like Adobe Photoshop and Sketch. He collaborates closely with his clients to understand their objectives and delivers websites that exceed their expectations. Choose Aniket for a website that stands out from the rest.</p>
                </div>
            </div>
            <div class="about">
                <div class="info">
                    <h3>Sohel Ali Mondal</h3>
                    <h2>Web Developer</h2>
                    <p>Sohel Ali Mondal is a skilled web developer specializing in designing and developing user-friendly websites using HTML, CSS, JavaScript, and other programming languages. With a keen eye for detail and a passion for creating stunning, responsive websites, he is dedicated to bringing his clients' visions to life. Sohel is a great communicator and a reliable team player who takes pride in delivering top-quality projects on time and on budget</p>
                </div>
                <div class="image">
                    <img src="https://i.pinimg.com/originals/40/00/d7/4000d7ed061f540a0180b6181184686d.jpg">

                </div>
            </div>
            <div class="about">
                <div class="image">
                    <img src=" https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg">
                </div>
                <div class="info">
                    <h3>Arindam Chanda</h3>
                    <h2>Presentation</h2>
                    <p>Arindam Chanda is an accomplished professional known for his innovative ideas and exceptional work ethic. He has worked for several well-known organizations and is respected for his ability to exceed expectations.Arindam has been recognized for his outstanding contributions to his field, receiving numerous awards and accolades. He is also actively involved in the community and committed to making a positive difference in the world.</p>
                </div>
            </div>
            <div class="about">
                <div class="info">
                    <h3>Ayan Das</h3>
                    <h2>Management</h2>
                    <p>Ayan Das is a management professional with a passion for leadership and problem-solving. Although he is just starting out in his career, he is eager to learn and grow in the field of management. With a positive attitude and a willingness to take on challenges, Ayan is ready to contribute to any organization that values teamwork, innovation, and results.</p>
                </div>
                <div class="image">
                    <img src="https://images.unsplash.com/photo-1507965613665-5fbb4cbb8399?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8ZGVlcCUyMG1lYW5pbmd8ZW58MHx8MHx8&w=1000&q=80.jpg">
                </div>
            </div>
            <div class="about">
                <div class="image">
                    <img src="https://images.unsplash.com/photo-1507965613665-5fbb4cbb8399?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8ZGVlcCUyMG1lYW5pbmd8ZW58MHx8MHx8&w=1000&q=80.jpg">
                </div>
                <div class="info">
                    <h3>Akasha Goshwami</h3>
                    <h2>Marketing</h2>
                    <p>Meet Akasha Goshwami, a dynamic and ambitious male marketer looking to make his mark in the industry. Despite being new to the field, Akasha possesses a natural talent for marketing and a willingness to learn. His fresh perspective and innovative ideas make him a valuable asset to any marketing team. Akasha has a keen eye for detail and is always striving for perfection in everything he does. With his excellent communication skills and analytical mindset, he's ready to take on any challenge and help your brand achieve its goals. Trust Akasha to deliver outstanding results and take your business to the next level.</p>
                </div>
            </div>
            <div class="about">

                <div class="info">
                    <h3>Debapatim Bera</h3>
                    <h2>Finance</h2>
                    <p>Debapatim Bera, and I have a passion for finance. As someone who loves working with numbers and analyzing data, I find the world of finance to be endlessly fascinating. I'm excited to learn more about this field and to see where my interest and dedication can take me in the future</p>
                </div>
                <div class="image">
                    <img src="https://images.unsplash.com/photo-1507965613665-5fbb4cbb8399?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8ZGVlcCUyMG1lYW5pbmd8ZW58MHx8MHx8&w=1000&q=80.jpg">
                </div>
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
