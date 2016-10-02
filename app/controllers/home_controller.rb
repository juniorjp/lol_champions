class HomeController < ApplicationController

  def index
  end

  def set_user_locale
    session['locale'] = params[:locale]
    redirect_to :back
  rescue ActionController::RedirectBackError
    redirect_to root_path
  end
end
