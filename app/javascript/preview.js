function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      $(document.getElementById(input.id + "_medium")).attr('src', e.target.result);
    }
    reader.readAsDataURL(input.files[0]);
  }
}

$(".file_upload").change(function() {
    console.log("The file being uploaded changed");
    readURL(this);
});