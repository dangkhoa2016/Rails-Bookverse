module DisplayValueHelper
  def display_value(record, column)
    value_method = "#{record.class.name.underscore}_#{column}_display_value"
    if respond_to?(value_method)
      return send(value_method, record, column)
    end

    value = record.send(column)

    if ['created_at', 'updated_at'].include?(column.to_s)
      display_datetime_value(value)
    # elsif value.is_a?(Numeric)
    #   display_currency_value(value)
    else
      is_boolean(value) ? display_boolean_value(value) : value
    end
  end

  def display_boolean_value(value)
    value ? 'Yes' : 'No'
  end

  def is_boolean(value)
    value.is_a?(TrueClass) || value.is_a?(FalseClass)
  end

  def display_date_value(value)
    I18n.l(value, format: :long)
  end

  def display_time_value(value)
    I18n.l(value, format: :long)
  end

  def display_datetime_value(value)
    I18n.l(value, format: :long)
  end

  def display_currency_value(value)
    number_to_currency(value, locale: :en)
  end
end
