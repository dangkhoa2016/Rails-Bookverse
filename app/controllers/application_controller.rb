class ApplicationController < ActionController::Base
  around_action :set_locale

  private

  def set_locale(&action)
    locale = params[:locale] || cookies[:locale] || extract_locale_from_accept_language_header
    locale = I18n.available_locales.map(&:to_s).include?(locale) ? locale : I18n.default_locale
    cookies[:locale] = { value: locale, expires: 1.year.from_now }
    I18n.with_locale(locale, &action)
  end

  def extract_locale_from_accept_language_header
    request.env["HTTP_ACCEPT_LANGUAGE"]&.scan(/^[a-z]{2}/)&.first
  end
end
