$(function(){
  completeJob();
});

function completeJob(){
  $(document).on('click', '#mark-complete', function(event){
    event.preventDefault();
    var ids = getCheckedBoxes();
    var pending_url = '/jobs?state=pending';
    var completed_url = '/jobs?state=completed';
    if ($('#pending-header').text() === "Your Pending Jobs:"){
      pending_url = '/jobs?state=pending&scoped=true';
      completed_url ='/jobs?state=completed&scoped=true';
    }
    $.post('/complete', { ids: ids}
      ).done(function(){
        appendPendingJobs(pending_url);
        appendCompletedJobs(completed_url);
      })
  });
}

function getCheckedBoxes(){
  var ids = [];
    var boxes = document.getElementsByName("ids[]");
    for (i = 0; i < boxes.length; i++){
      if (boxes[i].checked){
        ids.push(boxes[i]["value"])
      }
    }
  return ids;
}