// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require jquery.turbolinks
//= require jquery-ui
//= require autocomplete-rails



$(document).ready(function()
{
  var check_box = document.getElementsByClassName('activation_checkbox')
for (var i = 0; i < check_box.length; i++) { 
    if (check_box[i].checked == false)
       check_box[i].parentNode.parentNode.style.backgroundColor = "rgb(178, 70, 70)";
}
  $('.delete_book').click(function(event)
  { 
    var URL = $(this).attr('href');
    $(this).closest('tr').find('td').fadeOut('fast', function(here)
    { 
      $(here).parents('tr:first').remove();                    
    });    
    $.ajax
    ({
    	 method: "DELETE",
       url: URL,
       success: function(result)
       {
         $("#books").html(result);
       }
    });    
    return false;
  });

  $('#book_purchasable').click(function(){
    $('#purchasable').css('display', ($(this).is(':checked') ? 'block' : 'none'));
  });


  $(".user-row input[type='checkbox']").change(function(e) {
    var userRow = e.target.parentNode.parentNode;
    if ( e.target.checked ) {
      userRow.style.backgroundColor ="";
      $.ajax
      ({
        type: "POST",
        url: 'users/activate_user/' + $(this).val(),       
      });
    }  
    else {
      userRow.style.backgroundColor = "rgb(178, 70, 70)";
      $.ajax
      ({
        type: "POST",
        url: 'users/deactivate_user/' + $(this).val(),      
      });
    } 
     
  });


});

