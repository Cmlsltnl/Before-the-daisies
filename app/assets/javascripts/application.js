
function deselect(e) {
  $('.pop').slideFadeToggle(function() {
    e.removeClass('selected');
  });
}
//
// $(function() {
//   $('#close_bucket').on('click', function() {
//     if($(this).hasClass('selected')) {
//       deselect($(this));
//     } else {
//       $(this).addClass('selected');
//       $('.pop').slideFadeToggle();
//     }
//     return false;
//   });
$(document).on('click', '#close_bucket', function(){

  $a = $(this)[0].getAttribute('itemid');
  $(".messagepop").children()[0].setAttribute('action', '/items/' + $a)
  if($(this).hasClass('selected')) {
      deselect($(this));
    } else {
      $(this).addClass('selected');
      $(".pop").css( {position:"absolute", top:event.pageY, left: event.pageX});
      $('.pop').slideFadeToggle();
      $.ajax('/index',{
        type: 'get',
        data: {"item_id": $a},

        success: function(data){
          console.log(data);
        },

        error: function(data){
          console.log(data);
          console.log('this is error');
        }
      });

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
