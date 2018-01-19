class ApplicationController < ActionController::API
  def current_user
    token = params[:auth_token]
    payload = JWTAuth.decode(token)
    @current_user ||= User.find_by_username(payload[0]['sub'])
  end

  def logged_in?
    current_user != nil
  end

  def authenticate_user!
    debugger
    head :unauthorized unless logged_in?
  end
end
