class ApplicationController < ActionController::Base
  before_action :set_locale

  private

  def set_locale
    locale = get_locale
    I18n.locale = locale
    cookies[:locale] = { value: locale, expires: 1.year.from_now }
  end

  def get_locale
    locale = params[:locale]
    if locale && I18n.available_locales.include?(locale.to_sym)
      locale
    else
      cookies[:locale] || I18n.default_locale
    end
  end
end
