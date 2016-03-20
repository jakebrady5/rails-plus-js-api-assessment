$(function(){
  deleteJob();
});

function deleteJob(){
  $(document).on('click', '.delete', function(event){
    event.preventDefault();
    var item = this;
    var url = this.href;
    var pending_url = '/jobs?state=pending';
    var completed_url = '/jobs?state=completed';
    if ($('#pending-header').text() === "Your Pending Jobs:"){
      pending_url = '/jobs?state=pending&scoped=true';
      completed_url ='/jobs?state=completed&scoped=true';
    }
    $.ajax({
      type: "POST",
      url: url,
      data: {"_method": "delete"},
      complete: function(){
        $(item).parent().hide(500);
      }
    });
  })
}