<%-- 
    Document   : landingpage
    Created on : 14 May, 2023, 12:03:10 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Photographer Booking Website</title>
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
                margin: 0;
                padding: 0;
                font-family: Arial, sans-serif;
                font-size: 16px;
                line-height: 1.5;
                background-color: #c2e3ec;
                color: #333;
            }

            /* Header */
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
                color: dodgerblue;
                font-family: 'Space Mono', monospace;
                font-weight: bold;
                transition: 0.4s;
            }
            .logo h1 a:hover{
                cursor: pointer;
                transition: 0.4s;
            }
            header.scrolled .logo h1 a {
                font-size: 30px;
                color: white;
                font-family: 'Space Mono', monospace;
                font-weight: bold;
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
            /* Main content */
            main {

            }

            .hero {
                background-image: linear-gradient(rgba(0, 0, 0, 0.10), rgba(0, 0, 0, 0.10)), url("https://replicate.delivery/pbxt/dtntDci7fs2QCyvL2N7yX96iCaKQz9LodStRo9o1urgeXIehA/output.png");
                filter:contrast(120%);
                background-size: 100% 100%;
                background-repeat: no-repeat;
                height:900px;
                background-position: center;
                color: #fff;
                box-shadow:0 0px 55px 1px #333333;
                border-radius: 0 0 40px 40px;

            }
            .heading{
                font-family: 'Space Mono', monospace;

            }
            .highlight{
                background-color: black  ;
                -webkit-background-clip: text;
                -webkit-text-stroke-width: 2px;   
                -webkit-text-stroke-color: white;
            }
            .hero h2 {
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                -webkit-text-stroke-width: 2px;   
                -webkit-text-stroke-color: black;
                margin-left: 2%;
                padding-top:200px;
                padding-bottom: 14px;
                font-size: 4em;
                background: transparent;
                font-family: 'Space Mono', monospace;
            }

            .hero p {
                font-size: 2em;
                margin-left: 4%;
                margin-top: 100px ;
                padding-bottom:5px;
                font-family: 'Space Mono', monospace;
                color: black;
            }

            .hero button {
                color: black;
                margin-left: 13%;
                margin-top: 10px;
                animation: glow 1s ease-in-out infinite alternate;
                font-size: 2.2vw;
                font-family: 'Space Mono', monospace;
                cursor: pointer;
                position: relative;
                border: 2px solid black;
                border-radius: 20px;
                padding: 10px 20px;
                background: rgba(255,255,255,0.5);
                transition:0.3s ease-in-out;
            }
            .hero button:hover {
                color: black;
                transition: 0.3s ease-in-out;
                transform: scale(1.03);


            }


            #services {
                padding-top:140px;
                margin-top: 40px;
                text-align: center;

            }

            #services h3 {
                font-size: 50px;
                margin-bottom: 20px;
                font-family: 'Space Mono', monospace;
                color: black;


            }
            .service-cards{
                display:flex;
                flex-wrap: wrap;
                align-content: center;
                justify-content: center;
                align-items: center;
                flex-direction: row;
            } 

            .service-card1 {
                background-image:linear-gradient(rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0.15)), url("https://assets.vogue.in/photos/5f3e60a418ed58cd147adc28/2:3/w_1280,c_limit/Wedding%20photography.jpg");
                background-size: cover;
                background-position: center;
                margin: 35px;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0px 0px 20px 1px  #535353;
                text-align: center;
                width: 400px;
                height:600px;
            }
            .service-card2 {
                background-image:linear-gradient(rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0.15)), url("https://images.pexels.com/photos/4312847/pexels-photo-4312847.jpeg?auto=compress&cs=tinysrgb&w=400.jpg");
                background-size: cover;
                background-position: center;
                margin: 35px;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0px 0px 20px 1px  #535353;
                text-align: center;
                width: 400px;
                height:600px;
            }
            .service-card3 {
                background-image:linear-gradient(rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0.15)), url("https://i.pinimg.com/564x/d0/e4/b2/d0e4b2b67a63392ba2a4a9d4845bd6c3.jpg");
                background-size: cover;
                background-position: center;
                margin: 35px;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0px 0px 20px 1px  #535353;
                text-align: center;
                width: 400px;
                height:600px;
            }
            .service-card4 {
                background-image:linear-gradient(rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0.15)), url("https://images.pexels.com/photos/1540406/pexels-photo-1540406.jpeg?auto=compress&cs=tinysrgb&w=1600.jpg");
                background-size: cover;
                background-position: center;
                margin: 35px;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0px 0px 20px 1px  #535353;
                text-align: center;
                width: 400px;
                height:600px;
            }
            .service-card5 {
                background-image:linear-gradient(rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0.15)), url("https://images.unsplash.com/photo-1599360889420-da1afaba9edc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Y29tbWVyY2lhbCUyMHBob3RvZ3JhcGh5fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60.jpg");
                background-size: cover;
                background-position: center;
                margin: 35px;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0px 0px 20px 1px  #535353;
                text-align: center;
                width: 400px;
                height:600px;
            }
            .service-card h4 {
                font-size: 24px;
                margin: 170px 0 30px 0;
                color:#ff6600;
                font-family: 'Space Mono', monospace;
                color:white;
            }

            .service-card p {
                font-size: 16px;
                color: white;
                line-height: 1.5;
                margin-bottom:  25px;
                line-height: 2;

            }
            .service-card button{
                margin-bottom:  15px;
                display: inline-block;
                padding: 10px 20px;
                border-radius: 20px;
                background-color: rgba(255, 255, 255, 0.2);
                color: #fff;
                text-decoration: none;
                font-size: 15px;
                border:2px solid white;
                transition: all 0.3s ease;
            }

            .service-card button:hover {
                background-color: white;
                color:black;
            }

            #reviews {
                margin-top: 60px;
                text-align: center;
            }

            #reviews h3 {
                font-size: 30px;
                margin-bottom: 40px;
            }

            .review-cards {
                display: flex;
                justify-content: space-around;
                margin: 0 0 70px 0;

            }

            .review-card {
                background-color: rgba(255, 255, 255, 0.5);
                width: 300px;
                height: 200px;
                box-shadow: 0px 0px 20px 1px  #c5c5c5;
                padding: 20px;
                border-radius: 20px;
                border:none;
                margin:0 30px 0 30px;
            }

            .review-author {
                margin-top: 20px;
                color: black;
            }
            .review-text p{
                color: black;

            }
            .stars {
                font-size: 24px;
                color: #f1c40f;
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
                color:#ff6600;
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
                color:#ff6600;
            }

            .about p {
                font-size: 20px;
                padding:  20px 50px 40px 50px;
                color: white;
            }
            #contact {
                margin: 40px 0 20px 0 ;
                text-align: center;

            }

            #contact h3 {
                font-family: 'Space Mono', monospace;
                font-size: 30px;
                margin-bottom: 20px;
                color:#ff6600;
            }

            #contact p {
                font-size: 18px;
                margin-bottom: 30px;
                color:white;
            }

            .contact-button {
                display: inline-block;
                padding: 10px 20px;
                border-radius: 20px;
                background-color: #ff6600;
                color: #fff;
                text-decoration: none;
                font-size: 20px;
                border:2px solid white;
                transition: all 0.3s ease;
            }

            .contact-button:hover {
                background-color: white;
                color:black;
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
        </style>
    </head>
    <body>

        <header >
            <div class="logo">
                <h1><button><a href="landingpage.jsp" > Lenstory</a></button></h1>
            </div>
            <nav>
                <ul>
                    <li><button><a href="gallery.jsp">Gallery</a></button></li>
                    <li><button><a href="about.jsp">About</a></button></li>
                    <li><button><a href="contact.jsp">Contact</a></button></li>
                </ul>
            </nav>
        </header>

        <main>
            <div  class="hero">
                <div class="heading">
                    <h2>Welcome To <span class="highlight"> Lenstory</span></h2>
                    <p>Every picture has a story to tell</p><br><br><br><br>
                    <button class="btn" id="explore-pg-btn" onclick="scrollToSection()">Get Started</button>
                </div>
            </div>
            <section id="services">
                <h3>Our Services</h3>
                <div class="service-cards">
                    <div class="service-card1">
                        <div class="service-card">
                            <h4>Wedding Photography</h4>
                            <p>Our wedding photography service captures the memories of your special day with beautiful, high-quality images. We offer customizable packages to fit your needs and budget.</p>
                            <button onclick="firstpage()">Learn More</button>
                        </div>
                    </div>
                    <div class="service-card2">
                        <div class="service-card">
                            <h4>Portraits</h4>
                            <p>Our portrait photography service creates stunning images that showcase your personality and style. Whether you need headshots for your business or family portraits, we'll work with you to create the perfect shot.</p>
                            <button onclick="firstpage()">Learn More</button>
                        </div>
                    </div>
                    <div class="service-card3">
                        <div class="service-card">
                            <h4>Travel Photography</h4>
                            <p>Our travel photography service captures the beauty and essence of the places you visit. From stunning landscapes to vibrant cityscapes, our photos will transport you back to your favorite destinations.</p>
                            <button onclick="firstpage()">Learn More</button>
                        </div>
                    </div>
                    <div class="service-card4">
                        <div class="service-card">
                            <h4>Event Photography</h4>
                            <p>Capture your event's essence with our stunning photography. We'll provide you with a visual record that captures the memories of your special occasion.</p>
                            <button onclick="firstpage()">Learn More</button>
                        </div>
                    </div>
                    <div class="service-card5">
                        <div class="service-card">
                            <h4>Commercial Photography</h4>
                            <p>Elevate your brand with our stunning commercial photography. We'll help you showcase your products, services, and people in the best possible light, creating images that tell your brand's story and message.</p>
                            <button onclick="firstpage()">Learn More</button>
                        </div>
                    </div>

                </div>
            </section>

            <section id="reviews">
                <h3>What Our Users Say</h3>
                <div class="review-cards">
                    <div class="review-card">
                        <div class="review-text">
                            <p>"Stress-free experience. Beautiful photos."</p>
                        </div>
                        <div class="review-author">
                            <p><strong>John Smith</strong></p>
                            <p><span class="stars">&#9733;&#9733;&#9733;&#9733;&#9734;</span></p>
                        </div>
                    </div>
                    <div class="review-card">
                        <div class="review-text">
                            <p>"Amazing photographer. Highly recommend."</p>
                        </div>
                        <div class="review-author">
                            <p><strong>Jane Doe</strong></p>
                            <p><span class="stars">&#9733;&#9733;&#9733;&#9733;&#9733;</span></p>
                        </div>
                    </div>
                    <div class="review-card">
                        <div class="review-text">
                            <p>"Fantastic service. Will use again."</p>
                        </div>
                        <div class="review-author">
                            <p><strong>Mark Johnson</strong></p>
                            <p><span class="stars">&#9733;&#9733;&#9734;&#9734;&#9734;</span></p>
                        </div>
                    </div>
                </div>
            </section>

        </main>

        <div class="mottoabout">
            <div class="motto-container">
                <div class="motto">
                    <img src="https://img.icons8.com/bubbles/200/null/compact-camera.png"/>                        <h2>Capturing Life's Moments</h2>
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
            </div>
            <section id="contact">
                <h3>Contact Us</h3>
                <p>Have a question or want to book a session? Get in touch with us today!</p>
                <a href="contacthome.jsp" class="contact-button">Contact Us</a>
            </section>
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
                const section = document.getElementById('services');
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

            function firstpage() {
                window.location.href = "firstpage.html";
            }
        </script>
    </body>
</html>

