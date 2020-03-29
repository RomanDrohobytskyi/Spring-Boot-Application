<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>P r o f i l e</title>
    <link rel="shortcut icon" type="image/png" href="https://cdn0.iconfinder.com/data/icons/basic-outline/64/icon-basic-set_12-camera-512.png">
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="stylesheet" href="/static/css/buttons.css">
    <link rel="stylesheet" href="/static/css/login.css">
    <link rel="stylesheet" href="/static/css/text.css">
    <script type="text/javascript" src="/static/javascript/js.js"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/css/menu.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <#import "parts/menu.ftl" as menu>
    <#import "parts/footer.ftl" as footer>
    <#import "parts/elements.ftl" as elements>
</head>
<body>

    <@menu.customMenu menuElements slideMenuElements/>

    <!-- LOGIN Parallax Image -->
    <div class="parallax big-img-login-1 w3-display-container w3-opacity-min" id="home">
        <div class="w3-display-middle" style="white-space:nowrap;">
            <span class="w3-center w3-padding-large w3-black w3-xlarge w3-wide w3-animate-opacity">Login</span>
        </div>
    </div>

    <!-- LOGIN Container -->
    <div class="w3-content w3-container w3-padding-64" id="login">
        <div class="w3-center w3-row">
            <form method="get" action="/login">
                <p style="color: red">
                ${validatorError!}
                </p>
            </form>

            <form method="post" action="/login">
                <p class="w3-center">Enter Email: </p>
                <input class="login-input" type="email" name="username" placeholder="${email!''}"/>
                <p class="w3-center">Enter password: </p>
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <input class="login-input" type="password" name="password" placeholder="password"/>
                <br>
                <button type="submit" class="btn btn1 w3-button w3-padding-large">Save</button>
            </form>
        </div>
    </div>

    <@footer.footer/>
</body>
</html>