module DisplayHelper
  BORDER_COLORS = {
    "author" => "border-success",
    "author_profile" => "border-success",

    "book" => "border-info",
    "category" => "border-info",
    "review" => "border-info",
    "genre" => "border-info",
    "tag" => "border-info",

    "book_loan" => "border-warning",
    "library" => "border-warning",
    "member" => "border-warning",

    "publisher" => "border-secondary",
    "published_date" => "border-secondary"
  }

  ICON_SVG_FILE_MAPPING = {
    "coreui-brand.svg" => "--coreui-brand-icons",
    "coreui-flag.svg" => "--coreui-flag-icons",
    "coreui-free.svg" => "--coreui-free-icons"
  }

  def get_border_color(model)
    BORDER_COLORS[model.to_s.underscore.singularize.downcase] || "border-dark"
  end

  def is_index_action?
    action_name == "index" || action_name.start_with?("by_")
  end

  def showable_fields(record)
    get_display_columns(record).select do |column|
      display_by_actions = column[:display_by_actions] || []
      if display_by_actions.empty?
        true
      else
        display_by_actions.include?(action_name)
      end
    end
  end

  def render_columns(record)
    is_show_action = action_name == "show"

    showable_fields(record).map do |column|
      render_wrapper do
        if block_given?
          value = record.send(column[:field])

          capture(column, value) do
            yield(column, value)
          end
        else
          render_default(column, record)
        end
      end
    end.join.html_safe
  end

  def get_label(field, klass)
    if klass && klass.respond_to?(:human_attribute_name)
      klass.human_attribute_name(field)
    else
      I18n.translate!(field) rescue field.to_s.titleize
    end
  end

  def get_display_columns(record)
    klass = get_model_class(record)
    return [] if klass.nil?

    columns = klass.respond_to?(:display_columns) ? klass.display_columns : klass.column_names
    columns.map do |column|
      if column.is_a?(String)
        { field: column }
      else
        column
      end
    end
  end

  def get_model_class(record)
    if record.is_a?(String)
      return record.classify.constantize rescue nil
    end

    if record.respond_to?(:class)
      record.class
    elsif record.respond_to?(:klass)
      record.klass
    end
  end

  def render_default(column, record)
    column = { field: column } if column.is_a?(String)
    klass = get_model_class(record)

    content_tag(:strong, get_label(column[:field], klass)) + ": " +
      render_value(column, record, klass ? klass.columns_hash[column[:field].to_s]&.type : nil)
  end

  def render_field(column, record)
    column = { field: column } if column.is_a?(String)
    klass = get_model_class(record)

    render_value(column, record, klass ? klass.columns_hash[column[:field].to_s]&.type : nil)
  end

  def render_wrapper(&block)
    content_tag(:div, class: "col") do
      content_tag(:p, class: "mb-0") do
        yield
      end
    end
  end

  def render_value(column, record, type = nil)
    column = { field: column } if column.is_a?(String)
    value = record.send(column[:field])

    if respond_to?("#{record.class.model_name.element}_render_#{column[:field]}_value")
      return send("#{record.class.model_name.element}_render_#{column[:field]}_value", value)
    end

    if column[:type] == "association"
      return render_association(value)
    end

    render_value_by_type(type, value)
  end

  def render_value_by_type(type = nil, value = nil)
    case type
    when :decimal
      render_decimal_value(value)
    when :boolean
      value ? translate("boolean.on") : translate("boolean.off")
    when :date
      render_date_field(value)
    when :datetime
      render_datetime_field(value)
    else
      value.to_s
    end
  end

  def render_decimal_value(value)
    number_to_currency(value, locale: "en")
  end

  def render_date_field(value)
    return value if value.nil?
    I18n.localize value, format: :long
  end

  def render_datetime_field(value)
    return value if value.nil?
    I18n.localize value, format: :long
  end

  def render_association(record)
    if record.nil?
      "No association"
    else
      link_to(record)
    end
  end

  def svg_icon(icon, file_name = "coreui-free.svg")
    # <svg class='icon'>
    #   <% if false %>
    #     <use xlink:href='<%= asset_path("coreui-free.svg") %>#cil-arrow-bottom'></use>
    #   <% else %>
    #     <use data-icon='--coreui-free-icons' xlink:href='#cil-arrow-bottom'></use>
    #   <% end %>
    # </svg>
    content_tag(:svg, class: "icon") do
      # content_tag(:use, nil, "xlink:href": "#{asset_path([file_name])}##{icon}")
      content_tag(:use, nil, data: { icon: ICON_SVG_FILE_MAPPING[file_name] }, "xlink:href": "##{icon}")
    end
  end
end
