function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      $(document.getElementById("file_preview")).attr('src', e.target.result);
    }
    reader.readAsDataURL(input.files[0]);
  }
  else {
    $(document.getElementById("file_preview")).attr('src', '');
  }
}

$(".file_upload").change(function() {
    console.log("The file being uploaded changed");
    readURL(this);
});

$(document).ready(function() {
  console.log("The document is ready");
  var headerText = document.getElementById("event-form-header").textContent;
  console.log(headerText);
  if (headerText == "New Event") {
    $(document.getElementById("submit-button")).attr('value', 'Create Event');
  } 
  else if (headerText == "Edit Event") {
    $(document.getElementById("submit-button")).attr('value', 'Update Event');
  }
});