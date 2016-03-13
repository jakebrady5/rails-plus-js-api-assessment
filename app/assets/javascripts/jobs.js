$(function(){
  createJob();
  homeButton();
  profileButton();
  completeJob();
})

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

function homeButton(){
  $(document).on('click', '#home-button', function(event){
    event.preventDefault();
    setHeaders("All");
    appendPendingJobs('/get_pending_jobs');
    appendCompletedJobs('/get_completed_jobs');
  });
}

function profileButton(){
  $(document).on('click', '#profile-button', function(event){
    event.preventDefault();
    setHeaders("Your");
    appendPendingJobs('/get_mechanic_pending_jobs');
    appendCompletedJobs('/get_mechanic_completed_jobs');
  });
}

function appendPendingJobs(url){
  $.get(url
    ).done(function(jobs){
      $('#pending-list').html(populateList(jobs['jobs']));
  });
}

function appendCompletedJobs(url){
  $.get(url
    ).done(function(jobs){
      $('#completed-list').html(populateList(jobs['jobs']));
    });
}

function populateList(jobs){
  var str = "";
  str = iterateJobs(jobs);
  return str;
}

function iterateJobs(jobs){
  var str = "<ul>";
  jobs.forEach(function(job){
    var link_path = '/mechanics/' + job['mechanic']['id'] + '/jobs/' + job['id'];
    str += '<li>Mechanic: ' + job['mechanic']['name'] + '<br>';
    str += 'Customer: ' + job['customer']['name'] + '<br>';
    str += '<ul>';
    str += iterateWorkOrders(job['work_orders']);
    str += '</ul></li>';
    str += '<a href="' + link_path + '/edit">Edit Job</a>  |  ';
    str += '<a rel="nofollow" data-method="delete" href="' + link_path + '">Delete Job</a><br><br>';
  });
  str += '</ul>';
  return str;
}

function iterateWorkOrders(orders){
  var str = "";
  orders.forEach(function(order){
    str += '<li>' + order['description'] + ', ';
    str += '$' + order['price'] + ', ';
    str += '<strong>' + order['status'] + '</strong>'
    if(order['status'] === 'pending'){
      str += ', mark complete? <input type="checkbox" name="ids[]" value="' + order['id'] + '">';
    }
    str += '</li>';
  });
  return str;
}

function setHeaders(arg){
  $('#pending-header').text(arg + " Pending Jobs:");
  $('#completed-header').text(arg + " Completed Jobs:");
}

function createJob(){
  $(document).on('click', '#create-job', function(event){
    event.preventDefault();
    var url = window.location.pathname.slice(0, -3);
    $.post(url, $('form').serialize()
      ).done(function(data){
        var job = data['job'];
        var str = '<li>Mechanic: ' + job['mechanic']['name'] + '</li>';
        str += '<li>Customer: ' + job['customer']['name'] + '</li>';
        str += '<li>Work Orders:<ul>';
        job['work_orders'].forEach(function(order){
          str += '<li>Description: ' + order['description'] + '</li>';
          str += '<li>Price: $' + order['price'] + '</li>';
        });
        str += '</ul></li>';
        $('#new-ajax-jobs').append(str);
        $('input[type=text]').val('');
      });
  });
}