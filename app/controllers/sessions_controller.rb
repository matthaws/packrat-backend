class SessionsController < ApplicationController
  def create
    @user = User.from_omniauth(request.env["omniauth.auth"])
    debugger
    if @user.persisted?
      @token = JWTAuth.encode(@user.username)
      render 'users/show'
    else
      render json: { errors: ['Invalid Credentials'] }, status: 422
    end
  end

  def destroy
    reset_session
  end

  private

 def issuer
   ENV['packrat_client_url']
 end
end
