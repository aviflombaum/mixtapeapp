$(function(){
  $('form a.upload-song').click('click', function() {
    var content = $('#playlists_fields_template').html();
    var regexp  = new RegExp('new_playlists', 'g');
    var new_id  = new Date().getTime();

    $(this).before(content.replace(regexp, new_id)); 
    return false;
  });  
  
  
  $("#mixtape_song_ids_to_add").tokenInput("/songs/search.json", {
    resultsFormatter: formatTokenAutoComplete,
    tokenFormatter: formatTokenAutoComplete,
  });
  
})

function formatTokenAutoComplete(item){
  return "<li>" + item.artist_name + " - " + item.name + "</li>"
}

$('form a.remove-song').live('click', function() {
  var hidden_field = $(this).prev('input[type=hidden]')[0];
  if(hidden_field) {
    hidden_field.value = '1';
  }
  $(this).parents('.playlist.fields').hide();
  return false;
});