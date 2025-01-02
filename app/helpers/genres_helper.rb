module GenresHelper
  def genres_options_for_select
    Genre.all.map do |genre|
      [genre.name, genre.id]
    end
  end
end
