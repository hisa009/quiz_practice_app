$(function() {
  $(window).on('load', function() {
    $('.main__question__text').children().addBack().contents().each(function() {
      if (this.nodeType == 3) {
        $(this).replaceWith($(this).text().replace(/(\S)/g, '<span>$1</span>'));
      }
    });
    $('.main__question__text').css({ 'opacity':1 });
    for (var i = 0; i <= $('.main__question__text').children().size(); i++) {
      $('.main__question__text').children('span:eq('+i+')').delay(200*i).animate({ 'opacity': 1 }, 50);
    };
  });
  $('.main__btn').click(function(){
    $('.main__question__text span').stop(true, false);
  });
});