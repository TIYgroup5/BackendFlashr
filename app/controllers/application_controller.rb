class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def current_user
    token = request.headers['Access-Token']
    token && User.find_by(access_token: token)
  end

  def authenticate_user!
    unless current_user
      token = request.headers['Access-Token']
      render json: { error: "Could not authenticate with token:'#{token}'" },
        status: :unauthorized
        # status: 401
    end
  end
end
