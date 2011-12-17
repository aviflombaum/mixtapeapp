$(function(){
  $("a.share").click(function(e){
    $.get($(this).attr('href'), function(html){
      $.fancybox(html);      
    });
    e.preventDefault();
  });  
});
