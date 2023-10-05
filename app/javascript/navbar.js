// Function to update navbar background color
function updateNavbarBgColor() {
  const navbar = document.querySelector(".nav-container");
  const isHomePage = document.body.getAttribute("data-page") === "home";

  if (window.scrollY > 100 || !isHomePage) {
    navbar.style.backgroundColor = "#4872AE";
  } else {
    navbar.style.backgroundColor = "transparent";
  }

  // Adjust padding for home screen
  document.body.style.paddingTop = isHomePage ? "0" : "70px";
}
