module PublishersHelper
  def publishers_options_for_select
    Publisher.all.map do |publisher|
      [ publisher.name, publisher.id ]
    end
  end
end
