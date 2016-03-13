$(function(){
  createJob();
});

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