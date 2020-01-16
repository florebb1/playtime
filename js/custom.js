let initialOffset = $('body').scrollTop();
$('input, textarea, select').focus(function(e) {
   let offset = $(e.target).offset();
   initialOffset = $('body').scrollTop();
   $('body').scrollTop(offset.top-100);
});
$('input, textarea, select').focusout(function(e) {
   $('body').scrollTop(initialOffset);
});