module AuthorProfilesHelper
  [:social_facebook, :social_twitter, :social_instagram, :social_linkedin, :social_youtube].each do |column|
    define_method("author_profile_render_#{column}_form_field") do |form|
      form.text_field(column, class: 'form-control',
        data: {
          controller: 'social-input', social_input_network_value: column.to_s.gsub('social_', ''),
          action: 'blur->social-input#onBlur focus->social-input#onFocus'
        })
    end
  end

  def author_profile_render_social_networks_value(value)
    return AuthorProfile.human_attribute_name('no_social_networks') if value.blank?

    arr = value.map do |network, url|
      next if url.blank?

      network = network.to_s.gsub('social_', '')

      link_to(url, target: '_blank', class: 'text-primary hover-text-warning text-decoration-none mx-1', title: AuthorProfile.human_attribute_name('social_network_title', network: network.titleize)) do
        raw(svg_icon("cib-#{network}", "coreui-brand.svg").html_safe)
      end
    end
    
    if arr.compact.empty?
      AuthorProfile.human_attribute_name('no_social_networks')
    else
      arr.join.html_safe
    end
  end
end
