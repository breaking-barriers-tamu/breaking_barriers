document.addEventListener("DOMContentLoaded", function () {
  const navbar = document.querySelector(".nav-container");

  function updateNavbarBgColor() {
    const isHomePage = document.body.getAttribute("data-page") === "home";

    if (window.scrollY > 100 || !isHomePage) {
      navbar.style.backgroundColor = "#4872AE";
    } else {
      navbar.style.backgroundColor = "transparent";
    }

    // Adjust padding for home screen
    document.body.style.paddingTop = isHomePage ? "0" : "70px";
  }

  updateNavbarBgColor();

  window.addEventListener("scroll", updateNavbarBgColor);
});
