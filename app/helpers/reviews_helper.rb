module ReviewsHelper
  def review_rating_display_value(review, column)
    one_star = raw(
      <<-SVG
      <svg class='icon text-warning'>
        <use xlink:href="#{asset_path('coreui-free.svg')}#cil-star"></use>
      </svg>
      SVG
    )

    value = review.send(column)&.to_i

    if value > 0
      raw("<span class='d-inline-block' title='#{pluralize(value, 'star')}'>#{one_star * value}</span>")
    else
      'No rating'
    end
  end
end
