class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  def set_locale
    if params.has_key?(:locale)
      @api_locale = params[:locale]
    elsif session['locale']
      @api_locale = session['locale']
    else
      @api_locale = extract_locale_from_accept_language_header
    end

    I18n.locale = @api_locale = @api_locale.start_with?('pt') ? 'pt_BR': 'en_US'
  end

  private

  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'] ? request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first : 'pt_BR'
  end

end
