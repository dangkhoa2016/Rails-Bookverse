module PublishedDatesHelper
  def published_date_display_card_header_title(record)
    PublishedDate.human_attribute_name("header_title", book: record.to_s)
  end
end
