$(function(){
  Artist.autocomplete.init();
});

Artist = {};

// Autocomplete with Chosen
Artist.autocomplete = {
  init: function(){
    $("select#song_artist_name").chosen();
  }
};