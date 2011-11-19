$(function(){
  $('form a.add-song').click('click', function() {
    var content = $('#songs_fields_template').html();
    var regexp  = new RegExp('new_songs', 'g');
    var new_id  = new Date().getTime();

    $(this).before(content.replace(regexp, new_id)); 
    return false;
  });  
})

$('form a.remove-song').live('click', function() {
  var hidden_field = $(this).prev('input[type=hidden]')[0];
  if(hidden_field) {
    hidden_field.value = '1';
  }
  $(this).parents('.song.fields').hide();
  return false;
});