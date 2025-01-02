class ApplicationController < ActionController::Base
  around_action :set_locale
  before_action :set_view_type

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

  def set_view_type
    if params[:view].blank? || action_name != 'index'
      return
    end

    view_type = params[:view]
    view_type = if view_type && %w[table list card].include?(view_type&.downcase)
      view_type
    else
      cookies[:view_type].presence || 'list'
    end

    cookies[:view_type] = { value: view_type, expires: 1.year.from_now }
  end
end
