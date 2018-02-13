class ApplicationController < ActionController::API
  def current_user
    token = request.headers['Authorization']
    debugger
    payload = JWTAuth.decode(token)
    @current_user ||= User.find_by_username(payload[0]['sub'])
  end

  def logged_in?
    current_user != nil
  end

  def authenticate_user!
    head :unauthorized unless logged_in?
  end
end
