<%-- 
    Document   : signupPhotographer
    Created on : 8 May, 2023, 2:48:38 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
        <link rel="stylesheet" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Space+Mono:wght@700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@500&family=Raleway&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
        <title>Sign Up</title>
        <style>
            .material-symbols-outlined{
                margin-right: 5px;
            }
            body {
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
            }
            .background{
                background-image: linear-gradient(rgba(0, 0, 0, 0.20), rgba(0, 0, 0, 0.20)), url("https://images.wallpaperscraft.com/image/single/camera_lenses_surface_535355_3840x2400.jpg");
                background-size: cover;
                height:100% ;
                width: 100%;
                background-repeat: no-repeat;
                z-index: -1;
                position: fixed;
            }
            h1 {
                text-align: center;
                margin-top: 40px;
                margin-bottom: 30px;
                padding-right: 40px;
                color: white;
                font-size: 50px;
                font-family: 'Space Mono', monospace;
            }
            form {
                position: absolute;
                display: flex;
                flex-wrap: nowrap;
                flex-direction: column;
                width: 700px;
                padding-left: 70px;
                padding-right: 10px;
                border-radius: 30px;
                position: relative;
                backdrop-filter: blur(20px);
                border:1px solid white;
                color:white;
                margin-top: 10px;
                z-index: 1;
            }
            #image {
                position: absolute;
                clip: rect(0, 0, 0, 0);
                pointer-events: none;
                margin-left: 10%;

            }

            #file-label {
                display: flex;
                flex-direction: row;
                color: white;
                font-weight: bold;
                background: transparent;
                width: 160px;
                padding: 15px 25px;
                font-size: 15px;
                border: 2px solid white;
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
                outline: 1px dotted #000;
                outline: -webkit-focus-ring-color auto 5px;
            }

            #image:valid + #file-label {
                opacity: 1;
            }


            label {
                position:relative;
                display: block;
                margin: 10px 0 15px 0;
                font-size: 16px;
                letter-spacing: 1px;
                font-family: 'Space Mono', monospace;
            }

            .image{
                display: flex;
                justify-content: center;
                align-content: center;
                align-items: center;
                flex-direction: column;
                margin-right: 45px;
            }
            .profileimage{
                border-radius: 50%;
                border:none;
                border: 2px solid white;
            }

            .b{
                position:relative;
                background-color: transparent;
                padding: 12px 40px 12px 0;
                border: 2px solid black;
                border-radius: 10px;
            } 
            input[type=text], input[type=email], input[type=password], input[type=tel], input[type=date],input[type=number],textarea {
                position: relative;
                width: 90%;;
                border: 1px solid white;
                border-radius: 5px;
                margin-bottom: 20px;
                padding: 12px;
                box-sizing: border-box;
                background-color: transparent;
                color:white;
                font-weight: bold;
            }

            input:focus{
                background-color: white;
                color: black;
            }
            input[type=tel].error{                
                border: 1px solid red;
            }
            input[type=password].error {
                border: 1px solid red;
            }
            select {
                position:absolute;
                width: 100%;
                padding: 10px;
                border: 1px solid white;
                border-radius: 5px;
                margin-bottom: 20px;
                box-sizing: border-box;
            }

            .button{
                color: white;
                margin-top: 20px;
                font-weight: bold;
                background: transparent;
                width: 120px;
                padding: 10px 25px;
                font-size: 15px;
                border: 2px solid white;
                border-radius: 15px;
                transition: all 0.3s;
                text-align:center;
                cursor:pointer;
                font-family: 'Space Mono', monospace;
            }
            .button:hover{
                background-color: white;
                color:black;
                transform: scale(1.1);
            }
            a{color: orangered;
              font-size: 25px;
              text-decoration: none;

            }
            a:hover
            {
                color: wheat;

            }
            h4{
                color: white;
                text-decoration: solid;
                font-size: 20px;
                font-family: 'Caveat', cursive;
                letter-spacing: 2px;
                word-spacing: 2px;
            }

            gender{
                background-color:transparent;
                color: white;
            }

            lable{
                float:left;
            }
            select{
                width: 150px;
                height: 30px;
                padding: 5px;
                color: white;
                background-color:transparent;
            }
            select option { color: black;
            }
            select option:first-child{
                color: black;
            }
            input[type=date]
            {
                width: 150px;
                height: 30px;
                padding: 5px;
                margin-left: 2px;
            }
            ::-webkit-calendar-picker-indicator {
                filter: invert(1);
            }
            .dg {
                overflow: hidden;/* Makes this div contain its floats */
                display: grid;
                grid-template-columns: repeat(2, 1fr);
            }
            h2{
                font-family: 'Space Mono', monospace;
                font-size: 20px;

            }
            .file{
                margin:10px 30px 20px 0;
            }
            .portfolio{
                display: flex;
                justify-content: center;
                align-content: center;
                align-items: center;
                flex-direction: column;
                margin-right: 45px;
            }


            input.invalid {
                border: 1px solid red;
            }
            select.invalid {
                border: 1px solid red;
            }


        </style>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="background"></div>
        <form  method="POST" action='http://localhost:8080/photography/Registration'  onsubmit="return checkAge();validateForm1()" enctype="multipart/form-data">
            <h1>Sign Up</h1>
            <br>
            <div class="image">
                <img class="profileimage" id="imgout" width="140" height="140"  src=null disabled/>
                <br>
                <label for="Image"><h2>Profile Image</h2></label>
                <input class="file" type="file" id="image" name="image" onchange ="imgLoad(event)" required="">
                <label for="image" id="file-label"> 
                    <span class="material-symbols-outlined">
                        add_a_photo
                    </span>
                    Choose Image</label>
                <br>
            </div>
            <span id="imgerr" style="color:red"></span>
            <br>
            <label for="username">Username</label>
            <input class="b" type="text" id="username" name="username"   required>

            <label for="name">Name</label>
            <input class="b" type="text" id="name" name="name"   required>

            <label for="email">Email</label>
            <input class="b" type="email" id="email" name="email"  required>

            <label for="password">Password</label>
            <input class="b" type="password" id="pass" name="password"  required>
            <label for="showpass">
                <input type="checkbox" onclick="myFunction()">Show Password</label>
            <br>
            <label for="confirm-password">Confirm Password</label>
            <input class="b" type="password" id="cpass" name="confirm-password" required>
            <label for="showpass">
                <input type="checkbox" onclick="myFunction1()">Show Password</label>
            <br>
            <label for="phone-number" >Phone Number</label>
            <input class="b" type="tel" id="phone" name="phone" pattern="[0-9]{10}" required>
            <span id="lblError" class="error"></span>
            <div class="dg"> 
                <div class="d">
                    <label  for="date-of-birth">Date of Birth</label>
                    <input type="date" id="dob" name="DOB"  required>
                </div>
                <div class="g">
                    <label for="gender" >Gender</label>
                    <select id="gender" name="gender"  required>
                        <option value="">Please select</option>
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                        <option value="other">Other</option>
                    </select>
                </div>
            </div>
            <h2>Select your role:</h2>         
            <label><input type="radio" id="client" name="role" value="client" onclick="sendValue(this.value)"required=""> Client</label>
            <label><input type="radio" id="photographer" name="role" value="photographer" onclick="sendValue(this.value)" required=""> Photographer</label><br>
            <div id="portfolio" style="display: none;" >
                <div>
                    <label for="address">Address</label>
                    <input class="b" type="text" name="address" id="address" />
                </div>
                <div>
                    <label for="per-photo-price">Per Photo Session Price:</label>
                    <input class="b" type="number" name="photoPrice" id="per-photo-price" />
                </div>
                <div>
                    <label for="photo-video-price">Photo Video Session Price:</label>
                    <input class="b" type="number" name="photoVideoPrice" id="photo-video-price" />
                </div>
                <div>
                    <label for="pre-wedding-price">Pre-wedding Price:</label>
                    <input class="b" type="number" name="preWeddingPrice" id="pre-wedding-price" />
                </div>
                <div>
                    <label for="wedding-price">Wedding Price:</label>
                    <input class="b" type="number" name="weddingPrice" id="wedding-price" />
                </div>
                <div>
                    <label for="commercial-price">Commercial Price:</label>
                    <input class="b" type="number" name="commercialPrice" id="commercial-price" />
                </div>
                <div>
                    <label for="event-price">Event Price:</label>
                    <input class="b" type="number" name="eventPrice" id="event-price" />
                </div>
                <div>
                    <label for="about">About:</label>
                    <textarea name="about" id="about"></textarea>
                </div>

            </div>
            <label for="agree"><input type="checkbox" id="agree" name="agree" required> I agree to the Terms and Conditions</label>
            <button  class="button" type="submit" onclick="validatePassword(); validatePhone();validateForm1();submitForm()"  > <span>Sign Up </span> </button>
            <h4>Already a member?
                <a href="login.jsp"> Login </a></h4>
        </form>
        <script>
            function imgLoad(event) {

                var image = document.getElementById('imgout');
                fname = event.target.files[0].name;
                ext = fname.replace(/^.*\./, '');
                if (ext === 'png' || ext === 'jpg' || ext === 'jpeg')
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

            var clientRadio = document.querySelector('input[value="client"]');
            var photographerRadio = document.querySelector('input[value="photographer"]');
            var portfolioDiv = document.getElementById("portfolio");

            photographerRadio.addEventListener("click", function () {
                portfolioDiv.style.display = "block";
            });

            clientRadio.addEventListener("click", function () {
                portfolioDiv.style.display = "none";
            });

            function sendValue(value) {
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "http://loca+lhost:8080/photography/Registration", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.send("role=" + encodeURIComponent(value));
            }

            function myFunction() {
                var x = document.getElementById("pass");
                if (x.type === "password") {
                    x.type = "text";
                } else {
                    x.type = "password";
                }
            }
            function myFunction1() {
                var x = document.getElementById("cpass");
                if (x.type === "password") {
                    x.type = "text";
                } else {
                    x.type = "password";
                }
            }
            function validatePassword() {
                var password = document.getElementById("pass").value;
                var confirmPassword = document.getElementById("cpass").value;

                if (password !== confirmPassword) {
                    document.getElementById("pass").classList.add("error");
                    document.getElementById("cpass").classList.add("error");
                    document.getElementById("cpass").setCustomValidity("Password does not match");

                    return false;
                } else {

                    document.getElementById("pass").classList.remove("error");
                    document.getElementById("cpass").classList.remove("error");
                    document.getElementById("cpass").setCustomValidity("");

                    return true;
                }
            }
            document.querySelector("form").addEventListener("submit", function (event) {
                if (!validatePassword()) {
                    event.preventDefault();
                }
            });
            function validatePhone() {
                var phone = document.getElementById("phone").value;
                phone = phone.replace(/[^0-9]/g, "");
                if (!/^[0-9]{10}$/.test(phone)) {
                    document.getElementById("phone").classList.add("error");
                    document.getElementById("phone").setCustomValidity("Please enter a valid phone number");

                    return false;
                } else {
                    document.getElementById("phone").classList.remove("error");
                    document.getElementById("phone").setCustomValidity("");

                    return true;
                }
            }
            document.querySelector("form").addEventListener("submit", function (event) {
                if (!validatePhone()) {
                    event.preventDefault();
                }
            });

            function validateDOB() {
                var dob = new Date(document.getElementById("dob").value);
                var birthYear = dob.getFullYear();

                if (birthYear > 2003) {
                    document.getElementById("dob").setCustomValidity("You must be at least 18 years old to use this website.");
                    return false;
                } else {
                    document.getElementById("dob").setCustomValidity("");
                    return true;
                }
            }

            document.querySelector("form").addEventListener("submit", function (event) {
                if (!validateDOB()) {
                    event.preventDefault();
                }
            });

            function validateForm1() {
                let isValid = true;

                // username validation
                const username = document.getElementById("username");
                if (username.value === "") {
                    username.classList.add("invalid");
                    isValid = false;
                } else {
                    username.classList.remove("invalid");
                }

                const name = document.getElementById("name");
                if (name.value === "") {
                    name.classList.add("invalid");
                    isValid = false;
                } else {
                    name.classList.remove("invalid");
                }

                // Email validation
                const email = document.getElementById("email");
                if (email.value === "") {
                    email.classList.add("invalid");
                    isValid = false;
                } else {
                    email.classList.remove("invalid");
                }

                // Password validation
                const password = document.getElementById("pass");
                const confirmPassword = document.getElementById("cpass");
                if (password.value === "" || confirmPassword.value === "" || password.value !== confirmPassword.value) {
                    password.classList.add("invalid");
                    confirmPassword.classList.add("invalid");
                    isValid = false;
                } else {
                    password.classList.remove("invalid");
                    confirmPassword.classList.remove("invalid");
                }

                // Phone number validation
                const phone = document.getElementById("phone");
                if (phone.value === "") {
                    phone.classList.add("invalid");
                    isValid = false;
                } else {
                    phone.classList.remove("invalid");
                }

                // Date of birth validation
                const dob = document.getElementById("dob");
                if (dob.value === "") {
                    dob.classList.add("invalid");
                    isValid = false;
                } else {
                    dob.classList.remove("invalid");
                }
                // Gender validation
                const gender = document.getElementById("gender");
                if (gender.value === "") {
                    gender.classList.add("invalid");
                    isValid = false;
                } else {
                    gender.classList.remove("invalid");
                }

                return isValid;
            }

            function submitForm() {
                var username = document.getElementById("username").value;

                // AJAX request to send the username to the second JSP page
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "signupPhoto.jsp", true);
                xhr.xsetRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        // Handle the response from the second JSP page if needed
                        var response = xhr.responseText;
                        console.log(response);
                    }
                };
                xhr.send("username=" + encodeURIComponent(username));
            }

        </script>
    </body>
</html>
