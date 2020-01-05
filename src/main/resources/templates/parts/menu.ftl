<#macro customMenu elements withSlideMenu=true>
    <style>
        .fa{margin-right: 5px;}
    </style>

    <!-- NavBar (sit on top) -->
    <div class="w3-top">
        <div class="w3-bar" id="myNavBar">
            <#if withSlideMenu>
                <@slideMenu/>
            </#if>

            <#list elements as element>
                <a href="${element.url!''}" class="${element.hrefCssClass!''}"><i class="${element.cssClass!''}"></i>${element.name!''}</a>
            </#list>
        </div>
    </div>

</#macro>

<#macro navBar withSlideMenu=true>

    <style>
        .fa{margin-right: 5px;}
    </style>

    <!-- NavBar (sit on top) -->
    <div class="w3-top">
        <div class="w3-bar" id="myNavBar">

            <#if withSlideMenu>
                <@slideMenu/>
            </#if>

            <a href="/" class="w3-bar-item w3-button"><i class="fa fa-home"></i>HOME</a>
            <a href="#" class="w3-bar-item w3-button"><i class="fa fa-chevron-up"></i>UP</a>
            <a href="#about" class="w3-bar-item w3-button w3-hide-small"><i class="fa fa-user"></i>ABOUT</a>
            <a href="#portfolio" class="w3-bar-item w3-button w3-hide-small"><i class="fa fa-th"></i>PORTFOLIO</a>
            <a href="#contact" class="w3-bar-item w3-button w3-hide-small"><i class="fa fa-envelope"></i>CONTACT</a>
            <a href="/login" class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-red"><i class="fa fa-sign-in"></i></a>
            <a href="/profile" class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-red"><i class="fa fa-user"></i></a>
            <a href="#" class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-red">
                <i class="fa fa-search"></i>
            </a>
        </div>

        <!-- NavBar on small screens -->
        <div id="navDemo" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium">
            <a href="#about" class="w3-bar-item w3-button" onclick="toggleFunction()">ABOUT</a>
            <a href="#portfolio" class="w3-bar-item w3-button" onclick="toggleFunction()">PORTFOLIO</a>
            <a href="#contact" class="w3-bar-item w3-button" onclick="toggleFunction()">CONTACT</a>
            <a href="/login" class="w3-bar-item w3-button w3-right w3-hover-red"><i class="fa fa-sign-in"></i></a>

            <a href="#" class="w3-bar-item w3-button">SEARCH</a>
        </div>
    </div>

</#macro>

<#--
    TODO: List of url, fa-fa-icon, text
-->
<#macro slideMenu >

    <style>
        a{text-decoration: none;}
    </style>

    <a class="show-btn w3-bar-item w3-button" href="javascript:void(0);" onclick="toggleFunction()" title="Toggle Navigation Menu">
        <i class="fa fa-bars"></i>
    </a>
    <div class="middle w3-bar-item">
        <div class="sm-container">
            <div class="sm-menu">
                <a href="/main" ><i class="fa fa-envelope"></i>NOTES</a>
                <a href="/main_aim" ><i class="fa fa-dot-circle-o"></i>AIMS</a>
                <a href="/aims" ><i class="fa fa-circle-o"></i>ALL AIMS</a>
                <a href="/userAnalyzer/activity" ><i class="fa fa-circle-o"></i>USER ANALYZER</a>
                <a href="/photos" ><i class="fa fa-picture-o"></i>PHOTOS</a>
                <a href="/projects" ><i class="fa fa-archive"></i>PROJECTS</a>
                <a href="/user" ><i class="fa fa-user-circle"></i>USERS</a>
            </div>
        </div>
    </div>

    <script>
        $(".show-btn").click(function(){
            $(".sm-menu").fadeToggle("fast");
        });
    </script>

</#macro>