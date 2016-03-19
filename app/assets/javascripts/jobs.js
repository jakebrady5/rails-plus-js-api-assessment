$(function(){
  homeButton();
  profileButton();
});

function homeButton(){
  $(document).on('click', '#home-button', function(event){
    event.preventDefault();
    setHeaders("All");
    appendPendingJobs('/jobs?state=pending');
    appendCompletedJobs('/jobs?state=completed');
  });
}

function profileButton(){
  $(document).on('click', '#profile-button', function(event){
    event.preventDefault();
    setHeaders("Your");
    appendPendingJobs('/jobs?state=pending&scoped=true');
    appendCompletedJobs('/jobs?state=completed&scoped=true');
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