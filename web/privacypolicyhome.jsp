<%-- 
Document   : privacypolicy
Created on : 14 May, 2023, 12:07:59 AM
Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="stylesheet" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Space+Mono:wght@700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Monoton&display=swap" rel="stylesheet">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Lenstory Privacy Policy</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            body {
                font-family: 'Roboto', sans-serif;
                font-size: 16px;
                background-color: white;
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
            .container {
                margin:100px 100px 0 100px;
                padding: 30px;
                height:100%;
                background-color: #fff;
            }

            h1 {
                font-family: 'Space Mono', monospace;
                font-size: 36px;
                font-weight: 700;
                margin: 0 0 20px;
                text-align: center;
                color: #222;
            }

            h2 {
                font-family: 'Space Mono', monospace;
                font-size: 24px;
                font-weight: 700;
                margin: 30px 10px 20px;
                color: #222;
            }

            p {
                margin: 20px 40px;
            }
            ul{
                margin-left: 40px;
            }
            footer {
                display: flex;
                flex-wrap: wrap;
                flex-direction: row;
                align-content: center;
                align-items: center;
                justify-content: center;
                background-color: #333333;
                padding: 10px 0px 10px 90px;
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
        String role = request.getParameter("role");
        %>
        <header >
            <div class="logo">
                <h1><button><a href="landingpage.jsp" > Lenstory</a></button></h1>
            </div>
            <nav>
                <ul>
                    <li><button><a href="landingpage.jsp">Home</a></button></li>
                    <li><button><a href="galleryhome.jsp">Showcase</a></button></li>
                    <li><button><a href="abouthome.jsp">About</a></button></li>
                    <li><button><a href="contacthome.jsp">Contact</a></button></li>
                </ul>
            </nav>
        </header>
        <div class="container">
            <h1>Lenstory Privacy Policy</h1>

            <p>This privacy policy governs the manner in which Lenstory collects, uses, maintains and discloses information collected from users of the Lenstory website.</p>

            <h2>Personal Identification Information</h2>

            <p>We may collect personal identification information from users in a variety of ways, including, but not limited to, when users visit our website, register on the website, place an order, fill out a form, and in connection with other activities, services, features or resources we make available on our website. Users may be asked for, as appropriate, name, email address, mailing address, phone number, and credit card information. We will collect personal identification information from users only if they voluntarily submit such information to us. Users can always refuse to supply personal identification information, except that it may prevent them from engaging in certain website-related activities.</p>

            <h2>Non-Personal Identification Information</h2>

            <p>We may collect non-personal identification information about users whenever they interact with our website. Non-personal identification information may include the browser name, the type of computer and technical information about users' means of connection to our website, such as the operating system and the Internet service providers utilized and other similar information.</p>

            <h2>How We Use Collected Information</h2>

            <p>Lenstory may collect and use users' personal information for the following purposes:</p>

            <ul>
                <li>To improve customer service</li>
                <li>To personalize user experience</li>
                <li>To process payments</li>
                <li>To send periodic emails</li>
            </ul>

            <h2>How We Protect Your Information</h2>

            <p>We adopt appropriate data collection, storage and processing practices and security measures to protect against unauthorized access, alteration, disclosure or destruction. Sensitive and private data exchange between the website and its users happens over a SSL secured communication channel and is encrypted and protected with digital signatures.</p>

            <h2>Sharing Your Personal Information</h2>

            <p>We do not sell, trade, or rent users' personal identification information to others. We may share generic aggregated demographic information not linked to any personal identification information regarding visitors and users with our business partners, trusted affiliates and advertisers for the purposes outlined above.</p>

            <h2>Changes to This Privacy Policy</h2>

            <p>Lenstory has the discretion to update this privacy policy at any time. When we do, we will revise the updated date at the bottom of this page. We encourage users to frequently check this page for any changes to stay informed about how we are helping to protect the personal information we collect. You acknowledge and agree that it is your responsibility to review this privacy policy periodically and become aware of modifications.</p>

            <h2>Your Acceptance of These Terms</h2>

            <p>By using this website, you signify your acceptance of this policy. If you do not agree to this policy, please do not use our website. Your continued use of the website following the posting of changes to this policy will be deemed your acceptance of those changes.</p>
        </div>
        <footer>
            <button onclick="termOfUse()"> Terms of use</button>
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
            function termOfUse() {
                window.location.href = "termsofusehome.jsp";
            }
        </script>
    </body>
</html>


