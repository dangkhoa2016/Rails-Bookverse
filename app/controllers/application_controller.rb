class ApplicationController < ActionController::Base
  before_action :set_locale

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
end
