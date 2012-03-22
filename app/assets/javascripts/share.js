$(function(){
  $("a.share").click(function(e){
    
    // Grab the HTML from the HREF of the link
    $.get($(this).attr('href'), function(html){
      $.fancybox(html);
      
      $("#user_email").autocomplete({
    		source: "/users"
    	});
    	
      
    });

    e.preventDefault();
    
  });
  

  
})