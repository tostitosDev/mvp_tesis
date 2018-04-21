$(document).ready(function() {
  $(".search").click( function(e){
    console.log("search")
    $("#searchForm").submit(); 
  })
});