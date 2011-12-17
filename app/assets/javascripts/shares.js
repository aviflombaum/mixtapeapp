$(function(){
  $("a.share").click(function(e){
    $.get($(this).attr('href'), function(html){
      $.fancybox(html);

      $("#user_id").autocomplete({
    		source: "/users"
    	});
    });
    e.preventDefault();
  });

  // $("form#share_mixtape").live('submit', function(e){
  //   $.post($(this).attr("action"), $(this).serialize(), function(response){
  //     // setTimeout(function(){$.fancybox.close()}, 1800);
  //   }, 'script');
  //   e.preventDefault();
  // })
});
