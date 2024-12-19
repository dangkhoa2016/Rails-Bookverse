class LocalesController < ApplicationController
  def switch
    I18n.locale = params[:locale] || I18n.default_locale
    redirect_to request.referer || root_url
  end
end
