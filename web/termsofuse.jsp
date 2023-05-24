<%-- 
    Document   : termsofuse
    Created on : 14 May, 2023, 12:08:52 AM
    Author     : sohel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Space+Mono:wght@700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Monoton&display=swap" rel="stylesheet">

        <style>
            *{
                margin:0;
                padding: 0;
                box-sizing: border-box;
            }
            h1{
                margin: 0;
                font-family: 'Space Mono', monospace;
                text-align: center; 
                color: orange;
            }
            h2{
                font-size: 1.2em;
                margin-top: 20px;
                font-family: 'Space Mono', monospace;
            }
            head{
                text-align: center; 
                color: orange;
            }
            use{ padding: 20px;
                 border: 1px solid #ccc;

            }
            body {
                font-family: Arial, sans-serif;
                font-size: 20px;
                background-color: papayawhip;


            }
            .a{
                margin:100px 100px 0 100px;
                padding: 30px;
                height:100%;

            }
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
                background-color: rgba(255, 255, 255, 0.074);
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
            }
            .logo h1 a {
                font-size: 30px;
                color:orangered;
                font-family: 'Space Mono', monospace;
                font-weight: bold;
                transition: 0.4s;
            }
            .logo h1 a:hover{
                cursor: pointer;
                transition: 0.4s;
                color: black;
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
                font-size: 18px;
                font-weight: 600;
                color:rgba(252,70,46,255);
                transition: 0.4s;

            }
            header nav ul li a:hover {
                font-size: 18px;
                font-weight: 600;
                color:white;
                transition: 0.4s;
                color: black;
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
                transform: scale(1.03);
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
                height: 2px;
                background-color: black;
                transition-timing-function: cubic-bezier(0.25, 0.8, 0.25, 1);
                transition-duration: 400ms;
                transition-property: width, left;
            }
            footer {
                display: flex;
                flex-wrap: wrap;
                flex-direction: row;
                align-content: center;
                align-items: center;
                justify-content: center;
                background-color: #333333;
                padding: 10px 0px 10px 10px;
                color: rgba(232,210,169,255);
                text-align: center;
                height:10%;
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
            String role = request.getParameter("role");
        %>
        <header >
            <div class="logo">
                <h1><button><a href="mainpage.jsp?user=<%= user%>&role=<%= role%>" > Lenstory</a></button></h1>
            </div>
            <nav>
                <ul>
                    <li><button><a href="firstpage.jsp">Home</a></button></li>
                    <li><button><a href="gallery.jsp?user=<%= user%>&role=<%= role%>">Gallery</a></button></li>
                    <li><button><a href="about.jsp?user=<%= user%>&role=<%= role%>">About</a></button></li>
                    <li><button><a href="contact.jsp?user=<%= user%>&role=<%= role%>">Contact</a></button></li>
                    <li><button><a href="profile.jsp?user=<%= user%>&role=<%= role%>">Profile</a></button></li>

                </ul>
            </nav>
        </header>
        <div class="a">
            <div class="head">
                <h1>Terms of use</h1>

            </div>
            <div class="use">
                <h2>Terms of Service :</h2>  
                <p>This section should describe the general terms and conditions that govern the use of the booking system, including any limitations on liability, warranties, and disclaimers.</p>
                <h2> User Conduct:-</h2>    
                <p>This section should outline the expected behavior of users when using the booking system. This may include prohibitions against harassment, spamming, and illegal activities.</p>  
                <h2> Fees and Payments:-</h2>
                <p> If the booking system charges fees for its services, this section should detail the amount, timing, and methods of payment.</p>
                <h2>Intellectual Property :-</h2>  
                <p>This section should describe the ownership and use of any intellectual property associated with the booking system, including any trademarks, copyrights, or patents.</p>
                <h2>Privacy Policy:-</h2>
                <p>This section should outline the system's privacy policy, including the collection, use, and sharing of user data.</p>
                <h2>Termination and Cancellation:-</h2>  
                <p> This section should describe the circumstances under which the booking system may terminate or cancel a user's account or booking</p>  
                <h2>Dispute Resolution:-</h2>   
                <P>This section should describe the procedures for resolving any disputes between the booking system and its users.</P>
                <h2>Governing Law:-</h2>  
                <p>This section should specify the jurisdiction and laws that govern the agreement between the user and the booking system.</p>

            </div>
        </div>
        <br><br>
        <footer>
            <button onclick="pripol()"> Privacy policy</button>
            <p>&copy; 2023 Lenstory</p> 
        </footer>
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
        </script>
    </body>
</html>
