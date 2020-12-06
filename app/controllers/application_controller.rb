class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  private

  def production?
    Rails.env.production?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name] )
  end

  def set_search
    @search = Item.ransack(params[:q])
    @search_items = @search.result(distinct: true)
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
