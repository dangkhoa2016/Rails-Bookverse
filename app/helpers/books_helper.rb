module BooksHelper
  def books_options_for_select
    Book.all.map do |book|
      [ book.title, book.id ]
    end
  end
end
