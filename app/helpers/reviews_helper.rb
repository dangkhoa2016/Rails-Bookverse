module ReviewsHelper
  def review_render_rating_value(value)
    one_star = raw(
      <<-SVG
      <svg class='icon text-warning'>
        <use xlink:href="#{asset_path('coreui-free.svg')}#cil-star"></use>
      </svg>
      SVG
    )

    value = value&.to_i

    if value > 0
      raw("<span class='d-inline-block' title='#{Review.human_attribute_name('star', { count: value })}'>#{one_star * value}</span>")
    else
      Review.human_attribute_name('no_rating')
    end
  end
end
