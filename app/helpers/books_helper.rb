module BooksHelper
  def book_price_display_value(book, column)
    price = book.send(column)
    display_currency_value(price)
  end
end
