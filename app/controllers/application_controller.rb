class ApplicationController < ActionController::Base
  before_action :set_locale, :set_view_type

  private

  def set_locale
    unless params[:locale]
      return
    end

    locale = params[:locale]
    locale = if locale && I18n.available_locales.include?(locale.to_sym)
      locale
    else
      cookies[:locale] || I18n.default_locale
    end
    I18n.locale = locale
    I18n.default_locale = locale
    cookies[:locale] = { value: locale, expires: 1.year.from_now }
  end

  def set_view_type
    unless params[:view]
      return
    end

    view_type = params[:view]
    view_type = if view_type && %w[table list card].include?(view_type&.downcase)
      view_type
    else
      cookies[:view_type] || 'list'
    end

    cookies[:view_type] = { value: view_type, expires: 1.year.from_now }
  end
end
