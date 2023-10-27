function hideSectionsOnNonHomePage() {
  const isHomePage = document.body.getAttribute("data-page") === "home";

  const contactSection = document.getElementById("contact-section");
  const sitemapSection = document.getElementById("sitemap-section");

  if (!isHomePage) {
    contactSection.style.display = "none";
    sitemapSection.style.display = "none";
  }
}

document.addEventListener("DOMContentLoaded", hideSectionsOnNonHomePage);

document.addEventListener("turbo:load", hideSectionsOnNonHomePage);
