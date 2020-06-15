$(function() {
  var div = function correctAnswer(){
    let answer = $('.main__form__text').val()
    if ( answer == gon.answer ) {
      var html = `<div class="main__answer">
                    <div class="main__answer__text">正解</div>
                    <div class="main__answer__link">
                      <a class="main__answer__link__next" href='#'>やめる</a>
                      <a class="main__answer__link__next" href='/'>次の問題に進む</a>
                    </div>
                  </div>`
    } else {
      var html = `<div class="main__answer">
                    <div class="main__answer__text2">不正解</div>
                    <div class="main__answer__link">
                    <a class="main__answer__link__next" href='#'>やめる</a>
                    <a class="main__answer__link__next" href='/'>次の問題に進む</a>
                    </div>
                  </div>`
    }
    return html;
  }
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
  
  $('.main__form__btn').click(function() {
    $('.main').append(div)
  })
});