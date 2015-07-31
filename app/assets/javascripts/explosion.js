$(function(){
  $("form").submit(function(){
    var $explode = $('<div class="explode">');
    $explode
      .css({
        top: event.pageY + 'px',
        left: event.pageX + 'px'
      });
    
    $('body').append($explode);
    
    $explode.addClass('explode_ignite');
    
    setTimeout(function(){ $('.explode_ignite').remove(); }, 1000);
  });
});