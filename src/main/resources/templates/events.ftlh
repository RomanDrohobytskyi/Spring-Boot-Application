<!doctype html>
<html lang="en">
<head>
    <title>Events</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script>document.getElementsByTagName("html")[0].className += " js";</script>
    <link rel="stylesheet" href="../static/css/event-style.css">

    <link rel="shortcut icon" type="image/png" href="https://cdn.onlinewebfonts.com/svg/img_51582.png">
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="stylesheet" href="/static/css/buttons.css">
    <link rel="stylesheet" href="/static/css/photos.css">
    <link rel="stylesheet" href="/static/css/text.css">
    <link rel="stylesheet" href="/static/css/menu.css">

    <script type="text/javascript" src="/static/javascript/js.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/a39ccd76f8.js" crossorigin="anonymous"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <#import "parts/footer.ftlh" as footer>
    <#import "parts/image.ftlh" as paralax>
    <#import "parts/menu.ftlh" as menu>
    <#import "parts/elements.ftlh" as elements>
    <#import "parts/event.ftlh" as event>
</head>
<body>

<@menu.customMenu menuElements slideMenuElements true/>

<div class="parallax big-img-greeting-1 w3-display-container w3-opacity-min" id="home">
    <div class="w3-display-middle" style="white-space:nowrap;">
        <span class="w3-center w3-padding-large w3-black w3-xlarge w3-wide w3-animate-opacity" title="Events">Events</span>
    </div>
</div>


<div class="w3-content w3-container w3-padding-32" id="add-event">
    <div class="w3-center w3-row">
        <h3 class="w3-center">Add event</h3>
        <form action="/events/add" method="post">
            <p class="w3-center" style="color: red;">
                ${message!}
            </p>
            <br>
            <@elements.input id="title" name="title" type="text" placeholder="t e x t"
            onfocus="this.placeholder = ''"  onblur="this.placeholder = 't e x t'"/>
            <br><br>
            <@elements.input id="from" name="from" type="text" placeholder="f r o m ( H H : M M )"
            onfocus="this.placeholder = ''"  onblur="this.placeholder = 'f r o m ( H H : M M )'"/>
            <br><br>
            <@elements.input id="to" name="to" type="text" placeholder="t o ( H H : M M )"
            onfocus="this.placeholder = ''"  onblur="this.placeholder = 't o ( H H : M M )'"/>
            <br><br>
            <@elements.input id="date" name="date" type="date" placeholder="d a t e"
            onfocus="this.placeholder = ''"  onblur="this.placeholder = 'd a t e'"/>
            <br><br>
            <select name="eventType">
                <#list eventTypes as type>
                    <option value="${type}">${type}</option>
                </#list>
            </select>
            <br><br>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit" class="btn btn1 w3-button w3-padding-large" style="box-shadow:none;">
                Add
            </button>
        </form>
    </div>
</div>

<div>
    <div class="w3-content w3-container w3-padding-32" id="choose-event">
        <div class="w3-center w3-row">
            <h3 class="w3-center">Choose event</h3>
            <form action="/events" method="get" style="margin: 30px 10px 10px">
                <button type="submit" value="${'SPORT'}" name="eventType"
                        title="Sport" style="border: none;" class="fas fa-running">
                </button>
                <button type="submit" value="${'ART'}" name="eventType"
                        title="Art" style="border: none;" class="fas fa-palette">
                </button>
                <button type="submit" value="${'EDUCATION'}" name="eventType"
                        title="Education" style="border: none;" class="fas fa-graduation-cap">
                </button>
                <button type="submit" name="eventType"
                        title="Clear" style="border: none;" class="fas fa-eraser">
                </button>
                <input type="hidden" value="${_csrf.token}" name="_csrf">
            </form>
        </div>
    </div>

    <div class="cd-schedule cd-schedule--loading margin-top-lg margin-bottom-lg js-cd-schedule">
        <@event.timeline/>

        <div class="cd-schedule__events">
            <ul>
                <#assign colorNumber = 1/>
                <#list events?keys as day>
                    <li class="cd-schedule__group">
                        <div class="cd-schedule__top-info"><span>${day}</span></div>
                        <ul>
                           <#if events[day]?has_content>
                                <#list events[day] as event>
                                    <li class="cd-schedule__event">
                                        <a data-start="${event.from}" data-end="${event.to}"
                                           data-content="event-abs-circuit" data-event="event-${colorNumber}" href="#0">
                                            <em class="cd-schedule__name">${event.title}</em>
                                            <#--<a href="/events/delete/${event.id}">
                                                <i class="fa fa-trash-o" aria-hidden="true"
                                                   title="Delete event"></i>
                                            </a>
                                            <input type="hidden" value="${event}" name="event">-->
                                        </a>
                                    </li>
                                    <#if colorNumber == 4>
                                        <#assign colorNumber = 1/>
                                    <#else>
                                        <#assign colorNumber = colorNumber + 1/>
                                    </#if>
                                </#list>
                            </#if>
                        </ul>
                    </li>
                </#list>
            </ul>
        </div>

        <@event.eventDescription/>
    </div>
</div>

<script src="../static/javascript/util.js"></script>
<script src="../static/javascript/main.js"></script>

<div class="parallax big-img-greeting-small w3-display-container w3-opacity-min" id="end">
</div>

<@footer.footer/>
</body>
</html>