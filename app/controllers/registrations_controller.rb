class RegistrationsController < ApplicationController
def create
    @user = User.new(username: params[:username],
                     full_name: params[:full_name],
                     email: params[:email],
                     password: params[:password])
    if @user.save
      render "create.json.jbuilder", status: :created
      # status: 201
    else
      render json: { errors: @user.errors.full_messages },
        status: :unprocessable_entity
        # status: 422
    end
  end

  def destroy
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      @user.destroy
    else
      render json: { error: "Invalid email (#{params[:email]}) or password." },
        status: :unauthorized
        # status: 401
    end
  end

  def login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      render "login.json.jbuilder", status: :ok
      # status 200
    else
      render json: { error: "Could not find user for #{params[:username]} or wrong password." },
        status: :unauthorized
        # status: 401
    end
  end
end
