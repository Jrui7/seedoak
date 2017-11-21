class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:pseudo])
  end

  def after_sign_in_path_for(resource_or_scope)
    seeds_path
  end

  def default_url_options
  { host: ENV["HOST"] || "localhost:3000" }
  end

  private
    def authenticate_user!
      if user_signed_in?
        super
      else
        redirect_to root_path, notice: "Vous devez vous identifier ou créér un compte pour commencer" if request.original_fullpath != root_path
      end
    end


end
