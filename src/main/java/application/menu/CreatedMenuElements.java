package application.menu;

public class CreatedMenuElements {

    MenuElement homePage = new MenuElement("/", "w3-bar-item w3-button","fa fa-home", "HOME", "Home page");
    MenuElement login = new MenuElement("/login", "w3-bar-item w3-button w3-hide-small w3-right w3-hover-red","fa fa-sign-in", "", "Login");
    MenuElement profile = new MenuElement("/profile", "w3-bar-item w3-button w3-hide-small w3-right w3-hover-red","fa fa-user", "", "Profile");

    MenuElement upToTheTop = new MenuElement("#home", "w3-bar-item w3-button","fa fa-chevron-up", "UP", "Up to the top");
    MenuElement about = new MenuElement("#about", "w3-bar-item w3-button w3-hide-small","fa fa-user", "ABOUT", "About me");
    MenuElement portfolio = new MenuElement("#portfolio", "w3-bar-item w3-button w3-hide-small","fa fa-th", "PORTFOLIO", "My portfolio");
    MenuElement contact = new MenuElement("#contact", "w3-bar-item w3-button w3-hide-small","fa fa-envelope", "CONTACT", "Contact me");
    MenuElement moreData = new MenuElement("#moreData", "w3-bar-item w3-button w3-hide-small","fa fa-database", "MORE DATA", "More data");
    MenuElement loggedTimeTable = new MenuElement("#loggedTimeTable", "w3-bar-item w3-button w3-hide-small","fa fa-clock-o", "TIME TABLE", "Logged time table");
    MenuElement lineChart = new MenuElement("#line-chart", "w3-bar-item w3-button w3-hide-small","fa fa-line-chart", "CHARTS", "Logged time charts");
    MenuElement aimsList = new MenuElement("#aimsList", "w3-bar-item w3-button w3-hide-small","fa fa-list", "AIMS", "List of aims");
    MenuElement createAim = new MenuElement("#createAim", "w3-bar-item w3-button w3-hide-small","fa fa-plus", "CREATE", "Create aim");


    MenuElement aims = new MenuElement("/aims", "w3-bar-item w3-button", "fa fa-circle-o", "ALL AIMS", ">ALL AIMS");
    MenuElement smartAim = new MenuElement("/main_aim", "w3-bar-item w3-button", "fa fa-dot-circle-o", "S.M.A.R.T", "SMART");
    MenuElement tenThousandHoursAim = new MenuElement("/ten_thousand_hours_aim", "w3-bar-item w3-button", "fa fa-dot-circle-o", "10k H", "10k H");
    MenuElement main = new MenuElement("/main", "w3-bar-item w3-button", "fa fa-book", "NOTES", "NOTES");
    MenuElement userAnalyzer = new MenuElement("/userAnalyzer/activity", "w3-bar-item w3-button", "fa fa-circle-o", "USER ANALYZER", "USER ANALYZER");
    MenuElement photos = new MenuElement("/photos", "w3-bar-item w3-button", "fa fa-picture-o", "PHOTOS", "PHOTOS");
    MenuElement projects = new MenuElement("/projects", "w3-bar-item w3-button", "fa fa-archive", "PROJECTS", "PROJECTS");
    MenuElement users = new MenuElement("/user", "w3-bar-item w3-button", "fa fa-user-circle", "USERS", "USERS");

}
