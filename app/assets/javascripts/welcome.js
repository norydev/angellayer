$('a[href^="#"]').click(function(){
  var the_id = $(this).attr("href");

  $('html, body').animate({
    scrollTop:$(the_id).offset().top
  }, 1200);
  return false;
});

// js for scrollingdown smoothly on welcome page when button clicked