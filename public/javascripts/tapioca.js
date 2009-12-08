$(document).ready(function() {
  fadeFlashMessages();
});

function fadeFlashMessages() {
  $('#flash .message').fadeTo(0, .8);
  setTimeout(function() {
    $('#flash .message').fadeOut('slow');
  }, 6000);
}
