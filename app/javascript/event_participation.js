// app/assets/javascripts/event_participation.js

document.addEventListener('DOMContentLoaded', function() {
    var checkboxes = document.querySelectorAll('.participation-checkbox');
    
    checkboxes.forEach(function(checkbox) {
      checkbox.addEventListener('change', function() {
        var participantId = this.getAttribute('data-participant-id');
        var participating = this.checked;
      });
    });
  });