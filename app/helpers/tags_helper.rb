module TagsHelper
  def tags_options_for_select
    Tag.active.map do |tag|
      [ tag.name, tag.id ]
    end
  end
end
