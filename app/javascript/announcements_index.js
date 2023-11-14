document.addEventListener("DOMContentLoaded", () => {
  const announcementsContainer = document.getElementById("announcements");
  const loadMoreButton = document.querySelector("load-more-button");

  if (loadMoreButton) {
    loadMoreButton.addEventListener("click", (e) => {
      e.preventDefault();
      fetch(e.target.href)
        .then((response) => response.text())
        .then((data) => {
          announcementsContainer.insertAdjacentHTML("beforeend", data);
        });
    });
  }
});
