module AuthorsHelper
  def authors_options_for_select
    Author.all.map do |author|
      [author.full_name, author.id]
    end
  end
end
