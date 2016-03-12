$(function(){
  createJob();
  homeButton();
  profileButton();
})

function homeButton(){
  $(document).on('click', '#home-button', function(event){
    setHeaders("All");
    appendList(event);
  })
}

function appendList(event){
  $.get('/get_jobs'
    ).done(function(jobs){
      $('#pending-list').html(populateList(jobs));
  });
  event.preventDefault();
}

function populateList(jobs){
  var str = "";
  str = iterateJobs(jobs["jobs"]);
  return str;
}

function iterateJobs(jobs){
  var str = "<ul>";
  jobs.forEach(function(job){
    var link_path = '/mechanics/' + job['mechanic']['id'] + '/jobs/' + job['id'];
    str += '<li>Mechanic: ' + job['mechanic']['name'] + '<br>';
    str += 'Customer: ' + job['customer']['name'] + '<br>';
    str += '<ul>';
    job['work_orders'].forEach(function(order){
      str += '<li>' + order['description'] + ', ';
      str += '$' + order['price'] + ', ';
      str += '<strong>' + order['status'] + '</strong>'
      if(order['status'] === 'pending'){
        str += ', mark complete? <input type="checkbox" name="ids[]" value="' + order['id'] + '">';
      }
      str += '</li>';
    });
    str += '</ul></li>';
    str += '<a href="' + link_path + '/edit">Edit Job</a>  |  ';
    str += '<a rel="nofollow" data-method="delete" href="' + link_path + '">Delete Job</a><br><br>';
  });
  str += '</ul>';
  return str;
}

function setHeaders(arg){
  $('#pending-header').text(arg + " Pending Jobs:");
  $('#completed-header').text(arg + " Completed Jobs:");
}

function profileButton(){
  $(document).on('click', '#profile-button', function(event){
    event.preventDefault();
    setHeaders("Your");
  })
}

function createJob(){
  $(document).on('click', '#create-job', function(event){
    event.preventDefault();
    var url = window.location.pathname.slice(0, -3);
    $.post(url, $('form').serialize()
      ).done(function(data){
        var job = data['job'];
        var str = '<li>Mechanic: ' + job['mechanic']['name'] + '</li>';
        str += '<li>Mechanic: ' + job['mechanic']['name'] + '</li>';
        str += '<li>Customer: ' + job['customer']['name'] + '</li>';
        str += '<li>Work Orders:<ul>';
        job['work_orders'].forEach(function(order){
          str += '<li>Description: ' + order['description'] + '</li>';
          str += '<li>Price: ' + order['price'] + '</li>';
        });
        str += '</ul></li>';
        $('#new-ajax-jobs').append(str);
        $('input[type=text]').val('');
      });
  });
}