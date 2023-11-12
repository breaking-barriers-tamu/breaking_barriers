// Function to update navbar background color
function updateNavbarBgColor() {
  const navbar = document.querySelector(".nav-container");
  const navbarShade = document.querySelector(".nav-shade");
  const isHomePage = document.body.getAttribute("data-page") === "home";
  const isAboutPage = document.body.getAttribute("data-page") === "about";


  const loginButton = document.querySelector(".login-button");
  const scrollBounds = 200;

  if (isHomePage) {
    const coverTitle = document.querySelector(".title-container");
    const navLogo = document.querySelector(".logo");
    if (window.scrollY < scrollBounds) {
      coverTitle.style.display = "block";
      navLogo.style.opacity = "0";
    } else {
      coverTitle.style.display = "none";
      navLogo.style.opacity = "1";
    }
  }

  if (
    (window.scrollY < scrollBounds && isHomePage) ||
    (window.scrollY < scrollBounds && isAboutPage)
  ) {
    navbar.style.backgroundColor = "transparent";
    navbarShade.style.background =
      "linear-gradient(to bottom, rgba(0,0,0,.6) 0%, rgba(0,0,0,0) 100%)";
  } else {
    navbar.style.backgroundColor = "#4872AE";
    navbarShade.style.background = "transparent";
  }
  // Adjust padding for home screen
  document.body.style.paddingTop = isHomePage || isAboutPage ? "0" : "70px";
}

document.addEventListener("DOMContentLoaded", updateNavbarBgColor);
document.addEventListener("turbo:load", updateNavbarBgColor);
window.addEventListener("scroll", updateNavbarBgColor);