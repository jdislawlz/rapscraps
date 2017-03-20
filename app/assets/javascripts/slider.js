$(document).ready(function(){
  $('.scraps-list').slick({
    appendArrows : $('.scraps-navigation'),
    prevArrow: '<div class="slick-prev flex-md"><i class="fa fa-chevron-circle-left"></i></div>',
    nextArrow: '<div class="slick-next flex-md"><i class="fa fa-chevron-circle-right"></i></div>'
  });
  $('.scraps-list').on('beforeChange', function(event, slick, currentSlide, nextSlide){
    var id = nextSlide+1;
    var date = $('.scraps-single[data-slick-index="'+nextSlide+'"] .tweet-date').html();
    $('.current-scrap-number').html( id );
    $('.scraps-date').html(date);
  });
});
