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

  def get_border_color(model)
    BORDER_COLORS[model.to_s.underscore.singularize.downcase] || "border-dark"
  end

  def render_columns(record)
    is_show_action = action_name == "show"
    is_index_action = action_name == "index"
    columns = get_display_columns(record).select do |column|
      if column[:only_in_form] == true
        false
      else
        if is_index_action
          column[:only_in_index] == true || column[:only_in_index].nil?
        elsif is_show_action
          !column[:only_in_index] && (column[:only_in_show] == true || column[:only_in_show].nil?)
        else
          true
        end
      end
    end

    columns.map do |column|
      value = record.send(column[:field])
      render_wrapper do
        if block_given?
          capture(column, value) do
            yield(column, value)
          end
        else
          render_default(column, value, record)
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

  def render_default(column, value, record)
    column = { field: column } if column.is_a?(String)
    klass = get_model_class(record)
    content_tag(:strong, get_label(column[:field], klass)) + ": " +
      render_value(column, value, klass.columns_hash[column[:field].to_s]&.type)
  end

  def render_wrapper(&block)
    content_tag(:div, class: "col") do
      content_tag(:p, class: "mb-0") do
        yield
      end
    end
  end

  def render_value(column, value, type = nil)
    column = { field: column } if column.is_a?(String)

    if respond_to?("render_#{column[:field]}_value")
      return send("render_#{column[:field]}_value", value)
    end

    if column[:type] == "association"
      return render_association(value)
    end

    case type
    when :decimal
      render_decimal_value(value)
    when :boolean
      value ? translate("boolean.on") : translate("boolean.off")
    else
      value.to_s
    end
  end

  def render_field(column, record)
    column = { field: column } if column.is_a?(String)
    klass = get_model_class(record)
    return if klass.nil?
    type = klass.columns_hash[column[:field].to_s]&.type
    render_value(column, record.send(column[:field]), type)
  end

  def render_decimal_value(value)
    number_to_currency(value, locale: "en")
  end

  def render_association(record)
    if record.nil?
      "No association"
    else
      link_to(record)
    end
  end
end
