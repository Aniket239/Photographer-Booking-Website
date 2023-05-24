<%-- 
    Document   : pg-page
    Created on : 1 May, 2023, 4:01:51 PM
    Author     : HP
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="oracle.jdbc.OracleResultSet"%>
<%@page import="oracle.jdbc.OracleStatement"%>
<%@page import="oracle.jdbc.OracleConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@300&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Space+Mono:wght@700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Monoton&display=swap" rel="stylesheet">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>My Portfolio</title>
        <script 
            async src="https://basicons.xyz/embed.js">
        </script>
        <style>
            /* Reset styles */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            /* Global styles */
            body {
                font-family: 'Roboto', sans-serif;
                font-size: 16px;
                background-color: #dfdfdf;
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
            header nav{
                background-color: transparent;

            }
            header nav ul {
                display: flex;
                list-style: none;
                margin: 0;
                padding: 0;
                font-family: 'Space Mono', monospace;
            }
            header nav ul li {
                margin: 0 10px;
            }
            header nav ul li a {
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

            .container {
                display: flex;
                flex-wrap: nowrap;
                justify-content: center;
                background-color: black;
                width:100%;
                height:450px;
                padding-bottom: 40px;
                border-radius: 0 0 20px 20px;
            }
            .profile {
                display: flex;
                padding: 100px 0px 0 50px  ;
            }
            .name {
                color:white;
                font-weight: bold;
                margin: 40px 0 0 0;
                font-family: 'Space Mono', monospace;
            }

            .name h2{
                font-size: 32px;
                margin-left: 18px;
            }
            .name p{
                font-size: 22px;
                margin: 0 0 10px 22px;
            }
            .name button{
                margin: 0 0 0 20px;
            }
            .info {
                background-color: green;
                width:auto;
                height:30px;
                border-radius: 5px;
                font-weight: bold;
                margin: 46px 0 0 20px;
                padding: 0 5px 0 5px;
                font-family: 'Space Mono', monospace;
                font-size: 20px;
                color:white;

            }

            .profile-image {
                width: 250px;
                height: 250px;
                border-radius: 50%;
                overflow: hidden;
                margin-bottom: 30px;
                margin-right: 20px;
            }

            .profile-image img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .profile-address {
                font-family: 'Space Mono', monospace;
                text-align: center;
                color: white;
                font-size:20px;
            }

            .profile-address p {
                margin-bottom: 5px;
            }
            .gg-phone {
                box-sizing: border-box;
                position: relative;
                display: block;
                width: 20px;
                height: 15px;
                margin: 6px 6px 0 0;
                transform: scale(var(--ggs,1));
            }
            .gg-phone::after,
            .gg-phone::before {
                content: "";
                display: block;
                box-sizing: border-box;
                position: absolute;
            }
            .gg-phone::after {
                width: 18px;
                height: 18px;
                border-top-left-radius: 1px;
                border-bottom-right-radius: 1px;
                border-bottom-left-radius: 12px;
                border-left: 4px solid;
                border-bottom: 4px solid;
                left: 2px;
                bottom: 2px;
                background:
                    linear-gradient(
                    to left,
                    currentColor 10px,
                    transparent 0
                    ) no-repeat right 11px/6px 4px,
                    linear-gradient(
                    to left,
                    currentColor 10px,
                    transparent 0
                    ) no-repeat -1px 0/4px 6px
            }
            .gg-phone::before {
                width: 20px;
                height: 15px;
                border: 6px double;
                border-top-color: transparent;
                border-bottom-color: transparent;
                border-left-color: transparent;
                border-radius: 50%;
                transform: rotate(-45deg);
                bottom: 2px;
                left: 2px;
            }
            .contact {
                margin-top: 5px;
                font-size: 20px;
                background-color: transparent;
                color:greenyellow;
                border: none;
                display: flex;
                flex-wrap: nowrap;
            }

            .contact:hover{
                color: #0cd300;
                transform: scale(1.03);
            }

            .navigationbar nav {
                width: 100%;
                background-color: rgba(255,255,255,0.5);
                color: #fff;
                border-radius: -20px -20px 0 0;
                height: 80px;
            }
            .navigation{
                width: 100%;
                display: flex;
                justify-content: center;
            }

            .navigationbar nav ul {
                list-style: none;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
            }

            .navigationbar nav li {
                color:black;
                height: 100%;
            }

            .navigationbar nav button {
                background-color: transparent;
                font-family: 'Space Mono', monospace;
                color: inherit;
                cursor: pointer;
                border: none;
                font-size: 20px;
                letter-spacing: 1px;
                padding: 10px 50px 10px 50px;
                height: 100%;
                width: 200px;
                transition: transform 0.3s ease,background-color 0.5s ease,color 0.3s ease;
            }

            .navigationbar nav button:hover {
                transform: scale(1.03);
                background-color: #111411;
                color:white;
            }

            .gallery h1 {
                background-color: #dfdfdf;
                font-family: 'Space Mono', monospace;
                font-size:40px;
                font-weight: 500;
                margin-top: 50px;
                color: black;
                text-align: center;
            }
            .row {
                background-color: #dfdfdf;
                display: flex;
                flex-wrap: wrap;
                padding: 20px 120px 0 120px;
                border-radius: 0 0 20px 20px;
            }
            h3{
                text-align: center;
                margin: 20px 0 10px 0;
                font-family: 'Space Mono', monospace;
                font-size: 22px;
            }
            .column {
                flex: 20%;
                width: 20%;
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
                    max-width: 50%;
                }
            }

            #fullscreen {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.9);
                display: none;
                z-index: 9999;
            }

            #fullscreen img {
                display: block;
                max-width: 100%;
                max-height: 100%;
                margin: 0 auto;
                padding-top: 10vh;
            }

            #fullscreen .close-btn {
                position: absolute;
                top: 10px;
                right: 10px;
                color: #fff;
                font-size: 24px;
                cursor: pointer;
            }

            .about{
                background-color: #ffedbc;
                padding:20px;
                border: 2px solid black;
                border-radius: 20px 20px 20px 20px;
                font-size:40px;
                width:90%;
                margin-top: 100px;
                margin-left:5%;
                box-shadow: 15px 12px 0 3px #333333;
            }
            .about h3{
                font-size:40px;
                text-align: center;
                font-family: 'Space Mono', monospace;
            }
            .about h4{
                font-size: 30px;
                text-align: center;
                font-family: 'Space Mono', monospace;
            }
            .about p{
                font-size:22px;
                font-family: 'Ubuntu', sans-serif;
                font-weight: 600;
                margin:35px 50px 35px 50px;
            }

            .price-section {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                margin: 10px 0;
                transition: 0.5s in ease-in-out ;

            }

            .package {
                background-color:  #ffedbc;
                margin: 30px;
                padding: 30px;
                height:340px;
                border-radius: 20px;
                border: 2px solid black;
                box-shadow: 7px 7px 0 3px #333333;
                max-width: 300px;
                text-align: center;
                transition: transform 0.3s ease;

            }
            .package:hover{
                transform: scale(1.03);

            }
            .packhead {
                font-size: 40px;
                margin-bottom: 20px;
                text-align: center;
            }
            .package h2{
                margin-bottom: 20px;
            }
            .package button {
                padding: 10px 15px 10px 15px;
                border:none ;
                border-radius: 20px;
                cursor: pointer;
                border: 1px solid black;
                box-shadow: 3px 3px 0 1px #333333;
                transition: transform 0.3s ease;
            }
            .package button:hover{
                transform: scale(1.03);
            }

            .package ul {
                list-style: none;
                margin: 0;
                padding: 0;
            }

            .package li {
                font-size: 16px;
                margin-bottom: 15px;
            }

            .package li:last-child {
                font-weight: bold;
                margin-top: 20px;
                font-size: 20px;
            }

            .price_message{
                display: flex;
                flex-direction: row;
                justify-content: space-around;
                margin-bottom: 30px;
            }
            .money{
                color: #004D98;
                padding-left: 5px;
                font-weight: bold;
            }
            #contact{
                margin: 80px;
            }

            .contactprice{
                display: flex;
                flex-direction: row;
                justify-content: center;
                margin-top: 60px;

            }
            .contactprice img{
                width:40px;
                height: 40px;
                margin-right: 10px;
            }
            .contactprice1{
                display: flex;
                flex-wrap: nowrap;
                justify-content: center;
                margin-top: 60px;
            }
            .contactprice1 img{
                margin: 0 30px 50px 30px;
            }
            .contactprice p{
                margin-top: 5px;
                font-size: 22px;
            }
            .contact-photographer {
                background-color: #ffedbc;
                padding: 20px;
                border-radius: 25px;
                width: 500px;
                border: 2px solid black;
                box-shadow: 7px 7px 0 3px #333333;

            }

            .contact-photographer h2 {
                font-size: 24px;
                margin: 40px 0 10px 0;
                text-align: center;
            }

            .contact-photographer ul {
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .contactprice {
                margin-bottom: 10px;
                font-size: 16px;
                line-height: 1.5;
                transition: transform 0.3s ease;

            }
            .contactprice:hover {
                transform: scale(1.03);
            }
            .contactprice p{
                cursor: pointer;
            }
            .contactprice1  a {
                margin-right: 10px;
                transition: transform 0.3s ease;

            }
            .contactprice1 a:hover {
                transform: scale(1.05);

            }


            .contact-photographer li a {
                color: #333;
                text-decoration: none;
            }

            .email-copied {
                background-color: rgba(255,255,255,0.5);
                color: black;
                padding: 10px;
                right: 10px;
                width:30%;
                border-radius: 5px;
                transition: opacity 0.5s ease;
                opacity: 0;
            }

            .email-copied.show {
                opacity: 1;
            }
            .emailcopy{
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-content: center;
                align-items: center;
            }
            .iconfoot{
                background-color: rgba(0,0,0,0.8);
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
                background-color: rgba(0,0,0,1);
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
            float review = 0;
            int age = 0, c = 0;
            String name = request.getParameter("name"), username = "", about = "", phone = "", pricePhoto = "", pricePhotoVideo = "", wedding = "", pre_wedding = "", commercial = "", event = "", email = "";
            byte[] imageBytes = new byte[10];
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            try {
                // Establish a database connection
                Class.forName("oracle.jdbc.driver.OracleDriver");
                conn = DriverManager.getConnection("jdbc:oracle:thin:@Aniket:1521:orcl", "aniket", "bca");

                // Create a SQL query
                String sql = "select username,picture,age,review,phone,photoprice,photovideoprice,about,preweddingprice,weddingprice,commercialprice,eventprice,email from photographers where name=?";

                // Prepare the SQL query
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, name);

                // Execute the SQL query
                rs = pstmt.executeQuery();
                // Process the result set
                while (rs.next()) {
                    username = rs.getString("username");
                    Blob imageBlob = rs.getBlob("picture");
                    imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                    age = rs.getInt("age");
                    review = rs.getFloat("review");
                    phone = rs.getString("phone");
                    pricePhoto = rs.getString("photoprice");
                    pricePhotoVideo = rs.getString("photovideoprice");
                    about = rs.getString("about");
                    wedding = rs.getString("weddingprice");
                    pre_wedding = rs.getString("preweddingprice");
                    commercial = rs.getString("commercialprice");
                    event = rs.getString("eventprice");
                    email = rs.getString("email");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } finally {
                if (rs != null) {
                    try {
                        rs.close();
                    } catch (SQLException e) {
                    }
                }
                if (pstmt != null) {
                    try {
                        pstmt.close();
                    } catch (SQLException e) {
                    }
                }
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException e) {
                    }
                }
            }

            Connection connection = null, connection1 = null, connection2 = null, connection3 = null, connection4 = null;
            PreparedStatement statement = null, statement1 = null, statement2 = null, statement3 = null, statement4 = null;
            ResultSet resultSet = null, resultSet1 = null, resultSet2 = null, resultSet3 = null, resultSet4 = null;
            try {

                // Establish a database connection
                connection = DriverManager.getConnection("jdbc:oracle:thin:@Aniket:1521:orcl", "aniket", "bca");
                // Prepare the SQL query
                String sql = "SELECT photo FROM photos WHERE photographerId = ? and genre = ?";
                statement = connection.prepareStatement(sql);
                statement.setString(1, username);
                statement.setString(2, "wedding");

                // Execute the query
                resultSet = statement.executeQuery();

                connection1 = DriverManager.getConnection("jdbc:oracle:thin:@Aniket:1521:orcl", "aniket", "bca");
                String sql1 = "SELECT photo FROM photos WHERE photographerId = ? and genre = ?";
                statement1 = connection1.prepareStatement(sql1);
                statement1.setString(1, username);
                statement1.setString(2, "portrait");
                // Execute the query
                resultSet1 = statement1.executeQuery();

                connection2 = DriverManager.getConnection("jdbc:oracle:thin:@Aniket:1521:orcl", "aniket", "bca");
                String sql2 = "SELECT photo FROM photos WHERE photographerId = ? and genre = ?";
                statement2 = connection2.prepareStatement(sql2);
                statement2.setString(1, username);
                statement2.setString(2, "travel");
                // Execute the query
                resultSet2 = statement2.executeQuery();

                connection3 = DriverManager.getConnection("jdbc:oracle:thin:@Aniket:1521:orcl", "aniket", "bca");
                String sql3 = "SELECT photo FROM photos WHERE photographerId = ? and genre = ?";
                statement3 = connection3.prepareStatement(sql3);
                statement3.setString(1, username);
                statement3.setString(2, "commercial");
                // Execute the query
                resultSet3 = statement3.executeQuery();

                connection4 = DriverManager.getConnection("jdbc:oracle:thin:@Aniket:1521:orcl", "aniket", "bca");
                String sql4 = "SELECT photo FROM photos WHERE photographerId = ? and genre = ?";
                statement4 = connection4.prepareStatement(sql4);
                statement4.setString(1, username);
                statement4.setString(2, "event");
                // Execute the query
                resultSet4 = statement4.executeQuery();
                // Process the result
            } catch (SQLException e) {
                e.printStackTrace();
            }

        %>
        <header>
            <%                String username1 = request.getParameter("user");
                String role = request.getParameter("role");
            %>
            <div class="logo">
                <h1>
                    <button><a href="mainpage.jsp?user=<%= username1%>&role=<%= role%>" > Lenstory</a></button></h1>
            </div>
            <nav>
                <ul>
                    <li><button><a href="landingpage.jsp">Home</a></button></li>
                    <li><button><a href="gallery.jsp?user=<%= username1%>&role=<%= role%>">Gallery</a></button></li>
                    <li><button><a href="about.jsp?user=<%= username1%>&role=<%= role%>">About</a></button></li>
                    <li><button><a href="contact.jsp?user=<%= username1%>&role=<%= role%>">Contact</a></button></li>
                    <li><button><a href="profile.jsp?user=<%= username1%>&role=<%= role%>">Profile</a></button></li>
                </ul>
            </nav>
        </header>
        <main class="main">
            <div class="container">
                <section class="profile">
                    <div class="profile-image">
                        <% out.write("<img src=\"data:image/jpeg;base64," + new String(Base64.getEncoder().encode(imageBytes)) + "\"/>");%>
                    </div>
                    <div class=name>
                        <h2> <%= name%></h2>
                        <% String address = request.getParameter("address");%>
                        <p> <%= address%></p>
                        <p> Age - <%= age%></p>
                        <button class="contact" onclick="scrollToSection('contact')"><i class="gg-phone"> </i>Contact</button>
                    </div>
                    <div class="info">
                        <p> &#9733 <%= review%></p>
                    </div>
                </section>
            </div>
            <div class="navigationbar">
                <nav class="navigation">
                    <ul>
                        <li><button onclick="scrollToSection('gallery')">Gallery</button></li>
                        <li><button onclick="scrollToSection('about')">About</button></li>
                        <li><button onclick="scrollToSection('package')">Package</button></li>
                        <li><button onclick="scrollToSection('contact')">Contact</button></li>
                    </ul>
                </nav>
            </div>
            <section id="gallery">
                <div class="gallery">
                    <h1> Portfolio </h1>
                </div>
                <div class="row">
                    <div class="column">
                        <h3>Wedding</h3>
                        <% while (resultSet.next()) {
                                Blob imageBlob = resultSet.getBlob("photo");
                                imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                                out.write("<img style='width:100%'src=\"data:image/jpeg;base64," + new String(Base64.getEncoder().encode(imageBytes)) + "\" onclick='openFullscreen(this)'/>");
                            }
                        %>
                        <div id="fullscreen">
                            <span class="close-btn" onclick="closeFullscreen()">&times;</span>
                            <img id="fullscreen-image">
                        </div>
                    </div>
                    <div class="column">
                        <h3>Portrait</h3>
                        <% while (resultSet1.next()) {
                                Blob imageBlob = resultSet1.getBlob("photo");
                                imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                                out.write("<img style='width:100%'src=\"data:image/jpeg;base64," + new String(Base64.getEncoder().encode(imageBytes)) + "\" onclick='openFullscreen(this)'/>");
                            }
                        %>
                        <div id="fullscreen">
                            <span class="close-btn" onclick="closeFullscreen()">&times;</span>
                            <img id="fullscreen-image">
                        </div>
                    </div>
                    <div class="column">
                        <h3>Travel</h3>
                        <% while (resultSet2.next()) {
                                Blob imageBlob = resultSet2.getBlob("photo");
                                imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                                out.write("<img style='width:100%'src=\"data:image/jpeg;base64," + new String(Base64.getEncoder().encode(imageBytes)) + "\" onclick='openFullscreen(this)'/>");
                            }
                        %>
                        <div id="fullscreen">
                            <span class="close-btn" onclick="closeFullscreen()">&times;</span>
                            <img id="fullscreen-image">
                        </div>
                    </div>
                    <div class="column">
                        <h3>Commercial</h3>
                        <% while (resultSet3.next()) {
                                Blob imageBlob = resultSet3.getBlob("photo");
                                imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                                out.write("<img style='width:100%'src=\"data:image/jpeg;base64," + new String(Base64.getEncoder().encode(imageBytes)) + "\" onclick='openFullscreen(this)'/>");
                            }
                        %>
                        <div id="fullscreen">
                            <span class="close-btn" onclick="closeFullscreen()">&times;</span>
                            <img id="fullscreen-image">
                        </div>
                    </div>
                    <div class="column">
                        <h3>Event</h3>
                        <% while (resultSet4.next()) {
                                Blob imageBlob = resultSet4.getBlob("photo");
                                imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                                out.write("<img style='width:100%'src=\"data:image/jpeg;base64," + new String(Base64.getEncoder().encode(imageBytes)) + "\" onclick='openFullscreen(this)'/>");
                            }
                        %>
                        <div id="fullscreen">
                            <span class="close-btn" onclick="closeFullscreen()">&times;</span>
                            <img id="fullscreen-image">
                        </div>
                    </div>
                </div>
            </section>

            <br><br>
            <%
                String[] sentences = about.split("\\. ");
                int maxSentencesPerParagraph = 4;
                String output = "";
                String currentParagraph = "";
                for (int i = 0;
                        i < sentences.length;
                        i++) {
                    currentParagraph += sentences[i] + ". ";

                    if (i == sentences.length - 1 || (i + 1) % maxSentencesPerParagraph == 0) {
                        output += "<p>" + currentParagraph + "</p>";
                        currentParagraph = "";
                    }
                }

            %>
            <section id="about">
                <div class="about">
                    <h3>About</h3><h4> <%= name%></h4>
                    <p><%= output%></p>
                </div><br><br><br><br>
            </section>

            <section id="package">
                <h2 class="packhead">Packages</h2>
                <section class="price-section">
                    <div class="package">
                        <h2>Photo Package</h2>
                        <ul>
                            <li>Up to 2 hours of shooting time</li>
                            <li>50 professionally edited photos</li>
                            <li> <span class="money">  ₹<%= pricePhoto%> </span></li>
                            <button onclick="sendPrice('<%= pricePhoto%>','<%= username1%>')">Book Package</button>
                        </ul>

                    </div>

                    <div class="package">
                        <h2>Photo and Video Package</h2>
                        <ul>
                            <li>Up to 4 hours of shooting time</li>
                            <li>100 professionally edited photos</li>
                            <li>5-10 minute highlight video</li>
                            <li> <span class="money"> ₹<%= pricePhotoVideo%></span></li>
                            <button onclick="sendPrice('<%= pricePhotoVideo%>','<%= username1%>','<%= role%>')">Book Package</button>
                        </ul>
                    </div>

                    <div class="package">
                        <h2>Pre-Wedding Package</h2>
                        <ul>
                            <li>Up to 6 hours of shooting time</li>
                            <li>200 professionally edited photos</li>
                            <li>10-15 minute highlight video</li>
                            <li> <span class="money">  ₹<%=pre_wedding%></span></li>
                            <button onclick="sendPrice('<%= pre_wedding%>','<%= username1%>','<%= role%>')">Book Package</button>
                        </ul>
                    </div>


                    <div class="package">
                        <h2>Wedding Package</h2>
                        <ul>
                            <li>Up to 10 hours of shooting time</li>
                            <li>300 professionally edited photos</li>
                            <li>20-30 minute highlight video</li>
                            <li> <span class="money">  ₹<%= wedding%></span> </li>
                            <button onclick="sendPrice('<%= wedding%>','<%= username1%>','<%= role%>')">Book Package</button>

                        </ul>
                    </div>


                    <div class="package">
                        <h2>Events Package</h2>
                        <ul>
                            <li>Up to 8 hours of shooting time</li>
                            <li>150 professionally edited photos</li>
                            <li>2-5 minute promotional video</li>
                            <li> <span class="money"> ₹<%= event%> </span></li>
                            <button onclick="sendPrice('<%= event%>','<%= username1%>','<%= role%>')">Book Package</button>
                        </ul>
                    </div>
                    <div class="package">
                        <h2>Commercial Package</h2>
                        <ul>
                            <li>Up to 10 hours of shooting time</li>
                            <li>200 professionally edited photos</li>
                            <li>5-10 minute promotional video</li>
                            <li> <span class="money"> ₹<%= commercial%></span> </li>
                            <button onclick="sendPrice('<%= commercial%>','<%= username1%>','<%= role%>')">Book Package</button>
                        </ul>
                    </div>
                </section>
            </section>
            <section id="contact">
                <div class="price_message">
                    <section class="contact-photographer">
                        <h2>Contact Photographer</h2>
                        <ul>
                            <li> <% phone = "+91" + phone;%>
                                <a href="https://wa.me/<%= phone%>">
                                    <div class="contactprice">
                                        <img src="https://img.icons8.com/color/10008/null/whatsapp--v1.png"/><p class="contactphotographer"> <%= phone%> </p>
                                    </div></a></li>
                            <li class="emailcopy">
                                <div class="contactprice">
                                    <img src="https://img.icons8.com/fluency/48/null/gmail-new.png"/><p id="email" onclick="copyEmail()"> <%= email%> </p> </div>
                                <div class="email-copied">Email copied!</div>
                            </li>
                        </ul>
                    </section>
                </div>
            </section>
        </main>

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

            function scrollToSection(sectionId) {
                const section = document.getElementById(sectionId);
                const sectionTop = section.getBoundingClientRect().top + window.scrollY;
                const headerHeight = document.querySelector('header').offsetHeight;
                window.scroll({
                    top: sectionTop - headerHeight - 40,
                    behavior: 'smooth'
                });
            }

            function openFullscreen(img) {
                var fullscreenDiv = document.getElementById("fullscreen");
                var fullscreenImg = document.getElementById("fullscreen-image");

                fullscreenImg.src = img.src;
                fullscreenDiv.style.display = "block";
            }

            function closeFullscreen() {
                var fullscreenDiv = document.getElementById("fullscreen");

                fullscreenDiv.style.display = "none";
            }

            function sendPrice(price,username,role) {
                location.href = "payment.jsp?price=" + price+"&"+"user="+username+"&"+"role="+role;
            }

            function pripol() {
                window.location.href = "privacypolicy.jsp?user=<%= username1%>&role=<%= role%>";
            }
            function termOfUse() {
                window.location.href = "termsofuse.jsp?user=<%= username1%>&role=<%= role%>";
            }

            function copyEmail() {
                const email = document.getElementById("email").textContent;
                navigator.clipboard.writeText(email);
                const emailCopied = document.querySelector('.email-copied');
                emailCopied.classList.remove('hidden');
                emailCopied.classList.add('show');
                setTimeout(function () {
                    emailCopied.classList.remove('show');
                    emailCopied.classList.add('hidden');
                }, 2000);
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
