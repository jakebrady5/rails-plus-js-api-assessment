$(function(){
  completeJob();
});

function completeJob(){
  $(document).on('click', '#mark-complete', function(event){
    event.preventDefault();
    var ids = getCheckedBoxes();
    var pending_url = '/get_pending_jobs';
    var completed_url = '/get_completed_jobs';
    if ($('#pending-header').text() === "Your Pending Jobs:"){
      pending_url = '/get_mechanic_pending_jobs';
      completed_url ='get_mechanic_completed_jobs';
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