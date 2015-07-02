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
//= require underscore
//= require gmaps/google
//= require_tree .


function deselect(e) {
  $('.pop').slideFadeToggle(function() {
    e.removeClass('selected');
  });
}

$(document).on('click', '#close_bucket', function(){

  $a = $(this)[0].getAttribute('itemid');
  $(".messagepop").children()[0].setAttribute('action', '/items/' + $a)
  if($(this).hasClass('selected')) {
      deselect($(this));
    } else {
      $(this).addClass('selected');
      $(".pop").css( {position:"absolute", top:event.pageY, left: event.pageX});
      $('.pop').slideFadeToggle();
    }
    return false;
});


  $('.close').on('click', function() {
    deselect($('#close_bucket'));
    return false;
  });


$.fn.slideFadeToggle = function(easing, callback) {
  return this.animate({ opacity: 'toggle', height: 'toggle' }, 'fast', easing, callback);
};

