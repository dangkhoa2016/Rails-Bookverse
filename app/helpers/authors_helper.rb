module AuthorsHelper
  def authors_options_for_select
    Author.active.map do |author|
      [author.full_name, author.id]
    end
  end
end
