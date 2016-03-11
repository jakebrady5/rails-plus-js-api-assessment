$(function(){
  homeButton();
})

function homeButton(){
  $('#home-button').on('click', function(event){
    event.preventDefault();
    alert('home button works');
  })
}