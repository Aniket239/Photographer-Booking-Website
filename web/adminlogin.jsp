<%-- 
    Document   : UserDetails
    Created on : 1 Apr, 2023, 11:42:52 AM
    Author     : HP
--%>

<%@page import="oracle.jdbc.OracleStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="oracle.jdbc.OracleResultSet"%>
<%@page import="oracle.jdbc.OraclePreparedStatement"%>
<%@page import="oracle.jdbc.OracleConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Space+Mono:wght@700&display=swap" rel="stylesheet">
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
            .hero {
                background-image: url("https://replicate.delivery/pbxt/EBgItUPhdr6EJVUbqqRyadbaqasGFVXcbDGRKkDuMsXzJHPE/output.png");
                background-size: 100% 100%;
                background-repeat: no-repeat;
                background-size: cover;
                height: 800px;
                background-position: center;
                color: #fff;
                box-shadow:0 0px 55px 1px #333333;
                border-radius: 0 0 40px 40px;

            }
            .heading{
                text-align: left;
                padding-left: 120px;
            }
            .highlight{
                background-color: white  ;
                -webkit-background-clip: text;
                -webkit-text-stroke-width: 1px;   
                -webkit-text-stroke-color: white;
            }
            .hero h2 {
                -webkit-background-clip: text;
                -webkit-text-fill-color: white;
                -webkit-text-stroke-width: 1px;   
                -webkit-text-stroke-color: white; 
                padding-top:200px;
                padding-bottom: 14px;
                font-size: 4em;
                background: transparent;
                font-family: 'Space Mono', monospace;
            }

            .hero p {
                font-size: 2em;
                margin: 100px 0 0 90px;
                padding-bottom:5px;
                font-family: 'Space Mono', monospace;
                color:white;
            }

            .hero button {
                color: white  ;
                -webkit-background-clip: text;
                -webkit-text-stroke-width: 1px;   
                -webkit-text-stroke-color: white;
                margin: 10px 0 0 110px;
                animation: glow 1s ease-in-out infinite alternate;
                font-size: 2.5em;
                font-family: 'Space Mono', monospace;
                cursor: pointer;
                position: relative;
                border: none;
                background: none;
                transition-timing-function: cubic-bezier(0.25, 0.8, 0.25, 1);
                transition-duration: 400ms;
                transition-property: color;
            }
            .hero button:hover {
                color: white;
                transition: 0.3s ease-in-out;
                transform: scale(1.03);
                -webkit-text-fill-color: white;
                -webkit-text-stroke-width: 0px;   

            }
            .hero button:hover:after {
                width: 100%;
                left: 0%;
            }
            .hero button:after {
                content: "";
                pointer-events: none;
                bottom: -2px;
                left: 50%;
                position: absolute;
                width: 0%;
                height: 5px;
                background-color: #FF6400;
                transition-timing-function: cubic-bezier(0.25, 0.8, 0.25, 1);
                transition-duration: 400ms;
                transition-property: width, left;
            }

            .admintable{
                width:90%;
                margin-left: 5%;
            }

            .admintable h2{
                text-align: center;
                margin-top: 100px;
                font-size: 30px;
                font-family: 'Space Mono', monospace;

            }
            /* Set the font and border properties for the entire table */
            table {
                background-color:#3d5173; 
                font-family: Arial, sans-serif;
                width: 100%;
                border-collapse: collapse;
                margin: 50px 20px 0 20px;
                border: 1px solid black;
                color:white;
            }
            .tablephotographers{
                width:10000px;
            }

            /* Set the background color for the header row */

            /* Set the font size and padding for table cells */
            td, th {
                font-size: 14px;
                padding: 22px 12px 32px 18px;
                text-align: left;
            }

            /* Add a hover effect to table rows */
            tr:hover {
                background-color: black;
                color: white;
            }

            /* Set the background color for every other row */
            tr:nth-child(even) {
                background-color: #f2f2f2;
                color:black;
            }
            tr:nth-child(even):hover{
                background-color: black; 
                color: white;
            }
            td{                 width: 100px;
                                padding-top: 32px;
            }
            .headingTable{
                background-color: #f2f2f2;
                font-size: 17px;
                font-weight: bold;
                color: #040992;
                font-family: 'Space Mono', monospace;
                letter-spacing: 1px;
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
                margin: 10% 2% 2% 2%;
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
        </style>
    </head>
    <body>
        <%! OracleConnection oconn, oconn1, oconn2;
            OracleStatement ost, ost1, ost2;
            OracleResultSet ors, ors1, ors2;
            String q, q1, q2;
        %>
        <%
            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
            oconn = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-M90F0PT:1521:orcl", "aniket", "bca");
            q = "select * from USERS";
            ost = (OracleStatement) oconn.createStatement();
            ors = (OracleResultSet) ost.executeQuery(q);

            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
            oconn1 = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-M90F0PT:1521:orcl", "aniket", "bca");
            q1 = "select * from photographers";
            ost1 = (OracleStatement) oconn1.createStatement();
            ors1 = (OracleResultSet) ost1.executeQuery(q1);

            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
            oconn2 = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-M90F0PT:1521:orcl", "aniket", "bca");
            q2 = "select * from photos";
            ost2 = (OracleStatement) oconn2.createStatement();
            ors2 = (OracleResultSet) ost2.executeQuery(q2);

        %>

        <header >
            <div class="logo">
                <h1><button><a href="mainpage.jsp" > Lenstory</a></button></h1>
            </div>
            <nav>
                <ul>
                    <li><button><a href="landingpage.jsp">Home</a></button></li>
                    <li><button><a href="gallery.jsp">Gallery</a></button></li>
                    <li><button><a href="about.jsp">About</a></button></li>
                    <li><button><a href="contact.jsp">Contact</a></button></li>
                </ul>
            </nav>
        </header>
        <section class="hero">
            <div class="heading">
                <h2>Welcome <span class="highlight"> Admin</span></h2>
                <p>Check Out Tables</p><br><br><br><br>
                <button class="btn" id="explore-pg-btn" onclick="scrollToSection()">Get Started</button>
            </div>
        </section>
        <section id="table">
        <div id='admintable' class="admintable">
            <h2> Users Table</h2>
            <table>
                <thead>
                    <tr  >
                        <td class="headingTable">
                            Username
                        </td>
                        <td class="headingTable">
                            Email
                        </td>
                        <td class="headingTable">
                            Password
                        </td>
                        <td class="headingTable">
                            Phone Number
                        </td>
                        <td class="headingTable">
                            Date Of Birth
                        </td>
                        <td class="headingTable">
                            Gender
                        </td>
                        <td class="headingTable">
                            Picture
                        </td>
                        <td class="headingTable">
                            Name
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <%                    while (ors.next()) {
                    %>
                    <tr>
                        <%
                            for (int i = 1; i <= 8; i++) {
                        %>
                        <td>
                            <%=ors.getString(i)%>

                        </td>
                        <% }
                        %>
                    </tr>
                    <%                    }
                    %>
                </tbody>
                <tfoot>
                    <tr>

                    </tr>
                </tfoot>
            </table>
        </div>
        <br>
        <div id='admintable' class="admintable">
            <h2> Photographers Table</h2>
            <table class="tablephotographers">
                <thead>
                    <tr>
                        <td class="headingTable">
                            Username
                        </td>
                        <td class="headingTable">
                            Name
                        </td>
                        <td class="headingTable">
                            Address
                        </td>
                        <td class="headingTable">
                            Picture
                        </td>
                        <td class="headingTable">
                            Phone Number
                        </td>
                        <td class="headingTable">
                            Age
                        </td>
                        <td class="headingTable">
                            Password
                        </td>
                        <td class="headingTable">
                            Photo Price
                        </td>
                        <td class="headingTable">
                            Photo And Video Price
                        </td>
                        <td class="headingTable">
                            Pre-wedding Price
                        </td>
                        <td class="headingTable">
                            Wedding Price
                        </td>
                        <td class="headingTable">
                            Commercial Price
                        </td>
                        <td class="headingTable">
                            Event Price
                        </td>
                        <td class="headingTable">
                            Email 
                        </td>
                        <td class="headingTable">
                            About 
                        </td>
                        <td class="headingTable">
                            Review 
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <%                    while (ors1.next()) {
                    %>
                    <tr>
                        <%
                            for (int i = 1; i <= 16; i++) {
                        %>
                        <td>
                            <%=ors1.getString(i)%>

                        </td>
                        <% }
                        %>
                    </tr>
                    <%                    }
                    %>
                </tbody>
                <tfoot>
                    <tr>

                    </tr>
                </tfoot>
            </table>
        </div>
        <div id='admintable' class="admintable">
            <h2> Photos Table</h2>
            <table>
                <thead>
                    <tr  >
                        <td class="headingTable">
                            Photographer ID
                        </td>
                        <td class="headingTable">
                            Photo Id
                        </td>
                        <td class="headingTable">
                            Photo
                        </td>
                        <td class="headingTable">
                            Genre
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <%                    while (ors2.next()) {
                    %>
                    <tr>
                        <%
                            for (int i = 1; i <= 4; i++) {
                        %>
                        <td>
                            <%=ors2.getString(i)%>

                        </td>
                        <% }
                        %>
                    </tr>
                    <%                    }
                    %>
                </tbody>
                <tfoot>
                    <tr>

                    </tr>
                </tfoot>
            </table>
        </div>
        </section>
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
                <a href="contact.html">Contact Us</a>
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
        <script>
            function scrollToSection() {
                const sectionTop = table.getBoundingClientRect().top + window.scrollY;
                const headerHeight = document.querySelector('table').offsetHeight;
                window.scroll({
                    top: sectionTop - headerHeight + 300,
                    behavior: 'smooth'
                });
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
                window.location.href = "privacypolicy.html";
            }
            function termOfUse() {
                window.location.href = "termofuse.html";
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
