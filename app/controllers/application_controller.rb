class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    return unless session && warden && warden.user

    @current_user ||= User.find(warden.user.id)
  end
end
