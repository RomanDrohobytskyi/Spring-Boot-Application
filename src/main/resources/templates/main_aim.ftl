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

    <#import "parts/footer.ftl" as footer>
    <#import "parts/elements.ftl" as elements>

</head>
<body>
<style>
/*    textarea {
        display: block;
        margin-left: auto;
        margin-right: auto;
    }*/
</style>

<!-- NavBar (sit on top) -->
<div class="w3-top">
    <div class="w3-bar" id="myNavBar">
        <a class="w3-bar-item w3-button w3-hover-black w3-hide-medium w3-hide-large w3-right" href="javascript:void(0);" onclick="toggleFunction()" title="Toggle Navigation Menu">
            <i class="fa fa-bars"></i>
        </a>
        <a href="/" class="w3-bar-item w3-button"><i class="fa fa-home"></i>HOME</a>
        <a href="#home" class="w3-bar-item w3-button"><i class="fa fa-chevron-up"></i>Up</a>
        <a href="#about" class="w3-bar-item w3-button w3-hide-small"><i class="fa fa-user"></i> ABOUT</a>
        <a href="/main" class="w3-bar-item w3-button w3-hide-small"><i class="fa fa-envelope"></i> MESSAGES</a>
        <a href="/login" class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-red"><i class="fa fa-sign-out"></i>
            <form action="/logout" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
            </form>
        </a>
        <a href="#" class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-red">
            <i class="fa fa-search"></i>
        </a>
    </div>

    <!-- NavBar on small screens -->
    <div id="navDemo" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium">
        <a href="#about" class="w3-bar-item w3-button" onclick="toggleFunction()">ABOUT</a>
        <a href="main.ftl" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i> MESSAGES</a>
        <a href="/login" class="w3-bar-item w3-button w3-right w3-hover-red"><i class="fa fa-sign-in"></i></a>
        <a href="#" class="w3-bar-item w3-button">SEARCH</a>
    </div>
</div>

<!-- First Parallax Image with Text -->
<div class="parallax big-img-smart w3-display-container w3-opacity-min" id="home">
    <div class="w3-display-middle" style="white-space:nowrap;">
        <span class="w3-center w3-padding-large w3-black w3-xlarge w3-wide w3-animate-opacity">WHAT IS AIM</span>
    </div>
</div>

<!-- Definition of AIM container-->
<div class="w3-content w3-container w3-padding-64" id="about">
    <h3 class="w3-center w3-black ">S.M.A.R.T</h3>
    <p class="w3-center article"><em>It`s easier than You think</em></p>
    <p class="article-text">
        What is Lorem Ipsum?
    </p>
    <div class="w3-row">
        <div class="w3-col m6 w3-center w3-padding-large">
            <img src="https://www.professionalacademy.com/media/images-news/smarter-objectives.jpg" class="big-img-small-smart w3-round w3-image w3-opacity w3-hover-opacity-off" onclick="onClick(this)" alt="Photo of Me" width="100%">
                <p>
                    <b>S.M.A.R.T</b>
                </p>
            <br>
        </div>

        <!-- Hide this text on small devices -->
        <div class="w3-col m6 w3-hide-small w3-padding-large">
            <p class="article-text">
                Why do we use it?
            </p>
        </div>
    </div>
</div>

<!-- Second Parallax Image with Portfolio Text -->
<div class="parallax big-img-smart w3-display-container w3-opacity-min" id="home">
    <div class="w3-display-middle" style="white-space:nowrap;">
        <span class="w3-center w3-padding-large w3-black w3-xlarge w3-wide w3-animate-opacity">JUST CREATE</span>
    </div>
</div>

<!-- Create AIM container-->
<div class="w3-content w3-container w3-padding-64" id="about">
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

            <@elements.input id="aim_title" name="title" type="text" placeholder="t i t l e . . ."
                onfocus="this.placeholder = ''"  onblur="this.placeholder = 't i t l e . . .'"/>

            <p class="w3-center">d e s c r i p t i o n</p>
            <@elements.input id="aim_description" name="description" type="text" placeholder="d e s c r i p t i o n  . . ."
                onfocus="this.placeholder = ''"  onblur="this.placeholder = 'd e s c r i p t i o n  . . .'"/>

            <p class="w3-center">T e x t </p>

            <textarea  id="aim_text" name="text" placeholder="t e x t  . . ." rows="2" cols="21">
            </textarea>
            <#-- <@elements.input id="input" name="text" type="text" placeholder="t e x t . . ."
                onfocus="this.placeholder = ''"  onblur="this.placeholder = 't e x t . . .'"/>-->
            <br>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />

            <button type="submit" class="btn btn1 w3-button w3-padding-large"
                    onclick="return validateLength('Title', 'aim_title', 3, 32)">
                A d d
            </button>
        </form>
    </div>

</div>

<#--Third paralax IMG-->
<div class="parallax big-img-smart w3-display-container w3-opacity-min" id="home">
    <div class="w3-display-middle" style="white-space:nowrap;">
        <span class="w3-center w3-padding-large w3-black w3-xlarge w3-wide w3-animate-opacity">YOUR AIMS</span>
    </div>
</div>

<#--All AIMs-->
<div class="w3-content w3-container w3-padding-64" id="messages">
    <div id="aims" class="w3-center w3-row">
        <h3 class="w3-center">All aims</h3>


        <#-- Table of a messages -->
        <table id="aimsTable" align="center" width="100%" style="/*table-layout: fixed;*/">
        <#-- Table header -->
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Text</th>
                <th>Description</th>
                <th>User email</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>

        <#-- All Aims -->
            <#if all_aims?has_content>
                <#list all_aims as aim>
                    <#if aim.aimState!= "DELETED">
                        <tr id="aim_${aim.id}" style="text-align:center; height: 100px">
                            <td><b>
                                <a href="/aim_details/${aim.id}" style="text-decoration:none">
                                    ${aim.id}
                                </a>
                            </b></td>
                            <td><span>${aim.title}</span></td>
                            <td style="word-wrap: break-word"><i>${aim.text}</i></td>
                            <td style="word-wrap: break-word"><i>${aim.description}</i></td>
                            <td>${aim.user.email}</td>
                            <td>
                                <div>
                                    <a href="/editAim/${aim.id}" ><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                </div>
                            </td>

                            <td>
                                <div>
                                    <a href="/main_aim/delete/${aim.id}">
                                        <i class="fa fa-trash-o" aria-hidden="true" title="Delete aim"></i>
                                    </a>
                                    <input type="hidden" value="${aim}" name="aim">
                                </div>
                            </td>
                        </tr>
                    </#if>
                </#list>
            <#else>
                 <h4 class="w3-center" style="font-weight: bold;">No aims yet</h4>
            </#if>
        </table>
    </div>
</div>


<!-- Footer -->
<@footer.footer>
</@footer.footer>

</body>
</html>