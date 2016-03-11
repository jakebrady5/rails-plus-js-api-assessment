$(function(){
  homeButton;
})

function homeButton(){
  $('#home-button a').on('click', function(event){
    event.preventDefault();
    debugger;
    alert('home button works');
  })
}