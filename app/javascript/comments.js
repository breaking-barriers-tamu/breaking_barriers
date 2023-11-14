function setupDropdownToggles() {
  document.body.addEventListener("click", function (event) {
    if (event.target.matches(".dropdown-toggle")) {
      var dropdownContent = event.target.nextElementSibling;
      dropdownContent.style.display =
        dropdownContent.style.display === "block" ? "none" : "block";
    }
  });
}

function setupGlobalClickListener() {
  window.addEventListener("click", function (event) {
    if (!event.target.matches(".dropdown-toggle")) {
      document
        .querySelectorAll(".dropdown-content")
        .forEach(function (content) {
          content.style.display = "none";
        });
    }
  });
}

function setupEventHandlers() {
  setupDropdownToggles();
  setupGlobalClickListener();
}

document.addEventListener("DOMContentLoaded", setupEventHandlers);
document.addEventListener("turbo:load", setupEventHandlers);

function toggleEditComment(commentId, showEditForm) {
  var commentElement = document.getElementById("comment_" + commentId);
  var editFormElement = document.getElementById("edit_comment_" + commentId);

  if (commentElement && editFormElement) {
    commentElement.style.display = showEditForm ? "none" : "block";
    editFormElement.style.display = showEditForm ? "block" : "none";
  }
}

function cancelEditComment(commentId) {
  toggleEditComment(commentId, false);
}
