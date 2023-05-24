<%-- 
    Document   : photo_enent
    Created on : 17 May, 2023, 3:35:51 AM
    Author     : sohel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head> <link rel="stylesheet" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Space+Mono:wght@700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Monoton&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="">
        <link href='https://unpkg.com/css.gg@2.0.0/icons/css/software-upload.css' rel='stylesheet'>
        <style>

            body{
                background-color: #4c2b61;
            }

            h1{
                margin:30px 0 0 0;
                text-align: center;
                color: white;
                font-family: 'Space Mono', monospace;
            }
            h3{
                text-align: center;
                color: white;
                font-family: 'Space Mono', monospace;

            }
            .wallpaper{
                background-image: url("https://replicate.delivery/pbxt/RvNuzxUxfTSlACYi4V4RGeBGq6yrN6N4OR6yg67q7cUdNU8QA/output.png");
                background-size: cover;
                background-repeat: no-repeat;
                width: 100%;
                height: 100%;
                position: fixed;
            }
            .allform{
                display: flex;
                justify-content: center;
                margin-right: 450px;
                color: #161d27;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
                backdrop-filter: blur(20px);
                border: 2px solid  white;
                border-radius: 60px;
                margin-left: 400px;
                margin-top: 25px;
                width: 800px;
            }
            .total{
                display: flex;
                flex-direction: row;
                align-content: center;
                align-items: center;
            }
            .container {
                display: flex;
                flex-direction: column;
                align-items: center;
                width: auto;
                margin: auto;
                padding: 20px;
                background-color:transparent;
                border-radius: 5px;

            }

            .gg-software-upload {
                box-sizing: border-box;
                position: relative;
                display: block;
                transform: scale(var(--ggs,1));
                width: 16px;
                height: 6px;
                border: 2px solid;
                border-top: 0;
                border-bottom-left-radius: 2px;
                border-bottom-right-radius: 2px;
                margin: 13px 15px 0 0;
            }

            .gg-software-upload::after {
                content: "";
                display: block;
                box-sizing: border-box;
                position: absolute;
                width: 8px;
                height: 8px;
                border-left: 2px solid;
                border-top: 2px solid;
                transform: rotate(45deg);
                left: 2px;
                bottom: 4px
            }

            .gg-software-upload::before {
                content: "";
                display: block;
                box-sizing: border-box;
                position: absolute;
                border-radius: 3px;
                width: 2px;
                height: 10px;
                background: currentColor;
                left: 5px;
                bottom: 3px
            } 
            .image{
                border: 4px dashed white;
                display: flex;
                flex-direction: column;
                justify-content: space-around;
                align-content: center;
                align-items: center;
                width:300px;
                height: 350px;
                border-radius: 30px;
            } 
            img{
                border: none;
                border-radius: 30px;

            }
            #image {
                clip: rect(0, 0, 0, 0);
                pointer-events: none;
                opacity: 0;

            }

            #file-label {
                display: flex;
                flex-direction: row;
                color: black;
                font-weight: bold;
                background: transparent;
                width: 160px;
                padding: 15px 10px 15px 25px;
                font-size: 15px;
                border: 2px solid black;
                border-radius: 15px;
                transition: all 0.3s;
                text-align:center;
                cursor:pointer;
                font-family: 'Space Mono', monospace;
            }

            #image:hover + #file-label {
                background-color: white;
                color:black;
                transform: scale(1.1);
            }

            #image:focus + #file-label {
                outline: -webkit-focus-ring-color auto 5px;
            }

            #image:valid + #file-label {
                opacity: 1;
            }

            #imgerr{
                font-family: 'Space Mono', monospace;
            }

            /* Style for input fields */
            input[type=text], select, input[type=file] {
                width: 100%;
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            /* Style for submit button */
            #done{
                color: black;
                font-weight: bold;
                background: transparent;
                width: 150px;
                padding: 10px 25px;
                font-size: 15px;
                border: 2px solid black;
                border-radius: 15px;
                transition: all 0.3s;
                text-align:center;
                cursor:pointer;
                font-family: 'Space Mono', monospace;
            }
            #done:hover{
                background-color: white;
                color:black;
                transform: scale(1.1);
            }

            /* Style for form labels */
            label {
                font-size: 18px;
                font-weight: bold;
                color: white;
                font-family: 'Space Mono', monospace;
            }
            .img #logo{
                width:50px;
                height: 50px;
                top:10px;
                left:10px;
            }
            /* Style for error messages */
            .error-msg {
                color: red;
                font-size: 14px;
            }

            /* Style for success messages */
            .success-msg {
                color: green;
                font-size: 14px;
            }

            .homediv
            {
                text-align: center;
            }
            #home
            {
                align-content: center;
                background-color: #0069d9;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 18px;
                color: #ffffff;
            }
            a{
                text-decoration: none;
            }
            .next{
                color: black;
                font-weight: bold;
                background: transparent;
                width: 140px;
                height: auto;
                margin-top: 71%;
                margin-right: 5%;
                margin-left: 5%;
                font-size: 15px;
                border: 2px solid black ;
                border-radius: 25px;
                transition: all 0.3s;
                padding: 15px 20px 0 20px;
                cursor:pointer;
                font-family: 'Space Mono', monospace;
                padding:15px ;

            }
            .next:hover{
                background-color: white;
                color:black;
                transform: scale(1.1);
            }

            .total{
                text-align: center;
            }

        </style>
    </head>
    <body>
        <div class="wallpaper"></div>
        <%
            String user = request.getParameter("user");
            String name = request.getParameter("name");
        %>
        <div class="allform">
            <div class="total">
                <a class="next"href="signup_photo_commercial.jsp?user=<%= user%>&name=<%= name%>">previous</a>

                </form>
                <form  id="myForm" method="POST" action="http://localhost:8080/photography/portfolio" enctype="multipart/form-data">
                    <h1>Welcome <%= name%></h1>  
                    <h3> Add at least 5 Event Photos to your portfolio</h3>
                    <div class="container">
                        <div class="image">
                            <img class="profileimage" id="imgout" width="100%" height="100%"  src=""  disabled/>
                        </div>
                        <input class="file" type="file" id="image" name="image" onchange ="imgLoad(event)" required="">
                        <label for="image" id="file-label"><i class="gg-software-upload"></i> Choose Image </label>
                        <span id="imgerr" style="color:red"></span>
                        <br>
                        <br>
                        <%
                            String error = request.getParameter("status");
                            if (error != null && error.equalsIgnoreCase("success")) {
                                out.println("<span class=\"success-msg\">Added Successfully</span>");
                            } else if (error != null && error.equalsIgnoreCase("failed")) {
                                out.println("<span class=\"error-msg\">Failed To Add</span>");
                            } else {
                                out.println("<span class=\"error-msg\"></span>");
                            }
                        %>

                        <input type="hidden" name="user" value="<%= user%>">
                        <input type="hidden" name="name" value="<%= name%>">
                        <input type="hidden" name="genre" value="event">
                        <br>
                        <button  type="submit" name="submit" id="done">Add Image</button>
                        <br>
                    </div>
                </form>

                <a class="next"href="otp.html">Complete Signup</a>

            </div>
        </div>
        <script>

            function imgLoad(event) {

                var image = document.getElementById('imgout');
                fname = event.target.files[0].name;
                ext = fname.replace(/^.*\./, '');
                if (ext === 'png' || ext === 'jpg' || ext === 'jpeg' || ext === 'PNG' || ext === 'JPG' || ext === 'JPEG')
                {
                    image.src = URL.createObjectURL(event.target.files[0]);
                    document.getElementById("imgerr").innerHTML = "";
                    return true;
                } else
                {
                    document.getElementById("imgerr").innerHTML = "Only png, jpg, jpeg types allowed";
                    image.src = "null/";
                    return false;
                }
            }
            ;

            document.getElementById("myForm").submit();
        </script>
         </body>
</html>