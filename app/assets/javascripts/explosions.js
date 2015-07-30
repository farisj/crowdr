$('body').on('click', function(event) {
  var $explode = $('<div class="explode">');
  $explode
    .css({
      top: event.pageY + 'px',
      left: event.pageX + 'px'
    });
  
  $('body').html($explode);
  
  $explode.addClass('explode_ignite');
});