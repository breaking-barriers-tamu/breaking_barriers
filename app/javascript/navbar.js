// Function to update navbar background color
function updateNavbarBgColor() {
  const navbar = document.querySelector(".nav-container");
  const navbarShade = document.querySelector(".nav-shade");
  const isHomePage = document.body.getAttribute("data-page") === "home";

  const loginButton = document.querySelector(".login-button");

  if (window.scrollY < 100 && isHomePage) {
    navbar.style.backgroundColor = "transparent";
    navbarShade.style.background = "linear-gradient(to bottom, rgba(0,0,0,.6) 0%, rgba(0,0,0,0) 100%)";
    if (loginButton) loginButton.style.background = "#4872AE"; 
    if (loginButton) loginButton.style.color = "white"; 
  } else {
    navbar.style.backgroundColor = "#4872AE";
    navbarShade.style.background = "transparent";
    if (loginButton) loginButton.style.background = "white";
    if (loginButton) loginButton.style.color = "black";
  }
  // Adjust padding for home screen
  document.body.style.paddingTop = isHomePage ? "0" : "70px";
}

document.addEventListener("DOMContentLoaded", updateNavbarBgColor);
document.addEventListener("turbo:load", updateNavbarBgColor);
window.addEventListener("scroll", updateNavbarBgColor);