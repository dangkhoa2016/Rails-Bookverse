module TagsHelper
  def tags_options_for_select
    Tag.all.map do |tag|
      [tag.name, tag.id]
    end
  end
end
