//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

$(document).ready(function () {

  $('#user_roles').change(function() {
    $('#plan-descriptions').children().removeClass('active')
    var selectedPlan = $("option:selected", $(this)).text().toLowerCase();
    $('.' + selectedPlan + '-plan-description').addClass('active');
  });

});
