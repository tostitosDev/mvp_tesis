$(document).ready(function () {
  $('#sidebarCollapse').on('click', function (event) {
    event.preventDefault();
    $('#sidebar').toggleClass('active');
  });
});