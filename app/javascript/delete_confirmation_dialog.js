window.addEventListener("turbo:load", () => {
  // Listen for the submit event for class delete-alertbox
  document.addEventListener("submit", (event) => {
    if (event.target && event.target.className === "delete-alertbox") {
      console.log("Deletion Box Shown");
      event.preventDefault();
      Swal.fire({
        title: "Are you sure?",
        text: "You won't be able to revert this!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yes, delete it!",
      })
        .then((result) => {
          if (result.isConfirmed) {
            console.log("manually confirmed");
            event.target.submit();
          }
        })
        .catch(event.preventDefault());
    }
  });
});

