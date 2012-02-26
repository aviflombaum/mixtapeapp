module GenresHelper
  def genres_for_select
    @genres_for_select ||= Genre.for_select
  end
  
end
