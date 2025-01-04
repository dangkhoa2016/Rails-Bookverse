module FormHelper
  def form_field_for(form: nil, record: nil, column: nil)
    unless record && column && form
      return
    end

    content = []
    content << form.label(column, class: "form-label")

    if respond_to?("render_#{column}_form_field")
      content << send("render_#{column}_form_field", form)
      return content.join.html_safe
    end

    klass = record.class
    column_type = klass.columns_hash[column.to_s].type


    case column_type
    when :datetime
      content << form.datetime_field(column, class: "form-control")
    when :date
      content << form.date_field(column, class: "form-control")
    when :string
      content << form.text_field(column, class: "form-control")
    when :text
      content << form.text_area(column, class: "form-control", rows: 5)
    when :integer
      content << form.number_field(column, class: "form-control")
    when :decimal
      content << form.number_field(column, class: "form-control", step: "0.01")
    when :boolean
      data = { controller: "form-switch", true_text: translate("boolean.on"), false_text: translate("boolean.off") }
      checkbox_html = content_tag(:div, class: "form-check form-switch", data: data) do
        form.check_box(column, class: "form-check-input", role: "switch") +
          form.label(column, class: "form-check-label", role: "button")
      end

      content << checkbox_html
    end

    content.join.html_safe
  end

  def editable_fields(record)
    get_display_columns(record).select do |column|
      if column[:only_in_form]
        true
      else
        !column[:only_in_show] && !column[:only_in_index]
      end
    end
  end
end
