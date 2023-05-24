<%-- 
    Document   : login
    Created on : 9 May, 2023, 11:49:34 PM
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
        <link href="https://fonts.googleapis.com/css2?family=Raleway&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@500&family=Raleway&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Proza+Libre:wght@500&display=swap" rel="stylesheet">
        <style>
            body {
                height: 100%;
                display: flex;
                justify-content: center;
            }
            .background{
                position: fixed;
                margin: 0;
                padding: 0;
                background-image: linear-gradient(rgba(0, 0, 0, 0.20), rgba(0, 0, 0, 0.20)), url("https://images.wallpaperscraft.com/image/single/camera_hand_bw_199179_1920x1080.jpg");
                background-repeat: no-repeat;
                background-size: cover;
                height: 100%;
                width:100%;
                top: 0;
                left: 0;
                z-index: -1;
                background-position: center;

            }

            a{
                color: yellow;
                text-decoration: none;
                transition: 0.3s ease-in-out;

            }
            a:hover
            {
                color: black;
            }

            form{
                display: flex;
                flex-wrap: nowrap;
                flex-direction: column;
                justify-content: center;
                align-content: center;
                align-items: center;
                position: absolute;
                backdrop-filter: blur(15px);
                border:1px solid white;
                height:auto;
                background-color: rgba(250,250,250,0.2);
                width: 400px;
                margin-top: 1vw;
                border-radius: 50px;
                padding: 0px 3vw 3vw 3vw;
                transition: 0.3s ease-in-out;
            }
           
            p{
                color: red;
                font-size: 18px;
                font-family: 'Space Mono', monospace;
            }
            .b{
                color: white;
                width:80%;
                position: relative; 
                background-color: transparent;
                padding: 15px 20px;
                border: 1px solid white;
                border-radius: 10px;
                font-family: 'Space Mono', monospace;
            } 
            .b:hover{
                border: 1px solid black;

            }
            .showpass{
                color: white;
                position: relative;
                font-weight: bold;
                word-spacing: 2px;
                letter-spacing: 1px;
                font-family: 'Space Mono', monospace;
                font-size: 14px;
                right:110px;
                font-weight: bold;
            }

            .button{
                color: white;
                font-weight: bold;
                background: transparent;
                width: 120px;
                padding: 15px 25px;
                margin: 30px 0 20px 0;
                font-size: 15px;
                border: 2px solid white;
                border-radius: 15px;
                transition: all 0.3s;
                cursor:pointer;
                font-family: 'Space Mono', monospace;
            }
            .button:hover{
                background-color: white;
                color:black;
                transform: scale(1.1);
            }
            .button span {
                cursor: pointer;
                display: inline-block;
                position: relative;
            }

            h1{
                color: white;
                text-align: center;
                font-size: 50px;
                font-family: 'Space Mono', monospace;
                letter-spacing: 2px;
                margin-bottom: 60px;
            }

            h2{
                color: white;
                text-decoration: solid;
                font-size: 22px;
                font-family: 'Caveat', cursive;
                letter-spacing: 2px;
                word-spacing: 2px;
                font-weight: bold;
            }

            ::placeholder {
                color: white;
                opacity: 1;
                font-family: 'Space Mono', monospace;
                font-weight: bold;
                font-size: 17px;
                letter-spacing: 2px;

            }

            :-ms-input-placeholder { /* Internet Explorer 10-11 */
                color: white;
                font-family: 'Space Mono', monospace;
                font-weight: bold;
                font-size: 17px;

            }

            ::-ms-input-placeholder { /* Microsoft Edge */
                color: white;
                font-weight: bold;
                font-size: 17px;
                font-family: 'Space Mono', monospace;
            }
            .checkrole{
                display: flex;
                flex-direction: column;
                margin-right: 44%;
            }

            .checkrole label{
                color:white;
                font-family: 'Space Mono', monospace;

            }

            .check{
                font-family: 'Space Mono', monospace;
            }

            input[type="text"].invalid,
            input[type="password"].invalid {
                border: 1px solid red;
            }
            ::placeholder.invalid{
                color: red;
            }
            .error {
                color: red;
                font-family: 'Space Mono', monospace;
                font-weight: bold;
                font-size: 16px;
                margin-left: 10px;
            }

        </style>

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login Page</title>
    </head>
    <body> 
        
        <div class="background"></div>
        <form action="http://localhost:8080/photography/LoginServlet" method="post" > <br>

            <h1>Login</h1>
            <p id="errorMessage">${myValue}</p>
            <input class="b" type="text" name="name" id="name"  size="50" placeholder="Username"   required><br>
            <span id="username-error" class="error"></span>
            <span id="name-error" class="error"></span><br>

            <input class="b"  type="password" name="pass"  id="pass"  size="50" placeholder="Password"   required><br>
            <span id="password-error" class="error"></span>
            <span id="pass-error" class="error"></span>
            <div class="showpass">
                <input type="checkbox" onclick="myFunction()">Show Password
            </div>
            <br>
            <div class="checkrole">
                <h2 class="check">Login as a?</h2>         
                <label><input  type="radio" id="client" name="role" value="client" onclick="sendValue(this.value)"required=""> Client</label>
                <label><input  type="radio" id="photographer" name="role" value="photographer" onclick="sendValue(this.value)" required=""> Photographer</label><br>
            </div>
            <button  class="button" type="submit" onclick="validateForm()" ><span>Login </span></button>
            <h2>Not a member? 
                <a href="signup.jsp"> Sign Up</a>
            </h2>

        </form>

        <script>

            function sendValue(value) {
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "http://localhost:8080/photography/LoginServlet", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.send("role=" + encodeURIComponent(value));
            }
            
            

            var username = document.getElementById("name");
            var password = document.getElementById("pass");
            var errorMessage = document.getElementById("errorMessage");

            username.addEventListener("focus", function () {
                errorMessage.style.display = "none";
            });
            password.addEventListener("focus", function () {
                errorMessage.style.display = "none";
            });


            function myFunction() {
                var x = document.getElementById("pass");
                if (x.type === "password") {
                    x.type = "text";
                } else {
                    x.type = "password";
                }
            }

            function validateForm() {
                const username = document.getElementById("name");
                const password = document.getElementById("pass");
                if (username.value === "") {
                    username.classList.add("invalid");
                    document.getElementById("username-error").textContent = "Please enter a username";
                } else {
                    username.classList.remove("invalid");
                    document.getElementById("username-error").textContent = "";
                }

                if (password.value === "") {
                    password.classList.add("invalid");
                    document.getElementById("password-error").textContent = "Please enter a password";
                } else {
                    password.classList.remove("invalid");
                    document.getElementById("password-error").textContent = "";
                }
            }

            const nameInput = document.getElementById("name");
            const passInput = document.getElementById("pass");
            nameInput.addEventListener("blur", function () {
                if (nameInput.value === "") {
                    nameInput.classList.add("invalid");
                    document.getElementById("name-error").textContent = "Please enter a username";
                } else {
                    nameInput.classList.remove("invalid");
                    document.getElementById("name-error").textContent = "";
                }
            });
            passInput.addEventListener("blur", function () {
                if (passInput.value === "") {
                    passInput.classList.add("invalid");
                    document.getElementById("pass-error").textContent = "Please enter a password";
                } else {
                    passInput.classList.remove("invalid");
                    document.getElementById("pass-error").textContent = "";
                }
            });
            function validateForm() {
                if (nameInput.value === "") {
                    nameInput.classList.add("invalid");
                    document.getElementById("name-error").textContent = "Please enter a username";
                } else {
                    nameInput.classList.remove("invalid");
                    document.getElementById("name-error").textContent = "";
                }

                if (passInput.value === "") {
                    passInput.classList.add("invalid");
                    document.getElementById("pass-error").textContent = "Please enter a password";
                } else {
                    passInput.classList.remove("invalid");
                    document.getElementById("pass-error").textContent = "";
                }
            }
            var myValue = "Invalid Username or Password";
            // Use the value in JavaScript code
            swal(myValue);


        </script> 

    </body>

</html>
