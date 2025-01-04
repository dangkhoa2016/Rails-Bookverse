module PublishersHelper
  def publishers_options_for_select
    Publisher.active.map do |publisher|
      [publisher.name, publisher.id]
    end
  end
end
