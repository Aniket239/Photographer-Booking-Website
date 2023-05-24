<%-- 
    Document   : profile
    Created on : 10 May, 2023, 1:29:01 AM
    Author     : sohel
--%>
<%@page import="java.util.Base64"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> <link rel="stylesheet" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Space+Mono:wght@700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Monoton&display=swap" rel="stylesheet">

        <title>Profile Page</title>
        <style>

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: Arial, sans-serif;
                background-image: url("https://replicate.delivery/pbxt/qKmEPyyfcPVPeEJTOak6ViSiPK6Jn2vf0qcwSjexxBBqzegHC/output.png");            }

            a {
                text-decoration: none;
                color: #333;
            }
            header {
                background-color: transparent;
                height:14%;
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

            .container {
                width:55%;
                height: 100%;
                margin: 120px auto 120px auto;
                padding: 60px 30px 40px 30px;
                border: 1px solid #ccc;
                border-radius: 20px;
                backdrop-filter: blur(20px);
                font-family: 'Space Mono', monospace;
                background-color: rgba(255,255,255,0.1);

            }

            .profile-pic {
                width: 200px;
                height:200px;
                border-radius: 50%;
                margin: auto;
                overflow: hidden; 
            }

            .profile-pic img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .username{
                display: flex;
                flex-direction: column;
                align-content: center;
                align-items: center;
                width:auto;
                margin: 5% 35% 0% 35%;
                font-size: 20px;
            }
            .username .info{
                background-color: whitesmoke;
                text-align: center;
                width:140%;
            }




            label{
                margin: 0 0 10px 0;
                font-size: 18px;
                text-align: center;
            }
            .inputs{
                display: flex;
                flex-wrap: wrap;
                flex-direction: row;
                justify-content: center;
                width:100%;
            }
            .input{
                display: flex;
                flex-wrap: wrap;
                flex-direction: column;
                padding: 40px;
                width:400px;
                height:auto;
            }
            .info{
                display: flex;
                flex-wrap: wrap;
                flex-direction: column;
                padding: 10px;
                border: none;
                border-radius: 5px;
                background-color: whitesmoke;
                height:auto;
                width:300px;
            }
            .input .info p{
                text-align: center;
            }
            .inputabout{
                display: flex;
                flex-wrap: wrap;
                flex-direction: column;
                width:calc(150%-50px);
            }
            .infoabout{
                background-color: whitesmoke;
                border-radius: 5px;
                padding: 15px;

            }

            .photographer{
                display: flex;
                flex-direction: row;
                flex-wrap: wrap;
                justify-content: center;
            }
            .formbtn{
                display: flex;
                justify-content: center;
                align-content: center;
                align-items: center;
            }

            #delete-btn{
                background-color: red; 
                color: white;
                width: 185px;
                border: none;
                margin: 20px 0 0 0;
                padding: 15px;
                border-radius: 5px;
                cursor: pointer;
                font-size: 18px;
                transition: background-color 0.3s;
            }

            #delete-btn:hover{
                background-color: orangered;
            }

            /* Styles for confirmation message */
            #confirmation-message {
                width: 400px;
                padding: 20px;
                background-color: #f2f2f2;
                border-radius: 5px;
                text-align: center;
                margin: 50px auto;
            }

            #confirmation-message .buttons {
                display: flex;
                justify-content: center;
                margin: 20px 0;
            }

            #confirmation-message button {
                padding: 10px 20px;
                margin: 0 10px;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
            }

            #ok-btn {
                background-color: #4CAF50;
                color: white;
            }

            #cancel-btn {
                background-color: #f44336;
                color: white;
            }

            #deleted-message {
                color: #4CAF50;
                font-weight: bold;
            }

            footer {
                display: flex;
                flex-wrap: wrap;
                flex-direction: row;
                align-content: center;
                align-items: center;
                justify-content: center;
                background-color: #333333;
                padding: 50px 0px 50px 0px;
                color: rgba(232,210,169,255);
                text-align: center;
            }

            footer button{
                font-size: 15px;
                margin:0 50px 0 50px;
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
            String role = request.getParameter("role");
            int age = 0;
            String name = "", about = "", address = "", dob = "", gender = "", phone = "", pricePhoto = "", pricePhotoVideo = "", wedding = "", pre_wedding = "", commercial = "", event = "", email = "";
            byte[] imageBytes = new byte[10];
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            if (role.equalsIgnoreCase("photographer")) {

                try {
                    // Establish a database connection
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    conn = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-M90F0PT:1521:orcl", "aniket", "bca");

                    // Create a SQL query
                    String sql = "select picture,age,address,name,phone,photoprice,photovideoprice,about,preweddingprice,weddingprice,commercialprice,eventprice,email from photographers where username=?";

                    // Prepare the SQL query
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, user);

                    // Execute the SQL query
                    rs = pstmt.executeQuery();
                    // Process the result set
                    while (rs.next()) {
                        Blob imageBlob = rs.getBlob("picture");
                        imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                        name = rs.getString("name");
                        age = rs.getInt("age");
                        address = rs.getString("address");
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
            } else {

                try {
                    // Establish a database connection
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    conn = DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-M90F0PT:1521:orcl", "aniket", "bca");

                    // Create a SQL query
                    String sql = "select name,picture,phone,email,dob,gender from users where username=?";

                    // Prepare the SQL query
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, user);

                    // Execute the SQL query
                    rs = pstmt.executeQuery();
                    // Process the result set
                    while (rs.next()) {
                        Blob imageBlob = rs.getBlob("picture");
                        imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                        phone = rs.getString("phone");
                        name = rs.getString("name");
                        dob = rs.getString("dob");
                        gender = rs.getString("gender");
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
                </ul>
            </nav>
        </header>
        <div class="container">

            <div class="profile-pic">
                <% out.write("<img src=\"data:image/jpeg;base64," + new String(Base64.getEncoder().encode(imageBytes)) + "\"/>");%>
            </div>
            <div class="username">
                <label for="username">Username:</label>
                <div class="info"><p>  <%= user%>  </p></div>
            </div>
            <div class="inputs">
                <div class="input">
                    <label for="name"> Name:</label>
                    <div class="info"><p> <%= name%> </p></div>
                </div>
                <div class="input">
                    <label for="phone">Phone:</label>
                    <div class="info"><p> <%= phone%> </p></div>
                </div>
                <div class="input">
                    <label for="email">Email:</label>
                    <div class="info"><p> <%= email%> </p></div>
                </div>
                <div class="input" style="<%= (role != null && !role.equals("photographer")) ? "" : "display: none;"%>">
                    <label for="dob">Date of Birth:</label>
                    <div class="info"><p> <%= dob%> </p></div>
                </div>
                <div class="input" style="<%= (role != null && !role.equals("photographer")) ? "" : "display: none;"%>">
                    <label for="gender">Gender:</label>
                    <div class="info"><p> <%= gender%> </p></div>
                </div>

                <div class="photographer"  style="<%= (role != null && role.equals("photographer")) ? "" : "display: none;"%>">      
                    <div class="input">
                        <label for="address">Address</label>
                        <div class="info"><p> <%= address%></p></div>
                    </div>
                    <div class="input">
                        <label for="age">Age:</label>
                        <div class="info"><p> <%= age%></p></div>
                    </div>
                    <div class="input">
                        <label for="photo price">Photo price:</label>
                        <div class="info"><p> <%= pricePhoto%></p></div>
                    </div>
                    <div class="input">
                        <label for="photo video price">Photo video price:</label>
                        <div class="info"><p> <%= pricePhotoVideo%></p></div>
                    </div>
                    <div class="input">
                        <label for="pre wedding price">Pre wedding price:</label>
                        <div class="info"><p> <%=pre_wedding%></p></div>
                    </div>
                    <div class="input">
                        <label for="wedding price">Wedding price:</label>
                        <div class="info"><p> <%= wedding%></p></div>
                    </div>
                    <div class="input">
                        <label for="commercial price">Commercial Price price:</label>
                        <div class="info"><p> <%= commercial%></p></div>
                    </div>
                    <div class="input">
                        <label for=" Event price">Event price:</label>
                        <div class="info"><p> <%= event%></p></div>
                    </div>
                    <div class="inputabout">
                        <label for="About">About:</label>
                        <div class="infoabout"><p> <%= about%></p></div>
                    </div>
                </div>
            </div>
        </div>

        <footer>
            <button onclick="termOfUse()"> Terms of use</button>
            <p>&copy; 2023 Lenstory</p> 
            <button onclick="pripol()"> Privacy policy</button>
        </footer>

        <script>
            function deleteProfile() {
                const deleteBtn = document.getElementById("delete-btn");
                const confirmationMsg = document.getElementById("confirmation-message");
                const okBtn = document.getElementById("ok-btn");
                const cancelBtn = document.getElementById("cancel-btn");
                const deletedMsg = document.getElementById("deleted-message");

                deleteBtn.addEventListener("click", () => {
                    confirmationMsg.style.display = "block";
                });

                okBtn.addEventListener("click", () => {
                    // Perform account deletion here
                    confirmationMsg.style.display = "none";
                });
                cancelBtn.addEventListener("click", () => {
                    // Perform account deletion here
                    confirmationMsg.style.display = "none";
                });
            }
            function signup() {
                window.location.href = "signup.jsp";

            }
            function pripol() {
                window.location.href = "privacypolicy.jsp?user=<%= user%>&role=<%= role%>";
            }
            function termOfUse() {
                window.location.href = "termsofuse.jsp?user=<%= user%>&role=<%= role%>";
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
        </script>
    </body>
</html>