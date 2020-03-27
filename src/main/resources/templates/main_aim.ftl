<html>
<head>
    <title>A I M</title>
    <link rel="shortcut icon" type="image/png" href="https://cdn0.iconfinder.com/data/icons/tiny-icons-1/100/tiny-15-512.png">
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="stylesheet" href="/static/css/buttons.css">
    <link rel="stylesheet" href="/static/css/photos.css">
    <link rel="stylesheet" href="/static/css/text.css">
    <script type="text/javascript" src="/static/javascript/js.js"></script>
    <script type="text/javascript" src="/static/javascript/validators.js"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/css/menu.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <#import "parts/menu.ftl" as menu>
    <#import "parts/footer.ftl" as footer>
    <#import "parts/elements.ftl" as elements>
    <#import "parts/aims.ftl" as aims>
    <#import "parts/smartAimMarcos.ftl" as smartMacros>

</head>
<body>

    <style>
        .fa{
            margin-right: 5px;
        }
    </style>

    <@menu.navBar true/>

    <div class="parallax big-img-smart w3-display-container w3-opacity-min" id="home">
        <div class="w3-display-middle" style="white-space:nowrap;">
            <span class="w3-center w3-padding-large w3-black w3-xlarge w3-wide w3-animate-opacity">JUST CREATE</span>
        </div>
    </div>

    <!-- Create AIM container-->
    <div class="w3-content w3-container w3-padding-64" id="create">
        <h3 class="w3-center w3-black ">Create Your A I M</h3>
        <p class="w3-center article">
            <em>It`s easier than You think</em>
        </p>
        <p class="article-text">
            What is Lorem Ipsum?
        </p>

        <div class="w3-center w3-row">
            <h3 class="w3-center">Create smart AIM</h3>
            <form action="/main_aim/add" method="get" enctype="multipart/form-data">
                <div class="w3-center">
                    <@smartMacros.addSmartAim/>
                </div>
            </form>
        </div>

    </div>

    <div class="parallax big-img-smart w3-display-container w3-opacity-min" id="third">
        <div class="w3-display-middle" style="white-space:nowrap;">
            <span class="w3-center w3-padding-large w3-black w3-xlarge w3-wide w3-animate-opacity">YOUR AIMS</span>
        </div>
    </div>

    <#--All S.M.A.R.T AIMS table-->
    <div class="w3-content w3-container w3-padding-64" id="aims">
        <div class="w3-center w3-row">
            <h3 class="w3-center">All aims</h3>
            <@smartMacros.smartTable aims=all_aims/>
        </div>
    </div>

    <div class="parallax big-img-smart w3-display-container w3-opacity-min" id="fourth">
    </div>

    <!-- Footer -->
    <@footer.footer>
    </@footer.footer>

</body>
</html>