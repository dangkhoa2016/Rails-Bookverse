module BooksHelper
  def books_options_for_select
    Book.active.map do |book|
      [ book.title, book.id ]
    end
  end

  def book_render_authors_value(value)
    return Book.human_attribute_name("no_authors") if value.blank?
    value.map do |author|
      link_to author
    end.join(", ").html_safe
  end

  def book_render_publishers_value(value)
    return Book.human_attribute_name("no_publishers") if value.blank?
    value.map do |publisher|
      link_to publisher
    end.join(", ").html_safe
  end

  def book_render_reviews_value(value)
    return Book.human_attribute_name("no_reviews") if value.blank?
    result = value.pluck(:rating).sum / value.size.to_f
    content_tag(:span, result, class: "badge bg-primary",
      title: Book.human_attribute_name("total_reviews", count: value.size))
  end
end
